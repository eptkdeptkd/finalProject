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
	
	@RequestMapping(value = "orderhandleMove.do", method = RequestMethod.GET)
	public String orderhandleMove(orderParam param,Model model) {
		
		List<orderParam> list = service.getOrderList(param);
		model.addAttribute("list",list);
		model.addAttribute("param",param);
		
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
	
}
