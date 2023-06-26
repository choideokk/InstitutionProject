 <%
 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="./header.jsp"%>






	<h2>로그인</h2>
	
		<!-- 로그인 하지 않은 상태  -->
		<c:if test="${loginId== null}">
		<form name="form1" method="post" action="${path}/test">
		
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

