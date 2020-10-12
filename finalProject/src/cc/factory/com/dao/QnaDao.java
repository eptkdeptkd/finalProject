package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.QnaDto;
import cc.factory.com.dto.QnaParam;
import cc.factory.com.dto.QnaReplyDto;
import cc.factory.com.dto.QnaReplyPage;


public interface QnaDao {

	//List<QnaDto> QnaList();
	List<QnaDto> getQnaList(QnaParam qp);
	int getQnaCount(QnaParam qp);
	int countReply(int seq);
	
	QnaDto getQna(int seq);
	int readQna(int seq);
	
	boolean writeQna(QnaDto dto);
	
	boolean deleteQna(int seq);
	boolean deleteQnaReply(int seq);
	
	boolean updateQna(QnaDto dto);
	
	boolean writeQnaReply(QnaReplyDto dto);
	
	int getQnaReplyCount(int qnaseq);
	List<QnaReplyDto> qnaReplyListData(QnaReplyPage pg);
	
	boolean removeQnaReply(int seq);
}
