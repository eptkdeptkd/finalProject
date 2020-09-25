package bit.com.a.service;

import java.util.List;

import bit.com.a.dto.PdsDto;

public interface PdsService {

	List<PdsDto> getPdsList();	
	boolean uploadPds(PdsDto dto);	
	PdsDto getPds(int seq);
	
	boolean updatePds(PdsDto dto);
}
