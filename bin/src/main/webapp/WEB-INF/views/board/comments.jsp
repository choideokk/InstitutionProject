<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
   <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<!DOCTYPE html>

<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title> 
<style>
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
  <h1>댓글</h1>

    <form action="comments" method="post">
    <input type="text" name="name" placeholder="Your Name" required><br>
    <textarea name="replyText" placeholder="Your Comment" required></textarea><br>
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


<%--     <form id="commentForm" name="commentfrom" action ="/reply/comment">

<input name="replyno" readonly="readonly" value='<c:out value="${replyList.replyno}"/>' ><br><br>
<input name="updatedate" readonly="readonly" value='<c:out value="${replyList.updatedate}"/>' ><br><br>
<input name="replywriter" readonly="readonly" value='<c:out value="${replyList.replywriter}"/>' ><br><br>
<textarea rows="3"  name="replytext" readonly="readonly"  name="content"><c:out value="${replyList.replytext}"/></textarea>	


<div style="width:700px; margin-top:30px; text-align:center;">
    <br><br>
        <input type="text" name="name" placeholder="이름">
        <br>
        <textarea rows="5" cols="80" id="replytext" name="comment" placeholder="댓글을 작성하세요"></textarea>
        <br>
        <button type="submit" id="btnReply">댓글쓰기</button>
</div>
    </form>

<script>
 --%>


</script>

<!-- /* document.getElementById("commentForm").addEventListener("submit", function(event) {

       from.action = "/reply/comment";
	   form.method = "POST";
	   form.submit();
    console.log("이름:", name);
    console.log("댓글 내용:", comment);

}); */ -->
</body>
</html>
