const pageBtn = document.querySelectorAll(".page-link");
pageBtn.forEach((btn)=>{
	btn.addEventListener('click', (e)=>{
		pageNumber = e.target.dataset.dtIdx;
		fn_pagechk()
	})
});

function fn_pagechk(){
	$.ajax({
		url : path + "/boardlist?pageNo=" + pageNumber,
		type : "post",
		dataType : "html",
		contentType : "application/x-www-form-urlencoded; charset=utf-8",
		data : {
			isChecked : isChecked,
			searchTxt : searchTxt,
			searchKeyword : searchKeyword
		},
		success : function(data){
			location.href= path + "/boardlist?pageNo=" + pageNumber
		},
		error : function(request, status, error) {
			console.log(request, status, error)
		}
	})
}