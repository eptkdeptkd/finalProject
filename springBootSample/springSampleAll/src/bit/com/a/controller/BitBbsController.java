package bit.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.dto.BbsDto;
import bit.com.a.dto.BbsParam;
import bit.com.a.service.BbsService;

@Controller
public class BitBbsController {
	
	@Autowired
	BbsService service;

	@RequestMapping(value = "bbslist2.do", method = RequestMethod.GET)
	public String bbslist2(Model model) {
		model.addAttribute("doc_title", "글목록");
		return "bbslist2.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "bbslistData.do", method = {RequestMethod.GET, RequestMethod.POST})
	public List<BbsDto> bbslistData(BbsParam param){
		
		// paging 처리
		int sn = param.getPageNumber();
		int start = sn * param.getRecordCountPerPage() + 1;
		int end = (sn + 1) * param.getRecordCountPerPage();
		
		param.setStart(start);
		param.setEnd(end);
		
		List<BbsDto> bbsList = service.getBbsList(param);
		
		return bbsList;
	}
	
	@ResponseBody
	@RequestMapping(value = "bbslistCount.do", method = {RequestMethod.GET, RequestMethod.POST})
	public int bbslistCount(BbsParam param) {
		int count = service.getBbsCount(param);
		return count;
	}
	
}










