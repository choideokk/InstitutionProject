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


<c:if test="${loginId != null}">
	<form name="form2" method="post" action="${path}/logout">
		<p>${loginId}님반갑습니다</p>
		<button type="submit" id="logout" name="logout">로그아웃</button>
	</form>
</c:if>


</body>
</html>