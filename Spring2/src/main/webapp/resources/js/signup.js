



//var idchk=document.querySelector("#idchk");
//var idmsg = document.querySelector("#idmsg");
//var id = false;
//idchk.onblur=function(){ 
//const idid=/^[a-z0-9-_]{5,20}$/g;
//if(idchk.value==""){
//idmsg.innerHTML="필수입력정보입니다."
//idmsg.style.color="red";
//id = false;
//}else if(idid.test(idchk.value)){ 
//idmsg.innerHTML="사용가능한 아이디 입니다.";
//idmsg.style.color="green";
//id = true;
//}else{ 
//idmsg.innerHTML="5~20의 소문자 숫자 특수기호 (-)(_)만 사용하여 입력하세요.";
//idmsg.style.color="red";
//id = false;
//}

//}


let id = false;
//let idd = false;
$("#idchk").on("keyup",function(){ 
	const idid=/^[a-z0-9-_]{5,20}$/g;
	if($("#idchk").val()==""){
		$("#idmsg").text("필수입력정보입니다.");
		$("#idmsg").css("color","red");
//		idd = false;
	}else if(idid.test($("#idchk").val())){ 
		$("#idmsg").text("");
//		idd = true;
		let idc=$("#idchk").val();
		idcheck(idc);
	}else{ 
		$("#idmsg").text("5~20의 영문 소문자, 숫자와 특수기호 (-)(_)만 사용가능합니다.");
		$("#idmsg").css("color","red");
//		idd = false;
	}
//	if(!id){
//		$("#idmsg").text("아이디 중복체크 하세요.");
//		$("#idmsg").css("color","red");
//	}

})


//$("#idbtn").on("click",function(e){
//	e.preventDefault();
//	if(idd){
//		var idc=$("#idchk").val();
//
//		idcheck(idc);
//
//	}else{
//		alert("부적절한 id 입니다.")
//	}
//})

function idcheck(idc){
	console.log(idc);
	$.ajax({
		type: "get",
		url: "/member/signup/"+idc,
		data: idc,
		contentType: "application/json; charset=utf-8"
	})
	.done(function(r){
//		alert("중복된 id 입니다.");
		$("#idmsg").text("이미 사용중인 id 입니다.");
		$("#idmsg").css("color","red");
		id = false;
	})
	.fail(function(){
//		alert("사용가능한 id 입니다.");
		$("#idmsg").text("사용가능한 id 입니다.");
		$("#idmsg").css("color","green");
		id = true;
	})
}



//var pwchk=document.querySelector("#pwchk");
//var pwmsg = document.querySelector("#pwmsg");
//var pw = false;
//pwchk.onblur=function(){
//const pwpw = /^[a-zA-Z0-9~!@#$%^&*?-_]{8,16}$/g;
//if(pwchk.value==""){
//pwmsg.innerHTML="필수입력정보입니다."
//pwmsg.style.color="red";
//pw = false;
//}else if(pwpw.test(pwchk.value)){
//pwmsg.innerHTML="";
//pwmsg.style.color="green";
//pw = true;
//}else{
//pwmsg.innerHTML="8~16자 영문 대소문자 숫자 특수문자 사용하세요.";
//pwmsg.style.color="red";
//pw = false;
//}
//}

