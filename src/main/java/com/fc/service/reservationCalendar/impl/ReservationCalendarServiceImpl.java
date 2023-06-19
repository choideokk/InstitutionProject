package com.fc.service.reservationCalendar.impl;

import java.util.List;

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
	public List<ReservationCalendarDto> findDb() {
		
		List<ReservationCalendarDto> list = reservationCalendarDao.selectReservationListBySearchKeyword();
		
		return list;
	}
	
}
