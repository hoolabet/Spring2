/**
 * 비밀번호 찾기
 */




//$("input[type=radio]").on("change", function(){
//	$("#findPwEP").val("");
//	findPw();
//})
//
//findPw();
//
//
//
//function findPw(){
//	let value = $("input[type=radio][name=findPw]:checked").val();
//	if (value==="p") {
//		$("#findPwEP").attr("placeholder","전화번호");
//		$("#findPwEP").attr("name","phone");	  	
//    }else if(value==="e"){
//    	$("#findPwEP").attr("placeholder","이메일");
//    	$("#findPwEP").attr("name","email");
//    }
//	  
//}

$("#email_btn").on("click",function(e){
	e.preventDefault();
	$("#find_pw_msg").text("이메일 전송중...").css("color","green");
	let email=$("#findPwEmail").val();
	let name=$("#findPwName").val();
	let id=$("#findPwId").val();
	emcheck({name:name,email:email,id:id});
})

let em=false;
let emm=false;
const checkInput = $('.mail_check_input') // 인증번호 입력하는곳 
function emcheck(member){
	console.log("console function:"+member);
	$.ajax({
		type : 'post',
		url: "/member/emailchkPW",
		data:JSON.stringify(member),
		contentType: "application/json; charset=utf-8",
		success : function (data) {
			$("#find_pw_msg").text("");
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
			emm = true;
		}
	})
	.fail(function(){
		$("#find_pw_msg").text("아이디, 이름, 이메일을 다시 확인해주세요").css("color","red");
		emm = false;
	})
}

$("#email_address")
// 인증번호 비교 
// blur -> focus가 벗어나는 경우 발생
$('.mail_check_input').blur(function () {
	const inputCode = $(this).val();
	
	
	if(inputCode === code){
		em = true;	
	}else{
		em = false;
	}
});

$("#findPwsub").on("click",function(e){
	e.preventDefault();
	if(emm){
		if(em){
			$("form[action='/member/findPw']").submit();
		}else{
			$("#find_pw_msg").text("인증번호가 불일치 합니다. 다시 확인해주세요!").css("color","red");
		}
	}else{
		$("#find_pw_msg").text("인증번호를 입력하세요").css("color","red");
	}
	
	
})

