package cc.factory.com.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.factory.com.dto.PostScriptDto;
import cc.factory.com.dto.PostScriptParam;
import cc.factory.com.service.PostScriptService;

@Controller
public class PostScriptController {
	
	@Autowired
	PostScriptService service;
	
	
	@RequestMapping(value = "psdetail.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String psdetail(int seq, Model model) {		
		model.addAttribute("doc_title", "상세글 보기");
		
		PostScriptDto ps = service.getpostScript(seq);
		model.addAttribute("ps", ps);
		
		return "psdetail.tiles";
	}
	
	@RequestMapping(value = "pslist.do", method = RequestMethod.GET)
	public String pslist(Model model) {
		model.addAttribute("doc_title", "글목록");
		return "postscript.tiles";
	}
	
	@RequestMapping(value = "pswrite.do", method = {RequestMethod.GET,	RequestMethod.POST})
	public String writePs(Model model) {		
		model.addAttribute("doc_title", "글쓰기");
		
		return "pswrite.tiles";
	}
	
	@RequestMapping(value = "pswriteAf.do", method = RequestMethod.POST)
	public String pswriteAf(PostScriptDto ps, Model model) throws Exception {
		if(ps.getContent().equals("") || ps.getTitle().equals("")){
			return "pswrite.tiles";
		}
		service.writePs(ps);
		return "redirect:/pslist.do";
	}
	
	@RequestMapping(value = "answer.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String answer(int seq, Model model) throws Exception {		
		PostScriptDto ps=null;		
		ps = service.getpostScript(seq);
		model.addAttribute("ps", ps);
		return "answer.tiles";
	}
	
	@RequestMapping(value = "answerAf.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String answerAf(PostScriptDto ps, Model model) {		
		service.reply(ps);		
		return "redirect:/pslist.do";
	}
	
	@RequestMapping(value = "psdelete.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String deletePs(int seq, Model model) {		
		service.deletePs(seq);
		return "redirect:/pslist.do";		
	}
	
	@RequestMapping(value = "psupdate.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String psupdate(int seq, Model model){		
		PostScriptDto ps=service.getpostScript(seq);		
		model.addAttribute("ps", ps);		
		return "psupdate.tiles";
	}
	
	@RequestMapping(value = "psupdateAf.do", method = RequestMethod.POST)
	public String psupdateAf(PostScriptDto ps,Model model) {		
		service.updatePs(ps);
		return "redirect:/pslist.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "pslistData.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<PostScriptDto> pslistData(PostScriptParam param){
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = sn * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<PostScriptDto> psList = service.getPsList(param);
		
		return psList;
	}
	
	@ResponseBody
	@RequestMapping(value = "pslistCount.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int pslistCount(PostScriptParam param) {
		int count = service.getPsCount(param);
		return count;
	}
	

}
