package bit.com.a;

import java.text.DateFormat;
import java.util.Date;
import java.util.Locale;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.a.dto.Human;

@Controller
public class HelloController {

	private static Logger logger = LoggerFactory.getLogger(HelloController.class);
	
	@RequestMapping("hello")
	public String hello() {
	//	System.out.println("HelloController hello()");
		logger.info("HelloController hello() " + new Date());
		
		return "hello";
	}
								// form method="post"
	@RequestMapping(value = "home.do", method = RequestMethod.GET)
	public String homeMethod(Model model) {
		logger.info("homeMethod() " + new Date());
		
		String name = "홍길동";	// request.setAttribute("name", name);
		model.addAttribute("name", name);	// 짐싸!
				
		return "home";		// home.jsp 
	}
	
	@RequestMapping(value = "world.do", method = RequestMethod.GET)
	//public String world(int age, String name) {
	public String world(Human h,Model model) {
	
	//	logger.info("age:" + age);
	//	logger.info("name:" + name);
		
		logger.info(h.toString());
		
		String name = "할로";	// request.setAttribute("name", name);
		model.addAttribute("name", name);	// 짐싸!
		
		return "home";
	}
	
	/*
		셋팅
		Ajax
		회원가입	
		게시판
		
		tiles
		회원가입	
		게시판1
		게시판2 - plug-in(paging)		
		일정관리1
		일정관리2 - plug-in(calendar)
		자료실
		투표 만들기/하기
		Chat(web socket)
		Youtube
		
		Spring boot
		- Restful		server <-> client
		회원가입	
		게시판
	
	
	*/
}








