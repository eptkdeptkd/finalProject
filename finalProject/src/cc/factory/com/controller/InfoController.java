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

import cc.factory.com.dto.InfoDto;
import cc.factory.com.dto.InfoParam;
import cc.factory.com.dto.InfoReDto;
import cc.factory.com.service.InfoService;
import cc.factory.com.util.PdsUtil;

@Controller
public class InfoController {

	@Autowired
	InfoService service;

	@RequestMapping(value = "infoimage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String infoimage(Model model, InfoParam param) {

		//System.out.println("choice:" + param.getChoice());
		//System.out.println("searchWord:" + param.getSearchWord());

		// paging 처리
		int sn = param.getPageNumber(); // 현재 페이지
		int start = sn * param.getRecordCountPerPage() + 1; // 1 11 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20 30

		param.setStart(start);
		param.setEnd(end);

		//System.out.println("param의 스타트 엔드Page 접수 ");

		List<InfoDto> list = service.getInfoList(param);
		model.addAttribute("infolist", list);

		System.out.println("list = "+ list.toString());

		//System.out.println("디비가서 리스트 받고 모델로 보냄 ");
		// 글의 총수
		int totalRecordCount = service.getInfoCount(param);
		//System.out.println("글의 총수 받기 ");

		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("choice", param.getChoice());
		model.addAttribute("searchWord", param.getSearchWord());
		//System.out.println("다보내고타일즈로 이동직전 ");
		return "infoimage.tiles";
	}
	
	
	
	@RequestMapping(value = "infolist.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String infolist(Model model, InfoParam param) {

		//System.out.println("choice:" + param.getChoice());
		//System.out.println("searchWord:" + param.getSearchWord());
		
		// paging 처리
		int sn = param.getPageNumber(); // 현재 페이지
		int start = sn * param.getRecordCountPerPage() + 1; // 1 11 21
		int end = (sn + 1) * param.getRecordCountPerPage(); // 10 20 30

		param.setStart(start);
		param.setEnd(end);

		//System.out.println("param의 스타트 엔드Page 접수 ");

		List<InfoDto> list = service.getInfoList(param);
		model.addAttribute("infolist", list);

		System.out.println("list = "+ list.toString());

		//System.out.println("디비가서 리스트 받고 모델로 보냄 ");
		// 글의 총수
		int totalRecordCount = service.getInfoCount(param);
		//System.out.println("글의 총수 받기 ");

		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);

		model.addAttribute("choice", param.getChoice());
		model.addAttribute("searchWord", param.getSearchWord());
		//System.out.println("다보내고타일즈로 이동직전 ");
		return "infolist.tiles";
	}

	@RequestMapping(value = "infowrite.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String infowrite(Model model) {

		return "infowrite.tiles";
	}

	
	
	
	@RequestMapping(value = "infowriteAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String infowriteAf(InfoDto info, @RequestParam(value = "fileload", required = false)MultipartFile fileload, 
			HttpServletRequest req) throws Exception {
		System.out.println("infoWriteAf Dto = " + info.toString());
		
		if (info.getContent().equals("") || info.getTitle().equals("")) {
			return "infowrite.tiles";
		}
		
		
		
		// filename 취득
		String filename = fileload.getOriginalFilename();
		info.setOldfilename(filename);
		
		// upload 경로 설정
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
	//	String fupload = "d:\\tmp";
		
		System.out.println("fupload:" + fupload);
		
		// file명을 취득
		String f = info.getOldfilename();
		System.out.println("f == " + f);
		
		String newfilename = PdsUtil.getNewFileName(f);	
		System.out.println("newfilename == " + newfilename);
		
		info.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
		
		System.out.println("file?" + file);
		
		//System.out.println(fupload);
				
		try {
			// 실제로 파일이 업로드되는 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			//service.uploadPds(info);
			
			service.writeInfo(info);
			//System.out.println("=====info WriteAf Y?? " + Y);
			
			
			
			
			
			
		} catch (IOException e) {
			e.printStackTrace();
			
		}
		
		return "redirect:/infoimage.do";
		
		


	}

	@RequestMapping(value = "infodetail.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String infodetail(int seq, Model model) {

		InfoDto info = service.getInfo(seq);
		List<InfoReDto> infoReList = service.getInfoReList(seq);
		
		int count = service.getInfoReCount(seq);
		System.out.println("count== "+count);
		//System.out.println("Info Detail Dto = " + info.toString());

		model.addAttribute("info", info);
		model.addAttribute("infoReList", infoReList);

		return "infodetail.tiles";
	}


	 	
	 @RequestMapping(value = "writeRe.do", method = {RequestMethod.GET, RequestMethod.POST}) 
	 public String writeRe(InfoReDto infoRe, Model model) {
	
		 System.out.println("InfoReDto~~~==== "+ infoRe.toString());
		 boolean Y = service.writeRe(infoRe); 
		 System.out.println(Y);
		 if (Y) {
			 return "redirect:/infodetail.do?seq="+infoRe.getInfo_Seq(); 
			 //InfoDto info = service.getInfo(infoRe.getInfo_Seq());
			 
		}else {
			return "redirect:/infoimage.do"; 
		}
	 }
	 

	@RequestMapping(value = "infodelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String deleteInfo(int seq, Model model) {
		service.deleteInfo(seq);
		return "redirect:/infoimage.do";
	}

	@RequestMapping(value = "infoupdate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String infoupdate(int seq, Model model) {
		InfoDto info = service.getInfo(seq);
		model.addAttribute("info", info);
		return "infoupdate.tiles";
	}

	@RequestMapping(value = "infoupdateAf.do", method = RequestMethod.POST)
	public String infoupdateAf(InfoDto info, Model model) {
		service.updateInfo(info);
		return "redirect:/infoimage.do";
	}
}
