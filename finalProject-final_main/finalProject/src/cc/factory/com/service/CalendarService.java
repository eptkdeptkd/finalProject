package cc.factory.com.service;

import java.util.List;

import cc.factory.com.dto.CalendarDto;

public interface CalendarService {

	List<CalendarDto> getCalList();
	
	boolean addCalendar(CalendarDto cal);
}
