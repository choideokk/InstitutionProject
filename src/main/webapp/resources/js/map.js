
var clickedOverlay = null;

// 지도에 마커를 표시하고 오버레이를 만들고 창을 닫는 이벤트를 등록하는 함수
function displayMarker(parsedData, path) {
	// 지도에 마커를 표시
	var imageSrc = path + "/image/marker2.png";
	var imageSize = new kakao.maps.Size(25, 35);
	var imageOption = { offset: new kakao.maps.Point(27, 69) };
	var markerImage = new kakao.maps.MarkerImage(imageSrc, imageSize, imageOption);

	var marker = new kakao.maps.Marker({
		position: new kakao.maps.LatLng(parsedData.lot,
			parsedData.lat),
		image: markerImage
	});



	// 오버레이 만들기
	var overlay = new kakao.maps.CustomOverlay({
		position: marker.getPosition(),
		xAnchor: 0.5,
		yAnchor: 0.2,
		zIndex: 10
	});


	// 띄울 창 만들기
	var content = document.createElement('div');
	content.classList.add("olWrapper");

	var fcName = document.createElement("p");
	fcName.textContent = parsedData.rsrcNm;
	fcName.classList.add("olFcNameTxt");

	var fcImg = document.createElement('img');
	fcImg.setAttribute("src", path + "/image/facilities/" + parsedData.rsrcNo + ".jpg");
	fcImg.setAttribute("width", "200px");
	fcImg.setAttribute("height", "100px");


	var closeBtn = document.createElement('button');
	closeBtn.innerHTML = '닫기';
	closeBtn.setAttribute("type", "button");
	closeBtn.classList.add("closeBtn");
	closeBtn.onclick = function() {
		overlay.setMap(null);
	};

	var linkForm = document.createElement('form');
	var linkInput = document.createElement('input');

	linkInput.type = "hidden";
	linkInput.value = parsedData.rsrcNo;
	linkInput.name = 'no';

	linkForm.setAttribute('action', path + '/Calendar2?no=' + parsedData.rsrcNo);

	var bookBtn = document.createElement('button');
	bookBtn.innerHTML = '예약하기';
	bookBtn.classList.add("rsvtBtn");

	linkForm.appendChild(linkInput);
	linkForm.appendChild(bookBtn);
	linkForm.appendChild(closeBtn);

	content.appendChild(fcName);
	content.appendChild(fcImg);
	content.appendChild(linkForm);
	overlay.setContent(content);

	kakao.maps.event.addListener(marker, 'click', function() {
		map.setCenter(new kakao.maps.LatLng(parsedData.lot, parsedData.lat));
		if (clickedOverlay) {
			clickedOverlay.setMap(null);
		}
		overlay.setMap(map);
		clickedOverlay = overlay;
	});
	
	document.querySelector("#id-" + parsedData.rsrcNo).addEventListener("click", ()=>{
		if (clickedOverlay) {
			clickedOverlay.setMap(null);
		}
		overlay.setMap(map);
		clickedOverlay = overlay;
		
		map.setCenter(new kakao.maps.LatLng(parsedData.lot, parsedData.lat));
		map.setLevel(4, {animate: true});
	})

	// 클러스터러에 마커들을 추가합니다
	clusterer.addMarker(marker);
}

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

const searchInput = document.searchForm.searchTxt;
const keywordSelector = document.searchForm.searchKeyword;
keywordSelector.addEventListener('change', (e) => {
	if (e.target.value == 'addr') {
		searchInput.placeholder = "도로명 주소지를 입력해주세요";
	} else {
		searchInput.placeholder = "체육시설 명을 입력해주세요";
	}
});


const resetBtn = document.querySelector(".resetBtn");
resetBtn.addEventListener('click', () => {
	window.location.href = path + "/map";
})

const txtResetBtn = document.querySelector(".txtResetBtn");
txtResetBtn.addEventListener('click', () => {
	searchInput.value = "";
	if (keywordSelector.value == 'addr') {
		searchInput.placeholder = "도로명 주소지를 입력해주세요";
	} else {
		searchInput.placeholder = "체육시설 명을 입력해주세요";
	}
});

searchInput.addEventListener('change', (e) => {
	if (e.target.value == "") {
		txtResetBtn.style.display = "none";
	} else {
		txtResetBtn.style.display = "block";
	}
});

searchInput.addEventListener('keyup', (e) => {
	if (e.target.value == "") {
		txtResetBtn.style.display = "none";
	} else {
		txtResetBtn.style.display = "block";
	}
});