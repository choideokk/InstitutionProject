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
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
 <!-- JavaScript Bundle with Popper -->
 <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4" crossorigin="anonymous"></script>
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
 
    <style>     
      html {
  line-height: 1.7;
}

body {
  font-family: Helvetica, Arial, sans-serif;
  font-size: 15px;
  margin: 0;
  padding: 0;
}

img {
  max-width: 100%;
  height: auto;
}

a {
  text-decoration: none;
}

/* Main Column Typography */
.main-area h2 {
  font-size: 165%;
  font-weight: normal;
}

.container {
  max-width: 1200px;
  margin: 0 auto;
  padding-left: 40px;
  padding-right: 40px;
}
@media screen and (max-width: 480px){
  .container{
    padding-left: 20px;
    padding-right: 20px;
  }
}
@media screen and (min-width: 1300px){

body{
  font-size: 17px;
}

.container{
  max-width: 1200px;
}
}

header {
  padding-top: 20px;
  color: #fff;
  background-color: #bfa8e4;
}

header h1 {
  margin: 0;
  font-weight: normal;
  font-size: 165%;
}

header p {
  font-size: 90%;
  margin: 0;
}

/* Site Navigation */
.site-nav {
  margin-top: 20px;
}
@media screen and (max-width: 700px) {
.site-nav li{
width: 33.332%;
margin-right: 0;
}

@media screen and (max-width: 480px) {
  .site-nav li{
    width: 100% /* 절반! */
  }
}
.site-nav a{
padding: 15px 0;
margin-right: 5px;
margin-bottom: 5px;
text-align: center;
}
}


.site-nav ul {
  margin: 0;
  padding: 0;
}

.site-nav li {
  list-style: none;
  float: left;
  margin-right: 5px;
}

.site-nav a {
  display: block;
  color: #fff;
  padding: 10px 20px;
  background-color: #dc9aec;
}

.site-nav a:hover {
  background-color: #010201;
}

/* End Site Navigation */

.content-area {
  background-color: #f7f7f7;
  padding-bottom: 40px;
  padding-top: 40px;
}
@media screen and (max-width: 480px){
  .content-area{
    padding-top: 20px;
  }
}

.main-area {
  width: 100%;
  height: 950px;
  float: left;
  padding-right: 40px;
}

@media screen and (max-width: 700px){
  .main-area,
  .sidebar{
    width: auto;
    margin-left: 20px;
    float: none;
  }

  .main-area{
    padding-right: 0;
  }
}

.sidebar {
  width: 34%;
  float: left;
  background-color: #e9e4ec;
  margin-top: 20px;
  padding: 20px 40px;
  box-sizing: border-box;
  font-size: 85%;
}
@media screen and(max-width:700px){
    .main-area,
    .sidebar{
        width: auto;
        float: none;
    }
}

.info-box {
     width: 100%;
  background-color: #d7d2ec;
  border: 5px solid #baa3dd;
  padding: 20px 40px 7px 40px;
  margin-bottom: 1em;
}
@media screen and (max-width: 480px){
  .hide-small{
    display: none;
  }
}

footer {
  text-align: center;
  font-size: 85%;
  color: #fff;
  padding-bottom: 20px;
  padding-top: 20px;
}

.group:before,
.group:after {
  content: "";
  display: table;
}

.group:after {
  clear: both;
}

.group {
  zoom: 1;
}
.table>:not(caption)>*>*{
    padding: 5px;
}
#boardlist{
    margin-top: 30px;
}
.form-control{
display:inline-block;
text-align: center;
}
    </style>
</head>

<body>


    <header>
      <h3> 추가했다 이부분</h3>
        <!-- container -->
        <div class="container">
          <h1>3조</h1>
          <p class="hide-small">Website slogan included here.</p>
          <nav class="site-nav">
            <ul class="group">
              <li><a href="#">Home</a></li>
              <li><a href="#">About</a></li>
              <li><a href="#">Portfolio</a></li>
        
              <li><a href="#">Portfolio</a></li>
              <li class="hide-small"><a href="#">FAQs</a></li>
              <li class="hide-small"><a href="#">Links</a></li>
              <li><a href="#">Contact Us</a></li>
            </ul>
          </nav>
        </div>
        <!-- /container -->
      
      </header>

   
      
      <div class="content-area group">
        <!-- container -->
        <div class="container">
          <div class="main-area">
            <c:if test="${loginId != null}">
              <p>${loginId}님반갑습니다</p>
              <a href="${path}/logout">로그아웃</a>
            </c:if>
            
            <!-- info-box -->
            <div class="info-box hide-small" id="">

            </div>
            <!-- /info-box -->

            <div class="main">
                <div class="alert alert-danger" role="alert"><strong>주의!</strong> 상대방을 비방하는 글을 작성시 게시글 삭제 및 계정 무단 삭제가 될 수 있습니다..</div>
                
                <nav class="navbar bg-light">
                  <a class="btn btn-success"  href="${path}/write" target="_blank">게시글 작성</a>
                
                  </nav>
                <table id="boardlist" class="table table-striped table-bordered" cellspacing="0" 
                style="text-align: center";>
                    <thead>
                        <tr style="text-align: center;">
                            <th>번호</th>
                            <th>제목</th>
                            <th>작성자</th>
                            <th>등록일</th>
                            <th>조회수</th>
                            <th>추천수</th>
                            <th>신고수</th>
                     
                        </tr>
                    </thead>
                    <c:if test="${fn:length(boardList) == 0}">
                      <tr>
                        <td>검색 결과가 없습니다!</td>
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
                        <thead>
                    </tbody>

                </table>
      
<div class="row">
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
</div>
            
    
            </div>
    
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
      
        </div>
        <!-- /container -->
      
      </div>
      
      <footer>
       푸터 예정
      </footer>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-A3rJD856KowSb7dwlZdYEkO39Gagi7vIsF0jrRAoQmDKKtQBHUuLZ9AsSv4jD4Xa" crossorigin="anonymous"></script>

</body>
</html>