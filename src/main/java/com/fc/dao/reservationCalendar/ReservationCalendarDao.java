package com.fc.dao.reservationCalendar;

import java.util.List;

import com.fc.dto.reservationCalendar.ReservationCalendarDto;

public interface ReservationCalendarDao {

	public List<ReservationCalendarDto> selectReservationListBySearchKeyword();
}
