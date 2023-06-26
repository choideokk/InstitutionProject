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
 lat VARCHAR2(500),
 lot VARCHAR2(500),
 instUrlAddr VARCHAR2(1000),
 imgFileUrlAddr VARCHAR2(1000)
);

DROP TABLE facility_info CASCADE CONSTRAINTS;

SET DEFINE OFF;

 INSERT INTO facility_info VALUES(
      'DF16N2654325',
       '야외운동기구',
       '31058',
       '충남 천안시 서북구 입장면 호당리 235-3',
       '일원',
      '127.237124054246',
      '36.8960982224159',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=DF16N2654325',
      'https://www.eshare.go.kr/UserPortal/Upv/116360/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'EE25K0036224',
       '운동장 (충청연수원)',
       '31048',
       '충남 천안시 서북구 직산읍 남산2길 41',
       '충청연수원',
      '127.172950022415',
      '36.8833608345875',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=EE25K0036224',
      'https://www.eshare.go.kr/UserPortal/Upv/156433/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'EE25M4616164',
       '실내체육관 (충청연수원)',
       '31048',
       '충남 천안시 서북구 직산읍 남산2길 41',
       '충청연수원',
      '127.172950022415',
      '36.8833608345875',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=EE25M4616164',
      'https://www.eshare.go.kr/UserPortal/Upv/156534/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CD13S1300306',
       '직산 삼은공원 게이트볼장',
       '31035',
       '충남 천안시 서북구 직산읍 삼은리 510',
       '직산 삼은공원 게이트볼장',
      '127.157957354489',
      '36.8828179808063',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13S1300306',
      'https://www.eshare.go.kr/UserPortal/Upv/58321/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CD13S0148861',
       '성거읍 게이트볼장',
       '31044',
       '충남 천안시 서북구 성거읍 송남리 35-7',
       '성거읍 게이트볼장',
      '127.200644128285',
      '36.869221761454',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13S0148861',
      'https://www.eshare.go.kr/UserPortal/Upv/58306/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CD13S0341110',
       '성환 게이트볼장',
       '31018',
       '충남 천안시 서북구 성환읍 성월리 93-26',
       '성환 게이트볼장',
      '127.134955784315',
      '36.9120797263514',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13S0341110',
      'https://www.eshare.go.kr/UserPortal/Upv/58309/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CD13S0556367',
       '쌍용3동 게이트볼장',
       '31166',
       '충남 천안시 서북구 쌍용동 1281',
       '쌍용3동 게이트볼장',
      '127.123706491678',
      '36.8022778206743',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13S0556367',
      'https://www.eshare.go.kr/UserPortal/Upv/58312/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CD13S0806224',
       '쌍용1동 게이트볼장 (쌍용 배수지 게이트볼장)',
       '31167',
       '충남 천안시 서북구 쌍용동 313-5',
       '쌍용1동 게이트볼장 (쌍용 배수지 게이트볼장)',
      '127.127027743175',
      '36.8104463170965',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13S0806224',
      'https://www.eshare.go.kr/UserPortal/Upv/58315/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CD14K5813615',
       '입장 게이트볼장',
       '31056',
       '충남 천안시 서북구 입장면 기로리 354-8',
       '입장 게이트볼장',
      '127.242274470785',
      '36.9097309498513',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD14K5813615',
      'https://www.eshare.go.kr/UserPortal/Upv/58349/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26N0425124',
       '북부스포츠센터 수영장',
       '31019',
       '충남 천안시 서북구 성환읍 성환1로 45',
       '북부스포츠센터',
      '127.131995092017',
      '36.8997723687957',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N0425124',
      'https://www.eshare.go.kr/UserPortal/Upv/56415/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26O2402862',
       '천안종합운동장 육상장',
       '31157',
       '충남 천안시 서북구 번영로 208 (백석동)',
       '종합운동장',
      '127.113305208572',
      '36.8191007470086',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26O2402862',
      'https://www.eshare.go.kr/UserPortal/Upv/56457/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26N1414110',
       '북부스포츠센터 축구장',
       '31019',
       '충남 천안시 서북구 성환읍 성환1로 45',
       '북부스포츠센터',
      '127.131995092017',
      '36.8997723687957',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N1414110',
      'https://www.eshare.go.kr/UserPortal/Upv/56427/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26N1120787',
       '북부스포츠센터 다목적실',
       '31019',
       '충남 천안시 서북구 성환읍 성환1로 45',
       '북부스포츠센터',
      '127.131995092017',
      '36.8997723687957',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N1120787',
      'https://www.eshare.go.kr/UserPortal/Upv/56424/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26N0851084',
       '북부스포츠센터 다목적 체육관',
       '31019',
       '충남 천안시 서북구 성환읍 성환1로 45',
       '북부스포츠센터',
      '127.131995092017',
      '36.8997723687957',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N0851084',
      'https://www.eshare.go.kr/UserPortal/Upv/56421/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26N0640847',
       '북부스포츠센터 헬스장',
       '31019',
       '충남 천안시 서북구 성환읍 성환1로 45',
       '북부스포츠센터',
      '127.131995092017',
      '36.8997723687957',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N0640847',
      'https://www.eshare.go.kr/UserPortal/Upv/56418/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26M4918248',
       '한들문화센터 헬스장',
       '31094',
       '충남 천안시 서북구 음봉로 861-50 (백석동)',
       '한들문화센터',
      '127.104606412951',
      '36.828034199931',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26M4918248',
      'https://www.eshare.go.kr/UserPortal/Upv/56412/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26M4626561',
       '한들문화센터 수영장',
       '31094',
       '충남 천안시 서북구 음봉로 861-50 (백석동)',
       '한들문화센터',
      '127.104606412951',
      '36.828034199931',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26M4626561',
      'https://www.eshare.go.kr/UserPortal/Upv/56409/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26M2604476',
       '천안축구센터 풋살장',
       '31136',
       '충남 천안시 서북구 축구센터로 150 (성정동)',
       '천안축구센터',
      '127.145765483021',
      '36.8214400797856',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26M2604476',
      'https://www.eshare.go.kr/UserPortal/Upv/56388/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26M2224006',
       '천안축구센터 인조잔디구장',
       '31136',
       '충남 천안시 서북구 축구센터로 150 (성정동)',
       '천안축구센터',
      '127.145765483021',
      '36.8214400797856',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26M2224006',
      'https://www.eshare.go.kr/UserPortal/Upv/56385/fileDetail.do?file_sn=1'
    );

    INSERT INTO facility_info VALUES(
      'CC26M2012640',
       '천안축구센터 천연잔디구장',
       '31136',
       '충남 천안시 서북구 축구센터로 150 (성정동)',
       '천안축구센터',
      '127.145765483021',
      '36.8214400797856',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26M2012640',
      'https://www.eshare.go.kr/UserPortal/Upv/56382/fileDetail.do?file_sn=1'
    );
    
       INSERT INTO facility_info VALUES(
      'DF16N2241001','야외운동기구','31225','충남 천안시 동남구 목천읍 도장리 387',
       '일원','127.177992977134',
       '36.7460179280692',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=DF16N2241001',
      'https://www.eshare.go.kr/UserPortal/Upv/116348/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'DF16N2451662','야외운동기구','31246','충남 천안시 동남구 성남면 용원리 370-6',
       '일원','127.212980568471',
       '36.7481934266438',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=DF16N2451662',
      'https://www.eshare.go.kr/UserPortal/Upv/116354/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'BA10A0015174','한국도로공사 천안지사 사옥 후면(테니스장)','31067','충청남도 천안시 동남구 망향로 14',
       '한국도로공사 천안지사','127.16705073363659',
       '36.827467438280465',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=BA10A0015174',
      'https://www.eshare.go.kr/UserPortal/Upv/31258/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13K1044197','광덕면게이트볼장(광덕게이트볼장)','31221','충남 천안시 동남구 광덕면 신흥리 276',
       '광덕면게이트볼장(광덕게이트볼장)','127.108281917835',
       '36.6978443241836',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13K1044197',
      'https://www.eshare.go.kr/UserPortal/Upv/58001/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13K0659488','풍세면게이트볼장(풍세게이트볼장)','31213','충남 천안시 동남구 풍세면 남관리 675',
       '풍세면게이트볼장','127.128728602172',
       '36.7526485970156',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13K0659488',
      'https://www.eshare.go.kr/UserPortal/Upv/57998/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13K2459103','풍세그라운드골프장','31217','충청남도 천안시 동남구 풍세면 풍년길 58',
       '천안시 동남구 풍세면 풍서리 676-107번지(도로명주소 없음) 풍세그라운드골프장 (풍서천 인근)','127.11962499974108',
       '36.72317537871331',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13K2459103',
      'https://www.eshare.go.kr/UserPortal/Upv/58013/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q0552535','동면 다목적체육관','31258','충남 천안시 동남구 동면 동산리 551-1',
       '동면 다목적체육관','127.348319137479',
       '36.7787859537969',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q0552535',
      'https://www.eshare.go.kr/UserPortal/Upv/58065/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q0952173','동면 게이트볼장','31258','충남 천안시 동남구 동면 동산리 551-2',
       '동면 게이트볼장','127.34889643203',
       '36.7785504237092',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q0952173',
      'https://www.eshare.go.kr/UserPortal/Upv/58071/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q1342629','천안정','31232','충청남도 천안시 동남구 목천읍 삼방로 77-31',
       '천안정','127.23179162511488',
       '36.77429245568272',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q1342629',
      'https://www.eshare.go.kr/UserPortal/Upv/58079/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q1804040','천안승마장','31232','충청남도 천안시 동남구 목천읍 독립기념관로 1',
       '천안승마장','127.22863252898688',
       '36.7779661042754',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q1804040',
      'https://www.eshare.go.kr/UserPortal/Upv/58085/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q2224023','목천 서리 게이트볼장','31231','충남 천안시 동남구 목천읍 서리 100-16',
       '목천 서리 게이트볼장','127.234975194843',
       '36.783580568789',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q2224023',
      'https://www.eshare.go.kr/UserPortal/Upv/58105/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q4525063','목천 체육관','31246','충남 천안시 동남구 목천읍 운전리 22-5',
       '목천 체육관','127.23328080466',
       '36.7679534445328',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q4525063',
      'https://www.eshare.go.kr/UserPortal/Upv/58180/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q4709394','병천 게이트볼장','31254','충남 천안시 동남구 병천면 병천리 360-1',
       '병천 게이트볼장','127.302493436308',
       '36.7668472894576',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q4709394',
      'https://www.eshare.go.kr/UserPortal/Upv/58190/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q5236030','아우내 체육관','31256','충남 천안시 동남구 병천면 탑원리 292',
       '아우내 체육관','127.308897862136',
       '36.7605271772394',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q5236030',
      'https://www.eshare.go.kr/UserPortal/Upv/58223/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q5640951','북면 게이트볼장','31238','충남 천안시 동남구 북면 오곡리 399-1',
       '북면 게이트볼장','127.27368724571',
       '36.8273658628818',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q5640951',
      'https://www.eshare.go.kr/UserPortal/Upv/58246/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13Q5855589','성남 게이트볼장','31245','충남 천안시 동남구 성남면 신사리 431-7',
       '성남 게이트볼장','127.233142069418',
       '36.7433565456672',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13Q5855589',
      'https://www.eshare.go.kr/UserPortal/Upv/58256/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13R0553345','수신 게이트볼장','31251','충남 천안시 동남구 수신면 속창리 54-22',
       '수신 게이트볼장','127.2808105556',
       '36.7282383488397',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13R0553345',
      'https://www.eshare.go.kr/UserPortal/Upv/58272/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13R1040370','천안 신방 체육관','31203','충남 천안시 동남구 신방동 115',
       '천안 신방 체육관(041-592-8556)','127.129305550192',
       '36.7852073062169',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13R1040370',
      'https://www.eshare.go.kr/UserPortal/Upv/58281/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13R1308554','도솔광장 인공암벽장','31115','충남 천안시 동남구 천안대로 844 (신부동)',
       '도솔광장 인공암벽장','127.162963381378',
       '36.8243337408361',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13R1308554',
      'https://www.eshare.go.kr/UserPortal/Upv/58289/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13R1503667','중앙동 게이트볼장','31131','충남 천안시 동남구 오룡동 111',
       '중앙동 게이트볼장','127.150282907015',
       '36.8048828693391',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13R1503667',
      'https://www.eshare.go.kr/UserPortal/Upv/58294/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13R1705027','원성1동 게이트볼장','31125','충남 천안시 동남구 원성동 31-15',
       '원성1동 게이트볼장','127.162421707363',
       '36.8127383811328',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13R1705027',
      'https://www.eshare.go.kr/UserPortal/Upv/58297/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CD13R1958816','천안시 장애인 종합체육관','31068','충남 천안시 동남구 향교1길 104-38 (유량동)',
       '천안시 장애인 종합체육관(041-558-7356)','127.169320391597',
       '36.8135868856712',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CD13R1958816',
      'https://www.eshare.go.kr/UserPortal/Upv/58300/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'BA10A0015167','한국기술교육대학교 운동장','31253','충남 천안시 동남구 병천면 충절로 1600',
       '다산정보관','127.281200389603',
       '36.765104950533',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=BA10A0015167',
      'https://www.eshare.go.kr/UserPortal/Upv/69506/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CC26N2321095','태조산공원 인조잔디구장','31068','충남 천안시 동남구 태조산길 261 (유량동)',
       '태조산공원','127.188954140775',
       '36.8220781941172',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N2321095',
      'https://www.eshare.go.kr/UserPortal/Upv/56436/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CC26N2535948','태조산공원 족구장','31068','충남 천안시 동남구 태조산길 261 (유량동)',
       '태조산공원','127.188954140775',
       '36.8220781941172',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N2535948',
      'https://www.eshare.go.kr/UserPortal/Upv/56439/fileDetail.do?file_sn=1'
   );

   INSERT INTO facility_info VALUES(
      'CC26N1922175','천안야구장','31073','충남 천안시 동남구 천안대로 320 (삼룡동)',
       '천안야구장','127.164984630775',
       '36.7761051672514',
      'https://www.eshare.go.kr/UserPortal/Upv/UprResrcFacl/index.do?rsrc_no=CC26N1922175',
      'https://www.eshare.go.kr/UserPortal/Upv/56433/fileDetail.do?file_sn=1'
    );

