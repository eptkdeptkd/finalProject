package cc.factory.com.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.coffeeDetailDao;
import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.cartDto;
import cc.factory.com.dto.coffeeDto;
import cc.factory.com.dto.orderDetailDto;
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
		sqlSession.insert(ns+"addOrder",dto);
		return dto.getSeq();
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
	public int updateOrderCount(int seq) {
		return sqlSession.update(ns+"updateOrderCount",seq);
	}

	@Override
	public int addOrderDetail(orderDetailDto dto) {
		return sqlSession.insert(ns+"addOrderDetail",dto);
	}

	@Override
	public int delCart(int seq) {
		return sqlSession.delete(ns+"delCart",seq);
	}

	@Override
	public List<SideDto> getSyrupAll() {
		return sqlSession.selectList(ns+"getSyrupAll");
	}

	@Override
	public List<coffeeDto> getCoffeeList() {
		return sqlSession.selectList(ns+"getCoffeeList");
	}

	@Override
	public List<coffeeDto> getCoffeeKindList(int kind) {
		return sqlSession.selectList(ns+"getCoffeeKindList",kind);
	}

	@Override
	public int cartDel(int seq) {
		return sqlSession.delete(ns+"cartDel",seq);
	}

	@Override
	public List<coffeeDto> bestCoffee() {
		return sqlSession.selectList(ns+"bestCoffee");
	}
}
