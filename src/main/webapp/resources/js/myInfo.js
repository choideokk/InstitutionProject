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

$(document).ready(function() {
		// 취소
		$(".cancle").on("click", function() {

			location.href = path + "/memberInfo";

		})

		$("#submit").on("click", function(e) {

			if ($("#password").val() == "") {
				alert("비밀번호를 입력해주세요.");
				$("#password").focus();
				return false;
			}
			const pw= $("#password").val();
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
			const name= $("#memberName").val();
			const nameRegExp =/^[가-힣]+$/;
			if (!nameRegExp.test(name)) {
				alert("성명: 한글만 입력하세요");
				return false;
				}
			if ($("#email").val() == "") {
				alert("이메일을 입력해주세요.");
				$("#email").focus();
				return false;
			}
			const email= $("#email").val();
			const emailRegExp =/^[a-z0-9._%+-]+@[a-z0-9.-]+\.[a-z]{2,}$/;
			if (!emailRegExp.test(email)) {
				alert("이메일: 이메일 형식에 맞게 입력해주세요");
				return false;
				}
			
			if ($("#phoneNum").val() == "") {
				alert("전화번호를 입력해주세요.");
				$("#phoneNum").focus();
				return false;
			}
			
			const phoneNum= $("#phoneNum").val();
			const phoneNumRegExp =/^[0-9]{11}$/;
			if (!phoneNumRegExp.test(phoneNum)) {
		        alert("전화번호: '-'없이 숫자 11자리를 입력해주세요");
				return false;
				}
			
			alert("회원정보수정이 성공적으로 완료되었습니다!");
			$("#updateForm").submit();
		});

	})