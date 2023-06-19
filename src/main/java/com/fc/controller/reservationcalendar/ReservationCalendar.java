package com.fc.controller.reservationcalendar;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.fc.service.reservationCalendar.ReservationCalendarService;
import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;

@Controller
public class ReservationCalendar {
	
	@Autowired
	ReservationCalendarService reservationCalendarService;

	 @RequestMapping("/reservationCalendar")
	    public String reservationCalendar(Model model) {
	        List<ReservationCalendarDto> values = reservationCalendarService.findDb();  // DB에서 여러 값을 가져옵니다.
	        model.addAttribute("values", values);  // 값을 List로 Model 객체에 추가합니다.
	        
	        return "reservationCalendar";
	    }
	}


