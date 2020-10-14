package cc.factory.com.login;


public interface MemberDao {

	//List<MemberDto> allMember();
	
	int getId(MemberDto mem);
	boolean addmember(MemberDto mem);
	MemberDto login(MemberDto dto);
	
}
