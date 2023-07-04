<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<% // 브라우저 캐시 미저장 설정. 로그아웃(세션삭제) 후 뒤로가기 등 페이지 접근 막기 위함. response.setHeader("Cache-Control","no-store");
response.setHeader("Pragma","no-cache"); response.setDateHeader("Expires",0);
if(request.getProtocol().equals("HTTP/1.1")) response.setHeader("Cache-Control","no-cache"); %>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>

<!DOCTYPE html>
<html>

<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65"
	crossorigin="anonymous" />
<link href="${path}/css/boardlist.css" rel="stylesheet" type="text/css" />
<!-- JavaScript Bundle with Popper -->
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js"
	integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
	crossorigin="anonymous"></script>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<div class="content-area group">
		<!-- container -->
		<div class="container">
			<div class="main-area">

				<!-- info-box -->
				<div class="info-box hide-small" id=""></div>
				<!-- /info-box -->

				<div class="main">
					<div class="alert alert-danger" role="alert">
						<strong>주의!</strong> 상대방을 비방하는 글을 작성시 게시글 삭제 및 계정 무단 삭제가 될 수
						있습니다..
					</div>

					<nav class="navbar bg-light">
						<a class="btn btn-success" href="${path}/write" target="_blank">게시글
							작성</a>

					</nav>
					<table id="boardlist" class="table table-striped table-bordered"
						cellspacing="0" style="text-align: center";>
						<thead>
							<tr style="text-align: center;">
								<th>번호</th>
								<th>제목</th>
								<th>작성자</th>
								<th>등록일</th>
								<th>수정일</th>
								<th>추천수</th>
								<th>신고수</th>
								<th>조회수</th>

							</tr>
						</thead>
						<c:if test="${fn:length(currentPageInfo.content) == 0}">
							<tr>
								<td colspan="8" style="text-align: center">게시글이 없습니다!</td>
							</tr>
							<c:if test='${searchObj.searchTxt ne null}'>
								<tr>
									<td colspan="8" style="text-align: center"><a
										href="${path}/boardlist?pageNo=1">전체 게시글 목록으로 돌아가기</a></td>
								</tr>
							</c:if>
						</c:if>
						<tbody>
							<c:forEach items="${currentPageInfo.content}" var="boardList">
								<tr>
									<td><c:out value="${boardList.postno}" /></td>
									<td><a class="move"
										href='<c:out value="${path}/detail?postno=${boardList.postno}"/>'>
											<c:out value="${boardList.title}" />
									</a></td>

									<td><c:out value="${boardList.writer}" /></td>
									<td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
											value="${boardList.updatedate}" /> <td><fmt:formatDate pattern="yyyy/MM/dd HH:mm:ss"
											value="${boardList.changedate}" />             
                              
									<td><c:out value="${boardList.recommend}" /></td>
                              <td><c:out
											value="${boardList.report}" /> </td>
                            <td><c:out value="${boardList.viewcnt}" /></td>
                            
                        </tr>			
                      </c:forEach>	
                        
						<thead>
                    
						</tbody>

                </table>
      
<div class="row">
  <form class="search_wrap" method="POST" action="${path}/boardlist?pageNo=1" style="display: flex; justify-content: center;">
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
      <button type="submit" class="btn btn-success">Search</button>
    </div>
  </form>
</div>
            <c:if test='${searchObj.searchTxt eq "" ||  searchObj.searchTxt eq null}'>
            <ul class="pagination" style="display: flex; justify-content: center;">
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
            
          </div>
      
        </div>
        <!-- /container -->
      </div>
      </div>
<script>
         var path = '${path}';
         var isChecked = '${searchObj.isChecked}';
         var searchTxt = '${searchObj.searchTxt}';
         var searchKeyword = '${searchObj.searchKeyword}';
     </script> <script src="${path}/js/board.js" type="text/javascript"></script>

									</body>

</html>