package cc.factory.com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.coffeeDetailDao;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.service.coffeeDetailService;

@Service
public class coffeeDetailServiceImpl implements coffeeDetailService {

	@Autowired
	coffeeDetailDao dao;
	
	@Override
	public coffeeDto getDetailOne(int seq) {
		return dao.getDetailOne(seq);
	}

	@Override
	public boolean addCartOne(cartDto dto) {
		return dao.addCartOne(dto)>0?true:false;
	}

	@Override
	public List<cartDto> getCartAll(String id) {
		return dao.getCartAll(id);
	}

}
