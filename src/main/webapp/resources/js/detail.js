// 날짜 정보 가져오기
const date = new Date(); // 현재 날짜(로컬 기준) 가져오기
const utc = date.getTime() + (date.getTimezoneOffset() * 60 * 1000); // uct 표준시 도출
const kstGap = 9 * 60 * 60 * 1000; // 한국 kst 기준시간 더하기
const today = new Date(utc + kstGap); // 한국 시간으로 date 객체 만들기(오늘)

const thisMonth = new Date(today.getFullYear(), today.getMonth(), today.getDate());
renderCalender(thisMonth);



function renderCalender(thisMonth) {

	// 렌더링을 위한 데이터 정리
	currentYear = thisMonth.getFullYear();
	currentMonth = thisMonth.getMonth();
	currentDate = thisMonth.getDate();

	// 이전 달의 마지막 날 날짜와 요일 구하기
	var startDay = new Date(currentYear, currentMonth, 0);
	var prevDate = startDay.getDate();
	var prevDay = startDay.getDay();

	// 이번 달의 마지막날 날짜와 요일 구하기
	var endDay = new Date(currentYear, currentMonth + 1, 0);
	var nextDate = endDay.getDate();
	var nextDay = endDay.getDay();

	// console.log(prevDate, prevDay, nextDate, nextDay);

	// 현재 월 표기
	const yearMonth = document.querySelector(".year-month");
	yearMonth.textContent = currentYear + '.' + (currentMonth + 1);

	// 렌더링 html 요소 생성
	calendar = document.querySelector('.dates');
	calendar.innerHTML = '';

	// 지난달
	let count = 0;
	for (let i = prevDate - prevDay; i <= prevDate; i++) {
		calendar.innerHTML = calendar.innerHTML + '<div class="day prev"/>';
	}

		// 이번달
	for (let i = 1; i <= nextDate; i++) {
		if (i < today.getDate()) {
			calendar.innerHTML = calendar.innerHTML + '<div class="day prev disable">'
				+ i
				+ '</div>';

		} else if (i == today.getDate()) {
			calendar.innerHTML = calendar.innerHTML + '<div class="day current today">' + i + '</div>';
		} else {
			calendar.innerHTML = calendar.innerHTML + '<div class="day current">'
				+ "<button type='button' data-date="
				+ currentYear + '-' + (currentMonth + 1).toString().padStart(2, '0') + '-' + i.toString().padStart(2, '0')
				+ ">"
				+ i + '<br /> 예약 가능 </button></div>';
		}
	}

	// 다음달
	for (let i = 1; i < (7 - nextDay == 7 ? 0 : 7 - nextDay); i++) {
		calendar.innerHTML = calendar.innerHTML + '<div class="day next" />';
	}

	// 오늘 날짜 표기
	if (today.getMonth() == currentMonth) {
		todayDate = today.getDate();
		console.log(todayDate);
		var currentMonthDate = document.querySelector('.dates .today');
	}

	// 코드 추가 시작
	document.querySelectorAll('.dates .day button').forEach(day => {
		day.addEventListener('click', event => {
			// Remove .selectedDay from all days
			document.querySelectorAll('.dates .day button').forEach(day => {
				day.classList.remove('selectedDay');
			});
			// Add .selectedDay to the clicked day
			event.currentTarget.classList.add('selectedDay');
		});
	});
}