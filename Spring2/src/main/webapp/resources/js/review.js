/**
 * 리뷰
 */
$(document).ready(function(){
	// 리뷰 작성 함수 호출
	$("#wbtn").on("click",function(){
		
		var idVal=$("input[name=id]").val();
		var pnoVal=$("input[name=pno]").val();
		var scopeVal=$("input[type=radio]:checked").val();
		var contentVal=$("textarea[name=content]").val();
		var fileVal=$("input[type=file]").val();
		
		
		
		if(idVal=="" || pnoVal=="" || scopeVal=="" || contentVal==""){
			alert("평점과 내용을 입력해 주세요")
		}else{
			add({id:idVal,pno:pnoVal,scope:scopeVal,content:contentVal,file:fileVal})
		}
	})
	
	// 리뷰 작성 함수 선언
	function add(review){
		$.ajax({
			type:"post",
			url:"/newreview/write",
			data: JSON.stringify(review),
			contentType:"application/json; charset=utf-8",
			success:function(result){
				if(result=="success"){
					location.reload();
				}
			}
		})
	}
	
	
})