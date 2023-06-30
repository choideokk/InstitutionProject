package com.fc.controller.reservationcalendar;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import java.sql.Date;
import java.util.HashMap;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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
	
	@PostMapping("/clearMyReservation")
	public String clearMyReservation(@RequestBody ReservationCalendarDto reservationCalendarDto, HttpSession session, Model model) {

		  String loginId = (String) session.getAttribute("loginId");
		   System.out.println("loginId: " + loginId);
	    
		   boolean checkMyReservation = reservationCalendarService.checkMyReservation(loginId);

		   if (checkMyReservation) {
			    int result = reservationCalendarService.clearReservation(reservationCalendarDto);
			    
			    return "reservation/myReservation";
	     }
		   
	    model.addAttribute("errorMessage", "예약 등록자가 아닙니다.");
	    
	    return "reservation/myReservation";
	}
	
	 
	 @RequestMapping("/reservationCalendar")
	 public String reservationCalendar(
		        @RequestParam("rsvfNm") String rsvfNm, 
		        @RequestParam("category") String category, 
		        @RequestParam("date") Date date, 
		        HttpSession session,
		        Model model) {
		 
		 model.addAttribute("date", date);
		 model.addAttribute("rsvfNm", rsvfNm);
		 model.addAttribute("category", category);
		 
		 String no = (String) session.getAttribute("no");
		
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
		public String calendar2(@RequestParam String no, Model model, HttpSession session) {
			FcDetailDto currentFc = mapService.getCurrentFacility(no);

			if (currentFc != null) {
				model.addAttribute("currentFc", currentFc);
				
				session.setAttribute("no", no);
				return "reservation/calendar2";
			} 

			return "error";
		}
	 
	 //예약 등록 했을 때
	 	 @RequestMapping("/Calendar3")
	    public String calendar3(ReservationCalendarDto reservationCalendarDto,
	            Model model, HttpSession session) {
		 
		 	String loginId = (String) session.getAttribute("loginId");
		    reservationCalendarDto.setRsrcId(loginId);
		 	
		    int result = reservationCalendarService.createReservation(reservationCalendarDto);
	
		    List<ReservationCalendarDto> values = reservationCalendarService.myReservation(loginId);
		    
		    model.addAttribute("values", values);
		    
		    return "redirect:/myReservation";
		}
	 	 
	 	 //나의 예약 페이지 접근 및 처리
	 	 @RequestMapping("/myReservation")
		    public String myReservation(Model model, HttpSession session) {
			 
			 	String loginId = (String) session.getAttribute("loginId");
			    
			    List<ReservationCalendarDto> values = reservationCalendarService.myReservation(loginId);
			    
			    model.addAttribute("values", values);
			    
			    return "reservation/myReservation";
			}
	 	 

	 //등록된 예약에 참가 했을 때
	 @PostMapping("/Calendar4")
	 public String calendar4(ReservationCalendarDto reservationCalendarDto,
	         Model model, HttpSession session) {

	     String loginId = (String) session.getAttribute("loginId");
	     int totalPeopleCnt = reservationCalendarDto.getTotalPeopleCnt();

	     // 중복 아이디 확인을 위한 쿼리 실행
	     boolean isDuplicateId = reservationCalendarService.checkDuplicateId(loginId);

	     if (isDuplicateId) {
	    	 	String no = (String) session.getAttribute("no");
	    	 	 model.addAttribute("errorMessage", "이미 참가되어 있는 예약입니다.");
	    	 	
	    	 	
	    	    List<ReservationCalendarDto> values = reservationCalendarService.myReservation(loginId);
	    	    model.addAttribute("values", values);
	    	    return "forward:/Calendar2?no=" + no;
	     }
	     
	     // totalPeopleCnt 값이 1일 경우, participant_id1에 loginId를 설정
	     if (totalPeopleCnt == 1) {
	         reservationCalendarDto.setJidone(loginId);
	         reservationCalendarDto.setTotalPeopleCnt(2);
	         reservationCalendarDto.setStatus(1);
	         
	     } else if (totalPeopleCnt == 2) {
	         // 기존 participant_id1 값을 유지하고 participant_id2에 loginId를 설정
	         reservationCalendarDto.setJidtwo(loginId);
	         reservationCalendarDto.setTotalPeopleCnt(3);
	         reservationCalendarDto.setStatus(1);
	     } else if (totalPeopleCnt == 3) {
	         // 기존 participant_id1 값을 유지하고 participant_id2에 loginId를 설정
	         reservationCalendarDto.setJidthree(loginId);
	         reservationCalendarDto.setTotalPeopleCnt(4);
	         reservationCalendarDto.setStatus(2);
	     }

	     int result = reservationCalendarService.updateReservation(reservationCalendarDto);

		 List<ReservationCalendarDto> values = reservationCalendarService.myReservation(loginId);
		    
		 model.addAttribute("values", values);
	     
		 return "redirect:/myReservation";
	 }
	
	}