select * from facility_info;

--시설상세정보테이블
CREATE TABLE facility_info_detail (
    rsrcNo VARCHAR2(1000) PRIMARY KEY,
	rsrcClsCd VARCHAR2(1000),
	rsrcClsNm VARCHAR2(1000),
	rsrcInstCd VARCHAR2(1000),
	rsrcInstNm VARCHAR2(1000),
	usePsblYn VARCHAR2(1000),
	freeYn VARCHAR2(1000),
	rsrcIntr VARCHAR2(3000),
	atpn VARCHAR2(2000),
	lcInf VARCHAR2(1000),
	area NUMBER(1000),
	inqTag VARCHAR2(1000),
	updYmd VARCHAR2(1000),
	bnrImgFileUrl VARCHAR2(1000),
	delYn VARCHAR2(1000),
	rsrcAprvYn VARCHAR2(1000),
	sggCd VARCHAR2(1000),
	rsvtNdlsYn VARCHAR2(1000),
	lcInsttCd VARCHAR2(1000),
	lcInsttNm VARCHAR2(1000),
    
    foreign key (rsrcNo)
    references facility_info(rsrcNo)
);

DROP TABLE facility_info_detail CASCADE CONSTRAINTS;

select * from facility_info_detail;


INSERT INTO facility_info_detail VALUES(
    'BA10A0015167','010510','운동장','7004123','한국기술교육대학교','Y','N',
    '&lt;수용인원&gt; 1000명 &lt;개수&gt; 1 &lt;사용요금&gt; 1시간 150,000원 &lt;평일개방&gt; 09:00~20:00 &lt;토요일개방&gt; 09:00~20:00 &lt;휴일개방&gt; 09:00~20:00',
    '<p><br></p>','본관옆','운동장;한국기술교육대학교;',
    '2022-03-21','https://www.eshare.go.kr/UserPortal/Upv/69506/fileDetail.do?file_sn=1',
    'N','Y','44131','N','LC007699','한국기술교육대학교'
);
    
