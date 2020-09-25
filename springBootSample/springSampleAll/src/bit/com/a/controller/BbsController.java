package bit.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.a.dto.BbsDto;
import bit.com.a.dto.BbsParam;
import bit.com.a.service.BbsService;

@Controller
public class BbsController {
	
	@Autowired
	BbsService service;	
	/*
	@RequestMapping(value = "bbslist.do", method = RequestMethod.GET)
	public String bbslist(Model model) {
		model.addAttribute("doc_title", "글목록");
		
		List<BbsDto> list = service.getBbsList();
		model.addAttribute("bbslist", list);
		
		return "bbslist.tiles";
	}
	*/
	
	@RequestMapping(value = "bbslist.do", method = RequestMethod.GET)
	public String bbslist(Model model, BbsParam param) {
		model.addAttribute("doc_title", "글목록");
		
		System.out.println("choice:" + param.getChoice());
		System.out.println("searchWord:" + param.getSearchWord());
		
		// paging 처리
		int sn = param.getPageNumber();		// 현재 페이지
		int start = sn * param.getRecordCountPerPage() + 1;	// 1 11 21
		int end = (sn + 1) * param.getRecordCountPerPage();	// 10 20 30
		
		param.setStart(start);
		param.setEnd(end);
				
		List<BbsDto> list = service.getBbsList( param );
		model.addAttribute("bbslist", list);
		
		// 글의 총수
		int totalRecordCount = service.getBbsCount( param );
		
		model.addAttribute("pageNumber", sn);
		model.addAttribute("pageCountPerScreen", 10);
		model.addAttribute("recordCountPerPage", param.getRecordCountPerPage());
		model.addAttribute("totalRecordCount", totalRecordCount);
		
		model.addAttribute("choice", param.getChoice());
		model.addAttribute("searchWord", param.getSearchWord());
		
		return "bbslist.tiles";
	}
	
	@RequestMapping(value = "bbswrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String bbswrite(Model model) {		
		model.addAttribute("doc_title", "글쓰기");
		
		return "bbswrite.tiles";
	}
	
	@RequestMapping(value = "bbswriteAf.do", method = RequestMethod.POST)
	public String bbswriteAf(BbsDto bbs, Model model) throws Exception {
		if(bbs.getContent().equals("") || bbs.getTitle().equals("")){
			return "bbswrite.tiles";
		}
		service.writeBbs(bbs);
		return "redirect:/bbslist.do";
	}
	
	@RequestMapping(value = "bbsdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbsdetail(int seq, Model model) {		
		model.addAttribute("doc_title", "상세글 보기");
		
		BbsDto bbs = service.getBbs(seq);
		model.addAttribute("bbs", bbs);
		
		return "bbsdetail.tiles";
	}
	
	@RequestMapping(value = "answer.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String answer(int seq, Model model) throws Exception {		
		BbsDto bbs=null;		
		bbs = service.getBbs(seq);
		model.addAttribute("bbs", bbs);
		return "answer.tiles";
	}
	
	@RequestMapping(value = "answerAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String answerAf(BbsDto bbs, Model model) {		
		service.reply(bbs);		
		return "redirect:/bbslist.do";
	}
	
	@RequestMapping(value = "bbsdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deleteBbs(int seq, Model model) {		
		service.deleteBbs(seq);
		return "redirect:/bbslist.do";		
	}
	
	@RequestMapping(value = "bbsupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String bbsupdate(int seq, Model model){		
		BbsDto bbs=service.getBbs(seq);		
		model.addAttribute("bbs", bbs);		
		return "bbsupdate.tiles";
	}
	
	@RequestMapping(value = "bbsupdateAf.do", 
			method = RequestMethod.POST)
	public String bbsupdateAf(BbsDto bbs,Model model) {		
		service.updateBbs(bbs);
		return "redirect:/bbslist.do";
	}
}







