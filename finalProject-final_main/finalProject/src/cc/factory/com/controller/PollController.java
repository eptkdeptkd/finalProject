package cc.factory.com.controller;

import java.io.File;
import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;

import cc.factory.com.dto.PollBean;
import cc.factory.com.dto.PollDto;
import cc.factory.com.dto.PollSubDto;
import cc.factory.com.dto.Voter;
import cc.factory.com.login.MemberDto;
import cc.factory.com.service.PollService;
import cc.factory.com.util.PdsUtil;

@Controller
public class PollController {

	@Autowired
	PollService service;
	
	@RequestMapping(value = "polllist.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String polllist(Model model, HttpServletRequest req) {
		
		String id = ((MemberDto)req.getSession().getAttribute("login")).getId();
		
		//String id = "aaa";
		
		List<PollDto> list = service.getPollAllList(id);
		model.addAttribute("plists", list);		
		
		return "polllist.tiles";
	}
	
	@RequestMapping(value = "pollmake.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String pollmake(Model model) {
		
		return "pollmake.tiles";
	}
	
	@RequestMapping(value = "pollmakeAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String pollmakeAf(PollBean pbean, @RequestParam(value = "fileload", required = false)MultipartFile fileload, 
			HttpServletRequest req) {
		
		// filename 취득
		String filename = fileload.getOriginalFilename();
		pbean.setOldfilename(filename);
		
		// upload 경로 설정
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
	//	String fupload = "d:\\tmp";
		
		System.out.println("fupload:" + fupload);
		
		// file명을 취득
		// file명을 취득
		String f = pbean.getOldfilename();
		System.out.println("f == " + f);
		
		String newfilename = PdsUtil.getNewFileName(f);	
		System.out.println("newfilename == " + newfilename);
		
		pbean.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		
		System.out.println("file?" + file);
		System.out.println(pbean.toString());
		//System.out.println(fupload);
				
		try {
			// 실제로 파일이 업로드되는 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			//service.uploadPds(info);
			System.out.println("DB직전 ");
			service.makePoll(pbean);
			//System.out.println("=====info WriteAf Y?? " + Y);
			System.out.println("DB직후 ");
			
			
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
			System.out.println("error");
		}
		
		
		
		return "redirect:/polllist.do";		
	}
	
	@RequestMapping(value = "polldetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String polldetail(PollDto poll, Model model) {
		
		// 주제, 보기들
		PollDto dto = service.getPoll(poll);
		List<PollSubDto> list = service.getPollSubList(poll);
		System.out.println("detail === " + poll.toString());
		System.out.println(dto.toString());
		System.out.println(list.toString());
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "polldetail.tiles";
	}
	
	@RequestMapping(value = "polling.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String polling(Voter voter) {
		service.polling(voter);		
		return "redirect:/polllist.do";
	}
	
	@RequestMapping(value = "pollresult.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String pollresult(PollDto poll, Model model) {
		
		// PollTotal
		PollDto dto = service.getPoll(poll);		
		// acount
		List<PollSubDto> list = service.getPollSubList(poll);
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "pollresult.tiles";		
	}
	
	@RequestMapping(value = "pollresult2.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String pollresult2(PollDto poll, Model model) {
		
		// PollTotal
		PollDto dto = service.getPoll(poll);		
		// acount
		List<PollSubDto> list = service.getPollSubList(poll);
		
		model.addAttribute("poll", dto);
		model.addAttribute("pollsublist", list);
		
		return "pollresult2.tiles";		
	}
	
}