INSERT INTO facility_info_detail VALUES(
    'BA10A0015174','010503','테니스장','D412418', '한국도로공사 본부 대전충청본부 천안지사(대전충청)',
    'Y', 'Y', '<span style=''font-size: 12pt;''>현재 동계 제설 작업 준비 등으로 사용이 불가능하오니 참고하시기 바랍니다.</span><br><br><br><br><strike>이용시 사전협의 &lt;수용인원&gt; 2면 &lt;개수&gt; 1 &lt;사용요금&gt; 무료&nbsp;&lt;토요일개방&gt; 09:00~18:00 &lt;휴일개방&gt; 09:00~18:00</strike>',
    '<p><br></p>','사옥 후면(테니스장)',
    '', '2023-05-26', 'https://www.eshare.go.kr/UserPortal/Upv/31258/fileDetail.do?file_sn=1',
    'N', 'Y', '44131', 'N', 'LC001914', '한국도로공사천안지사'
);

INSERT INTO facility_info_detail VALUES(
    'CC26M2012640','010501','축구장','B552815','천안시시설관리공단','Y','N',
    '<p><br></p>','<p><br></p>','','','2021-03-26',
    'https://www.eshare.go.kr/UserPortal/Upv/56382/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006311','천안축구센터'
);







INSERT INTO facility_info_detail VALUES(
    'CC26M2224006','010501','축구장','B552815','천안시시설관리공단',
    'Y','N','<p><br></p>','<p><br></p>',
    '', '','2021-03-26','https://www.eshare.go.kr/UserPortal/Upv/56385/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006311','천안축구센터'
);




