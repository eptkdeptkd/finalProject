package cc.factory.com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.CalendarDao;
import cc.factory.com.dto.CalendarDto;
import cc.factory.com.service.CalendarService;

@Service
public class CalendarServiceImpl implements CalendarService {

	@Autowired
	CalendarDao dao;

	@Override
	public List<CalendarDto> getCalList() {
		List<CalendarDto> list = dao.getCalList();
		for(int i=0; i<list.size(); i++) {
			String d = list.get(i).getStartdate();
			d = d.substring(0,8);
			String yy = d.substring(0,4);
			String mm = d.substring(4,6);
			String dd = d.substring(6);
			list.get(i).setStartdate(yy+"-"+mm+"-"+dd);
		}
		return list;
	}

	@Override
	public boolean addCalendar(CalendarDto cal) {
		return dao.addCalendar(cal);
	}

	
	
}
