/**
 * 
 */
$(document).ready(function(){
	
	console.log($("#modify_Content").val())
	$("#modify_Content").val($("#modify_Content").val().replaceAll("<br>","\r\n"))
	
	$("#wbtn_m").on("click",function(){
		var idVal=$("input[name=id]").val();
		var pnoVal=$("input[name=pno]").val();
		var scopeVal=$("input[type=radio]:checked").val();
		var contentVal=$("textarea[name=content]").val();
		
		if(idVal=="" || scopeVal=="" || contentVal==""){
			alert("평점과 내용을 입력해 주세요")
		}else{
			if(confirm("리뷰를 수정하시겠습니까?")){
				$("#form").submit();
			}else{
				return false
			}
			
		}
	}) // click end
})