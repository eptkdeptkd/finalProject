package cc.factory.com.login;

import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;


@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	@RequestMapping(value = "login.do", method = RequestMethod.GET)
	public String login() {
		System.out.println("MemberController login()");		
		return "login.tiles";
	}
	
	@RequestMapping(value = "regi.do", method = RequestMethod.GET)
	public String regi() {
		System.out.println("MemberController regi()");
		return "regi.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "getId.do", method = RequestMethod.POST)
	public String getId(MemberDto mem) {
		System.out.println("MemberController getId()");
		
		int count = service.getId(mem);
		String msg = "";
		if(count > 0) {
			msg = "YES";
		}else {
			msg = "NO";
		}
		return msg;
	}
	
	@RequestMapping(value = "regiAf.do", method=RequestMethod.POST)
	public String regiAf(MemberDto dto) {
		System.out.println("MemberController regiAf " + new Date());
		
		boolean b = service.addmember(dto);
		if(b) {
			System.out.println("회원 가입되었습니다 " + new Date());
			return "login.tiles";
		}
		System.out.println("가입되지 않았습니다 " + new Date());
		
		return "regi.tiles";
	}
	
	@RequestMapping(value = "loginAf.do", method=RequestMethod.POST)
	public String loginAf(MemberDto dto, HttpServletRequest req) {
		System.out.println("MemberController loginAf()");
		
		MemberDto login = service.login(dto);
		
		if(login != null && !login.getId().equals("")) {
			// session
			req.getSession().setAttribute("login", login);
			//req.getSession().setMaxInactiveInterval(60 * 60 * 8);
			
			return "redirect:/main.do";
		}
		else {
			return "redirect:/login.do";
		}		
	}
	
	@RequestMapping(value = "sessionOut.do", method=RequestMethod.GET)
	public String sessionOut(HttpServletRequest req) {
		req.getSession().removeAttribute("login");
		return "redirect:/main.do";
	}
	
}









