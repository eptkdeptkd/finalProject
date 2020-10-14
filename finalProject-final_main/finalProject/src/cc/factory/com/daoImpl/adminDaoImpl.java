package cc.factory.com.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.adminDao;
import cc.factory.com.dto.SideDto;
import cc.factory.com.dto.alarmDto;
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

	@Override
	public int orderDetailFin(int seq) {
		return sqlSession.delete(ns+"orderDetailFin",seq);
	}

	@Override
	public int orderFin(int seq) {
		return sqlSession.delete(ns+"orderFin",seq);
	}

	@Override
	public int addAlarm(alarmDto dto) {
		return sqlSession.insert(ns+"addAlarm",dto);
	}

	@Override
	public int getTotOrder(String today) {
		return sqlSession.selectOne(ns+"getTotOrder",today);
	}

	@Override
	public int delCoffee(int seq) {
		return sqlSession.delete(ns+"delCoffee",seq);
	}

	@Override
	public List<coffeeDto> getCoffeeList() {
		return sqlSession.selectList(ns+"getCoffeeList");
	}
	
	// 사이드 추가 
	@Override
	public boolean addSide(SideDto dto) {
		int n = sqlSession.insert( ns + "addSide",dto);
		return n>0?true:false;
	}

	// 사이드 리스트
	@Override
	public List<SideDto> getsideList() {
		List<SideDto> list = sqlSession.selectList(ns + "sideList");
		return list;
	}

	@Override
	public void sideDelete(int seq) {
		sqlSession.delete(ns +"sideDelete", seq);
	}
		
}
