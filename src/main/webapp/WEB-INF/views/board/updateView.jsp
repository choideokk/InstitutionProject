<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  
 <script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>

  
  
  
  <style>
<style type="text/css">
.input_wrap{
	padding: 5px 20px;
}
label{
    display: block;
    margin: 10px 0;
    font-size: 20px;	
}
input{
	padding: 5px;
    font-size: 17px;
}
textarea{
	width: 800px;
    height: 200px;
    font-size: 15px;
    padding: 10px;
}
.btn{
  	display: inline-block;
    font-size: 22px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
    width: 140px;
    height: 41px;
    line-height: 39px;
    text-align : center;
    margin-left : 30px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
#delete_btn{
	background-color: #f3e3e7;
}
</style>
</head>
<body>


<h1>수정 페이지</h1>
	<form id="saveForm" action="/updateView" method="post">
	

	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="postno" readonly="readonly" value='<c:out value="${viewPage.postno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" value='<c:out value="${viewPage.title }"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 내용</label>
		<textarea rows="3" name="content"><c:out value="${viewPage.content}"/></textarea>
	</div>
	<div class="input_wrap">
		<label>게시판 작성자</label>
		<input name="writer" readonly="readonly" value='<c:out value="${viewPage.writer}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 등록일</label>
		<input readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${viewPage.updatedate }"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 수정일</label>
		<input readonly="readonly" value='<fmt:formatDate pattern="yyyy/MM/dd" value="${viewPage.changedate}"/>' >
	</div>		
	
	
	<div class="btn_wrap">
		<a class="btn" id="update_btn">저장하기</a>
		<a class="btn" id="cancel_btn">수정취소</a>
		<a class="btn" id="delete_btn">게시물 삭제</a>
	</div>
	</form>
	
	
	<form id="infoForm" action="/boardlist" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.postno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type }">	
		<input type="hidden" name="keyword" value="${cri.keyword }">	
	</form> 
	
	


<script>


let form = $("#infoForm");	// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
let mForm = $("#saveForm");	// 페이지 데이터 수정 from


$("#update_btn").on("click", function(e){
	
	var chk = confirm("수정하시겠습니까?");
    if (chk) {
    	mForm.submit();
		}
});

$("#delete_btn").on("click", function(e){
	form.attr("action", "/delete");
	form.attr("method", "post");
	var chk = confirm("게시물을 삭제하시겠습니까?");
    if (chk) {
      location.href="/delete?postno=${deleteviewPage.postno}"
		}
	form.submit();	
}); 

$("#cancel_btn").on("click", function(e){
	form.attr("action", "/boardlist");
	form.submit();
	var chk = confirm("취소하시겠습니까?");
    if (chk) {
    location.href="detail?postno=${viewPage.postno}";
		}
});	

</script>
	</body>
</html>