<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%
String loginId = null;
%>
<!DOCTYPE html>
<html>

<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge" />
<meta name="viewport" content="width=device-width, initial-scale=1.0" />
<meta name="description"
	content="Creators is a startup that helps content creators such as videographers, photographers, monetize their creative work." />


<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.2/css/all.css"
	integrity="sha384-oS3vJWv+0UjzBfQzYUhtDYW+Pj2yciDJxpsK1OYPAYjqT085Qq/1cq5FLXAZQ7Ay"
	crossorigin="anonymous" />
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous">
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.8.1/css/all.css"
	integrity="sha384-50oBUHEmvpQ+1lW4y57PTFmhCaXp0ML5d60M1M7uH2+nqUivzIebhndOJK28anvf"
	crossorigin="anonymous">
<link
	rel="https://maxcdn.bootstrapcdn.com/font-awesome/4.6.3/css/font-awesome.min.css">
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">

<title>Floorz</title>
</head>

<body>
	<!-- Navigation menu section -->
	<div class="navbar-wraaper" style="background-color: black;">
		<nav class="navbar navbar-expand-md navbar-dark">
			<a class="navbar-brand" href="${path}/main" style="padding-left:20px;">Floorz</a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#collapsibleNavbar">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="collapsibleNavbar" style="display:flex!important;flex-basis:auto;justify-content :center; position:relative;" >
				<ul class="navbar-nav" style="position:relative; width : 56% !important; padding-left:16%;">
					<li class="nav-item"><a class="nav-link"  href="${path}/map">예약하기</a>
					</li>
					<li class="nav-item"><a class="nav-link"
						href="${path}/boardlist?pageNo=1">게시판</a></li>
				
				<%
				if (session.getAttribute("loginId") == null) {
					loginId = (String) session.getAttribute("loginId");
				%>
				
					<li class="nav-item last" style="position:absolute;right: -138px !important;">
					<a class="nav-link" href="${path}/login">로그인/회원가입</a></li>
					<%
					} else {
					%>
					<li class="nav-item last" style="position:absolute;right: 20px !important;">
					<p style="color:white; font-size:16px; font-weight: 500; line-height: 30px;">${memberName}님</p></li>
					<li class="nav-item last" style="position:absolute;right: -158px !important;">
					<a class="nav-link" href="${path}/logout">로그아웃</a></li>
					<li class="nav-item last" style="position:absolute;right: -78px !important;">
					<a class="nav-link" href="${path}/mypage">마이페이지</a></li>
					<%
					}
					%>
				</ul>
			</div>
		</nav>
	</div>
