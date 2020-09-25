package bit.com.a.login;

import bit.com.a.dto.MemberDto;

public interface MemberDao {

	//List<MemberDto> allMember();
	
	int getId(MemberDto mem);
	boolean addmember(MemberDto mem);
	MemberDto login(MemberDto dto);
	
}
