package cc.factory.com.daoImpl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.adminDao;
import cc.factory.com.dto.coffeeDto;

@Repository
public class adminDaoImpl implements adminDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Admin.";
	
	@Override
	public int uploadFile(coffeeDto dto) {
		return sqlSession.insert(ns+"uploadFile",dto);
	}

}