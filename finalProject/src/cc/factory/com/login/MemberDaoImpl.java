package cc.factory.com.login;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository	// = 저장소
public class MemberDaoImpl implements MemberDao {

	@Autowired		// DI
	SqlSession sqlSession;		// SqlSession sqlSession = new SqlSessiontemplate();

	String namespace = "Member.";
	/*
	@Override
	public List<MemberDto> allMember() {
		List<MemberDto> list = sqlSession.selectList(namespace + "allMember");
		return list;
	}
	*/
	
	@Override
	public int getId(MemberDto mem) {		
		return sqlSession.selectOne(namespace + "getId", mem);
	}
	
	@Override
	public boolean addmember(MemberDto mem) {		
		int n = sqlSession.insert(namespace + "addmember", mem);		
		return n>0?true:false;
	}

	@Override
	public MemberDto login(MemberDto mem) {
		System.out.println("===> Mybatis로 loginCheck() 기능 처리");
		// 검색이 안되면 0을 반환해주기 때문에 0과 비교해서 참이면 false, 틀리면 true를 반환
		return  sqlSession.selectOne(namespace + "login", mem);
	}

	
	@Override
	public boolean updateId(MemberDto mem) {
		int n = sqlSession.update(namespace + "updateId", mem);		
		return n>0?true:false;
	}

	@Override
	public boolean deleteId(MemberDto mem) {
		int n = sqlSession.update(namespace + "deleteId", mem);		
		return n>0?true:false;
	}

	@Override
	public List<MemberDto> bestMember() {
		return sqlSession.selectList(namespace + "bestMember");
	}
}









