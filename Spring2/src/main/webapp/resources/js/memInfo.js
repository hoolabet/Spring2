
	


	
// 이메일 수정
	
	var email_chk = true;
	$("#email_val").on("blur",function(){
		const Email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/g;
		if($("#email_val").val()==""){
			$("#email_msg").text("필수입력정보입니다.").css("color","red");
			email_chk = false;
		}else if(Email.test($("#email_val").val())){
			$("#email_msg").text("");
			email_chk = true;
		}else{
			$("#email_msg").text("이메일 주소를 다시 확인해 주세요.").css("color","red");
			email_chk = false;
		}
	})
	
	$("#email_btn").on("click",function(){
		
		if(email_chk){
			var id=$("#id").val();
			var email=$("#email_val").val();
			alert("id="+id+", email="+email);
			modifyEmail({id:id,email:email});
		}else{
			alert("이메일 주소를 다시 확인해 주세요.");
		}
	})
	
	function modifyEmail(member){
		console.log(member);
		$.ajax({
			type: "put",
			url: "/member/modifyEmail",
			data:JSON.stringify(member),
			contentType: "application/json; charset=utf-8",
			success:function(result){
				if(result=="success"){
					alert("이메일수정 성공")
				}
			}
		})
	}
	
	
	
	
// 전화번호 수정
	
	var phone_chk =true;
	$("#phone_val").on("blur",function(){
		const phone = /^[0-9]{8,13}$/g;
		if($("#phone_val").val()==""){
			$("#phone_msg").text("필수입력정보입니다.").css("color","red");
			phone_chk = false;
		}else if(phone.test($("#phone_val").val())){
			$("#phone_msg").text("");
			phone_chk = true;
		}else{
			$("#phone_msg").text("전화번호를 다시 확인해 주세요.").css("color","red");
			phone_chk = false;
		}
	})
	
	
	$("#phone_btn").on("click",function(){
		
		if(email_chk){
			var id=$("#id").val();
			var phone=$("#phone_val").val();
			alert("id="+id+", phone="+phone);
			modifyPhone({id:id,phone:phone});
		}else{
			alert("전화번호를 다시 확인해 주세요.");
		}
	})
	
	function modifyPhone(member){
		console.log(member);
		$.ajax({
			type: "put",
			url: "/member/modifyPhone",
			data:JSON.stringify(member),
			contentType: "application/json; charset=utf-8",
			success:function(result){
				if(result=="success"){
					alert("전화번호수정 성공")
				}
			}
		})
	}
	



// 비밀번호 수정	
	
	var pw_chk = false;
	$("#pw_val").on("blur",function(){
		const pwpw = /^[a-zA-Z0-9~!@#$%^&*?-_]{8,16}$/g;
		if($("#pw_val").val()==""){
			$("#pw_msg").text("필수입력정보입니다.").css("color","red");
			pw_chk = false;
		}else if(pwpw.test($("#pw_val").val())){
			$("#pw_msg").text("");
			pw_chk = true;
		}else{
			$("#pw_msg").text("8~16자 영문 대소문자 숫자 특수문자 사용하세요.").css("color","red");
			pw_chk = false;
		}
	})
	

	
	var pw_chk2=false;
	$("#pw_val2").on("keyup",function(){
		if($("#pw_val2").val()===$("#pw_val").val()){
			$("#pw_msg2").text("정상입니다.").css("color","green");
			pw_chk2 = true;
		}else{
			$("#pw_msg2").text("비밀번호가 일치하지 않습니다.").css("color","red");
			pw_chk2 = false
		}
	})	
	

	
	$("#pw_btn").on("click",function(e){
		if(!(pw_chk && pw_chk2)){
			e.preventDefault();
			alert('비밀번호를 다시 확인하세요.');
		}else{
			var id=$("#id").val();
			var password=$("#pw_val").val();
			alert("id="+id+", password="+password);
			modifyPw({id:id,password:password});
		}
	})
	
	function modifyPw(member){
		console.log(member);
		$.ajax({
			type: "put",
			url: "/member/modifyPw",
			data:JSON.stringify(member),
			contentType: "application/json; charset=utf-8",
			success:function(result){
				if(result=="success"){
					alert("비밀번호수정 성공");
					location.replace("/member/login");
				}
			}
		})
	}
	
	
// 계정삭제
	
	$("#delete").on("click",function(){
		if(confirm("계정삭제하시겠습니까?")){
			alert("삭제한다");
			var id=$("#id").val();
			modifyDelete({id:id});
		}else{
			alert("취소");
			return false;
		}
	})
	

	function modifyDelete(member){
		console.log(member);
		$.ajax({
			type: "delete",
			url: "/member/modifyDelete",
			data:JSON.stringify(member),
			contentType: "application/json; charset=utf-8",
			success:function(result){
				if(result=="success"){
					alert("계정삭제 성공");
					location.replace("/");
				}
			}
		})
	}
	

