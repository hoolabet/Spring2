/**
 * 문의
 */
$(document).ready(function(){
	var pnoVal = $("input[name=pno]").val();
	

	
	
	// 아이디 마스킹 처리
	$("input[name=id]").each(function(i){                    
		var idval = $(this).val(); // 아이디값
		var ideq = $("input[name=id]:eq("+i+")").val(); // i번재 아이디 값
		var idmsk; // 마스킹처리된 아이디
		
		if(idval.length>2){ // 아이디 길이가 2보다 크면 *로 바꾸어라(마스킹처리)
			idmsk = ideq.replace(/(?<=.{1})(?=.{2})./gi, "*")
			console.log("e"+idmsk)
		}
		
		console.log("아이디 마스킹 처리"+i+":"+idmsk) // 마스킹 처리된 아이디 확인
		
		var str="";
		 
		str=`${idmsk}`;
		
		$(".msk:eq("+i+")").html(str); // i번째에 마스킹처리된 아이디를 넣어라
		
	})

	
	
	
	
	// 문의 삭제 버튼 클릭시
	$(".delete").on("click",function(){
		var ino = $(this).data("ino");
		console.log(ino);
		if(confirm("문의를 삭제하시겠습니까?")){
			remove(ino);
		}else{
			
		}
	})
	
	// 문의 답변 버튼 클릭시
	$(".answer").on("click",function(){
		var inoVal = $(this).data("ino");
		console.log(inoVal);
		console.log(pnoVal);
		window.location.href = "/board/inquirymodify?pno="+pnoVal+"&ino="+inoVal;
	})

	
	// url 주소에서 pageNum 값
	var urlParams = new URL(location.href).searchParams;
	var num = urlParams.get('pageNum');
	console.log(num) 
	
	// 문의 삭제 함수 선언
	function remove(ino){
		console.log(ino);
		$.ajax({
			type: "delete",
			url:"/inquiry/remove/"+ino,
			success:function(result){
				if(result=="success"){
					alert("문의삭제 성공")
					location.reload();
				}
			}
		})
	}
	
	
})