<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
	<head>
		<!-- 합쳐지고 최소화된 최신 CSS -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
		<!-- 부가적인 테마 -->
		<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">
	 	
	 	<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	 	
	 	
		<title>회원가입</title>
	</head>
	<script type="text/javascript">
		$(document).ready(function(){
			// 취소
			$(".cancle").on("click", function(){
				
				location.href = "/register";
						    
			})
		
			$("#submit").on("click", function(){
				if($("#loginId").val()==""){
					alert("아이디를 입력해주세요.");
					$("#loginId").focus();
					return false;
				}
				if($("#password").val()==""){
					alert("비밀번호를 입력해주세요.");
					$("#password").focus();
					return false;
				}
				if($("#memberName").val()==""){
					alert("성명을 입력해주세요.");
					$("#memberName").focus();
					return false;
				}
				if($("#email").val()==""){
					alert("이메일을 입력해주세요.");
					$("#email").focus();
					return false;
				}
				if($("#phoneNum").val()==""){
					alert("전화번호를 입력해주세요.");
					$("#phoneNum").focus();
					return false;
				}
				
			});
			
				
			
		})
		
		
		
		
	</script> 
	

	
	<body>
	
	
	
	
	
		<section id="container" >
			<form action="" method="post" style="width:80%; magin-left:0 auto; margin-right:0 auto;">
				<div class="form-group has-feedback">
					<label class="control-label" for="loginId">아이디</label>
					<input class="form-control" type="text" id="loginId" name="loginId" placeholder="숫자와 영어로 4-10자"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for="password">패스워드</label>
					<input class="form-control" type="password" id="password" name="password" placeholder="영문과 특수문자를 포함한 최소 8자" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for=memberName>성명</label>
					<input class="form-control" type="text" id="memberName" name="memberName" placeholder="한글로 최대 6자"/>
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for=email>이메일</label>
					<input class="form-control" type="text" id="email" name="email" />
				</div>
				<div class="form-group has-feedback">
					<label class="control-label" for=phoneNum>전화번호</label>
					<input class="form-control" type="text" id="phoneNum" name="phoneNum" />
				</div>
				<div class="form-group has-feedback">
					<button class="btn btn-success" type="submit" id="submit">회원가입</button>
					<button class="cencle btn btn-danger" type="button">취소</button>
				</div>
			</form>
		</section>
	
	</body>
	
</html>