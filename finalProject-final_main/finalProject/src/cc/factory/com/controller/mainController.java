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
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderDto;
import cc.factory.com.login.MemberDto;
import cc.factory.com.service.coffeeDetailService;

@Controller
public class mainController {

	@Autowired
	coffeeDetailService service;
	
	@RequestMapping(value = "coffeeMain.do", method = RequestMethod.GET)
	public String mainMove(Model model) {
		System.out.println("mainController mainMove()");	
		
		List<coffeeDto> list = service.getCoffeeList();
		model.addAttribute("list",list);
		
		return "coffeeMain.tiles";
	}
	
	@RequestMapping(value = "main.do", method = { RequestMethod.GET, RequestMethod.POST})
	public String map(Model model) {
		System.out.println("mainController map()");
		
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
		
		return "main.tiles";
	}
	
	@RequestMapping(value = "coffeeDetailMove.do", method = RequestMethod.GET)
	public String coffeeDetailMove(int seq,Model model) {
		System.out.println("mainController coffeeDetailMove()");	
		
		coffeeDto dto = service.getDetailOne(seq);
		
		model.addAttribute("dto", dto);
		
		return "coffeeDetailMove.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "cart.do", method = RequestMethod.POST)
	public boolean cart(cartDto dto) {
		System.out.println("mainController cart() " + dto.toString());	
		
		boolean b = service.addCartOne(dto);
		
		return b;
	}
	
	@RequestMapping(value = "cartMove.do", method = RequestMethod.GET)
	public String cartMove(Model model, HttpServletRequest req ) {
		System.out.println("mainController cartMove()");	
		
		MemberDto dto = (MemberDto) req.getSession().getAttribute("login");
		
		List<cartDto> list = service.getCartAll(dto.getId());
		model.addAttribute("list",list);
		
		// syrup
		List<SideDto> slist = service.getSyrupAll();
		model.addAttribute("slist",slist);
		
		return "cartMove.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "getVC.do", method = RequestMethod.POST)
	public int getVisitCount(String id) {
		System.out.println("mainController getVisitCount() " +id);	
		
		int count = service.getVisitCount(id);
		
		return count;
	}
	
	@ResponseBody
	@RequestMapping(value = "order.do", method = RequestMethod.POST, produces ="application/String; charset=UTF-8")
	public String order(orderDto dto) { 
		System.out.println("mainController order -> "+dto.getDetail());
		
		String msg = "";
		
		boolean b = true;
		
		boolean be = service.addOrder(dto);
		if(!be) b = false;
		be = service.updateVisitCount(dto.getId());
		if(!be) b = false;
		String cfseq = dto.getCoffee_seq().substring(1);
		be = service.updateOrderCount(cfseq);
		if(!be) b = false;
		
		if(b) {
			msg = "1/정상적으로 주문이 완료되었습니다";
		}else {
			msg = "0/주문 과정 중 오류가 발생하였습니다";
		}
		
		return msg;
	}
	
	@RequestMapping(value = "ofinish.do", method = RequestMethod.GET)
	public String ofinishMove() {
		System.out.println("mainController ofinishMove()");		
		return "ofinish.tiles";
	}
	
	
	@ResponseBody
	@RequestMapping(value = "getKindList.do", method = RequestMethod.POST)
	public List<coffeeDto> getKindList(int kind) {
		System.out.println("mainController getKindList() " +kind);	
		List<coffeeDto> list = new ArrayList<>();
		
		if(kind != 0) list = service.getCoffeeKindList(kind);
		else list = service.getCoffeeList();
			
		return list;
	}
	
	// 마이페이지 임시
	@RequestMapping(value = "mypage.do", method=RequestMethod.GET)
	public String mypage(MemberDto dto) {
		
		return "myPage.tiles";
	}
}
