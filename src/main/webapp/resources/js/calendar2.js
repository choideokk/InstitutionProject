 window.onload = function() {

        var leftDiv = document.querySelector(".haha2_left");
        var rightDiv = document.querySelector(".haha2_right");
        var right = document.querySelector(".right");
        var right2 = document.querySelector(".right2");
        
        // Set initial states
        right.style.display = 'none';  // Hide the 'right' div initially
        right2.style.display = 'block';  // Show the 'right2' div initially
        leftDiv.style.backgroundColor = '#7ce36c';
        rightDiv.style.backgroundColor = 'white';
        rightDiv.style.boxShadow = 'none';
        leftDiv.style.boxShadow = '0px 5px 5px rgba(0, 0, 0, 0.1)';

        leftDiv.addEventListener("click", function() {
            console.log("haha2_left clicked");
            leftDiv.style.backgroundColor = 'white';
            rightDiv.style.backgroundColor = '#7ce36c';
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
            leftDiv.style.backgroundColor = '#7ce36c';
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