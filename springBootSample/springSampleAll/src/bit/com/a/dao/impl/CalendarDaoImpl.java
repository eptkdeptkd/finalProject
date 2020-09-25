package bit.com.a.dao.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.CalendarDao;
import bit.com.a.dto.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Calendar.";

	@Override
	public List<CalendarDto> getCalendarList(CalendarDto cal) {		
		return sqlSession.selectList(ns + "getCalendar", cal);		
	}

	@Override
	public boolean writeCalendar(CalendarDto cal) {
		int n = sqlSession.insert(ns + "writeCalendar", cal); 
		return n>0?true:false;
	}

	@Override
	public CalendarDto getDay(CalendarDto cal) {
		return sqlSession.selectOne(ns + "getDay", cal);		
	}
	
	@Override
	public List<CalendarDto> getDayList(CalendarDto cal) {
		List<CalendarDto> list = sqlSession.selectList(ns + "getDayList", cal);		
		return list; 	
	}
	
	@Override
	public List<CalendarDto> getCallistmonth(CalendarDto caldto) {		
		return sqlSession.selectList(ns+"getCallistmonth", caldto);
	}
	
}
