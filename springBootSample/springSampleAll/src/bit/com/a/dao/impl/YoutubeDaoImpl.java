package bit.com.a.dao.impl;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import bit.com.a.dao.YoutubeDao;
import bit.com.a.dto.YoutubeSave;

@Repository
public class YoutubeDaoImpl implements YoutubeDao {

	@Autowired
	SqlSession sqlSession;
	
	String ns = "Youtube.";

	@Override
	public boolean addYou(YoutubeSave you) {
		int n = sqlSession.insert(ns + "addYou", you);
		return n>0?true:false;
	}
	
	
}
