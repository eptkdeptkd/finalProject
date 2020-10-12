package cc.factory.com.service;

import java.util.List;

import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.alarmDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderParam;

public interface adminService {

	public boolean uploadFile(coffeeDto dto);
	public List<orderParam> getOrderList(orderParam param);
	public boolean orderHandle(int seq);
	public boolean addAlarm(alarmDto dto);
	public int getTotOrder(String today);
	public boolean orderFin(int seq);
	public boolean delCoffee(int seq);
	public List<coffeeDto> getCoffeeList();
	
	// 사이드 추가
	boolean addSide(SideDto dto);
	//사이드 리스트
	List<SideDto> getsideList();
	// 사이드 삭제
	void sideDelete(int seq);
	
}
