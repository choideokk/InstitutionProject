--예약결제
--예약번호         
--학생번호
--수강신청일 
--수강 종료일
--인원수
--예약자정보
--결제 포인트

--시설정보테이블
CREATE TABLE facility_info (
 rsrcNo VARCHAR2(22) PRIMARY KEY,
 rsrcNm VARCHAR2(500),
 zip VARCHAR2(10),
 addr VARCHAR2(1000),
 daddr VARCHAR2(500),
 lot NUMBER(3, 13),
 lat NUMBER(3, 13),
 instUrlAddr VARCHAR2(1000),
 imeFileUrlAddr VARCHAR2(1000)
);

INSERT INTO facility_info VALUES ('EE25M4616164', '실내체육관 (충청연수원)', '31048', '충남 천안시 서북구 직산읍 남산2길 41',
'충청연수원', '36.882937', '127.173357', 'http://www.eshare.go.kr/..', 'http://www.eshare.go.kr/..');

INSERT INTO facility_info VALUES ('EE25K0036224', '운동장 (충청연수원)', '31048', '충남 천안시 서북구 직산읍 남산2길 41',
'충청연수원', '36.883234', '127.173284', 'http://www.eshare.go.kr/..', 'http://www.eshare.go.kr/..');

INSERT INTO facility_info VALUES ('CD14K5813615', '입장 게이트볼장', '31048', '충청남도 천안시 서북구 입장면 기로리 354-8',
'입장 게이트볼장', '36.909827', '127.242268', 'http://www.eshare.go.kr/..', 'http://www.eshare.go.kr/..');

INSERT INTO facility_info VALUES ('ABCDEFG1234', '자원명', '12345', '서울특별시 용산구 한강대로1번길1', '2동 3호', 35.12345, 128.12345, 'http://www.eshare.go.kr/..', 'http://www.eshare.go.kr/..');
INSERT INTO facility_info VALUES ('ABCDEFG1235', '자원명2', '54321', '서울 용산구 회나무로12길 27', '서울디지텍고등학교', 37.538999, 126.990544, 'http://www.eshare.go.kr/..', 'http://www.eshare.go.kr/..');

--시설상세정보테이블
CREATE TABLE facility_info_detail (
	rsrcNo VARCHAR2(1000),
	rsrcClsCd VARCHAR2(1000),
	rsrcClsNm VARCHAR2(1000),
	rsrcInstCd VARCHAR2(1000),
	rsrcInstNm VARCHAR2(1000),
	linkRsrcYn VARCHAR2(1000),
	usePsblYn VARCHAR2(1000),
	freeYn VARCHAR2(1000),
	rsrcIntr VARCHAR2(1000),
	usePrpse VARCHAR2(1000),
	atpn VARCHAR2(1000),
	lcInf VARCHAR2(1000),
	area NUMBER(38),
	inqTag VARCHAR2(1000),
	lossYn VARCHAR2(1000),
	amt1 NUMBER(10),
	amt2 NUMBER(10),
	updYmd VARCHAR2(1000),
	bnrImgFileUrlAddr VARCHAR2(1000),
	delYn VARCHAR2(1000),
	rsrcAprvYn VARCHAR2(1000),
	rsrcAprvYmd VARCHAR2(1000),
	sggCd VARCHAR2(1000),
	dtlUrlAddr VARCHAR2(1000),
	gdsAtrbCn VARCHAR2(1000),
	delYmd VARCHAR2(1000),
	rsvtNdlsYn VARCHAR2(1000),
	lcInsttCd VARCHAR2(1000),
	lcInsttNm VARCHAR2(1000)
);

  CREATE TABLE reservation_info (
    rsvtNo Number PRIMARY KEY,  --예약번호
    rgsrDate Date,  --등록일
    deadDate Date,  --마감일
    dDate Date,  --사용하는 날
    rsvtTime Number,   --사용하는 시간
    rsrcId VARCHAR2(1000) UNIQUE,  -- 개설자 아이디
    rsvfNm VARCHAR2(1000), --시설이름
    category VARCHAR2(500),  -- 종목
    totalPeopleCnt Number,  -- 참가 인원 숫자
    participant_id1 VARCHAR2(100),  -- 참가자1
    participant_id2 VARCHAR2(100),  -- 참가자2
    participant_id3 VARCHAR2(100),  -- 참가자3
    participant_id4 VARCHAR2(100),  --참가자4
    status Number, -- 상태
    approval  VARCHAR2(2)   --담당자 승인여부
    );
   
   select * from reservation_info;
    
   INSERT INTO reservation_info (rsvtNo, rgsrDate, deadDate, dDate, rsvtTime, rsrcId, rsvfNm, category, totalPeopleCnt, participant_id1, participant_id2, participant_id3, participant_id4, status, approval) 
