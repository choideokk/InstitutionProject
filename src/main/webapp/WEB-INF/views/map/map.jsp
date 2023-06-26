<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ page import="java.util.*" %>
		<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

			<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
			<!DOCTYPE html>
			<html>

			<head>
				<meta charset="UTF-8">
				<title>Insert title here</title>
				<link href="${path}/css/reset.css" rel="stylesheet" type="text/css" />
				<link href="${path}/css/map.css" rel="stylesheet" type="text/css" />
			</head>

			<body>
				<div style="position: absolute; top: 0; width: 100%; height: 100%; overflow-x: hidden;">
					<div id="map" style="width: 100%; height: 100%;"></div>
					<div class="rightSideAreas" style="right: 0px; height: 100%; padding: 10px; padding-bottom: 55px;">
						<div style="height: 100%;">
							<p>천안시 체육시설 목록..</p>
							<div style="margin-bottom: 15px;">
								<p>체육시설 검색</p>
								<form method="POST">
									<input type="text" name="searchTxt" placeholder="체육시설명을 입력해주세요" />
									<button type="submit">검색하기</button>
									<button type="button">초기화</button>
								</form>
							</div>
							<ul style="height: 100%; overflow-y: scroll; margin-bottom: 20px;">
								<c:forEach var='data' items="${fcList}">
									<li style="margin-bottom: 10px;">
										<button style="width: 100%; background: white; border: 0; display: flex;"
											type="button" data-lot="${data.lot}" data-lat="${data.lat}"
											class="eachPosBtn">
											<div>
												<img src="${path}/image/facilities/${data.rsrcNo}.jpg" width="100px"
													height="100px" />
											</div>
											<div>
												<strong>${data.rsrcNm}</strong>
												<p>${data.addr}${data.daddr}</p>
											</div>
										</button> <a href="${path}/Calendar2"
											style="width: 100%; text-decoration: none; display: block; text-align: center; background: #0d6efd; color: white; padding: 10px;">예약하기</a>
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

					// 지도에 컨트롤을 추가해야 지도위에 표시됩니다
					// kakao.maps.ControlPosition은 컨트롤이 표시될 위치를 정의하는데 TOPRIGHT는 오른쪽 위를 의미합니다
					map.addControl(mapTypeControl, kakao.maps.ControlPosition.TOPLEFT);

					// 지도 확대 축소를 제어할 수 있는  줌 컨트롤을 생성합니다
					var zoomControl = new kakao.maps.ZoomControl();
					map.addControl(zoomControl, kakao.maps.ControlPosition.BOTTOMLEFT);

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