<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://code.jquery.com/jquery-3.4.1.js"
	integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
	crossorigin="anonymous"></script>



<style>
style type ="text /css ">.input_wrap {
	padding: 5px 20px;
}

label {
	display: block;
	margin: 10px 0;
	font-size: 20px;
}

input {
	padding: 5px;
	font-size: 17px;
}

textarea {
	width: 800px;
	height: 200px;
	font-size: 15px;
	padding: 10px;
}

.btn {
	display: inline-block;
	font-size: 22px;
	padding: 6px 12px;
	background-color: #fff;
	border: 1px solid #ddd;
	font-weight: 600;
	width: 140px;
	height: 41px;
	line-height: 39px;
	text-align: center;
	margin-left: 30px;
	cursor: pointer;
}

.btn_wrap {
	padding-left: 80px;
	margin-top: 50px;
}

#delete_btn {
	background-color: #f3e3e7;
}

.comment-form {
	margin-top: 20px;
	padding: 20px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.comment-form label {
	display: block;
	margin-bottom: 10px;
	font-weight: bold;
}

.comment-form textarea {
	width: 100%;
	padding: 10px;
	border: 1px solid #ccc;
	border-radius: 4px;
}

.comment-form textarea {
	height: 100px;
}

.comment-form input[type="submit"] {
	background-color: #4CAF50;
	color: white;
	padding: 8px 16px;
	border: none;
	border-radius: 4px;
	cursor: pointer;
}

.comment-form input[type="submit"]:hover {
	background-color: #45a049;
}

.comment-form input[type="submit"]:focus {
	outline: none;
}

.comment-form .error-message {
	color: red;
	margin-top: 5px;
}
</style>


</head>

<body>

	<div>
		<h1>조회 페이지</h1>
		<form method="POST" action="${path}/likes?postno=${viewPage.postno}">
			<button type="submit">추천수 테스트</button>
			<button type="submit">신고 테스트</button>
		</form>
		<form id="updateForm" action="/update" method="post">
			<div class="input_wrap">
				<label>게시판 번호</label> <input name="postno" readonly="readonly"
					value='<c:out value="${viewPage.postno}"/>'>
			</div>
			<div class="input_wrap">
				<label>조회수</label> <input name="viewcnt" readonly="readonly"
					value=' <c:out value="${viewPage.viewcnt }"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 제목</label> <input name="title" readonly="readonly"
					value=' <c:out value="${viewPage.writer }"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 내용</label>
				<textarea rows="3" readonly="readonly" name="content"><c:out
						value="${viewPage.content}" /></textarea>
			</div>
			<div class="input_wrap">
				<label>게시판 작성자</label> <input name="writer" readonly="readonly"
					value='<c:out value="${viewPage.writer}"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 등록일</label> <input readonly="readonly"
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${viewPage.updatedate }"/>'>
			</div>
			<div class="input_wrap">
				<label>게시판 수정일</label> <input readonly="readonly"
					value='<fmt:formatDate pattern="yyyy/MM/dd" value="${viewPage.changedate}"/>'>
			</div>
			<div class="btn_wrap">
				<a class="btn" id="list_btn">목록 페이지</a>
				 <button type="submit" onclick="return submit2(this.form)" 
				 class="btn" id="update_btn" value="수정하기">수정</button>
				 
			 <a class="btn" id="delete_btn">삭제</a>
			</div>
		</form>


		<c:if test="${sessionScope.loginId != null}">
			<label for="userid">작성자: ${sessionScope.loginId}</label>
		</c:if>
		<form method="POST" action="${path}/reply?postno=${viewPage.postno}">
			<label for="replytext">댓글</label>
			<textarea id="replytext" name="replytext" rows="4" required></textarea>
			<button type="submit">제출</button>
			<input type="submit" value="댓글 작성" id="reply">
			<button type="button" id="chochun">댓글 추천</button>
			<button type="button" id="singo">댓글 신고</button>
		</form>

		<div class="rowtable">
			<table class="table" id="article-table">
				<thead>
					<tr>
						<th class="created-at"><a>댓글번호 </a></th>
						<th class="user-id"><a>작성자</a></th>
						<th class="created-at"><a>작성일</a></th>
						<th class="created-at"><a>수정일</a></th>
						<th class="created-at"><a>추천수</a></th>
						<th class="created-at"><a>신고수</a></th>
					</tr>
				</thead>

				<tbody>

					<c:forEach items="${list}" var="list">
						<tr>
							<td><c:out value="${list.replynumber}" /></td>
							<c:if test="${sessionScope.loginId != null}">
								<label for="userid">작성자: ${sessionScope.loginId}</label>
							</c:if>
							<td><c:out value="${list.replytext}" /></td>
							<td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${reply.updatedate}" /> <td><fmt:formatDate pattern="yyyy/MM/dd"
									value="${reply.changedate}" />             
					
							<td><c:out value="${list.recommend}" /></td>
						<td><c:out value="${list.report}" /></td>		
			</tr>			
		</c:forEach>	
            </tbody>
        </table>
    </div>
  
	
<script>

/* 	function submit2(frm){
		frm.action ='/update'
		frm.submit();
		
		return true;
	} */
	

 
	
	$("#list_btn").on("click", function(e){
		var chk = confirm("목록 페이지로 가시겠습니까?");
	    if (chk) {
        location.href='boardlist';
			}

	});

	$("#update_btn").on("click", function(e) {
		  var form = $("form"); // 
		  form.attr("action", "/update");
		  form.attr("method", "post");
		  var chk = confirm("수정 페이지로 가시겠습니까?");
		  if (chk) {
	    form.submit(); 
		   
		  }
		});


	$("#delete_btn").on("click", function(e) {
		  var form = $("form"); // 
		  form.attr("action", "/delete");
		  form.attr("method", "post");
		  var chk = confirm("삭제 진짜 페이지로 가시겠습니까?");
		  if (chk) {
	   	 form.submit(); 
		   
		  }
		});

	
	// $("#reply").on("click", function(e){
	//	mform.attr("action", "/viewPage");
	//	var chk = confirm("글 작성?");
	 //   if (chk) {
     //   location.href="/detail?postno="; 
	//		}
	//});	 
	


	
</script>
</body>
</html>
