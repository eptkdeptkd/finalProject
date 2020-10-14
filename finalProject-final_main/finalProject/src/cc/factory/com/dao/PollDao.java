package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.PollDto;
import cc.factory.com.dto.PollSubDto;
import cc.factory.com.dto.Voter;

public interface PollDao {

	List<PollDto> getPollAllList();	
	int isVote(Voter voter);	
	void makePoll(PollDto poll);
	void makePollSub(PollSubDto pollsub);
	
	PollDto getPoll(PollDto poll);
	List<PollSubDto> getPollSubList(PollDto poll);
	
	void pollingVoter(Voter voter);
	void pollingPoll(Voter voter);
	void pollingSub(Voter voter);
	
}
