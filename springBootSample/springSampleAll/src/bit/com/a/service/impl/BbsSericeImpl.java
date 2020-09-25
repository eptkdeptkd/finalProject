package bit.com.a.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.BbsDao;
import bit.com.a.dto.BbsDto;
import bit.com.a.dto.BbsParam;
import bit.com.a.service.BbsService;

@Service
public class BbsSericeImpl implements BbsService {

	@Autowired
	BbsDao dao;

	@Override
	public List<BbsDto> getBbsList(BbsParam bbs) {		
		return dao.getBbsList(bbs);
	}
	@Override
	public int getBbsCount(BbsParam bbs) {		
		return dao.getBbsCount(bbs);		
	}



	@Override
	public boolean writeBbs(BbsDto dto) {		
		return dao.writeBbs(dto);		
	}

	@Override
	public BbsDto getBbs(int seq) {		
		return dao.getBbs(seq);		
	}

	@Override
	public void readCount(int seq) {
		dao.readCount(seq);		
	}
	
	@Override
	public void reply(BbsDto bbs) {	// 댓글
		dao.replyBbsUpdate(bbs);
		dao.replyBbsInsert(bbs);	
	}
	
	@Override
	public void deleteBbs(int seq) {
		dao.deleteBbs(seq);		
	}
	@Override
	public void updateBbs(BbsDto bbs) {
		dao.updateBbs(bbs);
	}
	
	

	/*
	@Override
	public List<BbsDto> getBbsList(BbsParam bbs) {		
		return dao.getBbsList(bbs);		
	}
	*/
	
	
}
