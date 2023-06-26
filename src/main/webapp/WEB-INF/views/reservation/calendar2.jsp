<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
    <title>Page Layout</title>
    <style>
    
    * {
margin: 0;
padding: 0;
box-sizing: border-box;
}

    .hahaContainer{
    height:50px;
    width:100%;
    display:flex;
    }
    
    	.haha{
    	height:100%;
    	width:60%;
    	}
    	.haha2{
    	height:100%;
    	width:40%;
    	display:flex;
    	}
    	
    	.haha2_left{
    	height:100%;
    	width:50%;
    	  font-size: 16px;
  text-align: center;
  border: 1px solid black;
    	}
    	
    	.haha2_right{
    	height:100%;
    	width:50%;
    	  font-size: 16px;
  text-align: center;
  border: 1px solid black;
    	}
    	
    .haha2_left, .haha2_right {
    transition: all 0.3s;  /* Change this line for a smooth transition */
    box-shadow: 0px 5px 5px rgba(0, 0, 0, 0.1);  /* Add this line */
}
    	
    	    .right select {
            padding: 8px;
            font-size: 16px;
            border: 1px solid #ccc;
            border-radius: 4px;
            background-color: white;
            color: #555;
            width: 200px;
        }

        .right select:hover {
            border-color: #888;
        }

        .right select:focus {
            border-color: dodgerblue;
            box-shadow: 0 0 0 2px dodgerblue;
            outline: none;
        }

        .right select option {
            background-color: white;
            color: #555;
        }
    	
    	
        .container {
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
        }
        
        .bottom{
        	height: 400px;
        	 overflow: auto;
        }

        /* 테두리 추가 */
        .top, .bottom, .right {
            border: 1px solid black;
        }
        
        .top img {
                    width: 95%;
            height: 95%;
            object-fit: cover; /* 이미지가 div를 넘치지 않도록 설정 */
        }
        
    /* FullCalendar에 적용할 스타일 */
       #calendar {
            width: 100%;  /* 달력의 너비를 조금 줄임 */
            height: 100%; /* 달력의 높이를 조금 줄임 */
        }
        

.unavailable {
  color: red;
  background-color: lightgray;
}

.available {
  color: green;
}

.unavailable,
.available {
  font-size: 12px;
  text-align: center;
  display: flex;
  justify-content: center;
  align-items: center;
  height: 100%;
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
        });

        rightDiv.addEventListener("click", function() {
            console.log("haha2_right clicked");
            rightDiv.style.backgroundColor = 'white';
            leftDiv.style.backgroundColor = 'grey';
            rightDiv.style.boxShadow = 'none';
            leftDiv.style.boxShadow = '0px 5px 5px rgba(0, 0, 0, 0.1)';
            right2.style.display = 'block'; // Show the 'right2' div
            right.style.display = 'none'; // Hide the 'right' div
        });
    }
    
    
    
    $(document).ready(function() {
        var selectedDate = null;
        var selectedCategory = null;

        $('#calendar').fullCalendar({
            defaultView: 'month',
            aspectRatio: 1.8, /* 달력의 가로 세로 비율을 조절 */
            dayClick: function(date, jsEvent, view) {
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
                var rsvfnm = $('#rsvfnm').val();

                $.ajax({
                    url: "reservationCalendar",
                    type: 'POST',
                    data: {
                        date: dateText,
                        category: selectedCategory,
                        rsvfnm: rsvfnm
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
<div class="hahaContainer">
	<div class="haha">
	<input type="hidden" id="rsvfnm" value="${currentFc.rsrcNm}" />
		<p>${currentFc.rsrcNm} ${currentFc.rsrcClsNm}</p>
	</div>
	<div class="haha2">
		<div class="haha2_left">
			<p>조회 및 예약</p>
		</div>
		<div class="haha2_right">
			<p>예약정보</p>		
		</div>
	</div>
</div>
    <div class="container">
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
					<li>장소 : ${currentFc.rsrcNm}</li>
					<li>종목 : ${currentFc.rsrcClsNm}</li>
					<li>주소 : ${currentFc.addr}${currentFc.daddr}</li>
					<li>무료여부 : ${currentFc.freeYn}</li>
					<li>예약순서 : 선착순</li>
					<li>모집정원 : 4명</li>
					<li>취소기간 : 이용일 1일 전까지</li>
					<li>예약방법 : 인터넷</li>
					<li>문의전화 : </li>
			  </ul>
        </div>
    </div>
</body>
</html>
