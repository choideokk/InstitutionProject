<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 <!DOCTYPE html>
  <html>
  <head>
      <style>
      
      * {
	margin: 0;
	padding: 0;
	box-sizing: border-box;
}

   form {
        display: flex;
        flex-direction: column;
        align-items: center;
        justify-content: center;
        width: 100%;
        height: 95%;
        
    }


		.container2 {
              display: flex;
              justify-content: center;
              align-items: center;
              height: 700px;
              width: 100%;
          }

          .outer-boxx {
              display: flex;
              flex-direction: column;
              /* 세로 정렬 */
              flex-wrap: nowrap;
              /* 한 열로 정렬 */
              align-items: center;
              /* 가운데 정렬 */
              width: 100%;
              /* 박스 너비 조절 */
          }



      .inner-boxx2 {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
    border: 1px solid black;
    width: 90%;
    height: 85px;
    box-sizing: border-box;
    box-shadow: 2px 2px 5px rgba(0, 0, 0, 0.2); /* 그림자 추가 */
    margin-bottom: 10px;
    transition: 0.2s; /* 애니메이션 효과를 위한 전환 시간 설정 */
}

.inner-boxx2:hover {
    box-shadow: 2px 2px 10px rgba(0, 0, 0, 0.5); /* 호버 상태에서 그림자를 더 크게 만듭니다 */
    cursor: pointer; /* 마우스 커서를 포인터로 변경 */
}

.inner-boxx2:active {
    box-shadow: none; /* 클릭 중일 때 그림자를 없앱니다 */
    transform: scale(0.98); /* 클릭 중일 때 박스를 약간 축소 */
}

.rsvtNo, .status, .rsrcId {
	margin-bottom: 10px;
}

          .gray-background {
              background-color: #808080;
              /* Add the color you want */
          }
          
             .status-1 { background-color: skyblue; }
    .status-2 { background-color: initial; }
    
        .totalPeopleCnt {
        text-align: center;
    }
    
    #rsvtTime, #totalPeopleCnt, #status {
    display: flex;
    flex-direction: column;
    justify-content: center;
    align-items: center;
}
      </style>
     
  </head>


<body>



  <div class="container2">
    <div class="outer-boxx">
      <form action="Calendar3" method="post" id="reservationForm">
        <!-- Hidden fields -->
        <input type="hidden" id="rsvtTime" name="rsvtTime">
        <input type="hidden" id="category" name="category" value="${category}">
        <input type="hidden" id="toDate" name="toDate" value="${date}">
        <input type="hidden" id="rsvfNm" name="rsvfNm" value="${rsvfNm}">
        


          <div class="inner-boxx2 ${currentValue.totalPeopleCnt == 4 ? 'gray-background' : ''}" data-key-name="${keyName}" data-total-people-cnt="${currentValue.totalPeopleCnt}" onclick="boxClick(event);">
            <div id="rsvtTime">
              <strong>${10 + (i - 1)}:00 ~ ${10 + i}:00 </strong>
            </div>
             <div class="totalPeopleCnt">${currentValue.totalPeopleCnt != null ? currentValue.totalPeopleCnt : 0}명</div> 
            
            <div class="status" style="display: none;">${currentValue.status != null ? currentValue.status : 0}</div>
            <c:choose>
              <c:when test="${currentValue.status == null}">
                예약가능
              </c:when>
              <c:when test="${currentValue.status == '1'}">
                참가 가능
              </c:when>
              <c:when test="${currentValue.status == '2'}">
                마감 관리자 승인 대기중
              </c:when>
            </c:choose>
          </div>
        </c:forEach>
      <button type="submit">예약&참가</button>
    </div>
  </div>



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
	        totalPeopleCnt = totalPeopleCnt.replace(/\D/g, "");
	        
	        var isConfirmed = window.confirm("참가하시겠습니까?");
	        if (!isConfirmed) {
	            // 'Cancel'을 클릭했다면 폼 제출을 취소합니다.
	            event.preventDefault();
	            return;
	        }
	        
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