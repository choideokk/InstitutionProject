package com.fc.dto.board;

import java.sql.Date;

import org.springframework.format.annotation.DateTimeFormat;

import lombok.Data;

@Data
public class BoardDto {
	int postno;
	String writer;
	Date updatedate;
	Date changedate;
	String title;
	String content;
	int recommend;
	int report;
	int viewcnt;
	
	
}
