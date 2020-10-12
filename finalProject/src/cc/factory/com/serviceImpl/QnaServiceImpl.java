package cc.factory.com.serviceImpl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.QnaDao;
import cc.factory.com.dto.QnaDto;
import cc.factory.com.dto.QnaParam;
import cc.factory.com.dto.QnaReplyDto;
import cc.factory.com.dto.QnaReplyPage;
import cc.factory.com.service.QnaService;

@Service
public class QnaServiceImpl implements QnaService {

	@Autowired
	QnaDao dao;

	/*
	@Override
	public List<QnaDto> QnaList() {
		return dao.QnaList();
	}
	*/
	
	@Override
	public List<QnaDto> getQnaList(QnaParam qp) {
		return dao.getQnaList(qp);
	}
	@Override
	public int getQnaCount(QnaParam qp) {
		return dao.getQnaCount(qp);
	}
	@Override
	public int countReply(int seq) {
		return dao.countReply(seq);
	}
	
	@Override
	public QnaDto getQna(int seq) {
		return dao.getQna(seq);
	}
	@Override
	public int readQna(int seq) {
		return dao.readQna(seq);
	}

	@Override
	public boolean writeQna(QnaDto dto) {
		return dao.writeQna(dto);
	}

	@Override
	public boolean deleteQna(int seq) {
		return dao.deleteQna(seq);
	}
	@Override
	public boolean deleteQnaReply(int seq) {
		return dao.deleteQnaReply(seq);
	}

	@Override
	public boolean updateQna(QnaDto dto) {
		return dao.updateQna(dto);
	}

	@Override
	public boolean writeQnaReply(QnaReplyDto dto) {
		return dao.writeQnaReply(dto);
	}

	@Override
	public int getQnaReplyCount(int qnaseq) {
		return dao.getQnaReplyCount(qnaseq);
	}
	@Override
	public List<QnaReplyDto> qnaReplyListData(QnaReplyPage pg) {
		return dao.qnaReplyListData(pg);
	}
	
	@Override
	public boolean removeQnaReply(int seq) {
		return dao.removeQnaReply(seq);
	}
	
	
}
