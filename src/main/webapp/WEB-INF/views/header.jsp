<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%
String loginId = null;
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- CSS only -->
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

</head>
<body>

	<nav class="navbar navbar-expand-lg bg-light">
		<div class="container-fluid">
			<a class="navbar-brand" href="#">공공시설 예약</a>

			<div class="collapse navbar-collapse" id="navbarSupportedContent">
				<ul class="navbar-nav me-auto mb-2 mb-lg-0">
					<li class="nav-item"><a class="nav-link active"
						aria-current="page" href="#">메인</a></li>
					<li class="nav-item"><a class="nav-link" href="#">예약</a></li>
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#" role="button"
						data-bs-toggle="dropdown" aria-expanded="false">시설 둘러보기 </a>
						<ul class="dropdown-menu">
							<li><a class="dropdown-item" href="#">천안</a></li>
							<li><a class="dropdown-item" href="#">그 외 지역</a></li>
						</ul>
					</li>
				</ul>
				<%
					if (session.getAttribute("loginId") == null) {
						loginId = (String) session.getAttribute("loginId");
			    %>
				<ul class="d-flex">
							<li><a href="./test">로그인</a></li>
							<li><a href="./register">회원가입</a></li>
						</ul>	
				<%
				}else{
				%>
					<li class="nav-item"><a class="nav-link text-primary" href="./logout">로그아웃</a></li>
					<li class="nav-item"><a class="nav-link" href="#">마이페이지</a></li>
				<%
				}
				%>	
			</div>
		</div>
	</nav>