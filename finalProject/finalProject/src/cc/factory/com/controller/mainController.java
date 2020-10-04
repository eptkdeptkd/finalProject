package cc.factory.com.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.service.coffeeDetailService;

@Controller
public class mainController {

	@Autowired
	coffeeDetailService service;
	
	@RequestMapping(value = "main.do", method = RequestMethod.GET)
	public String mainMove() {
		System.out.println("mainController mainMove()");		
		return "main.tiles";
	}
	
	@RequestMapping(value = "coffeeDetailMove.do", method = RequestMethod.GET)
	public String coffeeDetailMove(int seq,Model model) {
		System.out.println("mainController coffeeDetailMove()");	
		
		coffeeDto dto = service.getDetailOne(seq);
		System.out.println(dto.toString());
		
		
		model.addAttribute("dto", dto);
		
		return "coffeeDetailMove.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "cart.do", method = RequestMethod.POST)
	public boolean order(cartDto dto) {
		System.out.println("mainController order() " + dto.toString());	
		
		boolean b = service.addCartOne(dto);
		
		return b;
	}
	
	@RequestMapping(value = "cartMove.do", method = RequestMethod.GET)
	public String cartMove(Model model, HttpServletRequest req ) {
		System.out.println("mainController cartMove()");	
		
		String id = (String) req.getSession().getId();
		id = "OJEA";
		
		List<cartDto> list = service.getCartAll(id);
		model.addAttribute("list",list);
		
		// syrup
		
		//model.addAttribute("sidelist",0);
		
		return "cartMove.tiles";
	}
	
	
}
