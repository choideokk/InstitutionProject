<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp"%>

    <title>Page Layout</title>
    <style>
    
    .bottomText1, .bottomText2{
    width:100%;
    text-align: center;
    }
    

    .bottomMenuContainer{
    width:95%;
    height:500px;
    display:flex;
        justify-content: center;
    }
    
    .bottomMenu{
    display:flex;
    width:50%;
    height:500px;
    flex-direction: column;
    margin-right:30px;
    margin-left:30px;
    
    }
    
    .bottomMenu1{
  margin-right: 20px; 
  color: black;
  transition: color 0.3s ease;
  text-align: center;
    }
    
    .bottomMenu1:hover{
      color: orange;
  text-decoration: underline;
  text-align: center;
    }
    
    
    .hahaContainer{
    height:50px;
    width:100%;
    display:flex;
    margin-top:20px;
    margin-bottom:20px;
    }
    
    .fc-sun { color: red; }  /* 일요일 텍스트 색상 빨간색으로 변경 */
.fc-sat { color: blue; } /* 토요일 텍스트 색상 파란색으로 변경 */
    
    	.haha{
    	height:100%;
    	width:60%;
    	padding-left: 30px;
    	}
    	.haha2{
    	height:100%;
    	width:40%;
    	display:flex;
    	}
    	
    .haha2_left, .haha2_right{
    height:100%;
    width:45%;
    font-size: 16px;
    text-align: center;
    border: 1px solid black;
    display: flex;
    justify-content: center;
    align-items: center;
    border-radius: 20px;  /* 이 부분이 추가된 것입니다 */
}

.haha2_left:hover, .haha2_right:hover {
    cursor: pointer;
}
    	
    .haha2_left, .haha2_right {
    transition: all 0.3s;  /* Change this line for a smooth transition */
    box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.1);  /* Add this line */
}

.haha {
	height: 100%;
	width: 60%;
}

.haha2 {
	height: 100%;
	width: 40%;
	display: flex;
}

        .right select option {
            background-color: white;
            color: #555;
        }
    	
    	
        .container1 {
            display: flex;
        }

        .left {
            width: 60%;
            box-sizing: border-box; /* 테두리의 너비가 총 너비에 포함되도록 설정 */
                 display: flex;
            flex-direction: column;
            
        }
        
        .right{
        	height: 700px;
        	width: 40%;
            box-sizing: border-box; /* 테두리의 너비가 총 너비에 포함되도록 설정 */
            
        }
        
                .right2{
        	height: 700px;
        	width: 40%;
            box-sizing: border-box; /* 테두리의 너비가 총 너비에 포함되도록 설정 */
        }

        .top  {
            height: 300px;
            display: flex;
    justify-content: center;
    align-items: center;
        }
        
        .bottom{
        	height: 400px;
        	 overflow: auto;
  
        }

        /* 테두리 추가 
        .top, .bottom, .right {
            border: 1px solid black;
        }*/
        
        .top img {
                    width: 90%;
            height: 100%;
            border-radius: 5%;
        }
        
    /* FullCalendar에 적용할 스타일 */
       #calendar {
            width: 95%;  /* 달력의 너비를 조금 줄임 */
            height: 95%; /* 달력의 높이를 조금 줄임 */
            margin-left:30px;
        }
        
        .active {
    color: blue;
    border: 1px solid blue;
}

.unavailable {
	color: red;
	background-color: lightgray;
}

.available {
	color: green;
}

.unavailable, .available {
	font-size: 12px;
	text-align: center;
	display: flex;
	justify-content: center;
	align-items: center;
	height: 100%;
}
       
       
       
  .right2 {
    padding: 20px;  
    background-color: #f6f6f6;
    box-shadow: h-offset v-offset blur spread color;
}

.right2 ul {
    list-style-type: none;  
    padding-left: 0;  
}

.right2 ul li {
    font-size: 18px;  
    line-height: 2.0;  
    margin-bottom: 30px; 
    border-bottom: 1px solid #ccc; /* 목록 항목 아래에 선 추가 */
}

