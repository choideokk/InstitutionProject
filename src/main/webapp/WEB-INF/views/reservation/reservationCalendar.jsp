<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	height: 700px;
	margin: 0;
	padding: 0;
}

.outer-box {
	display: flex;
	flex-direction: column;
	/* 세로 정렬 */
	flex-wrap: nowrap;
	/* 한 열로 정렬 */
	align-items: center;
	/* 가운데 정렬 */
	width: 220px;
	/* 박스 너비 조절 */
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
	background-color: #808080;
	/* Add the color you want */
}

.status-1 {
	background-color: skyblue;
}

.status-2 {
	background-color: initial;
}
</style>

</head>


<body>
	<div class="container">
		<div class="outer-box">
			<form action="Calendar3" method="post" id="reservationForm">
				<!-- Hidden fields -->
				<input type="hidden" id="rsvtTime" name="rsvtTime"> <input
					type="hidden" id="category" name="category" value="${category}">
				<input type="hidden" id="toDate" name="toDate" value="${date}">
				<input type="hidden" id="rsvfNm" name="rsvfNm" value="${rsvfNm}">


				<c:forEach var="i" begin="1" end="6">
					<c:set var="keyName" value="key${i}" />
					<c:set var="currentValue" value="${values[keyName]}" />

					<div
						class="inner-box ${currentValue.totalPeopleCnt == 4 ? 'gray-background' : ''}"
						data-key-name="${keyName}"
						data-total-people-cnt="${currentValue.totalPeopleCnt}"
						onclick="boxClick(event);">
						<div id="rsvtTime">
							<strong>${10 + (i - 1)}:00 ~ ${10 + i}:00 </strong>
							<div class="totalPeopleCnt">${currentValue.totalPeopleCnt != null ? currentValue.totalPeopleCnt : 0}</div>
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
								<p>마감 관리자 승인 대기중</p>
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
  // 기존의 코드
  var keyToTimeMap = {
    key1: 1000,
    key2: 1100,
    key3: 1200,
    key4: 1300,
    key5: 1400,
    key6: 1500
  };

  var rsvtTime = null;
  var selectedBox = null;
  var form = document.getElementById('reservationForm');

  function boxClick(event) {
    // 기존의 코드
    var box = event.currentTarget;
    var totalPeopleCnt = box.dataset.totalPeopleCnt;

    if (totalPeopleCnt == 4) {
      return;
    }
    
    

    if (selectedBox) {
      selectedBox.style.backgroundColor = 'initial';
    }

    rsvtTime = keyToTimeMap[box.dataset.keyName];
    selectedBox = box;
    box.style.backgroundColor = 'skyblue';
  }

  form.addEventListener('submit', function(event) {
	    if (rsvtTime) {
	        // 폼 액션 변경
	        var status = selectedBox.getElementsByClassName('status')[0].innerText;
	        var totalPeopleCnt = selectedBox.getElementsByClassName('totalPeopleCnt')[0].innerText;

	        switch (status) {
	            case "":
	            case "0":
	                form.action = "Calendar3"; // 예약가능 상태일 때의 액션
	                break;
	            case "1":
	                form.action = "Calendar4"; // 참가 가능 상태일 때의 액션
	                // Add a hidden input field to the form
	                var input = document.createElement('input');
	                input.type = 'hidden';
	                input.name = 'totalPeopleCnt';
	                input.value = totalPeopleCnt;
	                form.appendChild(input);
	                break;
	            case "2":
	                form.action = "/Action2"; // 마감 상태일 때의 액션
	                break;
	            default:
	                alert("알 수 없는 상태입니다.");
	                event.preventDefault();
	                return;
	        }

	        document.getElementById('rsvtTime').value = rsvtTime;
	    } else {
	        alert("박스를 선택해 주세요.");
	        event.preventDefault();
	    }
	});
</script>
</body>
</html>