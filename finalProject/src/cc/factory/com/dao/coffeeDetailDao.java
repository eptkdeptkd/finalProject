package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDto;

public interface coffeeDetailDao {

	public coffeeDto getDetailOne(int seq);
	public int addCartOne(cartDto dto);
	public List<cartDto> getCartAll(String id);
	
	public int getVisitCount(String id);
	public int addOrder(orderDto dto);
	public int updateVisitCount(String id);
	public int updateOrderCount(String seq);
	
}