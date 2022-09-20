/**
 * 아이디 찾기
 */




//$("input[type=radio]").on("change", function(){
//	$("#findIdEP").val("");
//	findId();
//})
//
//findId();
//
//
//
//function findId(){
//	let value = $("input[type=radio][name=findId]:checked").val();
//	if (value==="p") {
//		$("#findIdEP").attr("placeholder","전화번호");
//		$("#findIdEP").attr("name","phone");	  	
//    }else if(value==="e"){
//    	$("#findIdEP").attr("placeholder","이메일");
//    	$("#findIdEP").attr("name","email");
//    }
//	  
//}
	
$("#email_btn").on("click",function(e){
	e.preventDefault();
	
	let email=$("#findIdEmail").val();
	let name=$("#findIdName").val();
	emcheck({name:name,email:email});
})

let em=false;
const checkInput = $('.mail-check-input') // 인증번호 입력하는곳 
function emcheck(member){
	console.log("console function:"+member);
	$.ajax({
		type : 'post',
		url: "/member/emailchkID",
		data:JSON.stringify(member),
		contentType: "application/json; charset=utf-8",
		success : function (data) {
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}
	})
	.fail(function(){
		alert("실패.");
		$("#find_id_msg").text("실패");
		$("#find_id_msg").css("color","red");
		em = false;
	})
}

$("#email_address")
// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail-check-input').blur(function () {
	const inputCode = $(this).val();
	const $resultMsg = $('#find_id_msg');
	
	if(inputCode === code){
		em = true;	
	}else{
		em = false;
	}
});

$("#findIdsub").on("click",function(e){
	e.preventDefault();
	if(em){
		
	}else{
		$("#find_id_msg").text("인증번호가 불일치 합니다. 다시 확인해주세요!").css("color","red");
		
	}
})

