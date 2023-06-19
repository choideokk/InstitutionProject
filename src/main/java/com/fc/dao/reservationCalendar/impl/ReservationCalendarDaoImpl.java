package com.fc.dao.reservationCalendar.impl;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.fc.dao.reservationCalendar.ReservationCalendarDao;
import com.fc.dto.reservationCalendar.ReservationCalendarDto;

@Repository
public class ReservationCalendarDaoImpl implements ReservationCalendarDao{

	@Autowired
	SqlSessionTemplate sqlSessionTemplate;

	@Override
	public List<ReservationCalendarDto> selectReservationListBySearchKeyword() {
		List<ReservationCalendarDto> list = 
				sqlSessionTemplate.selectList("reservationCalendar_mapper.select_reservation_list");
		
		return list;
	
	}
}
