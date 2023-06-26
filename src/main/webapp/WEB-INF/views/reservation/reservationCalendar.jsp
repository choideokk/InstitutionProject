<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <style>
       <style>
        .container {
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            margin: 0;
            padding: 0;
            overflow-y: auto;   /* 세로 스크롤 추가 */
        }
        .outer-box {
            display: flex;
            flex-direction: column;   /* 세로 정렬 */
            flex-wrap: nowrap;   /* 한 열로 정렬 */
            align-items: center;   /* 가운데 정렬 */
            width: 220px;   /* 박스 너비 조절 */
        }
        .inner-box {
            border: 1px solid black;
            margin: 10px;
            padding: 10px;
            width: 200px;
            height: 10%;
            box-sizing: border-box;
        }
        .rsvtNo, .status, .rsrcId {
            margin-bottom: 10px;
        }
            .gray-background {
        background-color: #808080;   /* Add the color you want */
    }
    </style>
        <script>
        var selectedBox = null;

        function boxClick(event) {
            var box = event.currentTarget;
            var totalPeopleCnt = box.dataset.totalPeopleCnt;

            if (totalPeopleCnt == 4) {
                // Ignore clicks if totalPeopleCnt is 4
                return;
            }

            if (box === selectedBox) {
                box.style.backgroundColor = 'initial';
                selectedBox = null;
            } else {
                if (selectedBox) {
                    selectedBox.style.backgroundColor = 'initial';
                }
                box.style.backgroundColor = 'skyblue';
                selectedBox = box;
            }
        }
    </script>
</head>
<body>

<%
String date = request.getParameter("date");
String rsvfnm = request.getParameter("rsvfnm");
%>
<%= date %>
<div class="container">
    <div class="outer-box">
    <form action="Calendar3" method="post" id="reservationForm">
    <!-- Hidden fields for selectedKeyName and date -->
    <input type="hidden" id="selectedKeyName" name="selectedKeyName">
    <input type="hidden" id="date" name="date" value="<%= date %>">
    <input type="hidden" id="rsvfnm" name="rsvfnm" value="<%= rsvfnm %>">
    
    <c:forEach var="i" begin="1" end="6">
        <c:set var="keyName" value="key${i}" />
        <c:set var="currentValue" value="${values[keyName]}" /> 

        <!-- Added data-key-name attribute -->
        <div class="inner-box ${currentValue.totalPeopleCnt == 4 ? 'gray-background' : ''}" data-key-name="${keyName}" data-total-people-cnt="${currentValue.totalPeopleCnt}" onclick="boxClick(event);">
         
            <!-- The rest of your code -->
                <!-- <div class="rsrcId">개설자아이디: ${currentValue.rsrcId != null ? currentValue.rsrcId : '예약 없음'}</div>  -->

            <div id="rsvtTime">
            	<strong>${10 + (i - 1)}:00 ~ ${10 + i}:00 </strong>
            	 ( ${currentValue.totalPeopleCnt != null ? currentValue.totalPeopleCnt : 0} / 4 )
            </div>
            <div class="status" style="display: none;">${currentValue.status != null ? currentValue.status : 0}</div>
            

         <c:choose>
   			 <c:when test="${currentValue.status == null}">
   				<p>예약가능</p>
   			 </c:when>
		     <c:when test="${currentValue.status == '1'}">
				<p>참가 가능</p>
		     </c:when>
		     <c:when test="${currentValue.status == '2'}">
				<p>마감</p>
		     </c:when>
		</c:choose>
		
        </div>
    </c:forEach>
    
        <div>
            <button type="submit">예약&참가</button>
        </div>
    </form>
    
    <form>
        <button>목록</button>
    </form>
    
    </div>
</div>

<script>
    var selectedBox = null;
    var selectedKeyName = null;

    function boxClick(event) {
        var box = event.currentTarget;
        var totalPeopleCnt = box.dataset.totalPeopleCnt;

        if (totalPeopleCnt == 4) {
            // Ignore clicks if totalPeopleCnt is 4
            return;
        }

        if (box === selectedBox) {
            box.style.backgroundColor = 'initial';
            selectedBox = null;
            selectedKeyName = null;
        } else {
            if (selectedBox) {
                selectedBox.style.backgroundColor = 'initial';
            }
            box.style.backgroundColor = 'skyblue';
            selectedBox = box;
            selectedKeyName = box.dataset.keyName;
        }
    }

    document.getElementById('reservationForm').addEventListener('submit', function(event) {
        // Update the hidden field with the selected keyName before submitting the form
        if (selectedKeyName) {
            document.getElementById('selectedKeyName').value = selectedKeyName;
        } else {
            alert("박스를 선택해 주세요.");
            event.preventDefault();
        }
    });
</script>

</body>
</html>
