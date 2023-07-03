// 화면 전환
const signUpButton = document.getElementById('signUp');
const signInButton = document.getElementById('signIn');
const container = document.getElementById('container');

signUpButton.addEventListener('click', () =>
	container.classList.add('right-panel-active'));

signInButton.addEventListener('click', () =>
	container.classList.remove('right-panel-active'));

$(document).ready(function() {
	$('#hidePw').on('click', function() {
		$('input').toggleClass('active');
		if ($('input').hasClass('active')) {
			$(this).attr('class', "fa fa-eye-slash fa-lg")
				.prev('input').attr('type', "text");
		} else {
			$(this).attr('class', "fa fa-eye fa-lg")
				.prev('input').attr('type', 'password');
		}
	});


});

$(document).ready(function() {
	$('#hidePw2').on('click', function() {
		$('input').toggleClass('active');
		if ($('input').hasClass('active')) {
			$(this).attr('class', "fa fa-eye-slash fa-lg")
				.prev('input').attr('type', "text");
		} else {
			$(this).attr('class', "fa fa-eye fa-lg")
				.prev('input').attr('type', 'password');
		}
	});


});

$(function() {
	$("#btnLogin").click(function() {
		var userid = $("#loginId1").val();
		var passwd = $("#password1").val();
		if (userid == "") {
			alert("아이디를 입력하세요");
			$("#loginId1").focus(); //입력포커스 이동

			return false; //함수 종료
		}
		if (passwd == "") {
			alert("비밀번호를 입력하세요");
			$("#password1").focus();
			return false;
		}

	});
});

$(document).ready(function() {

	$("#memberUpdateBtn").on("click", function() {
		location.href = path + "/memberInfo";
	});

});





$(document).ready(function() {

	$("#logout").on("click", function() {
		alert("로그아웃 되었습니다.");
	});

});

$(document).ready(function() {
	// 취소
	$(".cancle").on("click", function() {

		location.href = path + "/register";

	})

	$("#submit").on("click", function(e) {

		if ($("#loginId").val() == "") {
			alert("아이디를 입력해주세요.");
			$("#loginId").focus();
			return false;
		}

		if ($("#password").val() == "") {
			alert("비밀번호를 입력해주세요.");
			$("#password").focus();
			return false;
		}
		const pw = $("#password").val();
		const pwRegExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,15}$/;
		if (!pwRegExp.test(pw)) {
			alert("비밀번호: 대문자, 소문자 , 숫자를 1개씩 포함해서 8~15자를 입력해주세요");
			return false;
		}

		if ($.trim($("#memberName").val()) == "") {
			alert("성명을 입력해주세요.");
			$("#memberName").focus();
			return false;
		}
		const name = $("#memberName").val();
		console.log(name);
		const nameRegExp = /^[가-힣]+$/;
		if (!nameRegExp.test(name)) {
			alert("성명: 한글만 입력하세요");
			return false;
		}


		if ($("#birth").val() == "") {
			alert("날짜를 선택해주세요.");
			$("#birth").focus();
			return false;
		}

		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		const email = $("#email").val();
		const emailRegExp = /^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
		if (!emailRegExp.test(email)) {
			alert("이메일: 이메일 형식에 맞게 입력해주세요");
			return false;
		}

		if ($("#phoneNum").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#phoneNum").focus();
			return false;
		}

		const phoneNum = $("#phoneNum").val();
		const phoneNumRegExp = /^[0-9]{11}$/;
		if (!phoneNumRegExp.test(phoneNum)) {
			alert("전화번호: '-'없이 숫자 11자리를 입력해주세요");
			return false;
		}

		var idChkVal = $("#id_check").val();
		if (idChkVal == "N") {
			alert("중복확인 버튼을 눌러주세요.");
			return false;
		}
		alert("회원가입이 성공적으로 완료되었습니다. 반갑습니다!");
		$("#regForm").submit();
	});

})

function fn_idChk() {
	// 그 전에 아이디가 숫자와 영어로 6-14자인지 먼저 체크하고, 안되면 중복확인조차 못하게
	var id = $("#loginId").val();
	var regExp = /^(?=.*[a-z])(?=.*\d).{6,14}$/;
	if (!regExp.test(id)) {
		alert("아이디: 영어와 숫자로 6-14자이어야 합니다.");
		return false;

		// 중복확인 코드
	}
	$.ajax({
		url: path + "/id_check",
		type: "post",
		dataType: "json",
		data: { "loginId": id },
		success: function(data) {
			if (data == 1) {
				$("#loginId").val("");
				$("#id_check").attr("value", "N");
				alert("중복된 아이디입니다.");
				return false;
			} else if (data == 0) {
				$("#id_check").attr("value", "Y");
				alert("사용가능한 아이디입니다.");
			}
		},
		error: function(request, status, error) {
			console.log(request, status, error);
		}
	})

}

//달력
var today = new Date();
var endDay = new Date(today.getFullYear() - 14, today.getMonth(), today
	.getDate());

$('#birth').datepicker(
	{
		dateFormat: 'yy-mm-dd',
		changeYear: true,
		changeMonth: true,
		showMonthAfterYear: true,
		dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
		monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월',
			'7월', '8월', '9월', '10월', '11월', '12월'],
		maxDate: endDay
		//beforeShowDay: after	//오늘 이후로 선택 못하게 하는 함수
	});

$('#birth').change(function() {
	$('#delete').css({
		'display': 'inline-block',
		'position': 'absolute',
		'right': '60px',
		'top': '50%',
		'transform': 'translateY(60%)',
		'cursor': 'pointer',
		'z-index': 'auto'

	});
});

$('#delete').click(function() {
	$('#birth').val('');
	$('#delete').css('display', 'none');
});

function after(date) {
	if (date > new Date()) {
		return [false];
	} else {
		return [true];
	}
}


