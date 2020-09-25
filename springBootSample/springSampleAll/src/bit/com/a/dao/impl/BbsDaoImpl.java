package bit.com.a.dao.impl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.BbsDao;
import bit.com.a.dto.BbsDto;
import bit.com.a.dto.BbsParam;

@Repository
public class BbsDaoImpl implements BbsDao {

	@Autowired		// DI
	SqlSession sqlSession;
	
	String ns = "Bbs.";

	@Override
	public List<BbsDto> getBbsList(BbsParam bbs) {	
		List<BbsDto> list = sqlSession.selectList(ns + "bbslist", bbs);
		return list;
	}
	@Override
	public int getBbsCount(BbsParam bbs) {		
		return sqlSession.selectOne(ns + "getBbsCount", bbs);
	}



	@Override
	public boolean writeBbs(BbsDto dto) {
		int n = sqlSession.insert(ns + "writeBbs", dto);
		return n>0?true:false;
	}

	@Override
	public BbsDto getBbs(int seq) {		
		return sqlSession.selectOne(ns + "getBbs", seq);
	}

	@Override
	public void readCount(int seq) {
		sqlSession.update(ns + "readCount", seq);
	}
	
	@Override
	public boolean replyBbsUpdate(BbsDto bbs) {		
		sqlSession.update(ns+"replyBbsUpdate", bbs);
		return true; 
	}

	@Override
	public boolean replyBbsInsert(BbsDto bbs) {
		sqlSession.insert(ns+"replyBbsInsert", bbs);
		return true;
	}

	/*
	@Override
	public List<BbsDto> getBbsList(BbsParam bbs) {
		List<BbsDto> list = sqlSession.selectList(ns + "getBbsSearchList", bbs);
		return list;
	}
	*/
	
	@Override
	public void deleteBbs(int seq) {
		sqlSession.update(ns+"deleteBbs", seq);
	}
	
	@Override
	public void updateBbs(BbsDto bbs) {
		sqlSession.update(ns+"updateBbs", bbs);
	}
	
}






