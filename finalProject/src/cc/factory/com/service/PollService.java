package cc.factory.com.service;

import java.util.List;

import cc.factory.com.dto.PollBean;
import cc.factory.com.dto.PollDto;
import cc.factory.com.dto.PollSubDto;
import cc.factory.com.dto.Voter;

public interface PollService {

	List<PollDto> getPollAllList(String id);	
	void makePoll(PollBean pbean);
	
	PollDto getPoll(PollDto poll);
	List<PollSubDto> getPollSubList(PollDto poll);
	
	void polling(Voter voter);
}
