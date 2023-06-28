<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %> 
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>     
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>  
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">

<script
  src="https://code.jquery.com/jquery-3.4.1.js"
  integrity="sha256-WpOohJOqMqqyKL9FccASB9O0KwACQJpFTUBLTYOVvVU="
  crossorigin="anonymous"></script>
  <style>
  a{
  	text-decoration : none;
  }
  table{
 	border-collapse: collapse;
 	width: 1000px;    
 	margin-top : 20px;
 	text-align: center;
  }
  td, th{
  	border : 1px solid black;
  	height: 50px;
  }
  th{
  	font-size : 17px;
  }
  thead{
  	font-weight: 700;
  }
  .table_wrap{
  	margin : 50px 0 0 50px;
  }
  .bno_width{
  	width: 12%;
  }
  .writer_width{
  	width: 20%;
  }
  .regdate_width{
  	width: 15%;
  }
  .updatedate_width{
  	width: 15%;
  }
  .top_btn{
  	font-size: 20px;
    padding: 6px 12px;
    background-color: #fff;
    border: 1px solid #ddd;
    font-weight: 600;
  }
  .pageInfo{
  	list-style : none;
  	display: inline-block;
    margin: 50px 0 0 100px;  	
  }
  .pageInfo li{
  	float: left;
    font-size: 20px;
    margin-left: 18px;
    padding: 7px;
    font-weight: 500;
  }
 a:link {color:black; text-decoration: none;}
 a:visited {color:black; text-decoration: none;}
 a:hover {color:black; text-decoration: underline;}
  .active{
  	background-color: #cdd5ec;
  }
  .search_area{
    display: inline-block;
    margin-top: 30px;
    margin-left: 260px;
  }
  .search_area input[type="text"]{
  	height: 30px;
    width: 250px;
  }
  .search_area button{
 	width: 100px;
    height: 36px;
  } 
  .search_area select{
  	height: 35px;
  }
   
  </style>
</head>
<body>
<h1>목록페이지입니다.</h1>

<div class="table_wrap">
	<a href="${path}/write" class="top_btn">게시판 등록</a>
	<table>
		<thead>
			<tr>
				<th class="bno_width">번호</th>
				<th class="title_width">제목</th>
				<th class="writer_width">작성자</th>
				<th class="regdate_width">작성일</th>
				<th class="updatedate_width">수정일</th>
				<th class="updatedate_width">조회수</th>				
			</tr>
		</thead>		
		<tbody>
		<c:if test="${fn:length(boardList) == 0}">
			<tr>
				<td colspan="6">검색 결과가 없습니다!</td>
			</tr>
		</c:if>
		<c:forEach items="${boardList}" var="boardList">
			<tr>
				<td><c:out value="${boardList.postno}"/></td>
				<td>
					<a class="move" href='<c:out value="${path}/detail?postno=${boardList.postno}"/>'>
						<c:out value="${boardList.title}"/>
					</a>
				</td>
				<td><c:out value="${boardList.writer}"/></td>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardList.updatedate}"/>
                <td><fmt:formatDate pattern="yyyy/MM/dd" value="${boardList.changedate}"/>             
					<td><c:out value="${boardList.viewcnt}"/></td>
			</tr>			
		</c:forEach>	
		</tbody>
	</table>
		
	<form class="search_wrap" method="POST" action="${path}/searchBoard">
		<div class="search_area">
			<label> 대소문자 구분
				<input type="checkbox" name="isChecked" <c:if test="${searchObj.isChecked == 'on'}">checked</c:if> />
			</label>
			<select name="searchKeyword">
				<option value="T" <c:if test="${searchObj.searchKeyword == 'T'}">selected</c:if>>제목</option>
				<option value="W" <c:if test="${searchObj.searchKeyword == 'W'}">selected</c:if>>작성자</option>
				<option value="TW" <c:if test="${searchObj.searchKeyword == 'TW'}">selected</c:if>>제목 + 작성자</option>
			</select>
			<input type="text" name="searchTxt" value="${searchObj.searchTxt}">
			<button type="submit">Search</button>
		</div>
	</form>
	
	
<div class="w3-center">
<div class="w3-bar">
  <a href="#" class="w3-button">&laquo;</a>
  <a href="#" class="w3-button">1</a>
  <a href="#" class="w3-button">2</a>
  <a href="#" class="w3-button">3</a>
  <a href="#" class="w3-button">4</a>
  <a href="#" class="w3-button">&raquo;</a>
</div>
</div>

	
	
</div> 
<!-- 
<script>
$(document).ready(function(){
	
	let result = '<c:out value="${result}"/>';
	
	checkAlert(result);
	console.log(result);
	
	function checkAlert(result){
		
		if(result === ''){
			return;
		}
		
		if(result === "enrol success"){
			alert("등록이 완료되었습니다.");
		}
		
		if(result === "modify success"){
			alert("수정이 완료되었습니다.");
		}
		
		if(result === "delete success"){
			alert("삭제가 완료되었습니다.");
		}		
	}	
	
});

	let moveForm = $("#moveForm");

	$(".move").on("click", function(e){
		e.preventDefault();
		
		moveForm.append("<input type='hidden' name='bno' value='"+ $(this).attr("href")+ "'>");
		moveForm.attr("action", "/board/get");
		moveForm.submit();
	});

	$(".pageInfo a").on("click", function(e){
		e.preventDefault();
		moveForm.find("input[name='pageNum']").val($(this).attr("href"));
		moveForm.attr("action", "/board/list");
		moveForm.submit();
		
	});	
	
	
	$(".search_area button").on("click", function(e){
		e.preventDefault();
		
		let type = $(".search_area select").val();
		let keyword = $(".search_area input[name='keyword']").val();
		
		if(!type){
			alert("검색 종류를 선택하세요.");
			return false;
		}
		
		if(!keyword){
			alert("키워드를 입력하세요.");
			return false;
		}		
		
		moveForm.find("input[name='type']").val(type);
		moveForm.find("input[name='keyword']").val(keyword);
		moveForm.find("input[name='pageNum']").val(1);
		moveForm.submit();
	});
	
</script> -->