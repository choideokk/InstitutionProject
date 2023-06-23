<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<c:set var="path"
	value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
	<h1>map</h1>
	<div id="map" style="width: 100%; height: 500px;"></div>
	<p>${path}</p>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey}&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript">
	var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
	var fcList = '${fcList}';
	var parsedList = JSON.parse(fcList);
	var markers = [];

	var options = { //지도를 생성할 때 필요한 기본 옵션
		center : new kakao.maps.LatLng(36.814696991254436, 127.10570765151945), //지도의 중심좌표.
		//지도의 레벨(확대, 축소 정도)
		level : 9
	};

	var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

	// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
	var mapTypeControl = new kakao.maps.MapTypeControl();

	// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
	// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
	map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPRIGHT);

	// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
	var zoomControl = new kakao.maps.ZoomControl();
	map.addControl(zoomControl, kakao.maps.ControlPosition.RIGHT);

	var clusterer = new kakao.maps.MarkerClusterer({
		map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
	    averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
	    minLevel: 9, // 클러스터 할 최소 지도 레벨 
	});
	
	for (let i = 0; i < parsedList.length; i++) {
		displayMarker(parsedList[i]);
	}
	
	
	// 지도에 마커를 표시하고 오버레이를 만들고 창을 닫는 이벤트를 등록하는 함수
	function displayMarker(parsedData) {
		// 지도에 마커를 표시
		var marker = new kakao.maps.Marker({
			position : new kakao.maps.LatLng(parsedData.lot,
					parsedData.lat)
		});
				
		// 오버레이 만들기
		var overlay = new kakao.maps.CustomOverlay({
			position : marker.getPosition()
		});
		
				
		// 띄울 창 만들기
		var content = document.createElement('div');
		content.innerHTML =  parsedData.rsrcNm;
		content.style.cssText = 'background: white; border: 1px solid black';
				    
		var closeBtn = document.createElement('button');
		closeBtn.innerHTML = '닫기';
		closeBtn.onclick = function () {
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
			overlay.setMap(map);
		});
		
		// 클러스터러에 마커들을 추가합니다
        clusterer.addMarker(marker);
	}
	</script>
</body>
</html>