package com.fc.service.reservationCalendar.impl;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;
import com.fc.service.reservationCalendar.ReservationCalendarService;

@Service
public class ReservationCalendarServiceImpl implements ReservationCalendarService {

	@Autowired
	ReservationCalendarDao reservationCalendarDao;

	@Override
	public List<ReservationCalendarDto> findDb2(String rsvfnm, String category, String date) {
		List<ReservationCalendarDto> list = reservationCalendarDao.selectReservationListBySearchKeyword(rsvfnm, category, date);
	    return list;
	}


	
	
}
