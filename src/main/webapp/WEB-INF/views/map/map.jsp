<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ page import="java.util.*"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<!DOCTYPE html>
<html>

<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="${path}/css/reset.css" rel="stylesheet" type="text/css" />
<link href="${path}/css/map.css" rel="stylesheet" type="text/css" />
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic:wght@400;700&display=swap" rel="stylesheet">

<style>
	* {
		font-family: 'Nanum Gothic', sans-serif;
	}
</style>
</head>

<body>
	<%@ include file="../header.jsp"%>
	<div class="mainWrapper">
		<div id="map" style="width: 100%; height: 100%;"></div>
		<div class="rightSideAreas">
			<div class="rightInner">
				<div style="padding-bottom: 15px; position: relative; margin: 15px; border-bottom: 1px solid gray;">
					<h4 style="text-align: center; font-weight: 700;">천안시 체육시설 검색</h4>
					<form method="POST" name="searchForm">
						<select name="searchKeyword" style="padding: 2px;">
							<option value="rsrcNm"
								<c:if test="${searchDto.searchKeyword == 'rsrcNm'}">selected</c:if>>시설명</option>
							<option value="addr"
								<c:if test="${searchDto.searchKeyword == 'addr'}">selected</c:if>>주소지</option>
						</select> <input type="text" name="searchTxt" placeholder="체육시설명을 입력해주세요"
							required value="${searchDto.searchTxt}" class="searchInput" />
						<button type="submit" class="searchBtn">검색</button>
						<button type="button" class="txtResetBtn" <c:if test='${searchDto.searchTxt eq "" || searchDto.searchTxt eq null}'>style="display: none;"</c:if>>x</button>
					</form>
				</div>
				<button type="button" class="resetBtn" style="border: 0; padding: 3px 10px; border-radius: 4px; color: #F8F9FA; background: #FF4B2B; position: relative; right: -65%;">검색 초기화</button>
				<ul
					style="height: 80%; overflow-y: scroll; margin: 5px 0 20px; padding: 0 10px;">
					<c:if test="${fn:length(fcList) == 0}">
						<li style="margin-bottom: 10px; text-align: center; font-size: 18px; color: #FF416C;">검색 결과가 없습니다.</li>
					</c:if>
					<c:forEach var='data' items="${fcList}">
						<li class="fcItem" style="margin-bottom: 10px; height: 100px;">
							<button
								type="button" data-lot="${data.lot}" data-lat="${data.lat}"
								class="eachPosBtn" id="id-${data.rsrcNo}">
								<div class="imgWrapper" style="height: 75px; width: 75px; background: linear-gradient(to right, #FF4B2B, #FF416C); border-radius: 50%;">
									<img src="${path}/image/facilities/${data.rsrcNo}.jpg" style="border-radius: 50%; margin-top: 2px;"
										width="70px" height="70px" />
								</div>
								<div class="txtAreas">
									<strong>${data.rsrcNm}</strong>
									<p>${data.addr} ${data.daddr}</p>
								</div>
							</button>
						</li>
					</c:forEach>
				</ul>
			</div>
			<button type="button" class="closeSideBtn"></button>
		</div>
	</div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=${apiKey}&libraries=services,clusterer,drawing"></script>
	<script type="text/javascript" src="${path}/js/map.js"></script>
	<script type="text/javascript">
					var container = document.getElementById('map'); //지도를 담을 영역의 DOM 레퍼런스
					var originalList = '${parsedList}';
					var path = '${path}';
					var parsedList = JSON.parse(originalList);
					var markers = [];

					var options = { //지도를 생성할 때 필요한 기본 옵션
						center: new kakao.maps.LatLng(36.83833584645811, 127.1958748509954), //지도의 중심좌표.
						//지도의 레벨(확대, 축소 정도)
						level: 8
					};

					var map = new kakao.maps.Map(container, options); //지도 생성 및 객체 리턴

					// 일반 지도와 스카이뷰로 지도 타입을 전환할 수 있는 지도타입 컨트롤을 생성합니다
					var mapTypeControl = new kakao.maps.MapTypeControl();

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMLEFT);

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, kakao.maps.ControlPosition.BOTTOMLEFT);


					var clusterer = new kakao.maps.MarkerClusterer({
						map: map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
						averageCenter: true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
						minLevel: 9, // 클러스터 할 최소 지도 레벨 
					});

					for (let i = 0; i < parsedList.length; i++) {
						displayMarker(parsedList[i], path);
					}	
				</script>
</body>

</html>