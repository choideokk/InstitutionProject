package com.fc.dto.board;

import java.sql.Date;

import lombok.Data;

@Data
public class BoardDto {
	int postNo;
	String writer;
	Date updateDate;
	String title;
	String content;
	int recommend;
	int report;
	int viewCnt;

}
