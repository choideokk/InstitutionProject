package com.fc.controller.reservationcalendar;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.fc.service.map.MapService;
import com.fc.service.reservationCalendar.ReservationCalendarService;
import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.facility.FcDetailDto;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;

@Controller
public class ReservationCalendar {
	
	@Autowired
	ReservationCalendarService reservationCalendarService;
	
	@Autowired
	MapService mapService;
	 
	 @RequestMapping("/reservationCalendar")
	 public String reservationCalendar(
		        @RequestParam("rsvfNm") String rsvfNm, 
		        @RequestParam("category") String category, 
		        @RequestParam("date") String date, 
		        Model model) {

		 model.addAttribute("date", date);
		 model.addAttribute("rsvfNm", rsvfNm);
		 model.addAttribute("category", category);
		    // do something with these values
		 List<ReservationCalendarDto> values = reservationCalendarService.findDb2(rsvfNm, category, date);
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
		public String calendar2(@RequestParam String no, Model model) {
			FcDetailDto currentFc = mapService.getCurrentFacility(no);

			if (currentFc != null) {
				model.addAttribute("currentFc", currentFc);
				return "reservation/calendar2";
			} 

			return "error";
		}
	 
	 
	 
	 @PostMapping("/Calendar3")
	    public String calendar3(ReservationCalendarDto reservationCalendarDto,
	            Model model, HttpSession session) {
		 
		 	String loginId = (String) session.getAttribute("loginId");
		    reservationCalendarDto.setRsrcId(loginId);
		 	
		 
		 int result = reservationCalendarService.createReservation(reservationCalendarDto);
		
		    
			return "reservation/calendar3";
		}
	 
	 //ㅇㅇ
	 @PostMapping("/Calendar4")
	 public String calendar4(ReservationCalendarDto reservationCalendarDto,
	         Model model, HttpSession session) {

	     String loginId = (String) session.getAttribute("loginId");
	     int totalPeopleCnt = reservationCalendarDto.getTotalPeopleCnt();

	     // totalPeopleCnt 값이 1일 경우, participant_id1에 loginId를 설정
	     if (totalPeopleCnt == 1) {
	         reservationCalendarDto.setParticipant_id1(loginId);
	         reservationCalendarDto.setTotalPeopleCnt(2);
	         reservationCalendarDto.setStatus(1);
	         
	     } else if (totalPeopleCnt == 2) {
	         reservationCalendarDto.setParticipant_id2(loginId);
	         reservationCalendarDto.setTotalPeopleCnt(3);
	         reservationCalendarDto.setStatus(1);
	     }
	     
	     int result = reservationCalendarService.updateReservation(reservationCalendarDto);

	     return "reservation/calendar3";
	 }
	
	}


