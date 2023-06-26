package com.fc.dto.reservationCalendar;

import java.sql.Date;

import lombok.Data;

@Data
public class ReservationCalendarDto {
	int rsvtNo;
	Date rgsrDate;
	Date deadDate;
	String dDate;
	int rsvtTime;
	String rsrcId;
	String rsvfNm;
	String category;
	int totalPeopleCnt;
	String participant_id1;
	String participant_id2;
	String participant_id3;
	String participant_id4;
	int status;
	String approval;
	
}
