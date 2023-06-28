<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="path" value="${pageContext.request.contextPath}"> </c:set>
	
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

   <script type="text/javascript" src="http://code.jquery.com/jquery-1.11.3.js"></script>




<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
  <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
  
<script type="text/javascript" src="/js/jquery-1.11.3.min.js"></script>
<script type="text/javascript" charset="utf-8" src="${path}/resources/js/smarteditor/js/service/HuskyEZCreator.js"></script>

<script type="text/javascript" src="${path}/resources/js/HuskyEZCreator.js" charset="utf-8"></script>



<script type="text/javascript">

var oEditors = [];
 
$(function(){
   nhn.husky.EZCreator.createInIFrame({
      oAppRef: oEditors,
      elPlaceHolder: "ir1",
      //SmartEditor2Skin.html 파일이 존재하는 경로
      sSkinURI: "SmartEditor2Skin.html",  
      htParams : {
          // 툴바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseToolbar : true,             
          // 입력창 크기 조절바 사용 여부 (true:사용/ false:사용하지 않음)
          bUseVerticalResizer : true,     
          // 모드 탭(Editor | HTML | TEXT) 사용 여부 (true:사용/ false:사용하지 않음)
          bUseModeChanger : true,         
          fOnBeforeUnload : function(){
               
          }
      }, 
      fOnAppLoad : function(){
          //textarea 내용을 에디터상에 바로 뿌려주고자 할때 사용
          oEditors.getById["ir1"].exec("PASTE_HTML", ["ㅎㅇ 시작하자마자 이문구 작성됨."]);
      },
      fCreator: "createSEditor2"
      });
</script>

</head>
<body>

	
	
 <div class="container">
  <h2>게시판 글쓰기 페이지입니당.</h2>
  <form action="/write"  method="post">
    <div class="form-group">
   
      <label for="title">제목</label>
      <input type="text" class="form-control" id="title"
       placeholder="제목 입력(4-100)" name="title"
       maxlength="100" required="required"
       pattern=".{4,100}">
    </div>
    <div class="form-group">
   <label for="content">내용</label>
   <textarea class="form-control" rows="5" id="content"
    name="content" placeholder="내용 작성"></textarea>
 </div>
    <div class="form-group">
      <label for="writer">작성자</label>
      <input type="text" class="form-control" id="writer"
       placeholder="작성자(2자-10자)" name="writer">
    </div>
    <button  class="btn" >등록</button>
  </form>
</div>


 <textarea rows="10" cols="30" id="ir1" name="ir1"></textarea>

</body>
</html>