package com.fc.service.reservationCalendar;

import java.util.List;
import java.util.Map;

import com.fc.dto.reservationCalendar.ReservationCalendarDto;

public interface ReservationCalendarService  {

	
	
	public List<ReservationCalendarDto> findDb2(String rsvfnm, String category, String date);
	
	
}
