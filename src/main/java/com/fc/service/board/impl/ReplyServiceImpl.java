package com.fc.service.board.impl;


import java.util.List;

import org.springframework.stereotype.Service;

import com.fc.dao.board.ReplyDao;
import com.fc.dto.board.ReplyDto;
import com.fc.service.board.ReplyService;
@Service
public class ReplyServiceImpl implements ReplyService{

	ReplyDao replyDao;
	
	 @Override
	   public List<ReplyDto> list(int postno) {
	    
		 
		return replyDao.list(postno);

	 }

	


	@Override
	public int count(int postno) {
		// TODO Auto-generated method stub
		return 0;
		
	}
	  @Override
	public void create(ReplyDto replydto) {
		// TODO Auto-generated method stub
	        replyDao.create(replydto);
	}

	        
}
