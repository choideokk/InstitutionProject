package com.fc.controller.reservationcalendar;

import java.util.List;
import java.util.Map;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fc.service.reservationCalendar.ReservationCalendarService;
import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;

@Controller
public class ReservationCalendar {
	
	@Autowired
	ReservationCalendarService reservationCalendarService;

//	 @RequestMapping("/reservationCalendar")
//	    public String reservationCalendar(Model model) {
//	        List<ReservationCalendarDto> values = reservationCalendarService.findDb();  // DB에서 여러 값을 가져옵니다.
//	        model.addAttribute("values", values);  // 값을 List로 Model 객체에 추가합니다.
//	        
//	        return "reservationCalendar";
//	    }
	 
	 @RequestMapping("/reservationCalendar")
	 public String reservationCalendar(
		        @RequestParam("rsvfnm") String rsvfnm, 
		        @RequestParam("category") String category, 
		        @RequestParam("date") String date, 
		        Model model) {

		    // do something with these values
		 List<ReservationCalendarDto> values = reservationCalendarService.findDb2(rsvfnm, category, date);
		 Map<String, ReservationCalendarDto> valuesMap = new HashMap<>();
		 for (int i = 0; i < values.size(); i++) {
		     int rsvtTime = values.get(i).getRsvtTime();
		     
		     int key;
		     switch (rsvtTime) {
		         case 1000:
		             key = 1;
		             break;
		         case 1100:
		             key = 2;
		             break;
		         case 1200:
		             key = 3;
		             break;
		         case 1300:
		             key = 4;
		             break;
		         case 1400:
		             key = 5;
		             break;
		         case 1500:
		             key = 6;
		             break;
		         default:
		             throw new IllegalArgumentException("Invalid rsvtTime: " + rsvtTime);
		     }
		     	     
		     valuesMap.put("key" + key, values.get(i));

		    model.addAttribute("values", valuesMap);
		 }
		    return "reservation/reservationCalendar";
		
	 }
	 
	 @RequestMapping("/Calendar2")
	    public String calendar2() {

	        return "reservation/calendar2";
	    }
	
	}


