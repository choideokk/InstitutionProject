<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<link rel="stylesheet" href="${path}/css/calendar2.css"  type="text/css" />
	
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp"%>

    <title>Page Layout</title>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    <script type="text/javascript" src="${path}/js/calendar2.js"></script>
</head>
<body>
<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>

<div class="hahaContainer">
	<div class="haha">
	<input type="hidden" id="rsvfNm" value="${currentFc.rsrcNm}" />
		<h2>${currentFc.rsrcNm}</h1>
	</div>
	<div class="haha2">
		<div class="haha2_left">
			조회 및 예약
		</div>
		<div class="haha2_right">
			예약정보	
		</div>
	</div>
</div>
    <div class="container1">
        <div class="left">
            <div class="top">
                <!-- 이미지 추가 -->
                <img src="${path}/image/facilities/${currentFc.rsrcNo}.jpg" width="100px" height="100px" />
            </div>
            <div class="bottom">
                <!-- FullCalendar 추가 -->
                <div id='calendar'></div>
            </div>
        </div>

        <div class="right">
	       		<!-- content -->
	           <div style="display: flex; justify-content: center; align-items: center;">
	           <label>조회할 시설을 선택해주세요.</label><br/>
	           <select id="category">
	           <option value="" disabled selected hidden>선택해주세요</option>
	               <option value="${currentFc.rsrcClsNm}">${currentFc.rsrcClsNm}</option>
	           </select>
	           </div>
	
	           <div id="contentArea" style="display: flex; justify-content: center; align-items: center;">	           </div> 
        		</div>
        
        <div class="right2">
	       		<!-- content -->
	           <div style="display: flex; justify-content: center; align-items: center;">
	           
	           <ul>
					<li><strong>장소</strong> : ${currentFc.rsrcNm}</li>
					<li><strong>종목</strong> : ${currentFc.rsrcClsNm}</li>
					<li><strong>주소</strong> : ${currentFc.addr}${currentFc.daddr}</li>
					<li><strong>무료여부</strong> : ${currentFc.freeYn}</li>
					<li><strong>예약순서</strong> : 선착순</li>
					<li><strong>모집정원</strong> : 4명</li>
					<li><strong>취소기간</strong> : 이용일 1일 전까지</li>
					<li><strong>예약방법</strong> : 인터넷</li>
					<li><strong>문의전화</strong> : </li>
			  </ul>
        </div>
    </div>
    </div>
    
    <div class="bottomMenuContainer">
    	<div class="bottomMenu">
    		<div class="bottomMenu1"><h4>예약 주의사항</h4></div>
    		<div class="bottomText1">
    			<p>모든 서비스의 이용은 담당 기관의 규정에 따릅니다. 각 시설의 규정 및 허가조건을 반드시 준수하여야 합니다.</p>
					<p>각 관리기관의 시설물과 부대시설을 이용함에 있어 담당자들과 협의 후 사용합니다.</p>
					<p>각 관리기관의 사고 발생시 서울시청에서는 어떠한 책임도 지지않습니다.</p>
					<p>시설이용료 납부는 각 관리기관에서 규정에 준합니다.</p>
					<p>본 사이트와 각 관리기관의 규정을 위반할 시에는 시설이용 취소 및 시설이용 불허의 조치를 취할 수 있습니다.</p>
					<p>접수 시간을 기준으로 브라우저에서 새로고침을 하면 변경된 정보를 볼 수 있습니다.</p>
				</div>
    		</div>
    		<div class="bottomMenu">
    		<div class="bottomMenu1"><h4>취소 주의사항</h4></div> 
   			<div class="bottomText2">
   				 <p> 예약 취소 : 예약 당일 및 이용 예정일 10일전 전액 환불, 7일전 30%, 2일전 80% 공제 후 환불가능하며, 하루전과 당일은 취소가 불가능합니다.</p>
				 <p>간헐적 우천에 따른 환불은 취소가 되지 않습니다. 문의사항은 관리자에게 연락주세요.</p>
				 </div>
    		</div>
    	</div>
</body>
</html>