var pw = false;
$("#pwchk").on("keyup",function(){
	const pwval= $("#pwchk").val();
	
	const pwpw = /^(?=.*[A-Za-z])(?=.*\d)(?=.*[`$@$!%*#?&])[A-Za-z\d`$@$!%*#?&]{8,16}$/g;

	if(pwval==""){
		$("#pwmsg").text("필수입력정보입니다.").css("color","red");
		pw = false;
	}else if(pwpw.test(pwval)){
		$("#pwmsg").text("");
		pw = true;
	}else{
		$("#pwmsg").text("8~16자 영문 숫자 특수문자를 하나 이상 사용하세요.").css("color","red");
		pw = false;
	}
})


//var pwchk2=document.querySelector("#pwchk2");
//var pwmsg2 = document.querySelector("#pwmsg2");
//var pw2=false;
//pwchk2.onkeyup=function(){
//if(pwchk2.value===pwchk.value){
//pwmsg2.innerHTML="정상입니다.";
//pwmsg2.style.color="green";
//pw2 = true;
//}else{
//pwmsg2.innerHTML="비밀번호가 다르다.";
//pwmsg2.style.color="red";
//pw2 = false;
//}
//}

var pw2=false;
$("#pwchk2").on("keyup",function(){
	if(pw){
		if($("#pwchk2").val()===$("#pwchk").val()){
			$("#pwmsg2").text("정상입니다.").css("color","green");
			pw2 = true;
		}else{
			$("#pwmsg2").text("비밀번호가 일치하지 않습니다.").css("color","red");
			pw2 = false
		}
	}else{
		$("#pwmsg2").text("비밀번호를 다시 확인해주세요.").css("color","red");
		pw_chk2 = false
	}
})




//var nachk=document.querySelector("#nachk");
//var namsg=document.querySelector("#namsg");
//var na = false;
//nachk.onblur=function(){
//const name = /^[가-힣a-zA-Z]+$/;
//if (nachk.value==""){
//namsg.innerHTML="필수입력정보입니다."
//namsg.style.color="red";
//na = false;
//}else if(name.test(nachk.value)){
//namsg.innerHTML="";
//namsg.style.color="green";
//na = true;
//}
//}

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


//var emchk=document.querySelector("#emchk");
//var emmsg = document.querySelector("#emmsg");
//var em = false;
//emchk.onblur=function(){
//const Email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/g;
//if(emchk.value==""){
//emmsg.innerHTML="필수입력정보입니다."
//emmsg.style.color="red";
//em = false;
//}else if(Email.test(emchk.value)){
//emmsg.innerHTML="";
//emmsg.style.color="green";
//em = true;
//}else{
//emmsg.innerHTML="이메일 주소를 다시 확인해 주세요.";
//emmsg.style.color="red";
//em = false;
//}
//}

$("#email_address").on("change",function(){
	$("#direct").val(this.value.slice(1));
	if($("#email_address").val()=="@user"){
		$("#direct").val("");
		$("#direct").attr("readonly",false);
		$("#direct").css("background-color","white");
	}else{
		$("#direct").val(this.value.slice(1));
		$("#direct").attr("readonly",true);
		$("#direct").css("background-color","#e7e7e7");
	}
})

var em = false;
let emm = false;
$("#email").on("keyup",function(){
	
	const Email = /^([a-z0-9_\.-]+)$/g;
	if($("#email").val()==""){
		$("#email_msg").text("필수입력정보입니다.").css("color","red");
		emm = false;
	}else if(Email.test($("#email").val())){
		$("#email_msg").text("");
		if($("#direct").val()!=""){
			$("#email_msg").text("인증").css("color","red");
		}
		emm = true;
	}else{
		$("#email_msg").text("이메일 주소를 다시 확인해 주세요.").css("color","red");
		emm = false;
	}
})

$("#email_btn").on("click",function(e){
	const Email_check= /^[0-9a-zA-Z]([-_.]?[0-9a-zA-Z])*.[a-zA-Z]{2,3}$/i;
	e.preventDefault();
	
	if($("#direct").val()==""){
		$("#email_msg").text("이메일을 입력해주세요.").css("color","red");
		emm = false;
	}
	if(emm){
		$("input[name='email']").val($("#email").val()+"@"+$("#direct").val());
		var emc=$("input[name='email']").val();
		if(Email_check.test($("#direct").val())){
			
			$("#email_msg").text("이메일 전송중...").css("color","green");
		}else{
			$("#email_msg").text("이메일 주소를 다시 확인해 주세요.").css("color","red");
		}

		emcheck(emc);
	}else{
		$("#email_msg").text("이메일 주소를 다시 확인해 주세요.").css("color","red");
//		alert("부적절한 이메일 입니다.")
	}
	
})

const checkInput = $('.mail_check_input') // 인증번호 입력하는곳 
function emcheck(email){
	console.log(email);
	$.ajax({
		type : 'get',
		url: "/member/emailchk/"+email,
		data:email,
		contentType: "application/json; charset=utf-8",
		success : function (data) {
			$("#email_msg").text("");
			console.log("data : " +  data);
			checkInput.attr('disabled',false);
			code =data;
			alert('인증번호가 전송되었습니다.')
		}
	})
//	.done(function(r){
//		alert("중복된 이메일 입니다.");
//		$("#email_msg").text("중복된 이메일 입니다.");
//		$("#email_msg").css("color","red");
//		em = false;
//	})
	.fail(function(){
		alert("실패.");
		$("#email_msg").text("실패");
		$("#email_msg").css("color","green");
		em = false;
	})
}

$("#email_address")
	// 인증번호 비교 
	// blur -> focus가 벗어나는 경우 발생
	$('.mail_check_input').blur(function () {
		const inputCode = $(this).val();
		const $resultMsg = $('#email_msg');
		
		if(inputCode === code){
			$resultMsg.html('인증번호가 일치합니다.');
			$resultMsg.css('color','green');
			em = true;
		}else{
			$resultMsg.html('인증번호가 불일치 합니다. 다시 확인해주세요!.');
			$resultMsg.css('color','red');
			em = false;
		}
	});









//var pchk=document.querySelector("#pchk");ms.emchk(email).getEmail(),HttpStatus.OK
//var pmsg=document.querySelector("#pmsg");
//var ph =false;
//pchk.onblur=function(){
//const phone = /^[0-9]{8,13}$/g;
//if (pchk.value==""){
//pmsg.innerHTML="필수입력정보입니다."
//pmsg.style.color="red";
//ph = false;
//}else if(phone.test(pchk.value)){
//pmsg.innerHTML="";
//pmsg.style.color="green";
//ph = true;
//}else{
//pmsg.innerHTML="전화번호를 다시 확인해 주세요.";
//pmsg.style.color="red";
//ph = false;
//}
//}



var ph = false;
//let phh =false;
$("#pchk").on("blur",function(){
	const phone = /^[0-9]{8,13}$/g;
	if($("#pchk").val()==""){
		$("#pmsg").text("필수입력정보입니다.").css("color","red");
//		phh = false;
	}else if(phone.test($("#pchk").val())){
		$("#pmsg").text("");
		$("input[name='phone']").val($("#front_num").val()+$("#pchk").val())
		var phc=$("input[name='phone']").val();


		phcheck(phc);
//		phh = true;
	}else{
		$("#pmsg").text("전화번호를 다시 확인해 주세요.").css("color","red");
//		phh = false;
	}
//	if(!ph){
//		$("#pmsg").text("전화번호 중복체크하세요.").css("color","red");
//	}
})


//$("#phbtn").on("click",function(e){
//	e.preventDefault();
//	if(phh){
//		$("input[name='phone']").val($("#front_num").val()+$("#pchk").val())
//		var phc=$("input[name='phone']").val();
//
//
//		phcheck(phc);
//	}else{
//		alert("부적절한 전화번호 입니다.")
//	}
//})

function phcheck(phc){
	console.log(phc);
	$.ajax({
		type: "get",
		url: "/member/signup/"+phc,
		data: phc,
		contentType: "application/json; charset=utf-8"
	})
	.done(function(r){
//		alert("중복된 전화번호 입니다.");
		$("#pmsg").text("이미 사용중인 전화번호 입니다.");
		$("#pmsg").css("color","red");
		ph = false;
	})
	.fail(function(){
//		alert("사용가능한 전화번호 입니다.");
		$("#pmsg").text("사용가능한 전화번호 입니다.");
		$("#pmsg").css("color","green");
		ph = true;
	})
}




//var signsub=document.querySelector("#signsub");
//signsub.onclick=function(e){
//if(!(id && pw && pw2 && na && em && ph && ad)){
//e.preventDefault();
//alert('입력해');
//}else{
//alert('가입됨');
//}
//}


const years=new Date().getFullYear();

for(i=years;i>years-100;i--){
	const year = `<option value='${i}'>${i}</option>`
		$("#birth_year").append(year);
}

for(i=1;i<=12;i++){
	const month = `<option value='${i}'>${i}</option>`
		$("#birth_month").append(month);
}
$("#birth_year").on("change",function(){
	$(this).val()
	$("#bichk").val($("#birth_year").val()+"-"+$("#birth_month").val()+"-"+$("#birth_date").val())
})

$("#birth_month").on("change",function(){
	
	let j=0;
	switch(Number($("#birth_month").val())){
	case 1:
	case 3:
	case 5:
	case 7:
	case 8:
	case 10:
	case 12:
		j=31;
		break;
	case 4:
	case 6:
	case 9:
	case 11:
		j=30;
		break;
	default:
		j=29;
		
	}
	if($(".days")!=null){
		$(".days").remove();
	}
	for(i=1;i<=j;i++){
		const date = `<option class="days" value='${i}'>${i}</option>`
			$("#birth_date").append(date);
			
	}
	$("#bichk").val($("#birth_year").val()+"-"+$("#birth_month").val()+"-"+$("#birth_date").val())
})

$("#birth_date").on("change",function(){
	$("#bichk").val($("#birth_year").val()+"-"+$("#birth_month").val()+"-"+$("#birth_date").val())
})


let ge = false;
function genderCheck(){
	if($("input[name=gender]:radio:checked").length<1){
		
		ge = false;
	}else{
		ge = true;
	}
}


let bi=false;
$(".birth_input").on("change",function(){
	if(isNaN($(this).val())){
			$(this).removeClass("check");
		
	}else{
		$(this).addClass("check");
	}
	$(".birth_input").each(function(){
		if($(this).attr("class") == "birth_input check"){
			bi=true;
		}else{
			bi=false;
			return false;
		}
		
	})
})



$("#signsub").on("click",function(e){
	e.preventDefault();

	genderCheck();
	
	if(!(id && pw && pw2 && na && em && ge && bi && ph)){

		alert('입력해');
	}else{
		$("input[name='email']").val();
		alert('가입됨');
		$("form[action='/member/signup']").submit();
	}
})
