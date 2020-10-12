package cc.factory.com.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.CalendarDao;
import cc.factory.com.dto.CalendarDto;

@Repository
public class CalendarDaoImpl implements CalendarDao {

	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String namespace = "Calendar.";

	@Override
	public List<CalendarDto> getCalList() {
		return sqlSession.selectList(namespace + "getCalList");
	}

	@Override
	public boolean addCalendar(CalendarDto cal) {
		int n = sqlSession.insert(namespace + "addCalendar", cal);
		return n>0?true:false;
	}
	
}
