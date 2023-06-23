package com.fc.dao.board.impl;

import java.util.List;
import java.util.Map;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.board.BoardDao;
import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.board.BoardDto;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;

@Repository
public class BoardDaoImpl implements BoardDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public int boardInsert(BoardDto boardDto) {
		// TODO Auto-generated method stub
	int result = sqlSessionTemplate.insert("board_mapper.insert_board", boardDto);
		
		return result;

	}
}
