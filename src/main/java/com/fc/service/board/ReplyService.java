package com.fc.service.board;

import java.util.List;


import com.fc.dto.board.ReplyDto;

public interface ReplyService {



	
	public int replyInsert(ReplyDto replyDto);


	public List<ReplyDto> getCommentList();


	public List<ReplyDto> getCommentListbyNumber(ReplyDto replyDto);











}
