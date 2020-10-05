package cc.factory.com.service;

import java.util.List;

import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDto;

public interface coffeeDetailService {

	public coffeeDto getDetailOne(int seq);
	public boolean addCartOne(cartDto dto);
	public List<cartDto> getCartAll(String id);
	
	public int getVisitCount(String id);
	public boolean addOrder(orderDto dto);
	public boolean updateVisitCount(String id);
	public boolean updateOrderCount(String seq);
	
}