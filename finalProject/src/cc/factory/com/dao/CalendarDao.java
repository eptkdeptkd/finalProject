package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.CalendarDto;

public interface CalendarDao {
	
	List<CalendarDto> getCalList();
	boolean addCalendar(CalendarDto cal);
}
