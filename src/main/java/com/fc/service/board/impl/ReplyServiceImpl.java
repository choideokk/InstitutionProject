package com.fc.service.board.impl;


import java.util.List;

import com.fc.dao.board.ReplyDao;
import com.fc.dto.board.ReplyDto;
import com.fc.service.board.ReplyService;

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
