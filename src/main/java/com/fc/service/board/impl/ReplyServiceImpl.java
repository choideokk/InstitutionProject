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
	public int replyInsert(ReplyDto replyDto) {
	    if (replyDto == null) {
	        throw new IllegalArgumentException("dto가 널이다.");
	    }

	    int result = replyDao.replyInsert(replyDto);
	    return result;
	}

	@Override
	public List<ReplyDto> getCommentList() {
		// TODO Auto-generated method stub
	
		List<ReplyDto> list = replyDao.list();
		
		return list;
	}



	@Override
	public List<ReplyDto> getCommentListbyNumber(ReplyDto replyDto) {
		// TODO Auto-generated method stub
		List<ReplyDto> list = replyDao.selectCommentListByNumber(replyDto);

		
		return list;
	}




	



	        
}
