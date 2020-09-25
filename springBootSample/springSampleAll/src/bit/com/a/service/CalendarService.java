package bit.com.a.service;

import java.util.List;

import bit.com.a.dto.CalendarDto;

public interface CalendarService {

	List<CalendarDto> getCalendarList(CalendarDto cal);
	
	boolean writeCalendar(CalendarDto cal);
	CalendarDto getDay(CalendarDto cal);
	
	List<CalendarDto> getDayList(CalendarDto cal);
	List<CalendarDto> getCallistmonth(CalendarDto caldto);
}
