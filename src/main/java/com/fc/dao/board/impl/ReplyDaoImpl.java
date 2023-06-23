package com.fc.dao.board.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;

import com.fc.dao.board.ReplyDao;
import com.fc.dto.board.ReplyDto;

public class ReplyDaoImpl implements ReplyDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	  //댓글 목록
		@Override
		public List<ReplyDto> list(int postno) {
        return sqlSessionTemplate.selectList("Reply_mapper.listReply", postno);
    }

		@Override
		public void create(ReplyDto replydto) {
			// TODO Auto-generated method stub
			sqlSessionTemplate.insert("Reply_mapper.insertReply",replydto);
		}

		
		@Override
		public int count(int postno) {
			// TODO Auto-generated method stub
			return 0;
		}
}
