<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="../header.jsp"%>

<link href="${path}/css/login.css" rel="stylesheet" type="text/css" />



<div class="container">
	<h2>로그인</h2>
	
		<!-- 로그인 하지 않은 상태  -->
		<c:if test="${loginId== null}">
		<form name="form1" method="post" action="${path}/login">
		
			<table border="1" width="400px">
				<tr>
					<td>아이디</td>
					<td><input id="userid" name="loginId"></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" id="passwd" name="password"></td>
				</tr>
				<tr>
					<td colspan="2" align="center">
						<button type="submit" id="btnLogin">로그인</button> 
						<c:if
							test="${message == 'error'}">
							<div style="color: red;">아이디 또는 비밀번호가 일치하지 않습니다.</div>
						</c:if>
						<c:if test="${message == 'logout'}">
							<div style="color: red;">로그아웃되었습니다.</div>
						</c:if>
					</td>
				</tr>
			</table>
		</form>
	</c:if>
	</div>
	
	
	
	
	<script>
		$(function() {
			$("#btnLogin").click(function() {
				userid = $("#userid").val();
				var passwd = $("#passwd").val();
				if (userid == "") {
					alert("아이디를 입력하세요");
					$("#userid").focus(); //입력포커스 이동

					return; //함수 종료
				}
				if (passwd == "") {
					alert("비밀번호를 입력하세요");
					$("#passwd").focus();
					return;
				}

			});
		});
	</script>
</body>
</html>

