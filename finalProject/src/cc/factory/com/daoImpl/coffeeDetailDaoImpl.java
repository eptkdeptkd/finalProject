package cc.factory.com.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.coffeeDetailDao;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDto;

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

	@Override
	public int addOrder(orderDto dto) {
		return sqlSession.insert(ns+"addOrder",dto);
	}

	@Override
	public int getVisitCount(String id) {
		return sqlSession.selectOne(ns+"getVisitCount",id);
	}

	@Override
	public int updateVisitCount(String id) {
		return sqlSession.update(ns+"updateVisitCount",id);
	}

	@Override
	public int updateOrderCount(String seq) {
		int count = 1;
		String[] str = seq.split(",");
		for(int i=0; i<str.length; i++) {
			int c = sqlSession.update(ns+"updateOrderCount",Integer.parseInt(str[i]));
			if(c<0) count = -1;
		}
		return count;
	}

}
