/**
 * 뒤로가기버튼
 */
$(document).ready(function(){
	
	var pnoVal = $("input[name=pno]").val();
	
	$("#listback").on("click",function(){
		window.location = "/board/detail?pno="+pnoVal+"";
	})
	$(".back").on("click",function(){
		window.location = document.referrer;
	})
})