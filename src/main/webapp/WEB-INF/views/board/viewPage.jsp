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
    margin-left : 80px;
    cursor : pointer;
}
.btn_wrap{
	padding-left : 80px;
	margin-top : 50px;
}
#delete_btn{
	background-color: #f3e3e7;

}


 input[type="text"], textarea {
        width: 100%;
        padding: 10px;
        margin-bottom: 10px;
        border: 1px solid #ccc;
        border-radius: 4px;
    }
    input[type="submit"] {
        padding: 10px 20px;
        background-color: #4CAF50;
        color: #fff;
        border: none;
        border-radius: 4px;
        cursor: pointer;
    }
    input[type="submit"]:hover {
        background-color: #45a049;
    }

    /* Style for the comments table */
    table {
        width: 700px;
        border-collapse: collapse;
    }
    td {
        padding: 10px;
        border: 1px solid #ccc;
    }
    tr:nth-child(even) {
        background-color: #f2f2f2;
    }
    tr:hover {
        background-color: #ddd;
    }

</style>


</head>

<body>


<h1>조회 페이지</h1>
	<form id="updateForm" action="/update" method="post">
	

	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="postno" readonly="readonly" value='<c:out value="${viewPage.postno}"/>' >
	</div>
		<div class="input_wrap">
		<label>조회수</label>
		<input name="viewcnt" readonly="readonly"  value=' <c:out value="${viewPage.viewcnt }"/>' >
	</div>
	<div class="input_wrap">
		<label>게시판 제목</label>
		<input name="title" readonly="readonly"  value=' <c:out value="${viewPage.writer }"/>' >
	</div>

	<div class="input_wrap">
		<label>게시판 내용</label>
	<textarea rows="3" readonly="readonly"  name="content"><c:out value="${viewPage.content}"/></textarea>	
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
		<a class="btn" id="list_btn">목록 페이지</a> 
		<a class="btn" id="update_btn">수정하기</a>
		<a class="btn" id="delete_btn" >게시글삭제</a>
	</div>

</form>

   <h1>댓글 목록</h1>
    
    <table>
        <thead>
            <tr>
                <th>등록일</th>
                <th>작성자</th>
                <th>내용</th>
             
            </tr>
        </thead>
        <tbody>
            <c:forEach items="${replylist}" var="replylist">
                <tr>
                
                    <td><fmt:formatDate value="${replylist.date}" pattern="yyyy-MM-dd HH:mm:ss" /></td>
                    <td>${replylist.content}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>
	

<h1>댓글입력</h1>

  <form action="comments" method="post">
    <input type="text" name="name" placeholder="" required><br>
    <textarea name="replyText" placeholder="" required></textarea><br>
    <input type="submit" value="작성">
</form>

<table>
    <c:forEach var="comment" items="${comments}">
        <tr>
            <td>
                ${comment.name}
<%--                 (<fmt:formatDate value="${comment.regDate}" pattern="yyyy-MM-dd a HH:mm:ss" />)<br>
 --%>                ${comment.replyText}
            </td>
        </tr>
    </c:forEach>
</table>
<script>



 	let form = $("#infoForm");		// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
	let mForm = $("#updateForm");	// 페이지 데이터 수정 from

	
	$("#list_btn").on("click", function(e){
		form.find("#postno").remove();
		var chk = confirm("목록 페이지로 가시겠습니까?");
	    if (chk) {
        location.href='boardlist';
			}

	});


	$("#update_btn").on("click", function(e){
		
		var chk = confirm("수정 페이지로 가시겠습니까?");
	    if (chk) {
	    	mForm.submit();
			}
	});


	$("#delete_btn").on("click", function(e){
		form.attr("action", "/delete");
	    form.attr("method", "get");
		
		var chk = confirm("게시물을 삭제하시겠습니까?");
	    if (chk) {
	      location.href="/delete?postno=${viewPage.postno}"
			}
	}); 
	
	
	$("#cancel_btn").on("click", function(e){
		form.attr("action", "/boardlist");
		form.submit();
		var chk = confirm("취소하시겠습니까?");
	    if (chk) {
        location.href="boardlist";
			}

	});	
	
	
</script>

</body>
</html>
	