.right2 ul li:last-child {
    margin-bottom: 0;  
    border-bottom: none; /* 마지막 목록 항목에는 선 없음 */
}


    </style>
    
    <link href="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.css" rel="stylesheet" />
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/moment.js/2.24.0/moment.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/fullcalendar/3.10.2/fullcalendar.min.js"></script>
    
    <script>
    window.onload = function() {
    	
    	
    	
    	
        var leftDiv = document.querySelector(".haha2_left");
        var rightDiv = document.querySelector(".haha2_right");
        var right = document.querySelector(".right");
        var right2 = document.querySelector(".right2");
        
        // Set initial states
        right.style.display = 'none';  // Hide the 'right' div initially
        right2.style.display = 'block';  // Show the 'right2' div initially
        leftDiv.style.backgroundColor = 'grey';
        rightDiv.style.backgroundColor = 'white';
        rightDiv.style.boxShadow = 'none';
        leftDiv.style.boxShadow = '0px 5px 5px rgba(0, 0, 0, 0.1)';

        leftDiv.addEventListener("click", function() {
            console.log("haha2_left clicked");
            leftDiv.style.backgroundColor = 'white';
            rightDiv.style.backgroundColor = 'grey';
            leftDiv.style.boxShadow = 'none';
            rightDiv.style.boxShadow = '0px 5px 5px rgba(0, 0, 0, 0.1)';
            right.style.display = 'block'; // Show the 'right' div
            right2.style.display = 'none'; // Hide the 'right2' div
            leftDiv.classList.add('active');  // Add 'active' class
            rightDiv.classList.remove('active');
        });

        rightDiv.addEventListener("click", function() {
            console.log("haha2_right clicked");
            rightDiv.style.backgroundColor = 'white';
            leftDiv.style.backgroundColor = 'grey';
            rightDiv.style.boxShadow = 'none';
            leftDiv.style.boxShadow = '0px 5px 5px rgba(0, 0, 0, 0.1)';
            right2.style.display = 'block'; // Show the 'right2' div
            right.style.display = 'none'; // Hide the 'right' div
            rightDiv.classList.add('active');  // Add 'active' class
            leftDiv.classList.remove('active'); 
        });
    }
    
    
    
    $(document).ready(function() {
        var selectedDate = null;
        var selectedCategory = $("#category").val();

        $('#calendar').fullCalendar({
            defaultView: 'month',
            aspectRatio: 1.8, /* 달력의 가로 세로 비율을 조절 */
            dayClick: function(date, jsEvent, view) {
            	// 추가된 코드: 클래스 'unavailable'가 있으면 클릭 기능 무시
                if ($(this).find('.unavailable').length > 0) {
                    return;
                }
            	
                // 기존에 선택된 날짜가 있을 경우 배경색 초기화
                if (selectedDate) {
                    selectedDate.css('background-color', '');
                }

                // 현재 선택된 날짜의 배경색 변경
                $(this).css('background-color', 'skyblue');
                selectedDate = $(this);

                // AJAX 요청 실행
                sendAjaxRequest();
            },
            eventClick: function(calEvent, jsEvent, view) {
                // 이벤트 클릭 시에도 선택된 날짜 갱신
                selectedDate = $(this);

                // AJAX 요청 실행
                sendAjaxRequest();
            },
            dayRender: function(date, cell) {
                var today = moment().startOf('day');
                var currentDay = moment(date).startOf('day');

                if (currentDay.isBefore(today)) {
                    // 오늘 이전 날짜일 경우
                    cell.append('<div class="unavailable">예약 불가</div>');
                } else if (currentDay.isSame(today)) {
                    // 오늘 날짜일 경우
                    cell.append('<div class="available">예약&참가<br> 가능</div>');
                } else {
                    // 오늘 이후 날짜일 경우
                    cell.append('<div class="available">예약&참가<br> 가능</div>');
                }
            }
        });

        // 카테고리 변경 시 선택된 카테고리 갱신
        $("#category").change(function() {
            selectedCategory = $(this).val();

            // AJAX 요청 실행
            sendAjaxRequest();
        });

        // AJAX 요청 함수
        function sendAjaxRequest() {
            if (selectedDate && selectedCategory) {
                var dateText = selectedDate.data('date');
                $('#rsvfNm').val("${currentFc.rsrcNm}");
                var rsvfNm = $('#rsvfNm').val();
                var urlParams = new URLSearchParams(window.location.search);
                var myParam = urlParams.get('no'); // 이곳에 실제로 가져오고 싶은 파라미터 이름을 넣어주세요.

                $.ajax({
                    url: "reservationCalendar",
                    type: 'POST',
                    data: {
                        date: dateText,
                        category: selectedCategory,
                        rsvfNm: rsvfNm,
                        myParam: myParam
                    },
                    success: function(data) {
                        $('#contentArea').html(data);
                    }
                });
            }
        }
    });
    </script>
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
	
	           <div id="contentArea" style="display: flex; justify-content: center; align-items: center;">
	           	
	           </div> 
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
