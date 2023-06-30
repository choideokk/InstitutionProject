<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<!DOCTYPE html>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <title>Calendar3</title>
    <style>
        table, th, td {
            border: 1px solid black;
            border-collapse: collapse;
        }
    </style>
</head>
<body>
<c:if test="${not empty errorMessage}">
    <script>
        alert("${errorMessage}");
    </script>
</c:if>

<h1>나의 예약 현황 페이지</h1>
    <table>
        <thead>
            <tr>
                <th>예약 번호</th>
                <th>예약 날짜</th>
                 <th>예약 시간</th>
                <th>개설자</th>
                <th>참가자1</th>
                <th>참가자2</th>
                <th>참가자3</th>
                <th>상태</th>
                <th>취소가능</th>
            </tr>
        </thead>
        <tbody>
            <c:forEach var="reservation" items="${values}">
                <tr>
                <form action="" method="post">
                    <td>${reservation.rsvtNo}</td>
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
$(document).ready(function() {
    $(".bStatus").click(function(event) {
        event.preventDefault(); // Prevent the default form submission

        var row = $(this).closest("tr"); // Find the row
        var rsvtNo = row.find("td:eq(0)").text(); // Extract the Reservation No.
        var toDate = row.find("td:eq(1)").text(); // Extract the Date
        var rsvtTime = row.find("td:eq(2)").text(); // Extract the Reservation Time
        var rsrcId = row.find("td:eq(3)").text(); // Extract the Resource Id
        var jidone = row.find("td:eq(4)").text(); // Extract the first participant
        var jidtwo = row.find("td:eq(5)").text(); // Extract the second participant
        var jidthree = row.find("td:eq(6)").text(); // Extract the third participant
        var status = row.find("td:eq(7)").text(); // Extract the status

        var url = "/FacilitiesProject/clearMyReservation";
        console.log("Request URL:", window.location.origin + url); // Print full request URL

        // Send the data to the server
        $.ajax({
            url: "/FacilitiesProject/clearMyReservation",
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
            	window.location.href = "/FacilitiesProject/myReservation";
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