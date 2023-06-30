<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<!-- 댓글 작성 -->
<div style="width:700px; text-align:left;">
     <c:if test="${sessionScope.userid != null }">
         <textarea rows="5" cols="80" id="replytext"
             placeholder="댓글을 작성하세요"></textarea>
         <br>
         <button type="button" id="btnReply">댓글쓰기</button>
     </c:if>
</div>
<!-- 댓글 목록 -->
<div id="listReply"></div>

<script>
<script>
$(function(){ //자동으로 실행되는 코드
    //댓글 목록 출력
    listReply2();
    
    //댓글 쓰기
    $("#btnReply").click(function(){
        var replytext=$("#replytext").val(); //댓글 내용
        var bno="${dto.bno}"; //게시물 번호
        var param={ "replytext": replytext, "bno": bno};
        //var param="replytext="+replytext+"&bno="+bno;
        $.ajax({
            type: "post",
            url: "${path}/reply/insert.do",
            data: param,
            success: function(){
                alert("댓글이 등록되었습니다.");
                listReply2(); //댓글 목록 출력
            }
        });
    });
    

</script>
</body>
</html>