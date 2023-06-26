<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <title>Page Layout</title>
    <style>
    .hahaContainer{
    height:50px;
    width:100%;
    display:flex;
    }
    
 
    
    	.haha{
    	height:100%;
    	width:65%;
    	}
    	.haha2{
    	height:100%;
    	width:35%;
    	display:flex;
    	}
    	
    	.haha2_left{
    	height:100%;
    	width:50%;
    	  font-size: 16px;
  text-align: center;
  border: 2px solid black;
    	}
    	
    	.haha2_right{
    	height:100%;
    	width:50%;
    	  font-size: 16px;
  text-align: center;
  border: 2px solid black;
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
            width: 65%;
            box-sizing: border-box; /* 테두리의 너비가 총 너비에 포함되도록 설정 */
                 display: flex;
            flex-direction: column;
        }
        
        .right{
        	height: 700px;
        	width: 35%;
            box-sizing: border-box; /* 테두리의 너비가 총 너비에 포함되도록 설정 */
        }
        
                .right2{
        	height: 700px;
        	width: 35%;
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

                $.ajax({
                    url: "reservationCalendar",
                    type: 'POST',
                    data: {
                        date: dateText,
                        category: selectedCategory,
                        rsvfnm: 'Main Gym'
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
		<p>시설이름 들어올곳</p>
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
                <img src="https://yeyak.seoul.go.kr/cmsdata/web_upload/svc/20230615/168680410872562A6SOA7V41Y3JZ48FRXN9HKF.jpg" alt="이미지 설명">
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
	               <option value="Football">축구장</option>
	               <option value="tennis">테니스장</option>
	           </select>
	           </div>
	
	           <div id="contentArea" style="display: flex; justify-content: center; align-items: center;">
	           	
	           </div> 
        </div>
        
        <div class="right2">
	       		<!-- content -->
	           <div style="display: flex; justify-content: center; align-items: center;">
	           <p>시설 예약에 대한 정보들
        </div>
        
        
    </div>
</body>
</html>
