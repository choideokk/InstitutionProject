<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>

<style>
.container {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
	height: 100vh;
	margin: 0;
	padding: 0;
}
</style>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<div class="container">
		<div>
			<h2>예약 등록전 예약 정보를 확인해주세요.</h1><br/>
		</div>
		<div>
			<form action="" method="post">
				<input type="text" name="rsvfnm" value="시설이름"><br/>
				<input type="text" name="category" value="종목이름"> <br/>
				<input type="text" name="date" value="사용날짜"><br/>
				<input type="text" name="time" value="사용시간"><br/>
				<input type="text" name="time" value="예약등록일"><br/>
				<input type="text" name="time" value="예약마감일"><br/>
				<button type="submit">예약하기</button>
				<button type="button" id="return" onClick="event.preventDefault(); window.history.back();">뒤로가기</button>
			</form>	
		</div>	
	</div>
	
</body>
</html>