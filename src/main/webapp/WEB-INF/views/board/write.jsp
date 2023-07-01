<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
  
    
  	<script>
    window.onload = function(){
       ck = CKEDITOR.replace("editor");
    };
    </script>
    <script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${path}/ckeditor/config.js"></script>
    
<link href="${path}/css/stars.css" rel="stylesheet" type="text/css" />

</head>
<body>

 <div class="container">
  <h2>게시판 글쓰기 페이지입니당.</h2>
  <form action="${path}/write"  method="post">
   <div class="form-group">
      <label for="writer">닉네임</label>
      <input type="text" class="form-control" id="writer"
       placeholder="작성자(2자-10자)" name="writer">
    </div>
    <div class="form-group">
   
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title"
       placeholder="제목 입력(4-100)" name="title"
       maxlength="100" required="required"
       pattern=".{4,100}">
    </div>
  <textarea class="form-control" id="content" name="content"></textarea>
<script type="text/javascript">

 CKEDITOR.replace('content'
                , {height: 500                                                  
                 });
 $(function () {
		CKEDITOR.replace('contents', {
			filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do'
		});
	});
 config.fillEmptyBlocks = false;
</script>


    <button  class="btn" >등록</button>
  </form>
</div>


<div class="stars">
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
  <div class="star"></div>
</div>
<script>
/* let form = $("#infoForm");		
let mForm = $("#updateForm");


$("#save_btn").on("click", function(e){
	form.attr("action", "/write");
	form.submit();
	var chk = confirm("글 등록을 하시겠습니까??");
    if (chk) {
    location.href="boardlist";
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