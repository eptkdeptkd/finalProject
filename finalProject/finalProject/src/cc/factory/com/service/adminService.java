package cc.factory.com.service;

import java.util.List;

import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderParam;

public interface adminService {

	public boolean uploadFile(coffeeDto dto);
	public List<orderParam> getOrderList(orderParam param);
	
}
