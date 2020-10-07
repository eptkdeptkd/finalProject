package cc.factory.com.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.coffeeDetailDao;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;

@Repository
public class coffeeDetailDaoImpl implements coffeeDetailDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "coffeeDetail.";
	
	@Override
	public coffeeDto getDetailOne(int seq) {
		return sqlSession.selectOne(ns+"getDetailOne",seq);
	}

	@Override
	public int addCartOne(cartDto dto) {
		return sqlSession.insert(ns+"addCartOne",dto);
	}

	@Override
	public List<cartDto> getCartAll(String id) {
		return sqlSession.selectList(ns+"getCartAll",id);
	}

}
