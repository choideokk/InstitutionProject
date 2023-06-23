package com.fc.service.board;

import java.util.List;

import com.fc.dto.board.ReplyDto;

public interface ReplyService {

	public List<ReplyDto> list(int postno);
    public int count(int postno);            //댓글 수

	public void create(ReplyDto replydto);
}
