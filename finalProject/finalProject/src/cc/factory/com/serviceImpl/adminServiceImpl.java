package cc.factory.com.serviceImpl;

import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.adminDao;
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
		
		SimpleDateFormat format1 = new SimpleDateFormat("yyyyMMdd");
		Date time = new Date();
		String t = format1.format(time);
		param.setToday(t);
		
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
			System.out.println("last = "+content.lastIndexOf("<br>"));
			content = content.substring(0,18);
			orderParam op = new orderParam(id,seq,content);
			System.out.println(op.toString());
			getlist.add(op);
		}
		return getlist;
	}



}
