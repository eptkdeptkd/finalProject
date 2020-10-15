package cc.factory.com.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.jsoup.Jsoup;
import org.jsoup.nodes.Document;
import org.jsoup.select.Elements;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.factory.com.dto.CalendarDto;
import cc.factory.com.dto.InfoDto;
import cc.factory.com.dto.InfoParam;
import cc.factory.com.dto.QnaDto;
import cc.factory.com.dto.QnaParam;
import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderDto;
import cc.factory.com.login.MemberDto;
import cc.factory.com.service.CalendarService;
import cc.factory.com.service.InfoService;
import cc.factory.com.service.QnaService;
import cc.factory.com.service.coffeeDetailService;

@Controller
public class mypageController {
	
	@Autowired
	QnaService qservice;
	@Autowired
	InfoService iservice;
	@Autowired
	CalendarService cservice;
	@Autowired
	coffeeDetailService service;
	
	// 마이페이지 임시
	@RequestMapping(value = "mypage.do", method=RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest req, QnaParam qp, InfoParam ip) {
		
		String id = (String) req.getSession().getId();
		id = "OJEA";
		
		List<cartDto> list = service.getCartAll(id);
		model.addAttribute("list",list);
		System.out.println(list);		
		
		qp.setChoice("writer");
		qp.setSearchWord("d4ntsky");
		List<QnaDto> qlist = qservice.getQnaList(qp);
		model.addAttribute("qlist",qlist);
		System.out.println(qlist);
		
		ip.setChoice("writer");
		ip.setSearchWord("aaa");
		List<InfoDto> ilist = iservice.getInfoList(ip);
		model.addAttribute("ilist",ilist);
		System.out.println(ilist);
		
		List<CalendarDto> clist = cservice.getCalList();
		model.addAttribute("clist",clist);
		
		
		
		return "myPage.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "bestCoffee.do", method = { RequestMethod.GET, RequestMethod.POST})
	public List<coffeeDto> bestCoffee() {
		List<coffeeDto> clist = service.bestCoffee();
		return clist;
	}
	
	@RequestMapping(value = "ranking.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String ranking() {
		
		return "ranking.tiles";
	}
}
