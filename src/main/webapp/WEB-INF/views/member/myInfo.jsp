<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${path}/css/myInfo.css"  type="text/css" />


	<!--회원정보수정-->
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="${path}/memberUpdate" method="post" id="updateForm">
				<h1>회원 정보 수정</h1>
					<input  type="text" id="loginId" name="loginId"
						value="${memberDto.loginId}" readonly="readonly" />
				<div style="position:relative; width:100%; ">
				<input type="password" id="password" name="password"
					placeholder="password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" /> 
					<i id="hidePw" class="fa fa-eye fa-lg"></i>	</div>						
			    <input type="text" id="memberName" name="memberName" value="${memberDto.memberName}" />				
				<input type="email" id="email" name="email"  value="${memberDto.email}"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" />
				<input type="text" id="phoneNum" name="phoneNum" value="${memberDto.phoneNum}"
					pattern="[0-9]{11}" />
				<button type="submit" id="submit">회원정보수정</button>
			</form>
		</div>
		
		<!-- 마이 페이지  -->
			<div class="form-container sign-in-container">		
			<c:if test="${loginId != null}">
	     <form name="form2" action="${path}/logout">
		<p style="font-size:16px; margin:35px 0 15px;"><span style="font-size:16px;"><strong>${memberName}님</strong></span> 반갑습니다</p>
		<button type="submit" id="logout" name="logout">로그아웃</button>
	    </form>
        </c:if>			
		</div>
		
		<!-- 회원가입 페이지에서 로그인 페이지로 넘어가기  -->
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1 style="margin-bottom:20px;">see u again!</h1>
					<button class="ghost" id="signIn">돌아가기</button>
				</div>
				
				<!-- 로그인 페이지에서 회원가입 페이지로 넘어가기  -->
				<div class="overlay-panel overlay-right">
					<h1 style="margin-bottom:12px;">Change your Information</h1>					
					<button class="ghost" id="signUp">회원정보수정</button>
					
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		var path = '${path}';
	</script>
	<script type="text/javascript" src="${path}/js/myInfo.js"></script>	
<%@ include file="../footer.jsp"%>