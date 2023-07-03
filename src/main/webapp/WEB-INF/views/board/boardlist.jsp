<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
 <%
 // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함.
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>
 <c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">
    <link href="${path}/css/board.css" rel="stylesheet" type="text/css" /> 
    <!-- 
    <link href="${path}/css/stars.css" rel="stylesheet" type="text/css" />
     -->
    
</head>

<body>
<h1>목록페이지입니다.</h1>
<c:if test="${loginId != null}">
	<p>${loginId}님반갑습니다</p>
	<a href="${path}/logout">로그아웃</a>
</c:if>

<div class="collapse" id="navbarToggleExternalContent">
  <div class="bg-dark p-4">
    <h5 class="text-white h4"> content</h5>
    <span class="text-muted">nav</span>
  </div>
</div>
<nav class="navbar navbar-dark bg-dark">
  <div class="container-fluid">
    <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarToggleExternalContent" aria-controls="navbarToggleExternalContent" aria-expanded="false" aria-label="Toggle navigation">
      <span class="navbar-toggler-icon"></span>
    </button>
  </div>
</nav>

    <div class="rowtable">
        <table class="table" id="article-table">
            <thead>
            <tr>
            <th class="created-at"><a>번호</a></th>
                <th class="title col-3"><a>제목</a></th>
                <th class="user-id"><a>작성자</a></th>
                <th class="created-at"><a>작성일</a></th>
                <th class="created-at"><a>수정일</a></th>
                 <th class="created-at"><a>조회수</a></th>
                <th class="created-at"><a>추천수</a></th>
            </tr>
            </thead>
         <c:if test="${fn:length(currentPageInfo.content) == 0}">
			<tr>
				<td colspan="7" style="text-align: center">검색 결과가 없습니다!</td>
			</tr>
			<tr>
				<td colspan="7" style="text-align: center"><a href="${path}/boardlist?pageNo=1">전체 게시글 목록으로 돌아가기</a></td>
			</tr>
		</c:if>
            <tbody>
     <c:forEach items="${currentPageInfo.content}" var="boardList">
			<tr>
				<td><c:out value="${boardList.postno}"/></td>
				<td>
					<a class="move" href='<c:out value="${path}/detail?postno=${boardList.postno}"/>'>
						<c:out value="${boardList.title}"/>
					</a>
				</td>
				<td><c:out value="${boardList.writer}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardList.updatedate}"/>
                <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss" value="${boardList.changedate}"/>             
				<td><c:out value="${boardList.viewcnt}"/></td>
				<td><c:out value="${boardList.recommend}"/></td>
			</tr>			
		</c:forEach>	
            </tbody>
        </table>
    </div>

    <div class="row">
        <div class="d-grid gap-2 d-md-flex justify-content-md-end">
<!-- <button type="button" class="btn btn-outline-success">글쓰기</button> -->
	<a href="${path}/write" class="top_btn">게시판 등록</a>

        </div>
    </div>


<div class="row">
  <form class="search_wrap" method="POST" action="${path}/boardlist?pageNo=1">
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
</div>
            <c:if test='${searchObj.searchTxt eq "" ||  searchObj.searchTxt eq null}'>
            <ul class="pagination">
    		<c:set var="pagePath" value="boardlist"></c:set>
			<!-- Previous 시작 -->
			<li
				class="paginate_button page-item previous <c:if test='${currentPageInfo.startPage<6}'>disabled</c:if>"
				id="dataTable_previous">
				<button data-path="${path}/${pagePath}?pageNo=${currentPageInfo.startPage-5}" 
				aria-controls="dataTable" data-dt-idx="${currentPageInfo.startPage-5}" tabindex="0"
				class="page-link">
				Previous
				</button>
				</li>
			<!-- Previous 끝 -->
			<!-- Page번호 시작, 컨트롤러에서 list에 페이징 객체를 넣었으므로 list.변수명으로 불러옴 -->
			<c:forEach var="pNo" begin="${currentPageInfo.startPage}" end="${currentPageInfo.endPage}"
				step="1">
				<li
					class="paginate_button page-item <c:if test='${param.pageNo eq pNo}'>active</c:if>">
					<button data-path="${path}/${pagePath}?pageNo=${pNo}" aria-controls="dataTable"
					data-dt-idx="${pNo}" tabindex="0" class="page-link">${pNo}</button>
				</li>
			</c:forEach>
			<!-- Page번호 끝 -->
			<!-- Next 시작 -->
			<li
				class="paginate_button page-item next <c:if test='${currentPageInfo.endPage>=currentPageInfo.totalPages}'>disabled</c:if>"
				id="dataTable_next">
				<button data-path="${path}/${pagePath}?pageNo=${currentPageInfo.startPage+5}"
				aria-controls="dataTable" data-dt-idx="${currentPageInfo.startPage+5}" tabindex="0"
				class="page-link">
				Next
				</button>
			</li>
			<!-- Next 끝 -->
			<!-- 페이징 처리 끝 -->
		</ul>
	</c:if>
<script>
var path = '${path}';
var isChecked = '${searchObj.isChecked}';
var searchTxt = '${searchObj.searchTxt}';
var searchKeyword = '${searchObj.searchKeyword}';
</script>
<script src="${path}/js/board.js" type="text/javascript"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

<div class="stars">
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
</div>
</body>
</html>