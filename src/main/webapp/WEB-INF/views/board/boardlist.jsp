<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-9ndCyUaIbzAi2FUVXJi0CjmCapSmO7SnpJef0486qhLnuZ2cdeRhO02iuK6FUUVM"
	crossorigin="anonymous">

<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
<style>
a {
	text-decoration: none;
}

table {
	border-collapse: collapse;
	width: 1000px;
	margin-top: 20px;
	text-align: center;
}

td, th {
	border: 1px solid black;
	height: 50px;
}

th {
	font-size: 17px;
}

thead {
	font-weight: 700;
}

.table_wrap {
	margin: 50px 0 0 50px;
}

.bno_width {
	width: 12%;
}

.writer_width {
	width: 20%;
}

.regdate_width {
	width: 15%;
}

.updatedate_width {
	width: 15%;
}

.top_btn {
	font-size: 20px;
	padding: 6px 12px;
	background-color: #fff;
	border: 1px solid #ddd;
	font-weight: 600;
}

.pageInfo {
	list-style: none;
	display: inline-block;
	margin: 50px 0 0 100px;
}

.pageInfo li {
	float: left;
	font-size: 20px;
	margin-left: 18px;
	padding: 7px;
	font-weight: 500;
}

a:link {
	color: black;
	text-decoration: none;
}

a:visited {
	color: black;
	text-decoration: none;
}

a:hover {
	color: black;
	text-decoration: underline;
}

.active {
	background-color: #cdd5ec;
}

.search_area {
	display: inline-block;
	margin-top: 30px;
	margin-left: 260px;
}

.search_area input[type="text"] {
	height: 30px;
	width: 250px;
}

.search_area button {
	width: 100px;
	height: 36px;
}

.search_area select {
	height: 35px;
}
</style>
</head>
<body>
	<h1>목록페이지입니다.</h1>

	<div class="table_wrap">
		<a href="${path}/write" class="top_btn">게시판 등록</a>
		<table>
			<thead>
				<tr>
					<th class="bno_width">번호</th>
					<th class="title_width">제목</th>
					<th class="writer_width">작성자</th>
					<th class="regdate_width">작성일</th>
					<th class="updatedate_width">수정일</th>
					<th class="updatedate_width">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:if test="${fn:length(currentPageInfo.content) == 0}">
					<tr>
						<td>검색 결과가 없습니다!</td>
					</tr>
				</c:if>
				<c:forEach items="${currentPageInfo.content}" var="boardList">
					<tr>
						<td><c:out value="${boardList.postno}" /></td>
						<td><a class="move"
							href='<c:out value="${path}/detail?postno=${boardList.postno}"/>'>
								<c:out value="${boardList.title}" />
						</a></td>
						<td><c:out value="${boardList.writer}" /></td>
						<td><fmt:formatDate pattern="yyyy/MM/dd"
								value="${boardList.updatedate}" />
						<td><fmt:formatDate pattern="yyyy/MM/dd"
								value="${boardList.changedate}" />
						<td><c:out value="${boardList.viewcnt}" /></td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<form class="search_wrap" method="POST" action="${path}/searchBoard?pageNo=1">
			<div class="search_area">
				<label> 대소문자 구분 <input type="checkbox" name="isChecked"
					<c:if test="${searchObj.isChecked == 'on'}">checked</c:if> />
				</label> <select name="searchKeyword">
					<option value="T"
						<c:if test="${searchObj.searchKeyword == 'T'}">selected</c:if>>제목</option>
					<option value="W"
						<c:if test="${searchObj.searchKeyword == 'W'}">selected</c:if>>작성자</option>
					<option value="TW"
						<c:if test="${searchObj.searchKeyword == 'TW'}">selected</c:if>>제목
						+ 작성자</option>
				</select> <input type="text" name="searchTxt" value="${searchObj.searchTxt}">
				<button type="submit">Search</button>
			</div>
		</form>

		<!-- 페이징 처리 시작 -->
		<ul class="pagination">
			<!-- Previous 시작 -->
			<li
				class="paginate_button page-item previous <c:if test='${currentPageInfo.startPage<6}'>disabled</c:if>"
				id="dataTable_previous"><a
				href="${path}/boardlist?pageNo=${currentPageInfo.startPage-5}"
				aria-controls="dataTable" data-dt-idx="0" tabindex="0"
				class="page-link">Previous</a></li>
			<!-- Previous 끝 -->
			<!-- Page번호 시작, 컨트롤러에서 list에 페이징 객체를 넣었으므로 list.변수명으로 불러옴 -->
			<c:forEach var="pNo" begin="${currentPageInfo.startPage}" end="${currentPageInfo.endPage}"
				step="1">
				<li
					class="paginate_button page-item <c:if test='${param.pageNo eq pNo}'>active</c:if>"><a
					href="${path}/boardlist?pageNo=${pNo}" aria-controls="dataTable"
					data-dt-idx="1" tabindex="0" class="page-link">${pNo}</a></li>
			</c:forEach>
			<!-- Page번호 끝 -->
			<!-- Next 시작 -->
			<li
				class="paginate_button page-item next <c:if test='${currentPageInfo.endPage>=currentPageInfo.totalPages}'>disabled</c:if>"
				id="dataTable_next"><a
				href="${path}/boardlist?pageNo=${currentPageInfo.startPage+5}"
				aria-controls="dataTable" data-dt-idx="7" tabindex="0"
				class="page-link">Next</a></li>
			<!-- Next 끝 -->
			<!-- 페이징 처리 끝 -->
		</ul>
	</div>
</body>
</html>