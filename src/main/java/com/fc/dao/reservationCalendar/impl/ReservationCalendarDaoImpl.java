package com.fc.dao.reservationCalendar.impl;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpSession;

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
	public List<ReservationCalendarDto> selectReservationListBySearchKeyword(String rsvfNm, String category, String date) {
	    List<ReservationCalendarDto> list = 
	        sqlSessionTemplate.selectList("reservationCalendar_mapper.select_reservation_list", Map.of("rsvfNm", rsvfNm, "category", category, "date", date));
	    
	    return list;
	}

	@Override
	public int insertReservation(ReservationCalendarDto reservationCalendarDto) {

		int result = sqlSessionTemplate.insert("reservationCalendar_mapper.insert_reservation", reservationCalendarDto);
		
		return result;
	}

	@Override
	public int updateReservation(ReservationCalendarDto reservationCalendarDto) {
		
		int result = sqlSessionTemplate.update("reservationCalendar_mapper.update_reservation", reservationCalendarDto);
		
		return result;
	}

	
	
}
