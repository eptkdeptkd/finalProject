package cc.factory.com.login;

import java.util.List;

public interface MemberDao {

	//List<MemberDto> allMember();
	
	int getId(MemberDto mem);
	boolean addmember(MemberDto mem);
	MemberDto login(MemberDto dto);
	
	boolean updateId(MemberDto mem);
	boolean deleteId(MemberDto mem);
	
	List<MemberDto> bestMember();
}
