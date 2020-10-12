package cc.factory.com.dao;

import java.util.List;
import java.util.Map;

import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderDto;

public interface coffeeDetailDao {

	public coffeeDto getDetailOne(int seq);
	public int addCartOne(cartDto dto);
	public List<cartDto> getCartAll(String id);
	public List<SideDto> getSyrupAll();
	
	public int getVisitCount(String id);
	public int addOrder(orderDto dto);
	public int addOrderDetail(orderDetailDto dto);
	public int updateVisitCount(String id);
	public int updateOrderCount(int seq);
	public int delCart(int seq);
	
	public List<coffeeDto> getCoffeeList();
	public List<coffeeDto> getCoffeeKindList(int kind);
	
}
