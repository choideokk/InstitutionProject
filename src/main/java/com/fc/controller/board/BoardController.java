package com.fc.controller.board;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fc.service.board.BoardService;
import com.fc.service.reservationCalendar.ReservationCalendarService;
import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.board.BoardDto;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;

@Controller
public class BoardController {

	@Autowired
	BoardService boardService;

	@RequestMapping("/boardInsert")
	public String boardInsert(@ModelAttribute BoardDto boardDto) {
		
		System.out.println(boardDto);
		int result = boardService.boardInsert(boardDto);
		System.out.println(result);
		
		return "boardInsert";
	}
	
//	@RequestMapping("/boardInsert")
//	public String boardInsert2() {
//		
//		return "boardInsert";
//	}
	
}
