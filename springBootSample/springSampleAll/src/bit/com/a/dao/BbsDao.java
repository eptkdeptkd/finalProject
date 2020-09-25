package bit.com.a.dao;

import java.util.List;

import bit.com.a.dto.BbsDto;
import bit.com.a.dto.BbsParam;

public interface BbsDao {

	List<BbsDto> getBbsList(BbsParam bbs);	
	int getBbsCount(BbsParam bbs);
	
	boolean writeBbs(BbsDto dto);
	
	BbsDto getBbs(int seq);
	void readCount(int seq);
	
	boolean replyBbsUpdate(BbsDto bbs);
	boolean replyBbsInsert(BbsDto bbs);
	
	//List<BbsDto> getBbsList(BbsParam bbs);
	
	void deleteBbs(int seq);
	void updateBbs(BbsDto bbs);
	
}
