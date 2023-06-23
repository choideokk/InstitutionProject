<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
		<c:set var="path" 
value="${pageContext.request.contextPath}" />
<div style="text-align: center;">
    <a href="${path}/">main</a>
    <a href="${path}/board/list.do">게시판</a>
</div>


</body>
</html>