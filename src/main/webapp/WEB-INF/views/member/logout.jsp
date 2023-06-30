<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%@ include file="../header.jsp"%>
<script type="text/javascript">
$(document).ready(function(){
	
	$("#memberUpdateBtn").on("click", function(){
		location.href= path+"/memberInfo";
	})
	
})
}
</script>

<c:if test="${loginId != null}">
	<form name="form2" method="post" action="${path}/logout">
		<p>${loginId}님반갑습니다</p>
		<button type="button" id="memberUpdateBtn" onclick="location.href='${path}/memberInfo'">회원정보 수정</button>
		<button type="submit" id="logout" name="logout">로그아웃</button>
	</form>
</c:if>


</body>
</html>