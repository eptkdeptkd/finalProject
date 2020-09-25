package bit.com.a.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import bit.com.a.dto.Youtube;
import bit.com.a.dto.YoutubeSave;
import bit.com.a.service.YoutubeService;
import bit.com.a.util.YoutubeParser;

@Controller
public class YoutubeController {
	
	@Autowired
	private YoutubeParser youtubeParser;
	
	@Autowired
	YoutubeService service;

	@RequestMapping(value = "youtube.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String youtube(String s_keyword, Model model) {
		model.addAttribute("doc_title", "유튜브");
		
		// 검색 *****
		//youtubeParser.getTitles("백종원");
		
		if(s_keyword != null && !s_keyword.equals("")) {
			List<Youtube> getTitles = youtubeParser.getTitles(s_keyword);
			
			model.addAttribute("yulist", getTitles);
			model.addAttribute("s_keyword", s_keyword);
		}		
		
		return "youtube.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "youtubesave.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String youtubesave(Youtube you, String id) {
		System.out.println("id:" + id);
		System.out.println("you:" + you.toString());
		
		boolean b = service.addYou(new YoutubeSave(id, you.getTitle(), you.getUrl()));
		if(b) {
			return "YES";
		}else {
			return "NO";
		}		
	}
	
}







