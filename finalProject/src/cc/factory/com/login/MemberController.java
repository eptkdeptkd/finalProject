package cc.factory.com.login;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import cc.factory.com.dto.coffeeDto;


@Controller
public class MemberController {
	
	@Autowired
	MemberService service;

	@RequestMapping(value = "login.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String login(Model model, String msg) {
		if(!"".equals(msg)) {
			model.addAttribute("msg", msg);
		}
		System.out.println("MemberController login()");		
		return "login.tiles";
	}
	
	@RequestMapping(value = "regi.do", method = {RequestMethod.GET,RequestMethod.POST})
	public String regi() {
		System.out.println("MemberController regi()");
		return "regi.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "getId.do", method = {RequestMethod.GET,RequestMethod.POST})
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
	
	@RequestMapping(value = "regiAf.do", method={RequestMethod.GET,RequestMethod.POST})
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
	
	@RequestMapping(value = "loginAf.do", method={RequestMethod.GET,RequestMethod.POST})
	public String loginAf(MemberDto mem, HttpSession session, RedirectAttributes model) {
		System.out.println("MemberController loginAf()");
		
		MemberDto result = service.login(mem, session);
		 
		if(result != null) {
			model.addAttribute("msg","성공");
			return "redirect:/main.do";
		} 
		else {
			model.addAttribute("msg","아이디나 비밀번호가 일치하지 않습니다");
			return "redirect:/login.do";
		}		
	}
	
	@RequestMapping(value = "sessionOut.do", method={RequestMethod.GET,RequestMethod.POST})
	public String sessionOut(HttpServletRequest req) {
		req.getSession().removeAttribute("login");
		return "redirect:/main.do";
	}
	
	//추가
	@RequestMapping(value = "updateId.do", method={RequestMethod.GET,RequestMethod.POST})
	public String updateId(MemberDto dto) {
		System.out.println("MemberController updateId " + new Date());
		service.updateId(dto);
		return "redirect:/mypage.do";
	}
	
	@RequestMapping(value = "deleteId.do", method={RequestMethod.GET,RequestMethod.POST})
	public String deleteId(HttpServletRequest req, MemberDto dto) {
		System.out.println("MemberController deleteId " + new Date());
		service.deleteId(dto);
		req.getSession().removeAttribute("login");
		return "redirect:/main.do";
	}
	
	@ResponseBody
	@RequestMapping(value = "bestMember.do", method = { RequestMethod.GET, RequestMethod.POST})
	public List<MemberDto> bestMember() {
		List<MemberDto> mlist = service.bestMember();
		return mlist;
	}
}









