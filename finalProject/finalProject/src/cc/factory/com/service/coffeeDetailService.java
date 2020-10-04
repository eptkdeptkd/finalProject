package cc.factory.com.service;

import java.util.List;

import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;

public interface coffeeDetailService {

	public coffeeDto getDetailOne(int seq);
	public boolean addCartOne(cartDto dto);
	public List<cartDto> getCartAll(String id);
}
