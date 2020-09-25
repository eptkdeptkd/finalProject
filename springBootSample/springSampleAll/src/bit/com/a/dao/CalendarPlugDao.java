package bit.com.a.dao;

import java.util.List;

import bit.com.a.dto.CalendarPlugDto;

public interface CalendarPlugDao {

	List<CalendarPlugDto> getCalendarPlugList(CalendarPlugDto dto);
}
