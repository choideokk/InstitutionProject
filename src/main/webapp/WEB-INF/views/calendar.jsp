<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Calendar</title>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.css" />
     <style>
       .highlight, .ui-state-active {
            background: blue;
            color: #ffffff;
        }
        .ui-state-disabled {
            background: #ddd;
            opacity: .65;
            filter: Alpha(Opacity=65);
            cursor: default;
        }
        .legend {
            margin-top: 10px;
        }
        .legend .box {
            display: inline-block;
            width: 15px;
            height: 15px;
            margin-right: 5px;
        }
        .available {
            background: white;
        }
        .unavailable {
            background: red;
        }
  .container {
    display: flex;
    height: 100vh;
}

.upper-half {
    flex: 7; /* 좌측 크기를 7로 설정 */
    display: flex;
    justify-content: center;
    align-items: center;
    flex-direction: column;
    width: 500px; /* 추가: 너비를 픽셀로 고정 */
    height: 500px; /* 추가: 높이를 픽셀로 고정 */
}

.lower-half {
    flex: 3; /* 우측 크기를 3으로 설정 */
    overflow: auto; /* 내용이 너무 길면 스크롤 */
    width: 500px; /* 추가: 너비를 픽셀로 고정 */
    height: auto; /* 추가: 높이를 내용에 따라 자동으로 설정 */
}
        
 .ui-datepicker {
  width: 100%;
  height: 100%;
  font-size: 3em;
   border: 2px solid #333;
  box-shadow: 5px 5px 10px rgba(0, 0, 0, 0.3);
}

.highlight, .ui-state-active {
  background: darkblue;
  color: #ffffff;
  border-radius: 50%;
}

.ui-datepicker th span {
  font-size: 0.8em;  // 값을 조절하여 원하는 크기를 설정하세요.
}

.ui-datepicker .ui-datepicker-title {
  font-size: 0.5em;
}

.ui-datepicker-calendar td a {
  font-size: 0.8em;
  padding: 0.2em;   
}

.ui-datepicker .ui-datepicker-prev,
.ui-datepicker .ui-datepicker-next {
    width: 60px;  /* 버튼의 가로 크기를 조절합니다 */
    height: 60px; /* 버튼의 세로 크기를 조절합니다 */
    
}

.ui-datepicker-calendar .ui-datepicker-week-end:first-child span {
  color: red !important;
}

.ui-datepicker-calendar .ui-datepicker-week-end:last-child span {
  color: blue !important;
}

    </style>
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/i18n/jquery-ui-i18n.min.js"></script>
    <script>
    $(function() {
    	$.datepicker.setDefaults($.datepicker.regional['ko']);
    	
    	 
        $("#datepicker").datepicker({
            dateFormat: "yy-mm-dd",
            minDate: 0,
            onSelect: function(dateText, inst) {
                $('.highlight').removeClass('highlight');
                $('a.ui-state-active').addClass('highlight');
                $('#selected_date').text(dateText);

                // 이제 여기서 AJAX 호출을 합니다.
                var category = $("#category").val();
                $.ajax({
                    url: "reservationCalendar",
                    type: 'POST',
                    data: {
                        date: dateText,
                        category: category,
                        rsvfnm: 'Main Gym'
                    },
                    success: function(data) {
                        $('#contentArea').html(data);
                    }
                });
            },
            beforeShow: function(input, inst) {
                setTimeout(function() {
                    inst.dpDiv.find('.ui-datepicker-calendar th').each(function(index, el) {
                        if (index === 0) {  // 일요일
                            $(this).addClass('sun');
                        } else if (index === 6) {  // 토요일
                            $(this).addClass('sat');
                        }
                    });
                }, 0);
            }
        });
    });
    </script>
</head>
<body>
 <div class="container">
        <div class="upper-half">
            <div id="datepicker"></div>
            <div class="box available"></div> = 예약 가능
            <div class="box unavailable"></div> = 예약 불가
            <h2>You selected: <span id="selected_date"></span></h2>
            <select id="category">
                <option value="Football">축구장</option>
                <option value="tennis_court">테니스장</option>
            </select>
        </div>
        <div class="lower-half" id="contentArea"></div>
    </div>
</html>
