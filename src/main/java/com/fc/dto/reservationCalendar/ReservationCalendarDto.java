package com.fc.dto.reservationCalendar;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationCalendarDto {
	int rsvtNo;
	Date rgsrDate;
	Date deadDate;
	Date toDate;
	int rsvtTime;
	String rsrcId;
	String rsvfNm;
	String category;
	int totalPeopleCnt;
	String jidone;
	String jidtwo;
	String jidthree;
	int status;
	String approval;
	String loginId;
	
}
