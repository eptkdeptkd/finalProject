package cc.factory.com.login;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


@Service	// controller, dao 중간에 위치.... DB데이터 가공
public class MemberServiceImpl implements MemberService {

	@Autowired				// ioc
	MemberDao memberDao;	// MemberDao memberDao = new MemberDaoImpl();
	
	/*
	@Override
	public List<MemberDto> allMember() {		
		return memberDao.allMember();
	}
	*/

	@Override
	public int getId(MemberDto mem) {		
		return memberDao.getId(mem);		
	}
	
	@Override
	public boolean addmember(MemberDto mem) {		
		return memberDao.addmember(mem);		
	}

	@Override
	public MemberDto login(MemberDto mem, HttpSession session) {		
		MemberDto result = memberDao.login(mem);
		System.out.println("MemberServiceImpl 임플임");
		if (result != null) {	//true 일경우 세션 등록
			//세션 변수 등록
			session.setAttribute("login", result);
		}
		return result;		
	}

	@Override
	public boolean updateId(MemberDto mem) {
		return memberDao.updateId(mem);
	}

	@Override
	public boolean deleteId(MemberDto mem) {
		return memberDao.deleteId(mem);
	}
	
	@Override
	public List<MemberDto> bestMember() {
		return memberDao.bestMember();
	}

}





