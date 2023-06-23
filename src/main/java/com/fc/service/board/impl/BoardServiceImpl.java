package com.fc.service.board.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.dao.board.BoardDao;
import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.board.BoardDto;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;
import com.fc.service.board.BoardService;
import com.fc.service.reservationCalendar.ReservationCalendarService;

@Service
public class BoardServiceImpl implements BoardService {

	@Autowired
	BoardDao boardDao;

	@Override
	public int boardInsert(BoardDto boardDto) {
		// TODO Auto-generated method stub
		int result = boardDao.boardInsert(boardDto);
		
		return result;

	}
}
