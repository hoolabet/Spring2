/**
 * 문의
 */
$(document).ready(function(){
	var pnoVal = $("input[name=pno]").val();
	
	
	// 비밀글 처리
/*	$("input[name=secret]").each(function(i){
		var scVal = $(this).val();
		console.log("secret = "+scVal)
		
		if(scVal==1){
			console.log(i+"번째 글 secret 값 ="+scVal)
//			$(".scac").text("비밀글 입니다.")
		}
	})*/
	
	
	// 아이디 마스킹 처리
	$("input[name=id]").each(function(i){                    
		var idval = $(this).val(); // 아이디값
		var ideq = $("input[name=id]:eq("+i+")").val(); // i번재 아이디 값
		
		// 마스킹처리
		var idmsk = ideq.replace(/(?<=.{1})(?=.{2})./gi, "*")
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

	
	
	
	/* 페이징 class 변경*/
	// url 주소에서 pageNum 값
	var urlParams = new URL(location.href).searchParams;
	var pnum = urlParams.get('pageNum');
	console.log(pnum) 
	
	// pnum과 text값이 같은 a태그
	var anum = $("#"+pnum).text();
	console.log("anum ="+anum)
	
	// 현재페이지 번호 색변경
	if(pnum==anum){
		$("#"+pnum).attr("class","red")
	}

	
	
	
	
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