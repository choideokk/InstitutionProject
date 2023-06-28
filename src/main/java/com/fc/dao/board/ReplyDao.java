package com.fc.dao.board;

import java.util.List;

import com.fc.dto.board.ReplyDto;

public interface ReplyDao {




	  public List<ReplyDto> list( );
	  
	  
	  List<ReplyDto> selectCommentListByNumber(ReplyDto replyDto);
	  
	  public int replyInsert(ReplyDto replyDto);
	 

}
