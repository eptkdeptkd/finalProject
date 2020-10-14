package cc.factory.com.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import cc.factory.com.dto.CalParam;
import cc.factory.com.dto.CalendarDto;
import cc.factory.com.dto.CalendarParam;
import cc.factory.com.login.MemberDto;
import cc.factory.com.service.CalendarService;
import cc.factory.com.util.CalendarUtil;

@Controller
public class CalendarController {

	@Autowired
	CalendarService service;

	/*
	 * @RequestMapping(value = "calendar.do", method = {RequestMethod.GET,
	 * RequestMethod.POST}) public String calList() {
	 * System.out.println("CalendarController calList()"); return "calList.tiles"; }
	 */

	@RequestMapping(value = "calendar.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String calList(Model model, HttpSession session) {
		System.out.println("CalendarController calList()");

		// MemberDto dto = (MemberDto) session.getAttribute("login");
		MemberDto dto = new MemberDto("aaa", "aaa");

		List<CalendarDto> list = service.getCalList();
		System.out.println("controller list - " + list.size());
		model.addAttribute("calList", list);

		return "calList.tiles";
	}
	
	// 일정 추가
	@RequestMapping(value = "addCalendar.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String addCalendar(Model model, CalendarParam cal) {

		cal.calculate();
		model.addAttribute("cal", cal);
		return "addCalendar.tiles";
	}
	
	// 일정 추가 확인 에러
	
	@RequestMapping(value = "addCalendarAf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public String calendarAf(Model model, CalParam calparam) {
		
		String yyyyMmdd=CalendarUtil.yyyymmddhhmm(calparam.getYear(),
				calparam.getMonth(), calparam.getDay(),
				calparam.getHour(),calparam.getMin());	// 시간까지 포함 시켰음.
		CalendarDto dto = new CalendarDto(calparam.getId(),
										  calparam.getTitle(), 
										  calparam.getContent(),
										  yyyyMmdd);
		
		service.addCalendar(dto);
		model.addAttribute("year", calparam.getYear());
		model.addAttribute("month", calparam.getMonth());
		
		return "forward:/calendar.do";
	}


}
