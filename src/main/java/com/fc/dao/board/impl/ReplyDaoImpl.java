package com.fc.dao.board.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.dao.DuplicateKeyException;
import org.springframework.stereotype.Repository;
import org.springframework.web.bind.annotation.ModelAttribute;

import com.fc.dao.board.ReplyDao;
import com.fc.dto.board.BoardDto;
import com.fc.dto.board.ReplyDto;

@Repository
public class ReplyDaoImpl implements ReplyDao{
	
	@Autowired
	SqlSessionTemplate sqlSessionTemplate;
	
	  //댓글 목록
//		@Override
//		public List<ReplyDto> list(int postno) {
//        return sqlSessionTemplate.selectList("Reply_mapper.listReply", postno);
//    }
//
//		@Override
//		public void create(ReplyDto replydto) {
//			// TODO Auto-generated method stub
//			sqlSessionTemplate.insert("Reply_mapper.insertReply",replydto);
//		}
//
//		
//		@Override
//		public int count(int postno) {
//			// TODO Auto-generated method stub
//			return 0;
//		}
	

		@Override
		public int insertReply(@ModelAttribute ReplyDto replyDto) {
			// TODO Auto-generated method stub
			int result = sqlSessionTemplate.insert("Reply_mapper.insert_Reply",replyDto);
			
			return result;
		}
		
		@Override
		public List<ReplyDto> listReply(int postno) {

				List<ReplyDto> list = sqlSessionTemplate.selectList("Reply_mapper.list_Reply", postno);
		
				return list;
		}
	
		@Override
		public int insertReplyLike(Map<String, String> infoMap){
			// TODO Auto-generated method stub
			int finalResult = 0;
			try {
			int result = sqlSessionTemplate.insert("Reply_insert_info", infoMap);
				if (result == 1) {
					finalResult = sqlSessionTemplate.update("Reply_up_like", infoMap);
				}
			// 중복이 안돼서 좋아요를 누를 수 있는 상황이면
			} catch (Exception e) {
				
				finalResult = 0;
			}
			return finalResult;	
		}

		
		
}
