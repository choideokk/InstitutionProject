package com.fc.service.board;


import java.util.List;
import java.util.Map;

import com.fc.dto.board.ReplyDto;

public interface ReplyService {

//	public List<ReplyDto> list(int postno);
//    public int count(int postno);            //댓글 수
//
//	public void create(ReplyDto replydto);
	
	
	public int replyInsert(ReplyDto replyDto);

	public List<ReplyDto> list(int replynumber);


	
	public int replylike(Map<String, String> likeInfo);


	
	
}
