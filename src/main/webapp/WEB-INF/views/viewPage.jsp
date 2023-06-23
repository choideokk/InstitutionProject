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
.update_btn, .list_btn, .delete_btn{
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
<script type="text/javascript">
		$(document).ready(function(){
			var formObj = $("form[name='readForm']");
			
			// 수정 
			$(".update_btn").on("click", function(){
				formObj.attr("action", "/updateView");
				formObj.attr("method", "get");
				formObj.submit();				
			})
			
			// 삭제
			$(".delete_btn").on("click", function(){
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
			})
			
			// 취소
			$(".list_btn").on("click", function(){
				
				location.href = "/boardlist";
			})
		})
	</script>

</head>

<body>


<h1>조회 페이지</h1>
	<form id="modifyForm" action="/update" method="post">
	

	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="postno" readonly="readonly" value='<c:out value="${viewPage.postno}"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly"  value=' <c:out value="${viewPage.writer }"/>' >
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
<button type="submit" class="update_btn">수정</button>
		<button type="submit" class="delete_btn">삭제</button>
			<button type="submit" class="list_btn">목록</button>	
	</div>



	
<%-- 	<form id="infoForm" action="/board/modify" method="get">
		<input type="hidden" id="bno" name="bno" value='<c:out value="${pageInfo.postno}"/>'>
		<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}"/>'>
		<input type="hidden" name="amount" value='<c:out value="${cri.amount}"/>'>
		<input type="hidden" name="type" value="${cri.type }">	
		<input type="hidden" name="keyword" value="${cri.keyword }">	
	</form> --%>
		


<div style="width:700px; margin-top:30px; text-align:center;">
     
         <textarea rows="5" cols="80" id="replytext"
             placeholder="댓글을 작성하세요"></textarea>
         <br>
    
         <button type="button" id="btnReply">댓글쓰기</button>

</div>
</form>
<script>


//댓글 목록 출력 함수
function listReply(){
    $.ajax({
        type: "get", //get방식으로 자료를 전달한다
        url: "${path}/reply/list.do?bno=${dto.bno}", //컨트롤러에 있는 list.do로 맵핑하고 게시판 번호도 같이 보낸다.
        success: function(result){ //자료를 보내는것이 성 공했을때 출력되는 메시지
            //result : responseText 응답텍스트(html)
            $("#listReply").html(result);
        }
    });
}




/* 	let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#modifyForm");	// 페이지 데이터 수정 from
	
	 목록 페이지 이동 버튼 
	$("#list_btn").on("click", function(e){
		form.find("#bno").remove();
		form.attr("action", "/board/list");
		form.submit();
	});
	

	$("#modify_btn").on("click", function(e){
		mForm.submit();
	});

	 취소 버튼 
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/board/get");
		form.submit();
	});	
	
	 삭제 버튼 
	$("#delete_btn").on("click", function(e){
		form.attr("action", "/board/delete");
		form.attr("method", "post");
		form.submit();
	}); */
	
</script>
	