/**
 * 문의 작성
 */
$(document).ready(function(){
	var idVal=$("input[name=id]").val();
	var pnoVal=$("input[name=pno]").val();
	
	
	
	// 문의 작성 함수 호출
	$("#wbtn").on("click",function(){
		var secretVal;
		
		$('input:checkbox[name=secret]').each(function () {
			if($(this).is(":checked")==true){
				secretVal=$(this).val();
		    }
		})
		
		var questionVal=$("textarea[name=question]").val();
		if(pnoVal=="" || questionVal==""){
			alert("문의사항을 입력해 주세요")
		}else if(idVal==""){
			alert("로그인 후 이용가능합니다.")
			window.location.href ="/member/login";
		}else{
			add({id:idVal,pno:pnoVal,question:questionVal,secret:secretVal})
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
					window.location = document.referrer;
				}
			}
		})
	}
	

})