INSERT INTO facility_info_detail VALUES(
    'CC26M2604476','010505','풋살장','B552815','천안시시설관리공단',
    'Y', 'N', '<p><br></p>', '<p><br></p>',
    '', '', '2021-03-26', 'https://www.eshare.go.kr/UserPortal/Upv/56388/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006311','천안축구센터'
);










INSERT INTO facility_info_detail VALUES(
    'CC26M4626561','010508','수영장','B552815',
    '천안시시설관리공단','Y','N','<p><br></p>',
    '<p><br></p>','','','2021-03-26',
    'https://www.eshare.go.kr/UserPortal/Upv/56409/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006312','한들문화센터'
);


INSERT INTO facility_info_detail VALUES(
    'CC26M4918248','010511','체력단련실','B552815',
    '천안시시설관리공단','Y','N','<p><br></p>','<p><br></p>',
    '','','2021-03-26','https://www.eshare.go.kr/UserPortal/Upv/56412/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006312','한들문화센터'
);


INSERT INTO facility_info_detail VALUES(
    'CC26N0425124','010508','수영장','B552815',
    '천안시시설관리공단','Y','N','<p><br></p>','<p><br></p>',
    '','','2021-06-18','https://www.eshare.go.kr/UserPortal/Upv/56415/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006313','북부스포츠센터'
);

