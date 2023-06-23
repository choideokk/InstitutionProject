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

	</div>
	<script type='text/javascript' src='${path}/js/detail.js'></script>
</body>
</html>