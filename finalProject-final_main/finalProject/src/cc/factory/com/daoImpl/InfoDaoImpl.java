package cc.factory.com.daoImpl;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.InfoDao;
import cc.factory.com.dto.InfoDto;
import cc.factory.com.dto.InfoParam;
import cc.factory.com.dto.InfoReDto;

@Repository
public class InfoDaoImpl implements InfoDao {

	@Autowired		// DI
	SqlSession sqlSession;
	
	String ns = "Info.";

	@Override
	public List<InfoDto> getInfoList(InfoParam bbs) {	
		List<InfoDto> list = sqlSession.selectList(ns + "Infolist", bbs);
		return list;
	}
	@Override
	public int getInfoCount(InfoParam bbs) {		
		return sqlSession.selectOne(ns + "getInfoCount", bbs);
	}



	@Override
	public boolean writeInfo(InfoDto dto) {
		int n = sqlSession.insert(ns + "writeInfo", dto);
		return n>0?true:false;
	}

	@Override
	public InfoDto getInfo(int seq) {		
		return sqlSession.selectOne(ns + "getInfo", seq);
	}

	@Override
	public void readCount(int seq) {
		sqlSession.update(ns + "readCount", seq);
	}
	
	/*
	 * @Override public boolean replyInfoUpdate(InfoDto bbs) {
	 * sqlSession.update(ns+"replyInfoUpdate", bbs); return true; }
	 * 
	 * @Override public boolean replyInfoInsert(InfoDto bbs) {
	 * sqlSession.insert(ns+"replyInfoInsert", bbs); return true; }
	 */

	/*
	@Override
	public List<BbsDto> getBbsList(BbsParam bbs) {
		List<BbsDto> list = sqlSession.selectList(ns + "getBbsSearchList", bbs);
		return list;
	}
	*/
	
	@Override
	public void deleteInfo(int seq) {
		sqlSession.update(ns+"deleteInfo", seq);
	}
	
	@Override
	public void updateInfo(InfoDto bbs) {
		sqlSession.update(ns+"updateInfo", bbs);
	}
	@Override
	public int getInfoReCount(int seq) {
		return sqlSession.selectOne(ns+"getInfoReCount", seq);
	}
	@Override
	public List<InfoReDto> getInfoReList(int seq) {
		List<InfoReDto> list = sqlSession.selectList(ns + "getInfoRelist", seq);
		return list;
		
	}
	@Override
	public boolean writeRe(InfoReDto dto) {
		int n = sqlSession.insert(ns + "writeRe", dto);
		return n>0?true:false;
	}
	
	
	
}






