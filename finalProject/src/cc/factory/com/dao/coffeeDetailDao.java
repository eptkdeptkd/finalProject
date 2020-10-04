package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;

public interface coffeeDetailDao {

	public coffeeDto getDetailOne(int seq);
	
	public int addCartOne(cartDto dto);
	
	public List<cartDto> getCartAll(String id);
	
}
