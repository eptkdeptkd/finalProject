package bit.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.CalendarDao;
import bit.com.a.dto.CalendarDto;
import bit.com.a.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao dao;

	@Override
	public List<CalendarDto> getCalendarList(CalendarDto cal) {		
		return dao.getCalendarList(cal);
	}

	@Override
	public boolean writeCalendar(CalendarDto cal) {		
		return dao.writeCalendar(cal);		
	}

	@Override
	public CalendarDto getDay(CalendarDto cal) {		
		return dao.getDay(cal);		
	}
	
	@Override
	public List<CalendarDto> getDayList(CalendarDto cal) {		
		return dao.getDayList(cal);		
	}

	@Override
	public List<CalendarDto> getCallistmonth(CalendarDto caldto) {		
		return dao.getCallistmonth(caldto);		
	}
	
	
}
