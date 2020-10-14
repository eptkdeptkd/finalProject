package cc.factory.com.controller;

import java.io.File;
import java.io.IOException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderParam;
import cc.factory.com.service.adminService;
import cc.factory.com.util.PdsUtil;

@Controller
public class adminController {

	@Autowired
	adminService service;
	
	@RequestMapping(value = "coffeeAddMove.do", method = RequestMethod.GET)
	public String coffeeAddMove() {
		return "coffeeAddMove.tiles";
	}
	
	@RequestMapping(value = "adminlink.do", method = RequestMethod.GET)
	public String adminlink() {
		return "adminlink.tiles";
	}
	
	
	@RequestMapping(value = "coffeeDelMove.do", method = RequestMethod.GET)
	public String coffeeDelMove(Model model) {
		List<coffeeDto> list = service.getCoffeeList();
		model.addAttribute("list",list);
		
		return "coffeeDelMove.tiles";
	}
	
	@RequestMapping(value = "delCoffee.do", method = RequestMethod.GET)
	public String delCoffee(int seq) {
		service.delCoffee(seq);
		return "redirect:/coffeeDelMove.do";
	}
	
	@RequestMapping(value = "orderhandleMove.do", method = RequestMethod.GET)
	public String orderhandleMove(orderParam param,Model model) {
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Date time = new Date();
		String t = format1.format(time);
		param.setToday(t);
		
		List<orderParam> list = service.getOrderList(param);
		int getTotOrder = service.getTotOrder(t);
		model.addAttribute("list",list);
		model.addAttribute("param1",param);
		model.addAttribute("totPage", getTotOrder);
		
		System.out.println("handler move success = "+ list.size()+", " +param.toString());
		return "orderhandleMove.tiles";
	}
	
	@RequestMapping(value = "coffeeAdd.do", method = RequestMethod.POST)
	public String coffeeAdd(@RequestParam(value="fileload",required=false )MultipartFile fileload, 
			HttpServletRequest req, coffeeDto dto, Model model) {
		System.out.println("adminController coffeeAdd() " + dto.toString());	
		
		String filename = fileload.getOriginalFilename();
		dto.setOriginname(filename);
		
		String fupload = req.getServletContext().getRealPath("/upload");
		
		String newfilename = PdsUtil.getNewFileName(filename);
		
		dto.setNewname(newfilename);
		
		File file = new File(fupload+"/"+newfilename);
		boolean b = false;
		try {
			FileUtils.writeByteArrayToFile(file, fileload.getBytes());
			
			b = service.uploadFile(dto);
			
		} catch (IOException e) {
			e.printStackTrace();
		}
		
		model.addAttribute("b", b);
		return "coffeeAddMove.tiles";
	}
	
	@ResponseBody
	@RequestMapping(value = "orderFin.do", method = {RequestMethod.GET,RequestMethod.POST})
	public boolean orderFin(int seq) {
		
		boolean b = service.orderFin(seq);
		return b;
	}
	
	@ResponseBody
	@RequestMapping(value = "getBbsList.do", method = RequestMethod.GET)
	public List<orderParam> getBbsList(orderParam param) {
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Date time = new Date();
		String t = format1.format(time);
		param.setToday(t);
		
		List<orderParam> list = service.getOrderList(param);

		return list;
	}
	
	// 사이드 추가 
	@RequestMapping(value = "addSide.do",  method = {RequestMethod.GET,	RequestMethod.POST})
	public String addSide() {
		System.out.println("adminController addSide()");
		
		return "addSide.tiles";
	}
	
	 // db 저장
	@RequestMapping(value = "addSideAf.do",  method = {RequestMethod.GET,	RequestMethod.POST})
	public String addSideAf(SideDto dto) {
		System.out.println("adminController addSideAf()" + new Date());
		
		boolean b =  service.addSide(dto);
		if(b) {
			System.out.println("사이드 추가완료" + new Date());
			return "main.tiles";
		}
			System.out.println("사이드 추가 실패" + new Date());
			return "addSide.tiles";
	}
	
	// 사이드 리스트 
	@RequestMapping(value = "sideList.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public String sideList(Model model) {
		
		List<SideDto> list = service.getsideList();
		model.addAttribute("sideList", list);
		
		return "sideList.tiles";
		
	}
	
	// 사이드 삭제 
	@RequestMapping(value = "sideDelete.do",  method = {RequestMethod.GET, RequestMethod.POST})
	public String sideDelete(int seq, Model model) {
		service.sideDelete(seq);
		return "redirect:/sideList.do";
	}
		
}
