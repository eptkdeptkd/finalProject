package bit.com.a.service;

import java.util.List;

import bit.com.a.dto.PollBean;
import bit.com.a.dto.PollDto;
import bit.com.a.dto.PollSubDto;
import bit.com.a.dto.Voter;

public interface PollService {

	List<PollDto> getPollAllList(String id);	
	void makePoll(PollBean pbean);
	
	PollDto getPoll(PollDto poll);
	List<PollSubDto> getPollSubList(PollDto poll);
	
	void polling(Voter voter);
}
