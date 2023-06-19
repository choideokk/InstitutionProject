<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<head>
    <title>reservationCalendar</title>
    <style>
    /* 토요일 텍스트 색상 변경 */
    .fc-sat {
        color: blue !important;
    }
    .fc-sun {
        color: red;
    }
    .fc-day.non-current {
        color: #f5f5f5; // Change this color to whatever you want
    }
     .fc-day-number {
    font-weight: bold;
}
    </style>
    <link rel='stylesheet' href='https://fullcalendar.io/js/fullcalendar-3.1.0/fullcalendar.min.css' />
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
</head>
<body>
   
   <c:forEach var="value" items="${values}">
    <div style="display:none;" class="value-data" 
         data-dd-date="${value.ddDate}" 
         data-rsvt-time="${value.rsvtTime}">
    </div>
</c:forEach>
   
   
    <div id='calendar'></div>
    <div id="dialog" title="Event Details" style="display:none;"></div>

    <script src='https://fullcalendar.io/js/fullcalendar-3.1.0/lib/moment.min.js'></script>
    <script src='https://fullcalendar.io/js/fullcalendar-3.1.0/lib/jquery.min.js'></script>
    <script src='https://fullcalendar.io/js/fullcalendar-3.1.0/fullcalendar.min.js'></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>

    <script th:inline="javascript">
    
    $(document).ready(function() {
    	
    	var valueElements = document.getElementsByClassName('value-data');
        var buttonIds = [];
        for (var i = 0; i < valueElements.length; i++) {
            var buttonId = valueElements[i].getAttribute('data-dd-date').replace(/-/g, '') + valueElements[i].getAttribute('data-rsvt-time').replace(/:/g, '');
            
            buttonIds.push(buttonId);
        };

        console.log("buttonIds: " + buttonIds);  // 최종 buttonIds 배열을 콘솔에 출력

    	
        $('#calendar').fullCalendar({
        	 dayRender: function(date, cell) {
        		   
                 if (date.month() !== $('#calendar').fullCalendar('getDate').month()) {
                     // If the date is not in the current month, apply the 'non-current' class to the cell
                     $(cell).addClass('non-current');
                 }
             },
            displayEventTime: false,
       
            events: function(start, end, timezone, callback) {
                var events = [];
                var date = start.clone();
                while(date <= end) {
                    var dateString = date.format("YYYY-MM-DD");
                    for (var hour = 10; hour <= 16; hour++) {
                        var id = dateString.replace(/-/g, '') + ('0' + hour).slice(-2) + "00-" + dateString.replace(/-/g, '') + ('0' + (hour+1)).slice(-2) + "00";
                        events.push({
                            title: hour + ':00 - ' + (hour+1) + ':00',
                            start: dateString + 'T' + ('0' + hour).slice(-2) + ':00:00',
                            end: dateString + 'T' + ('0' + (hour+1)).slice(-2) + ':00:00',
                        });
                    }
                    date.add(1, 'd');
                }
                callback(events);
            },
            eventRender: function(event, element) {
            	var buttonId = event.start.format("YYYYMMDDHHmm");
            	var button = $('<button id="btn-' + buttonId + '" class="fc-title" style="background: lightgray; border: none; text-align: center; width: 100%;">' + event.title + '</button>');
            	
            	if (buttonIds.includes(buttonId)) {
            	    // buttonId 값이 buttonIds 배열에 있다면 수행할 작업
            		 button.css('background-color', 'black');
            	} else {
            	    // buttonId 값이 buttonIds 배열에 없다면 수행할 작업
            	}
            	
                if (event.start.month() !== $('#calendar').fullCalendar('getDate').month()) {
                    // If the event is not in the current month, change the button's background color to black
                    // and disable pointer events
                    button.css('background-color', '#f2f2f2');
                    button.css('color', '#f2f2f2');
                    button.css('pointer-events', 'none');
                }

                element.find('.fc-title').replaceWith(button);
                
            },
            eventClick: function(event, jsEvent) {
                // Check if the event is in the current month
                if (event.start.month() !== $('#calendar').fullCalendar('getDate').month()) {
                    // If it's not, do nothing and return
                    return;
                }

                jsEvent.preventDefault(); // Stop the browser from redirecting.

                var eventDate = event.start.format("YYYY-MM-DD"); // Get event date
                var eventTime = event.title; // Get event time

                $("#dialog").empty();
                // Add date and time details
                $("#dialog").append('<p>Date: ' + eventDate + '</p>');
                $("#dialog").append('<p>Time: ' + eventTime + '</p>');
                
                // Add a div for buttons
                var $btnContainer = $('<div style="display: flex;"></div>');
                $btnContainer.append('<button id="registerBtn" style="margin-right: 10px;">등록하기</button>');
                $btnContainer.append('<button id="participateBtn" style="margin-right: 10px;">참가하기</button>');
                $btnContainer.append('<button id="cancelBtn">취소하기</button>');
                $("#dialog").append($btnContainer);
                
                $("#dialog").dialog({
                    modal: true,
                    width: "50%",
                    height: $(window).height() * 0.8,
                    title: 'Event Details' // Set the dialog title
                });
            }
        });
    });
    </script>
    
 
</body>
</html>