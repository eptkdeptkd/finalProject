package cc.factory.com.dao;

import java.util.List;

import cc.factory.com.dto.PostScriptDto;
import cc.factory.com.dto.PostScriptParam;

public interface PostScriptDao {
	
	List<PostScriptDto> getPsList(PostScriptParam ps);
	int getPsCount(PostScriptParam ps);
	
	boolean writePs(PostScriptDto dto);
	
	PostScriptDto getpostScript(int seq);
	void readCountPs(int seq);
	
	boolean replyPsUpdate(PostScriptDto ps);
	boolean replyPsInsert(PostScriptDto ps);
	
	void deletePs(int seq);
	void updatePs(PostScriptDto ps);
	
}
