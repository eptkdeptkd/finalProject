package bit.com.a.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class mainController {

	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String mainMove() {
		System.out.println("mainController mainMove()");		
		return "main.tiles";
	}
	
}
