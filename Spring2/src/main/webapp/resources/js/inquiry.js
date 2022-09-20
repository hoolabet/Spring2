/**
 * 문의
 */
$(document).ready(function(){
	
	var userVal =  $("input[name=userInfo]").val();
	var idVal = $("input[name=id]").val();
	var answerVal = $("input[name=answer]").val();
	var pnoVal = $("input[name=pno]").val();
	var inoVal = $("input[name=ino]").val();
	
	ibtn();
	
	var eqValuedf = $("input[name=ino]:eq(0)").val() ;
	var eqValuedf1 = $("input[name=ino]:eq(1)").val() ;
	alert(eqValuedf)
	alert(eqValuedf1)
	
	function ibtn(){
		var i =0
		var inoi =0;
		
		var arr=[];
		
		var inoarr = $("input[name=ino]").each(function(i){
			console.log(i)
			var value = $(this).val();
			console.log(value);
			var eqValue = $("input[name=ino]:eq(" + i + ")").val() ;
			
			
		})
			// 답변 및 수정
			$(".ianswer").on("click",function(){
				window.location.href = '/board/inquirymodify?pno='+pnoVal+'&ino='+arr;
			})
	}
	
	// 삭제
	$(".idelete").on("click",function(){
		alert("삭제버튼")
	})
	
	
})