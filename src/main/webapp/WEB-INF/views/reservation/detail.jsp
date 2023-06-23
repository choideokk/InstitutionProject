<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link href="${path}/css/detail.css" rel="stylesheet" type="text/css" />
<title>Insert title here</title>
</head>
<body>
	<!-- 여기서 뭘 넘겨줘야하니////// -->
	<!-- 시설이름 / 종목 (수영, 테니스) /  -->
	<!-- 값 다 넘어오게.. -->

	<h1>상세페이지지롱</h1>
	<ul>
		<li>${currentFc.rsrcNo}</li>
		<li>${currentFc.rsrcNm}</li>
		<li>${currentFc.addr}${currentFc.daddr}</li>
		<li>${currentFc.instUrlAddr}</li>
		<li>위도 ${currentFc.lot}</li>
		<li>경도 ${currentFc.lat}</li>
		<li>예약링크 ${currentFc.instUrlAddr}</li>
		<li>이미지파일 링크 ${currentFc.imgFileUrlAddr}</li>
	</ul>
	<div>
	<div class="sec_cal">
		<div class="cal_nav">
			<p class="year-month"></p>
		</div>
		<div class="cal_wrap">
			<ul class="days" style="padding-left: 0;">
				<li class="day">일</li>
				<li class="day">월</li>
				<li class="day">화</li>
				<li class="day">수</li>
				<li class="day">목</li>
				<li class="day">금</li>
				<li class="day">토</li>
			</ul>
			<div class="dates"></div>
		</div>
		<div class="marker_info">
			<em class="marker today">오늘</em>
			<em class="marker able">예약가능</em>
			<em class="marker disable">예약불가</em>
			<em class="marker selected">선택</em>
		</div>
	</div>

	<form>
		<input type="hidden" name="selectionStartDay">
		<div>
			<div class="head">
				<p>예약현황</p>
				<p>
					선택날짜 <span class="selectedDate"></span>
				</p>
			</div>
			<p class="emptyTxt">선택된 날짜가 없습니다. 날짜를 선택해주세요.</p>
			<ul class="availableTimeTb" style="display: none;">
				<li><button type='button'>10:00 ~ 11:00</button></li>
				<li><button type='button'>11:00 ~ 12:00</button></li>
				<li><button type='button'>12:00 ~ 13:00</button></li>
				<li><button type='button'>13:00 ~ 14:00</button></li>
				<li><button type='button'>14:00 ~ 15:00</button></li>
				<li><button type='button'>15:00 ~ 16:00</button></li>
			</ul>
		</div>
		<button>예약하기</button>
		<!-- 문의하기로 채팅을 연결해도 되겠다는 생각을 잠깐.. -->
		<button>문의하기</button>
	</form>
	</div>
	<script type='text/javascript' src='${path}/js/detail.js'></script>
</body>
</html>