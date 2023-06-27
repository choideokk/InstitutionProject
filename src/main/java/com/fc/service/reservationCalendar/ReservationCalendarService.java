package com.fc.service.reservationCalendar;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fc.dto.reservationCalendar.ReservationCalendarDto;

public interface ReservationCalendarService  {

	
	public int createReservation(ReservationCalendarDto reservationCalendarDto);
	
	public int updateReservation(ReservationCalendarDto reservationCalendarDto);
	
	public List<ReservationCalendarDto> findDb2(String rsvfNm, String category, String date);
	
	
}
