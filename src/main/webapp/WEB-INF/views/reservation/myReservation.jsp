<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<%@ include file="../header.jsp"%>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Calendar3</title>
    <style>
    * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

td, th {
height:45px;
}



   .bStatus {
    height: 35px;
    background-color: #f44336; /* 빨간색 */
    color: white; /* 텍스트 색상은 흰색 */
    border-radius: 5px; /* 버튼의 모서리를 둥글게 만들어 줍니다. */
    cursor: pointer; /* 마우스 커서를 버튼 위로 가져갔을 때, 손가락 모양으로 바뀌게 만들어 줍니다. */
}
    
      table, th, td {
    border: 1px solid black;
    border-collapse: collapse;
    text-align: center;
}
        
       .container3 {
    display: flex;
    flex-direction: column;
    align-items: center;
    height: 100vh;
}
        .button {
        display:flex;
        }
        
            .th-width-1 {
        width: 80px; 
    }
    
    .th-width-2 {
        width: 400px; 
    }
    
    .th-width-3 {
        width: 100px; 
    }
    .th-width-4 {
        width: 100px; 
    }
    .th-width-5 {
        width: 80px; 
    }
     .inner-container {
    display: flex;
    justify-content: center;
    width: 100%;
}

table {
    width: 1200px;
    height: auto;

}

.center-container {
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;
    width: 100%;
}

    </style>
    
</head>
<body>
<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>

<div class="center-container">
    <h1>나의 예약 현황 페이지</h1>
    <div class="button">
        <button id="showPastReservations">지난 예약 보기</button>
        <button id="showNowReservations">현재 예약 보기</button>
    </div>
</div>

<div class="container3">
<div class="inner-container">
    <table>
        <thead>
            <tr>
            <th class="th-width-1">예약 번호</th>
        <th class="th-width-2">시설명</th>
        <th class="th-width-3">예약 날짜</th>
                 <th class="th-width-4">예약 시간</th>
                <th class="th-width-5">개설자</th>
                <th class="th-width-5">참가자1</th>
                <th class="th-width-5">참가자2</th>
                <th class="th-width-5">참가자3</th>
                <th class="th-width-6">상태</th>
                <th>예약취소</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reservation" items="${values}">
                <tr>
                <form action="" method="post">
                    <td>${reservation.rsvtNo}</td>
                    <td>${reservation.rsvfNm}</td>
                    <td>${reservation.toDate}</td>
                    <td>${reservation.rsvtTime}</td>
                    <td>${reservation.rsrcId}</td>
                    <td>${fn:escapeXml(reservation.jidone)}</td>
                    <td>${fn:escapeXml(reservation.jidtwo)}</td>
                    <td>${fn:escapeXml(reservation.jidthree)}</td>
                    <td class="status">${reservation.status}</td>
                    <td><button class="bStatus">${reservation.status}</button><td>
                    </form>
                </tr>
            </c:forEach>
        </tbody>
    </table>
    </div>
    </div>
    
   

<script>
    var statuses = document.getElementsByClassName('status');
    var bStatuses = document.getElementsByClassName('bStatus');
    
    for (var i = 0; i < statuses.length; i++) {
        var statusElement = statuses[i];
        var status = statusElement.textContent;

        if (status === "1") {
            statusElement.textContent = "모집중";
            bStatuses[i].textContent = "취소하기";
        } else if (status === "2") {
            statusElement.textContent = "승인대기중";
            bStatuses[i].textContent = "취소하기";
        } else if (status === "3") {
            statusElement.textContent = "승인완료";
            bStatuses[i].parentNode.removeChild(bStatuses[i]); // 3 또는 4인 경우 버튼을 삭제
        } else if (status === "4") {
            statusElement.textContent = "종료";
            bStatuses[i].parentNode.removeChild(bStatuses[i]); // 3 또는 4인 경우 버튼을 삭제
        }
    }
</script>
<script>
var path = '${path}';
$(document).ready(function() {
	  $("tbody tr").each(function() {
	        var row = $(this);
	        var toDate = new Date(row.find("td:eq(2)").text());

	        // Get today's date
	        var today = new Date();
	        today.setHours(0,0,0,0);

	        // If the toDate is in the future, show the row, otherwise hide it
	        if (toDate.getTime() >= today.getTime()) {
	            row.show();
	        } else {
	            row.hide();
	        }
	    });
	
	
	
	$("#showNowReservations").click(function() {
        $("tbody tr").each(function() {
            var row = $(this);
            var toDate = new Date(row.find("td:eq(2)").text());

            // Get today's date
            var today = new Date();
            today.setHours(0,0,0,0);

            // If the toDate is in the future, show the row, otherwise hide it
            if (toDate.getTime() >= today.getTime()) {
                row.show();
            } else {
                row.hide();
            }
        });
    });
	
	$("#showPastReservations").click(function() {
	    $("tbody tr").each(function() {
	        var row = $(this);
	        var toDate = new Date(row.find("td:eq(2)").text());

	        // Get today's date
	        var today = new Date();
	        today.setHours(0,0,0,0);

	        // If the toDate is in the past, show the row, otherwise hide it
	        if (toDate.getTime() < today.getTime()) {
	            row.show();
	            row.find(".bStatus").hide();
	        } else {
	            row.hide();
	        }
	    });
	});

	
    $(".bStatus").click(function(event) {
    	 var row = $(this).closest("tr"); // Find the row
         var toDate = new Date(row.find("td:eq(2)").text()); // Extract the Date

         // Get today's date
         var today = new Date();
         today.setHours(0,0,0,0);

         // If the toDate is not in the past, prevent the form submission and alert the user
         if (toDate.getTime() <= today.getTime()) {
             event.preventDefault(); // Prevent the default form submission
             alert("오늘이전 예약은 취소할 수 없습니다.");
             return;
         }
         

        var row = $(this).closest("tr"); // Find the row
        var rsvtNo = row.find("td:eq(0)").text(); // Extract the Reservation No.
        var rsvfNm = row.find("td:eq(1)").text(); // Extract the Reservation No.
        var toDate = row.find("td:eq(2)").text(); // Extract the Date
        var rsvtTime = row.find("td:eq(3)").text(); // Extract the Reservation Time
        var rsrcId = row.find("td:eq(4)").text(); // Extract the Resource Id
        var jidone = row.find("td:eq(5)").text(); // Extract the first participant
        var jidtwo = row.find("td:eq(6)").text(); // Extract the second participant
        var jidthree = row.find("td:eq(7)").text(); // Extract the third participant
        var status = row.find("td:eq(8)").text(); // Extract the status
        
        var url = path + "/clearMyReservation";
        console.log("Request URL:", window.location.origin + url); // Print full request URL

        // Send the data to the server
        $.ajax({
            url: path+ "/clearMyReservation",
            method: "POST",
            data: JSON.stringify({
                rsvtNo: rsvtNo,
                toDate: toDate,
                rsvtTime: rsvtTime,
                rsrcId: rsrcId,
                jidone: jidone,
                jidtwo: jidtwo,
                jidthree: jidthree
            }),
            contentType: "application/json",
            success: function(response) {
                // 새로고침
                alert("취소되었습니다");
            	window.location.href = path + "/myReservation";
            },
            error: function(jqXHR, textStatus, errorThrown) {
                console.error("AJAX request failed: ", textStatus, ", Detail: ", errorThrown);
                console.error("Response: ", jqXHR.responseText);
            }
        });
    });
});

</script>
</body>
</html>