INSERT INTO facility_info_detail VALUES(
    'CC26N0640847', '010511', '체력단련실', 'B552815', '천안시시설관리공단',
    'Y', 'N', '<p><br></p>',
    '<p><br></p>', '', '', '2021-03-26',
    'https://www.eshare.go.kr/UserPortal/Upv/56418/fileDetail.do?file_sn=1',
    'N', 'Y','44133', 'N','LC006313','북부스포츠센터'
);
 
INSERT INTO facility_info_detail VALUES(
    'CC26N0851084', '010512','실내체육관','B552815','천안시시설관리공단',
    'Y','N','<p><br></p>','<p><br></p>','','','2021-03-26',
    'https://www.eshare.go.kr/UserPortal/Upv/56421/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006313','북부스포츠센터'
);

INSERT INTO facility_info_detail VALUES(
    'CC26N1120787','010512','실내체육관','B552815','천안시시설관리공단',
    'Y','N','<p><br></p>','<p><br></p>','','','2021-03-26',
    'https://www.eshare.go.kr/UserPortal/Upv/56424/fileDetail.do?file_sn=1',
    'N','Y','44133','N','LC006313','북부스포츠센터'
);
   
INSERT INTO facility_info_detail VALUES(
    'CC26N1414110','010501','축구장','B552815', '천안시시설관리공단', 'Y', 'N', '<p><br></p>',
    '<p><br></p>', '', '', '2021-03-26',
    'https://www.eshare.go.kr/UserPortal/Upv/56427/fileDetail.do?file_sn=1', 
    'N', 'Y','44133','N','LC006313','북부스포츠센터'
);
    
INSERT INTO facility_info_detail VALUES(
    'CC26N1922175','010509','야구장','B552815','천안시시설관리공단',
    'Y','N','<p><br></p>','<p><br></p>',
    '','','2021-03-26','https://www.eshare.go.kr/UserPortal/Upv/56433/fileDetail.do?file_sn=1',
    'N','Y','44131','N','LC006315','천안야구장'
);

INSERT INTO facility_info_detail VALUES(
    'CC26N2321095','010501','축구장','B552815','천안시시설관리공단',
    'Y','N','<p><br></p>','<p><br></p>',
    '','','2021-06-18','https://www.eshare.go.kr/UserPortal/Upv/56436/fileDetail.do?file_sn=1',
    'N','Y','44131','N','LC006316','태조산공원'
);

--예약정보테이블
--예약번호
--등록일
--마감일
--사용일
--시간 ( 09:00 ~ 10:00 이면 테이블상 9로 표시, 10:00~11:00이면 10으로 표시)
--등록 유저 (예약자)
--사용 시설
--종목 
--참가자
--모집인원
--상태
--담당자 승인
    CREATE TABLE reservation_info (
    rsvtNo Number,
    rgsrDate Date,
    deadDate Date,
    dDate Date,
    rsvtTime Number,
    rsrcNm VARCHAR2(1000),
    category VARCHAR2(500),
    participant VARCHAR2(500),
    totalPeopleCnt Number,
    status Number,
    approval  VARCHAR2(2)
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





