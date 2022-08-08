
window.onload=function(){
	
//	var idchk=document.querySelector("#idchk");
//	var pwchk=document.querySelector("#pwchk");
//	var msg = document.querySelector("#msg");
//	var loginsub= document.querySelector("#loginsub");
//	
//	loginsub.onclick=function(e){
//		if(idchk.value==""){
//			e.preventDefault();
//			msg.innerHTML="아이디를 입력해주세요.";
//			msg.style.color="red";
//		}else if(pwchk.value==""){
//			e.preventDefault();
//			msg.innerHTML="비밀번호를 입력해주세요.";
//			msg.style.color="red";
//		}
//	}
	
	$("#loginsub").on("click",function(e){
		if($("#idchk").val()==""){
			e.preventDefault();
			$("#msg").text("아이디를 입력해주세요.").css("color","red");
		}else if($("#pwchk").val()==""){
			e.preventDefault();
			$("#msg").text("비밀번호를 입력해주세요.").css("color","red");
		}
		
	})
	
	
}