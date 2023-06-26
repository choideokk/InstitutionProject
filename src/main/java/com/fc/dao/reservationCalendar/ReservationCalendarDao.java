package com.fc.dao.reservationCalendar;

import java.util.List;
import java.util.Map;

import com.fc.dto.reservationCalendar.ReservationCalendarDto;

public interface ReservationCalendarDao {

	public List<ReservationCalendarDto> selectReservationListBySearchKeyword(String rsvfnm, String category, String date);

}
