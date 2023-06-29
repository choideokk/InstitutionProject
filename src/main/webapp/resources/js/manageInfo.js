function fn_opinionChk(type, alertTxt){
			$.ajax({
				url : path + "/action_proc",
				type : "post",
				dataType : "json",
				data : {"postno" : postNumber, "type" : type},
				success : function(data){
					if (data == 1) {
						alert(alertTxt + "이(가) 완료되었습니다.")
						location.href = path + "/detail?postno=" + postNumber;
						return false;
					} else if (data == 0){
						alert("이미 " + alertTxt + "한 게시글입니다")
						location.href = path + "/detail?postno=" + postNumber;
					}
				},
				error : function(request, status, error) {
					console.log(request, status, error)
				}
			})
		}