package com.fc.dto.board;

import java.sql.Date;

import lombok.Data;

@Data
public class ReplyDto {
	
	private int replyno;
	   private int postno;
	   private String replytext;
	    private String replywriter;
	    private Date updatedate;
	    private Date changedate;
}
