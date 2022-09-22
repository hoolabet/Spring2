/**
 * 문의 답변 수정 
 */
$(document).ready(function(){
	var idVal=$("input[name=id]").val();
	var pnoVal=$("input[name=pno]").val();
	var inoVal=$("input[name=ino]").val();
	var questionVal=$("textarea[name=question]").val();
	
	// 문의 답변 함수 호출
	$("#wbtn").on("click",function(){
		var answerVal=$("textarea[name=answer]").val();
		
		add({id:idVal,pno:pnoVal,question:questionVal,answer:answerVal,ino:inoVal});
	})
	
	// 문의 답변 함수 선언
	function add(inquiry){
		console.log(inquiry)
		
		$.ajax({
			type:"post",
			url:"/board/inquirymodify",
			data: JSON.stringify(inquiry),
			contentType:"application/json; charset=utf-8",
			success:function(result){
				if(result=="success"){
					window.location = document.referrer;
				}
			}
		})
	}
	

})
