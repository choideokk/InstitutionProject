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
		var pw= $("#password").val();
	    const pwRegExp = /^(?=.*\d)(?=.*[a-z])(?=.*[A-Z]).{8,}$/;
		 if (!pwRegExp.test(pw)) {
			alert("대문자, 소문자 , 숫자를 1개씩 포함해서 8글자 이상 입력해주세요");
			return false;
			}

		if ($.trim($("#memberName").val()) == "") {
			alert("성명을 입력해주세요.");
			$("#memberName").focus();
			return false;
		}
		if ($("#email").val() == "") {
			alert("이메일을 입력해주세요.");
			$("#email").focus();
			return false;
		}
		if ($("#phoneNum").val() == "") {
			alert("전화번호를 입력해주세요.");
			$("#phoneNum").focus();
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
		alert("아이디는 영어와 숫자로 6-14자이어야 합니다.");
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
