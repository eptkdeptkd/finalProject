package cc.factory.com.service.Impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.InfoDao;
import cc.factory.com.dto.InfoDto;
import cc.factory.com.dto.InfoParam;
import cc.factory.com.dto.InfoReDto;
import cc.factory.com.service.InfoService;

@Service
public class InfoServiceImpl implements InfoService {

	@Autowired
	InfoDao dao;

	@Override
	public List<InfoDto> getInfoList(InfoParam bbs) {		
		return dao.getInfoList(bbs);
	}
	@Override
	public int getInfoCount(InfoParam bbs) {		
		return dao.getInfoCount(bbs);		
	}



	@Override
	public boolean writeInfo(InfoDto dto) {		
		return dao.writeInfo(dto);		
	}

	@Override
	public InfoDto getInfo(int seq) {		
		return dao.getInfo(seq);		
	}

	@Override
	public void readCount(int seq) {
		dao.readCount(seq);		
	}
	
	/*
	 * @Override public void reply(InfoDto bbs) { // 댓글 dao.replyInfoUpdate(bbs);
	 * dao.replyInfoInsert(bbs); }
	 */
	
	@Override
	public void deleteInfo(int seq) {
		dao.deleteInfo(seq);		
	}
	@Override
	public void updateInfo(InfoDto bbs) {
		dao.updateInfo(bbs);
	}
	@Override
	public int getInfoReCount(int seq) {
		return dao.getInfoReCount(seq);
	}
	@Override
	public List<InfoReDto> getInfoReList(int seq) {
		return dao.getInfoReList(seq);
	}
	@Override
	public boolean writeRe(InfoReDto dto) {
		return dao.writeRe(dto);
	}
	
	


	
	
}
