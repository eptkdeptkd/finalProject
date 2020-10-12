package cc.factory.com.serviceImpl;

import java.io.Serializable;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.PostScriptDao;
import cc.factory.com.dto.PostScriptDto;
import cc.factory.com.dto.PostScriptParam;
import cc.factory.com.service.PostScriptService;

@Service
public class PostScriptServiceImpl implements PostScriptService {
	
	@Autowired
	PostScriptDao dao;
	
	@Override
	public List<PostScriptDto> getPsList(PostScriptParam ps) {
		return dao.getPsList(ps);
	}

	@Override
	public int getPsCount(PostScriptParam ps) {
		return dao.getPsCount(ps);
	}

	@Override
	public boolean writePs(PostScriptDto ps) {
		return dao.writePs(ps);
	}

	@Override
	public PostScriptDto getpostScript(int seq) {
		return dao.getpostScript(seq);
	}

	@Override
	public void readCountPs(int seq) {
		dao.readCountPs(seq);
	}

	@Override
	public void reply(PostScriptDto ps) {
		dao.replyPsUpdate(ps);
		dao.replyPsInsert(ps);
	}

	@Override
	public void deletePs(int seq) {
		dao.deletePs(seq);
	}

	@Override
	public void updatePs(PostScriptDto ps) {
		dao.updatePs(ps);
	}
	
	
}
