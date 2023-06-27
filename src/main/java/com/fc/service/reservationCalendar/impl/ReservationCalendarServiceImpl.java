package com.fc.service.reservationCalendar.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public List<ReservationCalendarDto> findDb2(String rsvfNm, String category, String date) {
		List<ReservationCalendarDto> list = reservationCalendarDao.selectReservationListBySearchKeyword(rsvfNm, category, date);
	    return list;
	}

	
	@Override
	public int createReservation(ReservationCalendarDto reservationCalendarDto) {

		int result = reservationCalendarDao.insertReservation(reservationCalendarDto);
		
		return result;
	}


	@Override
	public int updateReservation(ReservationCalendarDto reservationCalendarDto) {
		
			int result = reservationCalendarDao.updateReservation(reservationCalendarDto);
		
		return result;
	}



	
	
}
