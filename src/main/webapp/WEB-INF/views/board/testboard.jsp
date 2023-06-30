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

<!DOCTYPE html>


<html>
<head>
 <meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title> 
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-gH2yIJqKdNHPEq0n4Mqa/HGKIhSkIHeL5AyhkYV8i59U5AR6csBvApHHNl/vI1Bx" crossorigin="anonymous">

 <style>
 
 *{
 	margin:0;
 	padiing:0;
 	box-sizing: border-box;
 }
 .rowtable{
 	margin-top: 40px;
 	
 }
  .search-form {
  width: 80%;
  margin: 0 auto;
  margin-top: 1rem;
}

.search-form input {
  height: 100%;
  background: transparent;
  border: 0;
  display: block;
  width: 100%;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select {
  background: transparent;
  border: 0;
  padding: 1rem;
  height: 100%;
  font-size: 1rem;
}

.search-form select:focus {
  border: 0;
}

.search-form button {
  height: 100%;
  width: 100%;
  font-size: 1rem;
}

.search-form button svg {
  width: 24px;
  height: 24px;
}

.card-margin {
  margin-bottom: 1.875rem;
}

@media (min-width: 992px) {
  .col-lg-2 {
    flex: 0 0 16.66667%;
    max-width: 16.66667%;
  }
}

.card {
  border: 0;
  box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -webkit-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -moz-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
  -ms-box-shadow: 0px 0px 10px 0px rgba(82, 63, 105, 0.1);
}

.card {
  position: relative;
  display: flex;
  flex-direction: column;
  min-width: 0;
  word-wrap: break-word;
  background-color: #ffffff;
  background-clip: border-box;
  border: 1px solid #e6e4e9;
  border-radius: 8px;
}

    </style>
</head>

<body>
<h1>목록페이지입니다.</h1>
<c:if test="${loginId != null}">
	<form name="form2" method="post" action="${path}../member/logout">
		<p>${loginId}님반갑습니다</p>
		<button type="submit" id="logout" name="logout">로그아웃</button>
	</form>
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
         <c:if test="${fn:length(boardList) == 0}">
			<tr>
				<td>검색 결과가 없습니다!</td>
			</tr>
		</c:if>
            <tbody>
     <c:forEach items="${boardList}" var="boardList">
			<tr>
				<td><c:out value="${boardList.postno}"/></td>
				<td>
					<a class="move" href='<c:out value="${path}/detail?postno=${boardList.postno}"/>'>
						<c:out value="${boardList.title}"/>
					</a>
				</td>
				<td><c:out value="${boardList.writer}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardList.updatedate}"/>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardList.changedate}"/>             
					<td><c:out value="${boardList.viewcnt}"/></td>
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
        <div class="card card-margin search-form" method="POST" action="${path}/searchBoard">
            <div class="card-body p-0">
                <form id="search-form">
                    <div class="row">
                        <div class="col-12">
                            <div class="row no-gutters">
                                <div class="col-lg-3 col-md-3 col-sm-12 p-0">
                                    <label for="search-type" hidden>검색 유형</label>
                                    <label> 대소문자 구분
						<input type="checkbox" name="isChecked" <c:if test="${searchObj.isChecked == 'on'}">checked</c:if> />
									</label>
                                    <select class="form-control" id="search-type" name="searchType">
                                        <option>제목</option>
                                        <option>본문</option>
                                        <option>id</option>
                                        <option>닉네임</option>
                                        <option>해시태그</option>
                                    </select>
                                </div>
                                <div class="col-lg-8 col-md-6 col-sm-12 p-0">
                                    <label for="search-value" hidden>검색어</label>
                                    <input type="text" placeholder="검색어..." class="form-control" id="search-value"
                                           name="searchValue">
                                </div>
                                <div class="col-lg-1 col-md-3 col-sm-12 p-0">
                                    <button type="submit" class="btn btn-base">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="24" height="24"
                                             viewBox="0 0 24 24" fill="none" stroke="currentColor" stroke-width="2"
                                             stroke-linecap="round" stroke-linejoin="round"
                                             class="feather feather-search">
                                            <circle cx="11" cy="11" r="8"></circle>
                                            <line x1="21" y1="21" x2="16.65" y2="16.65"></line>
                                        </svg>
                                    </button>
                                </div>
                            </div>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </div>
    <div class="row">
        <nav id="pagination" aria-label="Page navigation">
            <ul class="pagination justify-content-center">
                <li class="page-item"><a class="page-link" href="#">Previous</a></li>
                <li class="page-item"><a class="page-link" href="#">1</a></li>
                <li class="page-item"><a class="page-link" href="#">Next</a></li>
            </ul>
        </nav>
    </div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>
</body>
</html>