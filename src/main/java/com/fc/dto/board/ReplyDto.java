package com.fc.dto.board;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyDto {
	int postno; //게시물 번호
	Integer replynumber;  //댓글번호
	String replytext ; //댓글내용
	String replywriter; //댓글 작성자 id	
	String replyname; //댓글 작성자 이름
	Date replyupdatedate;//댓글 작성자 이름
	Date replychangedate; //수정일자
	int recommend;
	int report;
	private String secretreply; //비밀댓글 여부
	 private String replyuserid; //member 테이블의 id
	


			 
}
