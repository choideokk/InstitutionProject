package com.fc.dao.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.board.ReplyDao;
import com.fc.dto.board.BoardDto;
import com.fc.dto.board.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;


	

	
	  //댓글 목록
	
		@Override
		public List<ReplyDto> list() {
			
			List<ReplyDto> list =  sqlSessionTemplate.selectList("Reply_mapper.listReply");
			
        return list;
    }

		@Override
		public int replyInsert(ReplyDto replyDto) {
			// TODO Auto-generated method stub
			
		int reulst = sqlSessionTemplate.insert("Reply_mapper.insertReply",replyDto);
			
		return reulst;
		}

		
		@Override
		public List<ReplyDto> selectCommentListByNumber(ReplyDto replyDto) {
			
			List<ReplyDto> list = sqlSessionTemplate.selectList("Reply_mpper.listNumberReply",replyDto);
			
			return list;
		}

	
}
