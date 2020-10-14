package cc.factory.com.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.PostScriptDao;
import cc.factory.com.dto.PostScriptDto;
import cc.factory.com.dto.PostScriptParam;
@Repository
public class PostScriptDaoImpl implements PostScriptDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	String ns = "PostScript.";

	@Override
	public List<PostScriptDto> getPsList(PostScriptParam ps) {
		List<PostScriptDto> list = sqlSession.selectList(ns + "getPsList", ps);
		return list;
	}

	@Override
	public int getPsCount(PostScriptParam ps) {
		return sqlSession.selectOne(ns + "getPsCount", ps);
	}

	@Override
	public boolean writePs(PostScriptDto dto) {
		int n = sqlSession.insert(ns + "writePs", dto); 
		return n>0?true:false;
	}

	@Override
	public PostScriptDto getpostScript(int seq) {
		return sqlSession.selectOne(ns + "getpostScript", seq);
	}

	@Override
	public void readCountPs(int seq) {
		sqlSession.update(ns + "readCountPs", seq);
	}

	@Override
	public boolean replyPsUpdate(PostScriptDto ps) {
		sqlSession.update(ns + "replyPsUpdate", ps);
		return true;
	}

	@Override
	public boolean replyPsInsert(PostScriptDto ps) {
		sqlSession.insert(ns + "replyPsInsert", ps);
		return true;
	}

	@Override
	public void deletePs(int seq) {
		sqlSession.update(ns + "deletePs", seq);
	}

	@Override
	public void updatePs(PostScriptDto ps) {
		sqlSession.update(ns + "updatePs", ps);
	}

	

	
	
	
	
	
	

}
