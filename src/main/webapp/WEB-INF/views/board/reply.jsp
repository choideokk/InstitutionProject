<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<!DOCTYPE html>

<html>

<style>


</style>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.input_wrap {
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
	/* 글 내용의 경계선 표시 */
	.content{
		border: 1px dotted #cecece;
	}
	/* 글 내용안에 있는 이미지의 크기 제한 */
	.content img{
		max-width: 100%;
	}
	/* 댓글에 관련된 css */
	.comments ul{
		padding: 0;
		margin: 0;
		list-style-type: none;
	}
	.comments ul li{
		border-top: 1px solid #888; /* li 의 윗쪽 경계선 */
	}
	.comments dt{
		margin-top: 5px;
	}
	.comments dd{
		margin-left: 26px;
	}
	.comments form textarea, .comments form button{
		float: left;
	}
	.comments li{
		clear: left;
	}
	.comments form textarea{
		width: 85%;
		height: 100px;
	}
	.comments form button{
		width: 15%;
		height: 100px;
	}
	/* 댓글에 댓글을 다는 폼과 수정폼을 일단 숨긴다. */
	.comment form{
		display: none;
	}
	.comment{
		position: relative;
	}
	.comment .reply_icon{
		width: 8px;
		height: 8px;
		position: absolute;
		top: 10px;
		left: 30px;
	}
	.comments .user-img{
		width: 20px;
		height: 20px;
		border-radius: 50%;
	}
</style>
</head>
<body>
<%-- <div class="comments">
		<div class="comment_form">
			<form action="comment_insert.do" method="post"> 
				<input type="hidden" name="ref_group" value="${dto.postno }"/>
				<input type="hidden" name="target_id" value="${dto.writer }"/>
			<label>게시판 등록일</label> <inputreadonly="readonly"
				value='<fmt:formatDate pattern="yyyy/MM/dd" value="${dto.updatedate }"/>'>
		</div>
				<textarea rows="content"><c:if test="">로그인이 필요합니다.</c:if></textarea>
				<button type="submit">등록</button>
            </form>
		</div>
   </div>
    --%>
    <form action="/reply" method="post">
 
  <label for="reply">댓글</label>
  <textarea id="reply" name="replytext" rows="4" required></textarea>
  <button type="submit" value="댓글 작성" id="reply" >댓글등록</button>	
	</form>	
  <button type="submit" id="chochun" >댓글 추천 </button>
  <button type="submit" id="singo">댓글 신고 </button>

  
  
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
				<td><c:out value="${list.replynumber}"/></td>
			 	<c:if test="${sessionScope.loginId != null}">
    	<label for="userid">작성자: ${sessionScope.loginId}</label>
  					</c:if>
				<td><c:out value="${list.replytext}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${reply.replyupdatedate}"/>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${reply.replychangedate}"/>             
					<td><c:out value="${list.recommend}"/></td>
						<td><c:out value="${list.report}"/></td>		
			</tr>			
		</c:forEach>	
            </tbody>
        </table>
    </div>
</body>
</html>