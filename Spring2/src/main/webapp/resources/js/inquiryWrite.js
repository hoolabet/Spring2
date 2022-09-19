/**
 * 문의 작성
 */
$(document).ready(function(){
	var idVal=$("input[name=id]").val();
	var pnoVal=$("input[name=pno]").val();

	
	
	// 문의 작성 함수 호출
	$("#wbtn").on("click",function(){
		var questionVal=$("textarea[name=question]").val();
		if(idVal=="" || pnoVal=="" || questionVal==""){
			alert("문의사항을 입력해 주세요")
		}else{
			add({id:idVal,pno:pnoVal,question:questionVal})
		}
	})
	
	// 문의 작성 함수 선언
	function add(inquiry){
		$.ajax({
			type:"post",
			url:"/board/inquirywrite",
			data: JSON.stringify(inquiry),
			contentType:"application/json; charset=utf-8",
			success:function(result){
				if(result=="success"){
					window.location.href = '/board/inquiry?pno='+pnoVal;
				}
			}
		})
	}
	

})