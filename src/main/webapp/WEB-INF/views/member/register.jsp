<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<c:set var="path" value="${pageContext.request.contextPath}"></c:set>
<html>
<head>
<!-- 합쳐지고 최소화된 최신 CSS -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap.min.css">
<!-- 부가적인 테마 -->
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.2/css/bootstrap-theme.min.css">

<script
	src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<title>회원가입</title>
</head>
<style type="text/css">


.ui-datepicker select {
	vertical-align: middle;
	height: 28px;
}

</style>
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<body>

	<section id="container">
		<form action="" method="post" id="regForm"
			style="width: 80%; magin-left: 0 auto; margin-right: 0 auto;">
			<div class="form-group has-feedback">
				<label class="control-label" for="loginId">아이디</label> <input
					class="form-control" type="text" id="loginId" name="loginId"
					placeholder="숫자와 영어로 6-14자 입력해주세요" pattern="[a-z0-9]{6,14}">
				<button type="button" id="id_check" onclick="fn_idChk();" value="N">중복확인</button>

			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for="password">패스워드</label> <input
					class="form-control" type="password" id="password"
					name="password"
					placeholder="최소 8글자 이상 (단, 숫자,소문자,대문자 각각 최소 1개씩 포함) 입력해주세요 "
					pattern="(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}" />
					
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for=memberName>성명</label> <input
					class="form-control" type="text" id="memberName" name="memberName"
					placeholder="한글로 최대 6자 입력해주세요 " />
			</div>
			
			<div class="form-group has-feedback">
				<label class="control-label" for=phoneNum>생년월일</label> <input
					class="form-control" type="text" id="birth" name="birth"placeholder="만 14세 미만 가입 불가 " readonly>
					<span id="delete" style="color: red; position: relative; right: 25px; display: none;"><i class="fas fa-times font-img"></i></span>
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for=email>이메일</label> <input
					class="form-control" type="email" id="email" name="email"
					placeholder="이메일을 입력해주세요"
					pattern="[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$">
			</div>
			<div class="form-group has-feedback">
				<label class="control-label" for=phoneNum>전화번호</label> <input
					class="form-control" type="text" id="phoneNum" name="phoneNum"
					placeholder="전화번호를 입력해주세요"
					pattern="[0-9]{11}">
			</div>
			<div class="form-group has-feedback">
				<button class="btn btn-success" type="submit" id="submit">회원가입</button>
				<button class="cencle btn btn-danger" type="button">취소</button>
			</div>
		</form>
	</section>
	<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.13.1/js/all.min.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script type="text/javascript">
		var path='${path}';
	</script>
<script type="text/javascript" src="${path}/js/register.js"></script>
<script type="text/javascript">
var today = new Date();
var endDay = new Date( today.getFullYear()-14, today.getMonth(), today.getDate() );

$('#birth').datepicker({
	dateFormat: 'yy-mm-dd',
	changeYear: true,
	changeMonth: true,	
	showMonthAfterYear: true,
	dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
	monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
	maxDate: endDay
	//beforeShowDay: after	//오늘 이후로 선택 못하게 하는 함수
});

$('#birth').change(function() {
	$('#delete').css('display', 'inline-block');
});

$('#delete').click(function(){
	$('#birth').val('');
	$('#delete').css('display', 'none');
});

function after(date) {
	if(date > new Date()) {
		return [false];
	} else {
		return [true];
	}
}
</script>
</body>

</html>