package bit.com.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

/* AOP와 다른 Package를 사용하는 것을 권장 */
@Controller
public class bWebSocket {
	@RequestMapping(value = "chating.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String chating(Model model) {
		model.addAttribute("doc_title", "채팅");		
		return "chating.tiles";
	}	
}
