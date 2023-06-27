package com.fc.dao.reservationCalendar;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

import com.fc.dto.reservationCalendar.ReservationCalendarDto;

public interface ReservationCalendarDao {

	public int insertReservation(ReservationCalendarDto reservationCalendarDto);
	
	public int updateReservation(ReservationCalendarDto reservationCalendarDto);
	
	public List<ReservationCalendarDto> selectReservationListBySearchKeyword(String rsvfNm, String category, String date);

}
