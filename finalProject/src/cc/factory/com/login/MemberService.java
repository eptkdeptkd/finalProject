package cc.factory.com.login;

import java.util.List;

import javax.servlet.http.HttpSession;

public interface MemberService {

	//List<MemberDto> allMember();
	
	int getId(MemberDto mem);
	boolean addmember(MemberDto mem);
	
	MemberDto login(MemberDto mem, HttpSession session);
		
	boolean updateId(MemberDto mem);
	boolean deleteId(MemberDto mem);
	
	List<MemberDto> bestMember();
}
