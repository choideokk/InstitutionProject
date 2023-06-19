<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<head>
    <title>New Page</title>
</head>
<body>
    <c:forEach var="value" items="${values}">
		<p>${value.rsvtTime}</p>
	</c:forEach>
</body>
</html>