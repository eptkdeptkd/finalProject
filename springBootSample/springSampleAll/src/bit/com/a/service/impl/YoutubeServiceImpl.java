package bit.com.a.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import bit.com.a.dao.YoutubeDao;
import bit.com.a.dto.YoutubeSave;
import bit.com.a.service.YoutubeService;

@Service
public class YoutubeServiceImpl implements YoutubeService {

	@Autowired
	YoutubeDao dao;
	
	@Override
	public boolean addYou(YoutubeSave you) {		
		return dao.addYou(you);		
	}

	
}
