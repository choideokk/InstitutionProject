package com.fc.dto.board;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyDto {
	int postno ; //댓글번호
	int replynumber; //게시물 번호
	String replytext ; //댓글내용
	 String replyer; //댓글 작성자 id	
	 String name; //댓글 작성자 이름
	Date replyupdatedate;//댓글 작성자 이름
	Date replychangedate; //수정일자
	private String secret_reply; //비밀댓글 여부
	 private String writer; //member 테이블의 id

}
