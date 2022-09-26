/**
 * 
 */

// 비밀번호 수정	
	
	var pw_chk = false;
	$("#pw_val").on("blur",function(){
		const pwpw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[`$@$!%*#?&])[A-Za-z\d`$@$!%*#?&]{8,16}$/g;
		if($("#pw_val").val()==""){
			$("#pw_msg").text("필수입력정보입니다.").css("color","red");
			pw_chk = false;
		}else if(pwpw.test($("#pw_val").val())){
			$("#pw_msg").text("");
			pw_chk = true;
		}else{
			$("#pw_msg").text("8~16자 영문 숫자 특수문자를 하나 이상 사용하세요.").css("color","red");
			pw_chk = false;
		}
	})
	

	
	var pw_chk2=false;
	$("#pw_val2").on("keyup",function(){
		if(pw_chk){
			if($("#pw_val2").val()===$("#pw_val").val()){
				$("#pw_msg2").text("정상입니다.").css("color","green");
				pw_chk2 = true;
			}else{
				$("#pw_msg2").text("비밀번호가 일치하지 않습니다.").css("color","red");
				pw_chk2 = false
			}
		}else{
			$("#pw_msg2").text("비밀번호를 다시 확인해주세요.").css("color","red");
			pw_chk2 = false
		}
	})	
	

	
	$("#modisub").on("click",function(e){
		if(!(pw_chk && pw_chk2)){
			e.preventDefault();
			alert('비밀번호를 다시 확인하세요.');
		}else{
			$("form[action='/member/modifyPassword']").submit();
		}
	})