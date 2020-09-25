package bit.com.a.controller;

import java.util.Calendar;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import bit.com.a.dto.CalParam;
import bit.com.a.dto.CalendarDto;
import bit.com.a.dto.CalendarParam;
import bit.com.a.dto.MemberDto;
import bit.com.a.service.CalendarService;
import bit.com.a.util.CalendarUtil;

@Controller
public class CalendarController {

	@Autowired
	CalendarService service;
	
	@RequestMapping(value = "calendarlist.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String calendarlist(Model model, HttpSession session, CalendarParam cal) {
		model.addAttribute("doc_title", "일정");
		
		cal.calculate();
		
		// 로그인 정보
		String id = ((MemberDto)session.getAttribute("login")).getId();
		// 날짜 취득
		String yyyymm = CalendarUtil.yyyymm(cal.getYear(), cal.getMonth());
		
		// dto set
		CalendarDto fcal = new CalendarDto();
		fcal.setId(id);
		fcal.setRdate(yyyymm);
		
		List<CalendarDto> list = service.getCalendarList(fcal);
		
		model.addAttribute("flist", list);
		model.addAttribute("cal", cal);
		
		return "calendar.tiles";		
	}
	
	@RequestMapping(value="calwrite.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calwrite(Model model, CalendarParam cal) {		
		model.addAttribute("doc_title", "일정쓰기");
		
		cal.calculate();
		model.addAttribute("cal", cal);
		
		return "calwrite.tiles";		
	}
	// calwriteAf.do
	@RequestMapping(value="calwriteAf.do", method={RequestMethod.GET, RequestMethod.POST})
	public String calwriteAf(Model model, CalParam calparam) {
		
		String yyyyMmdd=CalendarUtil.yyyymmddhhmm(calparam.getYear(),
				calparam.getMonth(), calparam.getDay(),
				calparam.getHour(),calparam.getMin());	// 시간까지 포함 시켰음.
		
		CalendarDto dto = new CalendarDto(calparam.getId(),
										calparam.getTitle(),
										calparam.getContent(),
										yyyyMmdd);		
		service.writeCalendar(dto);
		
		model.addAttribute("year", calparam.getYear());
		model.addAttribute("month", calparam.getMonth());
		
		return "forward:/calendarlist.do";		
	}

	@RequestMapping(value="caldetail.do", method={RequestMethod.GET, RequestMethod.POST})
	public String caldetail(CalendarDto cal, Model model) {
		model.addAttribute("doc_title", "일정보기");
		
		CalendarDto dto = service.getDay(cal);		
		model.addAttribute("cal", dto);		
		
		return "caldetail.tiles";		
	}
	
	@RequestMapping(value = "callist.do", method = {RequestMethod.POST,RequestMethod.GET})
	public String callist(HttpServletRequest request, CalendarParam calparam, Model model) {		
		model.addAttribute("doc_title", "CALENDAR 일별일정");
		
		System.out.println("calparam:" + calparam.toString());
		
		String id=((MemberDto)request.getSession().getAttribute("login")).getId();
		String yyyyMmdd=CalendarUtil.yyyymmdd(calparam.getYear(),
				calparam.getMonth(), calparam.getDay());
		
		CalendarDto fcal=new CalendarDto(-1, id, null, null, yyyyMmdd, null);
		
		System.out.println("id:" + id);
		System.out.println("yyyyMmdd:" + yyyyMmdd);
		
		List<CalendarDto> flist = service.getDayList(fcal);
				
		model.addAttribute("callist", flist);
		
		model.addAttribute("year", calparam.getYear());
		model.addAttribute("month", calparam.getMonth());
		
		return "callist.tiles";
	}
	
	@RequestMapping(value = "calendarMonth.do", method = {RequestMethod.GET, RequestMethod.POST})
	public String callistmonth(HttpServletRequest request, Model model, int year, int month) {
		model.addAttribute("doc_title", "월별 일정 목록");
		
		MemberDto dto = (MemberDto)request.getSession().getAttribute("login");
		
		String id = dto.getId();
		
		Calendar cal = Calendar.getInstance();
		
		if(year == 0 && month == 0){
			year = cal.get(Calendar.YEAR);
			month = cal.get(Calendar.MONTH) + 1;
		}
			
		String rdate = Integer.toString(year) + CalendarUtil.two(month);
		
		CalendarDto caldto = new CalendarDto();
		
		caldto.setId(id);
		caldto.setRdate(rdate);;
		
		List<CalendarDto> callistmonth = service.getCallistmonth(caldto);
		
		model.addAttribute("month", month);
		model.addAttribute("year", year);
		model.addAttribute("callistmonth", callistmonth);		
		
		return "calendarMonth.tiles";
	}
	
}









