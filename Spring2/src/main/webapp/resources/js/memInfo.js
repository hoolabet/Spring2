window.onload=function(){
	

	
	
	var pw = false;
	$("#pwchk").on("blur",function(){
		const pwpw = /^[a-zA-Z0-9~!@#$%^&*?-_]{8,16}$/g;
		if($("#pwchk").val()==""){
			$("#pwmsg").text("필수입력정보입니다.").css("color","red");
			pw = false;
		}else if(pwpw.test($("#pwchk").val())){
			$("#pwmsg").text("");
			pw = true;
		}else{
			$("#pwmsg").text("8~16자 영문 대소문자 숫자 특수문자 사용하세요.").css("color","red");
			pw = false;
		}
	})
	

	
	var pw2=false;
	$("#pwchk2").on("keyup",function(){
		if($("#pwchk2").val()===$("#pwchk").val()){
			$("#pwmsg2").text("정상입니다.").css("color","green");
			pw2 = true;
		}else{
			$("#pwmsg2").text("비밀번호가 일치하지 않습니다.").css("color","red");
			pw2 = false
		}
	})
	
	

	
	var na = false;
	$("#nachk").on("blur",function(){
		const name = /^[가-힣a-zA-Z]+$/;
		if($("#nachk").val()==""){
			$("#namsg").text("필수입력정보입니다.").css("color","red");
			na = false;
		}else if(name.test($("#nachk").val())){
			$("#namsg").text("");
			na = true;
		}else{
			$("#namsg").text("한글 또는 영문 대소문자 사용하세요.").css("color","red");
			na = false;
		}
	})
	
	

	
	var em = false;
	$("#emchk").on("blur",function(){
		const Email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/g;
		if($("#emchk").val()==""){
			$("#emmsg").text("필수입력정보입니다.").css("color","red");
			em = false;
		}else if(Email.test($("#emchk").val())){
			$("#emmsg").text("");
			em = true;
		}else{
			$("#emmsg").text("이메일 주소를 다시 확인해 주세요.").css("color","red");
			em = false;
		}
	})
	
	

	
	var ph =false;
	$("#pchk").on("blur",function(){
		const phone = /^[0-9]{8,13}$/g;
		if($("#pchk").val()==""){
			$("#pmsg").text("필수입력정보입니다.").css("color","red");
			ph = false;
		}else if(phone.test($("#pchk").val())){
			$("#pmsg").text("");
			ph = true;
		}else{
			$("#pmsg").text("이메일 주소를 다시 확인해 주세요.").css("color","red");
			ph = false;
		}
	})
	
	

	
	var ad = false;
	$("#adchk").on("blur",function(){
		if($("#adchk").val()==""){
			$("#admsg").text("필수입력정보입니다.").css("color","red");
			ad = false;
		}else{
			$("#admsg").text("");
			ad = true;
		}
	})
	
	

	
	$("#modify").on("click",function(e){
		if(!(pw && pw2 && na && em && ph && ad)){
			e.preventDefault();
			alert('입력해');
		}else{
			alert('수정됨');
		}
	})
	
	
	$("#delete").on("click",function(){
		alert('삭제됨');
	})
	

	
	

}