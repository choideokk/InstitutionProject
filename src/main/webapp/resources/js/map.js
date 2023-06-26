var clickedOverlay = null;
// 지도에 마커를 표시하고 오버레이를 만들고 창을 닫는 이벤트를 등록하는 함수
function displayMarker(parsedData) {
	// 지도에 마커를 표시
	var marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(parsedData.lot,
			parsedData.lat)
	});

	// 오버레이 만들기
	var overlay = new kakao.maps.CustomOverlay({
		position: marker.getPosition()
	});


	// 띄울 창 만들기
	var content = document.createElement('div');
	content.innerHTML = parsedData.rsrcNm;
	content.style.cssText = 'background: white; border: 1px solid black';

	var closeBtn = document.createElement('button');
	closeBtn.innerHTML = '닫기';
	closeBtn.onclick = function() {
		overlay.setMap(null);
	};

	var linkForm = document.createElement('form');
	var linkInput = document.createElement('input');

	linkInput.type = "hidden";
	linkInput.value = parsedData.rsrcNo;
	linkInput.name = 'no';

	linkForm.setAttribute('action', '/detail?no=' + parsedData.rsrcNo);

	var bookBtn = document.createElement('button');
	bookBtn.innerHTML = '예약하기';

	linkForm.appendChild(linkInput);
	linkForm.appendChild(bookBtn);

	content.appendChild(closeBtn);
	content.appendChild(linkForm);
	overlay.setContent(content);

	kakao.maps.event.addListener(marker, 'click', function() {
	if (clickedOverlay) {
        clickedOverlay.setMap(null);
    }
    overlay.setMap(map);
    clickedOverlay = overlay;
	});

	// 클러스터러에 마커들을 추가합니다
	clusterer.addMarker(marker);
}
const eachPosBtns = document.querySelectorAll(".eachPosBtn");

eachPosBtns.forEach((btn) => {
	btn.addEventListener('click', (e) => {
		map.setCenter(new kakao.maps.LatLng(e.target.dataset.lot, e.target.dataset.lat));
		map.setLevel(4);
	});
});

const rightSideAreas = document.querySelector(".rightSideAreas");
const sideBtn = document.querySelector(".closeSideBtn");
sideBtn.addEventListener('click', () => {
	if (rightSideAreas.style.right === "-350px") {
		rightSideAreas.style.right = "0px";
		sideBtn.classList.remove("closed");
	} else {
		sideBtn.classList.add("closed");
		rightSideAreas.style.right = "-350px";
	}
})