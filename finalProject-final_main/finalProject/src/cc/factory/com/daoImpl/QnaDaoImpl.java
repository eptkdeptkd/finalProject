package cc.factory.com.daoImpl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import cc.factory.com.dao.QnaDao;
import cc.factory.com.dto.QnaDto;
import cc.factory.com.dto.QnaParam;
import cc.factory.com.dto.QnaReplyDto;
import cc.factory.com.dto.QnaReplyPage;

@Repository
public class QnaDaoImpl implements QnaDao {
	
	@Autowired
	SqlSessionTemplate sqlSession;
	
	private String ns = "Qna.";

	/*
	@Override
	public List<QnaDto> QnaList() {
		
		return sqlSession.selectList(ns + "QnaList");
	}
	*/
	
	@Override
	public List<QnaDto> getQnaList(QnaParam qp) {
		return sqlSession.selectList(ns + "qnaList", qp);
	}
	@Override
	public int getQnaCount(QnaParam qp) {
		return sqlSession.selectOne(ns + "countQna", qp);
	}
	@Override
	public int countReply(int seq) {
		return sqlSession.selectOne(ns + "countReply", seq);
	}
	
	@Override
	public QnaDto getQna(int seq) {
		return sqlSession.selectOne(ns + "getQna", seq);
	}
	@Override
	public int readQna(int seq) {
		return sqlSession.update(ns + "readQna", seq);
	}

	@Override
	public boolean writeQna(QnaDto dto) {
		int n = sqlSession.insert(ns + "writeQna", dto);
		return n>0?true:false;
	}

	@Override
	public boolean deleteQna(int seq) {
		int n = sqlSession.delete(ns + "deleteQna", seq);
		return n>0?true:false;
	}
	@Override
	public boolean deleteQnaReply(int seq) {
		int n = sqlSession.delete(ns + "deleteQnaReply", seq);
		return n>0?true:false;
	}

	@Override
	public boolean updateQna(QnaDto dto) {
		int n = sqlSession.update(ns + "updateQna", dto);
		return n>0?true:false;
	}
	
	@Override
	public boolean writeQnaReply(QnaReplyDto dto) {
		int n = sqlSession.insert(ns + "writeQnaReply", dto);
		return n>0?true:false;
	}
	
	@Override
	public int getQnaReplyCount(int qnaseq) {
		return sqlSession.selectOne(ns + "getQnaReplyCount", qnaseq);
	}
	@Override
	public List<QnaReplyDto> qnaReplyListData(QnaReplyPage pg) {
		// TODO Auto-generated method stub
		return sqlSession.selectList(ns + "qnaReplyListData", pg);
	}
	
	@Override
	public boolean removeQnaReply(int seq) {
		int n = sqlSession.delete(ns + "removeQnaReply", seq);
		return n>0?true:false;
	}
	
}
