<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<%
 response.setHeader("Cache-Control","no-store");
 response.setHeader("Pragma","no-cache");
 response.setDateHeader("Expires",0);
 if(request.getProtocol().equals("HTTP/1.1"))
     response.setHeader("Cache-Control","no-cache");
 %>
 
 
 
<!-- CSS only -->

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
    <script type="text/javascript" src="https://code.jquery.com/jquery-3.2.0.min.js" ></script>

<title>Insert title here</title>

    <script type="text/javascript" src="${path}/ckeditor/ckeditor.js"></script>
    <script type="text/javascript" src="${path}/ckeditor/config.js"></script>
    
<link href="${path}/css/write.css" rel="stylesheet" type="text/css" />



<!-- JavaScript Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/js/bootstrap.bundle.min.js" integrity="sha384-kenU1KFdBIe4zVF0s0G1M5b4hcpxyD9F7jL+jjXkk+Q2h455rYXK/7HAuoJl+0I4"
 crossorigin="anonymous"></script>
 <!-- 부트스트랩-->
<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" 
rel="stylesheet" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">	

</head>
<body>
	<c:if test="${sessionScope.loginId == null}">
	<script>
	 	alert("로그인 후 사용 가능합니다.");
	 	location.href="${path}/login";
	 	</script>
	</c:if>



	<div id= "header">	
	
	<div id="header-top">
	 header top
	</div>			
	<div id= "header-bottom">
		 header bottm
		 </div>
	</div>
	
<div class="wrap">
	
	
	  <form name="saveForm" action="/updateView" method="post">
	<div class="container">
	
		
	<div id="main">
		<div id="notice_box">
		<strong  class="hilite">시민의 소리에 귀 귀울이는 3조가 되겠습니다.</strong><br/><br/>
		게시판 운영 중 아래의 경우 임의삭제 될 수 있음을 알려드립니다.<br/>
		- 광고성 글, 단체 또는 개인을 비방⋅음해하는 게시글<br/>
		- 개인정보(주민등록번호 등)노출 게시글<br/>
		- 저속한 표현, 반복게시물, 답변이 불필요한 내용 등의 게시글<br/>
	
		
		</div>	
		
	<c:if test="${sessionScope.loginId != null}">
			
	<div class="row">
  <div class="col">
    <input type="text" class="form-control" readonly="readonly" value="환영합니다.ID : ${sessionScope.loginId} 님." aria-label="First name" style="width:300px; margin-bottom: 20px;">
  </div>
</div>
		</c:if>
<select class="form-select" aria-label="Default select example">
  <option selected>카테고리</option>
  <option value="1">축구장</option>
  <option value="2">수영장</option>
  <option value="3">테니스장</option>
  <option value="4">볼링장</option>
  <option value="5">풋살장</option>
  
</select>
    	<div class="input_wrap">
		<label>게시판 번호</label>
		<input name="postno" readonly="readonly" value='<c:out value="${viewPage.postno}"/>' >
	</div>
    <div class="input-group mb-3" >
  	<span class="input-group-text" id="inputGroup-sizing-default">제목</span>
  	<input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
  	 id="title" name="title"  maxlength="100" value='<c:out value="${viewPage.title }"/>'>
</div>
 
		<!--  에디터 폼 -->
		  <textarea class="form-control" id="content" name="content">${viewPage.content}</textarea>
	<div class="input-group mb-3" >
  	<span class="input-group-text" id="inputGroup-sizing-default">해시태그</span>
  	<input type="text"  class="form-control" aria-label="Sizing example input" aria-describedby="inputGroup-sizing-default"
  	 id="name" placeholder="#해시태그" name="name"  maxlength="100" >
</div> 
  
<button  class="btn btn-dark"  type="submit" id="update_btn" style=" clear =both;">저장하기</button>
<button  class="btn btn-dark" type="button" id="cancel_btn" style=" clear =both;">수정 취소</button>
<button  class="btn btn-dark" type="button" id="delete_btn" style=" clear =both;">게시물 삭제</button>
	
		    					

		    
    
		<div id="area">
				<div class="areaPoll " >
	
						<div class="leftArea">
							<p><b>현재 페이지 내 게시된 정보 문의는 아래의 담당부서에 문의주시기 바랍니다.</b> </p>
							<p>담당부서: 휴먼교육부 <span>041-1234-1234</span> </p>
							<p>최종수정: 2023-07-01</p>
						</div>
						<hr/>
						
			<input type="hidden"	id="a_no"		name="a_no"		value="25">
			<input type="hidden"	id="a_cate"	name="a_cate"	value="portal">
			<input type="hidden"	id="etc_page"	name="etc_page"	value="">
			
			<dl class="rightArea"> <dt><b>이 페이지에서 제공하는 정보에 만족하셨습니까?</b></dt>
				<dd> 
					<span><input type="radio" name="point" id="point1" value="5" checked="checked"><label for="point1">&nbsp;매우만족</label></span> 
					<span><input type="radio" name="point" id="point2" value="4" class="cbr-type"> <label for="point2">&nbsp;만족</label></span> 
					<span><input type="radio" name="point" id="point3" value="3" class="cbr-type"> <label for="point3">&nbsp;보통</label></span>
					<span><input type="radio" name="point" id="point4" value="2" class="cbr-type"> <label for="point4">&nbsp;불만족</label></span> 
					<span><input type="radio" name="point" id="point5" value="1" class="cbr-type"> <label for="point5">&nbsp;매우불만족</label></span> 
				</dd>
				<dd><br><br>
		<div class="form-floating">
  <textarea class="form-control" placeholder="Comments" id="floatingTextarea"></textarea>
  <label for="floatingTextarea" placeholder="Comments"></label>
</div>
				</dd>
			</dl>
		

		</div>
			
		
		</div> <!-- main 끝  -->

</div> <!-- container 끝 -->
</div>
	  </form>  


		
	  <div id="footer">
	 	<h2>임시 dddfooter</h2> 
	  </div>
	  
</div>
<script>


let form = $("#infoForm");	// 페이지 이동 form(리스트 페이지 이동, 조회 페이지 이동)
let mForm = $("#saveForm");	// 페이지 데이터 수정 from


$("#update_btn").on("click", function(e){
	
	var chk = confirm("저장하시겠습니까?");
    if (chk) {
   		// 수정한 내용이 담긴 폼을 updateView라는 링크로 post를 한다
        mForm.submit();
   		
   		
   		// 업데이트가 완료되면 /detail?postno=어찌구 로 리다이렉트한다
   				}
});

$("#delete_btn").on("click", function(e){
	form.attr("method", "post");
	var chk = confirm("게시물을 삭제하시겠습니까?");
    if (chk) {
	form.attr("action", "/delete?postno=${viewPage.postno}");
    //location.href="/delete?postno=${viewPage.postno}"
	}
	form.submit();	
}); 

$("#cancel_btn").on("click", function(e){
	form.attr("action", "/boardlist?postno=1");
	form.submit();
	var chk = confirm("수정을 취소하시겠습니까?");
    if (chk) {
    location.href="detail?postno=${viewPage.postno}";
		}
});	

CKEDITOR.replace('content'
        , {height: 500 ,
         });
$(function () {
CKEDITOR.replace('content', {
	filebrowserUploadUrl : '${pageContext.request.contextPath}/adm/fileupload.do'
   });
});
config.fillEmptyBlocks = false;


</script>
	</body>
</html>