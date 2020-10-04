package cc.factory.com.serviceImpl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.adminDao;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.service.adminService;

@Service
public class adminServiceImpl implements adminService {

	@Autowired
	adminDao dao;
	
	@Override
	public boolean uploadFile(coffeeDto dto) {
		return dao.uploadFile(dto)>0?true:false;
	}

}
