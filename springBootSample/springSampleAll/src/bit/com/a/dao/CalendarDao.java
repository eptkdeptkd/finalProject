package bit.com.a.dao;

import java.util.List;

import bit.com.a.dto.CalendarDto;

public interface CalendarDao {

	List<CalendarDto> getCalendarList(CalendarDto cal);
	
	boolean writeCalendar(CalendarDto cal);
	
	CalendarDto getDay(CalendarDto cal);

	List<CalendarDto> getDayList(CalendarDto cal);

	List<CalendarDto> getCallistmonth(CalendarDto caldto);
}
