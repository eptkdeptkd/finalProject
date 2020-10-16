package cc.factory.com.controller;

import java.io.IOException;
import java.net.http.HttpRequest;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
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
import cc.factory.com.dto.PollDto;
import cc.factory.com.dto.PostScriptDto;
import cc.factory.com.dto.PostScriptParam;
import cc.factory.com.dto.QnaDto;
import cc.factory.com.dto.QnaParam;
import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderDto;
import cc.factory.com.dto.orderParam;
import cc.factory.com.login.MemberDto;
import cc.factory.com.service.CalendarService;
import cc.factory.com.service.InfoService;
import cc.factory.com.service.PollService;
import cc.factory.com.service.PostScriptService;
import cc.factory.com.service.QnaService;
import cc.factory.com.service.coffeeDetailService;

@Controller
public class mypageController {
	
	@Autowired
	InfoService iSvc;
	@Autowired
	QnaService qSvc;
	@Autowired
	PostScriptService rSvc;
	@Autowired
	PollService pSvc;
	@Autowired
	coffeeDetailService fSvc;

	// 마이페이지 임시
	@RequestMapping(value = "mypage.do", method = RequestMethod.GET)
	public String mypage(Model model, HttpServletRequest req, QnaParam qp, InfoParam ip, PostScriptParam rp) {

		MemberDto mem = (MemberDto) req.getSession().getAttribute("login");
		String id = (String) mem.getId();

		// 공지사항
		List<InfoDto> ilist = iSvc.getInfoList(ip);

		System.out.println("id 확인   " + id);

		// QnA
		qp.setChoice("writer");
		qp.setSearchWord(id);
		List<QnaDto> qlist = qSvc.getQnaList(qp);

		// 후기
		rp.setChoice("writer");
		rp.setSearchWord(id);
		List<PostScriptDto> rlist = rSvc.getPsList(rp);

		// 투표
		List<PollDto> plist = pSvc.getPollAllList(id);

		// 추가 2020.10.16
				String WeatherURL = "https://weather.naver.com/today";
				Document doc;
				
				try {
					doc = Jsoup.connect(WeatherURL).get();
					Elements elem = doc.select(".weather_area .summary  .weather");
					String[] str = elem.text().split(" ");
					model.addAttribute("weather", elem);
				} catch (IOException e) {
					e.printStackTrace();
				}
				
		model.addAttribute("ilist", ilist);
		model.addAttribute("qlist", qlist);
		model.addAttribute("rlist", rlist);
		model.addAttribute("plist", plist);

		return "myPage.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "bestCoffee.do", method = { RequestMethod.GET, RequestMethod.POST})
	public List<coffeeDto> bestCoffee() {
		List<coffeeDto> clist =  fSvc.bestCoffee();
		return clist;
	}
	
	@RequestMapping(value = "ranking.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String ranking() {
		
		return "ranking.tiles";
	}
	
	// 추가 2020.10.15
	@RequestMapping(value = "myOrder.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String myOrder(HttpServletRequest req,Model model) {
		System.out.println("mypageController myOrder ");
		MemberDto dto = (MemberDto) req.getSession().getAttribute("login");
		String id = dto.getId();
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Date time = new Date();
		String t = format1.format(time);
		
		orderParam param = new orderParam(id,t);
		List<orderDetailDto> list =  fSvc.myOrderList(param);
		model.addAttribute("list",list);
		
		return "myOrder.tiles";
	}
	
}