VALUES (2, TO_DATE('2023-06-21','YYYY-MM-DD'), TO_DATE('2023-06-22','YYYY-MM-DD'), TO_DATE('2023-06-25','YYYY-MM-DD'), 1200, 'userId', 'Main Gym', 'Football', 4, 'participant1', 'participant2', 'participant3', 'participant4', 1, 'Y');
 
  COMMIT;
    
    
--회원정보테이블
CREATE TABLE MEMBER
   ( MEMBER_NO NUMBER, 
   LOGIN_ID VARCHAR2(30 BYTE), 
   PASSWORD VARCHAR2(30 BYTE), 
   MEMBER_NAME VARCHAR2(30 BYTE), 
   JOIN_DATE DATE DEFAULT SYSDATE,
   USER_CODE VARCHAR2(6 BYTE),
    POINT NUMBER,
    REPORT_COUNT NUMBER default 0
   );
   
--게시판테이블
--글번호
--작성자(아이디)
--작성날짜
--제목
--내용
--추천수
--신고수
--조회수
    CREATE TABLE board_infos (
        postNo Number,
        writer VARCHAR2(100),
        updateDate Date,
        title VARCHAR2(100),
        content VARCHAR2(3000),
        recommend Number,
        report Number,
        viewCnt Number
    );
    

select * from board_infos;








--레슨테이블1
CREATE TABLE LESSON (
  student_number NUMBER(10) PRIMARY KEY NOT NULL,  --학생번호
  lesson_start DATE, --레슨 시작일
  lesson_end DATE, --레슨 종료일
  student_id VARCHAR2(40), --학생 아이디
 	 CONSTRAINT student_fk FOREIGN KEY (student_id) REFERENCES LESSON_STUDENT_PROFILE(student_id)
 		ON DELETE SET NULL,
  lesson_id NUMBER(5), -- 레슨 아이디
  	CONSTRAINT teacher_fk  FOREIGN KEY (lesson_id) REFERENCES TEACHER_PROFILE(teacher_id) 
		ON DELETE SET NULL,
  possible VARCHAR2(10) DEFAULT '예약가능' -- 예약 가능한 날
);

select *
from LESSON;


--레슨테이블2

CREATE TABLE MUSICLESSON (
  lesson_id NUMBER(5) PRIMARY KEY,--레슨 아이디
  student_id NUMBER(10), --학생 아이디
  teacher_id NUMBER(5),--선생 아이디
  lesson_statr_date DATE, --레슨 시작일
  lesson_end_date DATE,--레슨 종료일
  start_time TIME, -- 시작 시간
  end_time TIME,  --끝나는 시간
  lesson_department VARCHAR2(50),-- 레슨 분야
  lesson_pay INT, --레슨 비용
  CONSTRAINT student_fk FOREIGN KEY (student_id) REFERENCES LESSON_STUDENT_PROFILE(student_id) ON DELETE SET NULL,
  CONSTRAINT teacher_fk FOREIGN KEY (teacher_id) REFERENCES LESSON_TEACHER_PROFILE(teacher_id) ON DELETE SET NULL
);
--학생정보
CREATE TABLE LESSON_STUDENT_PROFILE (
  student_id VARCHAR2(20) PRIMARY KEY,
  pw VARCHAR2(30) NOT NULL,
  gender VARCHAR2(4),
  interest VARCHAR2(20),
  name VARCHAR2(10) NOT NULL,
  level NUMBER(2),
  email VARCHAR2(50) NOT NULL,
  age INTEGER NOT NULL,
  address VARCHAR2(20) NOT NULL,
  phone INTEGER
);
--선생정보
CREATE TABLE LESSON_TEACHER_PROFILE (
  teacher_id VARCHAR2(20) PRIMARY KEY,
  pw VARCHAR2(30) NOT NULL,
  name VARCHAR2(10) NOT NULL,
  gender VARCHAR2(4),
  email VARCHAR2(50) NOT NULL,
  age INTEGER NOT NULL,
  address VARCHAR2(30) NOT NULL,
  phone INTEGER NOT NULL,
  department VARCHAR2(10) NOT NULL  -- 선생 파트
);

--공간 미정
CREATE TABLE facility (

);

--회원등급
CREATE TABLE STUDENT_GRADE (
 student_id VARCHAR2(20) PRIMARY KEY, --학생 아이디
 grade_gift VARCHAR2(200),-- 혜택
 grade_name  VARCHAR2(50), --등급이름 골드,플래티넘 등등
);





