<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="../header.jsp"%>
<link rel="stylesheet" href="${path}/css/login.css"  type="text/css" />


	<!--회원가입 -->
	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="${path}/register" method="post" id="regForm">
				<h1>Create Account</h1>
				<div class="registerId-wrapper">
					<input class="registerId" type="text" id="loginId" name="loginId"
						placeholder="id" pattern="[a-z0-9]{6,14}" />
					<button type="button" class="idChk" id="id_check"
						onclick="fn_idChk();" value="N">중복확인</button>
				</div>
				<div style="position:relative; width:100%; ">
				<input type="password" id="password" name="password"
					placeholder="password"
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" /> 
					<i id="hidePw" class="fa fa-eye fa-lg"></i>	</div>									
			    <input type="text" id="memberName" name="memberName" placeholder="name" />				
				<input class="birth" type="text" id="birth" name="birth"
					placeholder="birth" readonly /> 
					<span id="delete">
					<i class="fas fa-times font-img"></i>
					</span> 				
				<input type="email"placeholder="Email" type="email" id="email" name="email"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$" />
				<input type="text" id="phoneNum" name="phoneNum" placeholder="phoneNumber"
					pattern="[0-9]{11}" />
				<button type="submit" id="submit">회원가입</button>
			</form>
		</div>
		
		<!-- 로그인  -->
		<div class="form-container sign-in-container">
		<c:if test="${loginId== null}">
			<form  name="form1" method="post" action="${path}/login">
				<h1>Sign in</h1>
				<input type="text" placeholder="id" id="loginId1" name="loginId"/>
				<div style="width: 100%; position: relative;">
					<input type="password" placeholder="Password" id="password1" name="password"/> 
					<i id="hidePw2" class="fa fa-eye fa-lg"></i>
				</div> 				
				<c:if test="${message == 'error'}">
					<div style="color: red; font-size:14px; margin-bottom:5px;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
				</c:if>						
				<button type="submit" id="btnLogin">로그인</button>
			</form>
			</c:if>			
				
		</div>
		
		<!-- 회원가입 페이지에서 로그인 페이지로 넘어가기  -->
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Welcome Back!</h1>
					<p>로그인 하기 </p>
					<button class="ghost" id="signIn">Sign In</button>
				</div>
				
				<!-- 로그인 페이지에서 회원가입 페이지로 넘어가기  -->
				<div class="overlay-panel overlay-right">
					<h1>Hello, Friend!</h1>					
					<c:if test="${loginId== null}">
                    <p>아직 회원가입을 안하셨나요?</p>
					<button class="ghost" id="signUp">Sign Up</button>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		var path = '${path}';
	</script>
	<script type="text/javascript" src="${path}/js/register.js"></script>	
	
<%@ include file="../footer.jsp"%>