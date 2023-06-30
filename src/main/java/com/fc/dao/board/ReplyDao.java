package com.fc.dao.board;

import java.util.List;
import java.util.Map;

import com.fc.dto.board.ReplyDto;

public interface ReplyDao {

	
//    public List<ReplyDto> list(int postno); //댓글 목록
//
//    
//    public int count(int postno);     //댓글 수
//
//	public void create(ReplyDto replydto);


	public int insertReply(ReplyDto replyDto);

	public List<ReplyDto> listReply(int postno);

	
	public int insertReplyLike(Map<String, String> likeInfo);

}
