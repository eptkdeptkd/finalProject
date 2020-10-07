package cc.factory.com.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.adminDao;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
import cc.factory.com.dto.orderParam;

@Repository
public class adminDaoImpl implements adminDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Admin.";
	
	@Override
	public int uploadFile(coffeeDto dto) {
		return sqlSession.insert(ns+"uploadFile",dto);
	}

	@Override
	public List<orderParam> getOrderSeqList(orderParam param) {
		return sqlSession.selectList(ns+"getOrderSeqList",param);
	}

	@Override
	public List<orderDetailDto> getOrderList(int seq) {
		return sqlSession.selectList(ns+"getOrderList",seq);
	}

	
}
