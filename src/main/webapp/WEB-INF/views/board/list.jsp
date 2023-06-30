<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
        <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:forEach var="row" items="${map.list}">
    <tr>
        <td>${row.bno}</td>
        <td>
<a href="${path}/board/view.do?bno=${row.bno}">
${row.title}
</a>
            <c:if test="${row.cnt > 0}">
                <span style="color:red;">( ${row.cnt} )</span>
            </c:if>   
        </td>
        <td>${row.name}</td>
        <td><fmt:formatDate value="${row.regdate}"
            pattern="yyyy-MM-dd HH:mm:ss"/> </td>
        <td>${row.viewcnt}</td>
    </tr>
</c:forEach>
</body>
</html>