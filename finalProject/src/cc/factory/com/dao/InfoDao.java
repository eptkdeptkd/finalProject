package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.InfoDto;
import cc.factory.com.dto.InfoParam;
import cc.factory.com.dto.InfoReDto;

public interface InfoDao {

	List<InfoDto> getInfoList(InfoParam bbs);	
	int getInfoCount(InfoParam bbs);
	
	boolean writeInfo(InfoDto dto);
	
	InfoDto getInfo(int seq);
	void readCount(int seq);
	
	/*
	 * boolean replyInfoUpdate(InfoDto bbs); boolean replyInfoInsert(InfoDto bbs);
	 */
	
	//List<BbsDto> getBbsList(BbsParam bbs);
	
	void deleteInfo(int seq);
	void updateInfo(InfoDto bbs);
	
	
	public int getInfoReCount(int seq);
	
	List<InfoReDto> getInfoReList(int seq);	
	boolean writeRe(InfoReDto dto);
}
