package cc.factory.com.service.Impl;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cc.factory.com.dao.PollDao;
import cc.factory.com.dto.PollBean;
import cc.factory.com.dto.PollDto;
import cc.factory.com.dto.PollSubDto;
import cc.factory.com.dto.Voter;
import cc.factory.com.service.PollService;

@Service
public class PollServiceImpl implements PollService {
	
	@Autowired
	PollDao dao;

	@Override
	public List<PollDto> getPollAllList(String id) {
		
		// 모든 투표 목록을 갖고 온다.
		List<PollDto> list = dao.getPollAllList();
		
		// 편집을 해서 투표가 가능한지 설정해서 넘겨줄 리스트
		List<PollDto> plist = new ArrayList<PollDto>();
		
		for (PollDto poll : list) {
			int pollid = poll.getPollid();	// 투표 번호
			
			// 투표를 했으면 1, 안했으면 0
			int count = dao.isVote(new Voter(pollid, -1, id));
			if(count == 1) {	// 투표 했음
				poll.setVote(true);				
			}
			else {				// 투표 안했음
				poll.setVote(false);				
			}
			plist.add(poll);
		}
		return plist;
	}

	@Override
	public void makePoll(PollBean pbean) {
		
		// 투표 주제
		PollDto poll = new PollDto( pbean.getId(), 
									pbean.getQuestion(), 
									pbean.getSdate(), 
									pbean.getEdate(), 
									pbean.getItemcount(),
									0,
									pbean.getFilename(),
									pbean.getOldfilename());
		dao.makePoll(poll);
				
		// 투표 보기들
		String answer[] = pbean.getPollnum();
		
		for (int i = 0; i < pbean.getItemcount(); i++) {
			PollSubDto pollsub = new PollSubDto();
			pollsub.setAnswer(answer[i]);
			System.out.println(answer[i]);
			dao.makePollSub(pollsub);			
		}
	}

	@Override
	public PollDto getPoll(PollDto poll) {		
		return dao.getPoll(poll);
	}

	@Override
	public List<PollSubDto> getPollSubList(PollDto poll) {		
		return dao.getPollSubList(poll);		
	}

	@Override
	public void polling(Voter voter) {
		dao.pollingVoter(voter);
		dao.pollingPoll(voter);
		dao.pollingSub(voter);		
	}
	
	

	
}








