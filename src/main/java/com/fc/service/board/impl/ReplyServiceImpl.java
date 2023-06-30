package com.fc.service.board.impl;


import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.dao.board.ReplyDao;
import com.fc.dto.board.ReplyDto;
import com.fc.service.board.ReplyService;
@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	ReplyDao replyDao;

	@Override
	public int replyInsert(ReplyDto replyDto) {
		// TODO Auto-generated method stub
		

		int result = replyDao.insertReply(replyDto);
		return result;
	}

	@Override
	public List<ReplyDto> list(int postno) {
		// TODO Auto-generated method stub
		
		List <ReplyDto> list = replyDao.listReply(postno);
		
		return list;
	}

	@Override
	public int replylike(Map<String, String> likeInfo) {
		// TODO Auto-generated method stub
		
		int result = replyDao.insertReplyLike(likeInfo);

		return result;
	}

	


	        
}
