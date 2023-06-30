<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
		<title>회원가입</title>
	</head>
	
	<body>
		<section id="container">
			<form action="${path}/memberUpdate" method="post" id="updateForm">
				<div class="form-group has-feedback">
					<label class="control-label" for="loginId">아이디</label>
					<input class="form-control" type="text" id="loginId" name="loginId" value="${memberDto.loginId}" readonly="readonly"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="password">패스워드</label>
					<input class="form-control" type="password" id="password" name="password" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="memberName">성명</label>
					<input class="form-control" type="text" id="memberName" name="memberName" value="${memberDto.memberName}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="phoneNum">전화번호</label>
					<input class="form-control" type="text" id="phoneNum" name="phoneNum" value="${memberDto.phoneNum}"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="email">이메일</label>
					<input class="form-control" type="text" id="email" name="email" value="${memberDto.email}"/>
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원정보수정</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
		
		<script type="text/javascript" src="${path}/js/myPage.js"></script>
		
		
	</body>
</html>