package cc.factory.com.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.adminDao;
import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.alarmDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderParam;
import cc.factory.com.service.adminService;

@Service
public class adminServiceImpl implements adminService {

	@Autowired
	adminDao dao;
	
	@Override
	public boolean uploadFile(coffeeDto dto) {
		return dao.uploadFile(dto)>0?true:false;
	}

	@Override
	public List<orderParam> getOrderList(orderParam param) {
		int s = ( param.getPageNumber() * param.getReadPerPage() ) + 1;
		int e = ( param.getPageNumber() * param.getReadPerPage() ) + param.getReadPerPage();
		param.setStart(s);
		param.setEnd(e);
		
		List<orderParam> getlist = new ArrayList<>(); // 총 받아오는 곳
		List<orderParam> seqlist = dao.getOrderSeqList(param);
		
		for(int i=0; i<seqlist.size(); i++) {
			String id= seqlist.get(i).getId();
			int seq = seqlist.get(i).getSeq();
			List<orderDetailDto> list = dao.getOrderList(seq);
			String content = "";
			for(int j=0; j<list.size(); j++) {
				content += list.get(j).getCoffee_name()+","+list.get(j).getShot()+","+list.get(j).getSyrup()+","+list.get(j).getAsk()+"<br>";
			}
			content = content.substring(0,content.lastIndexOf("<br>"));
			orderParam op = new orderParam(id,seq,content);
			getlist.add(op);
		}
		return getlist;
	}

	@Override
	public boolean orderHandle(int seq) {
		int b1 = dao.orderDetailFin(seq);
		int b2 = dao.orderFin(seq);
		return (b1>1 && b2>1)?true:false;
	}

	@Override
	public boolean addAlarm(alarmDto dto) {
		return dao.addAlarm(dto)>0?true:false;
	}

	@Override
	public int getTotOrder(String today) {	
		return dao.getTotOrder(today);
	}

	@Override
	public boolean orderFin(int seq) {
		int b1 =dao.orderDetailFin(seq);
		int b2 =dao.orderFin(seq);
		return (b1>0 && b2>0)?true:false;
	}

	@Override
	public boolean delCoffee(int seq) {
		return dao.delCoffee(seq)>0?true:false;
	}

	@Override
	public List<coffeeDto> getCoffeeList() {
		return dao.getCoffeeList();
	}

	@Override
	public boolean addSide(SideDto dto) {
		return dao.addSide(dto);
	}

	@Override
	public List<SideDto> getsideList() {
		return dao.getsideList();
	}

	@Override
	public void sideDelete(int seq) {
		dao.sideDelete(seq);
	}

}
