package bit.com.a.controller;

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

import bit.com.a.dto.PdsDto;
import bit.com.a.service.PdsService;
import bit.com.a.util.PdsUtil;

@Controller
public class PdsController {
	
	@Autowired
	PdsService service;
	
	@RequestMapping(value = "pdslist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdslist(Model model) {
		model.addAttribute("doc_title", "자료실 목록");
		
		List<PdsDto> list = service.getPdsList();
		model.addAttribute("pdslist", list);
		
		return "pdslist.tiles";
	}
	
	@RequestMapping(value = "pdswrite.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdswrite(Model model) {
		model.addAttribute("doc_title", "자료 올리기");
		
		return "pdswrite.tiles";
	}
	
	@RequestMapping(value = "pdsupload.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String pdsupload(PdsDto pdsdto, 
					@RequestParam(value = "fileload", required = false)MultipartFile fileload, 
					HttpServletRequest req) {
		
		// filename 취득
		String filename = fileload.getOriginalFilename();
		pdsdto.setOldfilename(filename);
		
		// upload 경로 설정
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
	//	String fupload = "d:\\tmp";
		
		System.out.println("fupload:" + fupload);
		
		// file명을 취득
		String f = pdsdto.getOldfilename();
		String newfilename = PdsUtil.getNewFileName( f );	// 324324324324.txt
		
		pdsdto.setFilename(newfilename);
		
		File file = new File(fupload + "/" + newfilename);
				
		try {
			// 실제로 파일이 업로드되는 부분
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			// db에 저장
			service.uploadPds(pdsdto);
			
		} catch (IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}	 
		
		return "redirect:/pdslist.do";		
	}
	
	// fileDownload.do
	@RequestMapping(value = "fileDownload.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String fileDownload(String filename, int seq, HttpServletRequest req, Model model) {
		
		// 경로
		// server
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 폴더
	//	String fupload = "d:\\tmp";
		
		File downloadFile = new File(fupload + "/" + filename);
		
		model.addAttribute("downloadFile", downloadFile);		
		model.addAttribute("seq", seq);
		
		return "downloadView";
	}
	
	@RequestMapping(value = "pdsdetail.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String pdsdetail(int seq, Model model) {
		model.addAttribute("doc_title", "자료 보기");
				
		// dto 취득
		PdsDto pdsdto = service.getPds(seq);
		model.addAttribute("pds", pdsdto);
		
		return "pdsdetail.tiles";
	}
	
	@RequestMapping(value = "pdsupdate.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String pdsupdate(int seq, Model model) {
		model.addAttribute("doc_title", "자료 수정");
		
		// dto 취득
		PdsDto pdsdto = service.getPds(seq);
		model.addAttribute("pds", pdsdto);
		
		return "pdsupdate.tiles";
	}
	
	@RequestMapping(value = "pdsupdateAf.do", method= {RequestMethod.GET, RequestMethod.POST})
	public String pdsupdateAf(	PdsDto pdsdto, 
								String namefile,	// 기존의 파일 명,
								HttpServletRequest req,
								@RequestParam(value = "fileload", required = false)MultipartFile fileload) {
		
		pdsdto.setOldfilename(fileload.getOriginalFilename());
		
		// 파일 경로
		String fupload = req.getServletContext().getRealPath("/upload");
		
		// 수정할 파일이 있음
		if(pdsdto.getOldfilename() != null && !pdsdto.getOldfilename().equals("")) {
			
			String f = pdsdto.getOldfilename();
			String newfilename = PdsUtil.getNewFileName(f);
			
			pdsdto.setFilename(newfilename);
			
			File file = new File(fupload + "/" + newfilename);			
			
			try {
				// 실제 업로드
				FileUtils.writeByteArrayToFile(file, fileload.getBytes());
				
				// db 경신
				service.updatePds(pdsdto);		
				
			} catch (IOException e) {				
				e.printStackTrace();
			}			
		}
		else {	// 수정할 파일 없음
			
			// 기존의 파일명으로 설정
			pdsdto.setFilename(namefile);
			
			// DB
			service.updatePds(pdsdto);	
		}
		
		return "redirect:/pdslist.do";
	}
	
	
	
}








