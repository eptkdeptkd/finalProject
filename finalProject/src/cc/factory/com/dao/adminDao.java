package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.alarmDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderParam;

public interface adminDao {
	
	public int uploadFile(coffeeDto dto);
	public List<orderParam> getOrderSeqList(orderParam param);
	public List<orderDetailDto> getOrderList(int seq);
	public int orderDetailFin(int seq);
	public int orderFin(int seq);
	public int addAlarm(alarmDto dto);
	public int getTotOrder(String today);
	public int delCoffee(int seq);
	public List<coffeeDto> getCoffeeList();
	
	
	boolean addSide(SideDto dto);// 사이드 추가
	List<SideDto>getsideList();// 사이드 리스트
	void sideDelete(int seq);// 사이드 삭제 

	
}
