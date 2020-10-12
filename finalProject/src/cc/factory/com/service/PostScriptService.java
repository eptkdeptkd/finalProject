package cc.factory.com.service;

import java.util.List;

import cc.factory.com.dto.PostScriptDto;
import cc.factory.com.dto.PostScriptParam;

public interface PostScriptService {
	
	List<PostScriptDto> getPsList(PostScriptParam ps);
	int getPsCount(PostScriptParam ps);
	
	boolean writePs(PostScriptDto dto);
	
	PostScriptDto getpostScript(int seq);
	void readCountPs(int seq);
	
	void reply(PostScriptDto ps);
	
	void deletePs(int seq);
	void updatePs(PostScriptDto ps);

}
