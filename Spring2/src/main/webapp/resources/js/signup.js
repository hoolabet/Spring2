



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


var id = false;
let idd = false;
$("#idchk").on("blur",function(){ 
	const idid=/^[a-z0-9-_]{5,20}$/g;
	if($("#idchk").val()==""){
		$("#idmsg").text("필수입력정보입니다.");
		$("#idmsg").css("color","red");
		idd = false;
	}else if(idid.test($("#idchk").val())){ 
		$("#idmsg").text("");
		idd = true;
	}else{ 
		$("#idmsg").text("5~20의 소문자 숫자 특수기호 (-)(_)만 사용하여 입력하세요.");
		$("#idmsg").css("color","red");
		idd = false;
	}

})


$("#idbtn").on("click",function(e){
	e.preventDefault();
	if(idd){
		var idc=$("#idchk").val();

		idcheck(idc);

	}else{
		alert("부적절한 id 입니다.")
	}
})

function idcheck(idc){
	console.log(idc);
	$.ajax({
		type: "get",
		url: "/member/signup/"+idc,
		data: idc,
		contentType: "application/json; charset=utf-8"
	})
	.done(function(r){
		alert("중복된 id 입니다.");
		$("#idmsg").text("중복된 id 입니다.");
		$("#idmsg").css("color","red");
		id = false;
	})
	.fail(function(){
		alert("사용가능한 id 입니다.");
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
	if($("#pwchk2").val()===$("#pwchk").val()){
		$("#pwmsg2").text("정상입니다.").css("color","green");
		pw2 = true;
	}else{
		$("#pwmsg2").text("비밀번호가 일치하지 않습니다.").css("color","red");
		pw2 = false
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

var em = false;
let emm = false;
$("#email").on("blur",function(){
	const Email = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/g;
	if($("#email").val()==""){
		$("#email_msg").text("필수입력정보입니다.").css("color","red");
		emm = false;
	}else if(Email.test($("#email").val())){
		$("#email_msg").text("");
		emm = true;
	}else{
		$("#email_msg").text("이메일 주소를 다시 확인해 주세요.").css("color","red");
		emm = false;
	}
	emm=true;
})

$("#email_btn").on("click",function(e){
	e.preventDefault();
	if(emm){
		var emc=$("#email").val();
		emc=emc.slice(0,emc.length-4)

		emcheck(emc);
	}else{
		alert("부적절한 이메일 입니다.")
	}
})

function emcheck(emc){
	console.log(emc);
	$.ajax({
		type: "get",
		url: "/member/signup/"+emc,
		data: emc,
		contentType: "application/json; charset=utf-8"
	})
	.done(function(r){
		alert("중복된 이메일 입니다.");
		$("#email_msg").text("중복된 이메일 입니다.");
		$("#email_msg").css("color","red");
		em = false;
	})
	.fail(function(){
		alert("사용가능한 이메일 입니다.");
		$("#email_msg").text("사용가능한 이메일 입니다.");
		$("#email_msg").css("color","green");
		em = true;
	})
}

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
		$("#pmsg").text("전화번호를 다시 확인해 주세요.").css("color","red");
		ph = false;
	}
})


//var adchk=document.querySelector("#adchk");
//var admsg=document.querySelector("#admsg");
//var ad = false;
//adchk.onblur=function(){
//const add = /.{1,}/;
//if (!add.test(adchk.value)){
//admsg.innerHTML="필수입력정보입니다."
//admsg.style.color="red";
//ad = false;
//}else {
//admsg.innerHTML="";
//admsg.style.color="green";
//ad = true;
//}
//}

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


//var signsub=document.querySelector("#signsub");
//signsub.onclick=function(e){
//if(!(id && pw && pw2 && na && em && ph && ad)){
//e.preventDefault();
//alert('입력해');
//}else{
//alert('가입됨');
//}
//}

$("#signsub").on("click",function(e){
	if(!(id && pw && pw2 && na && em && ph && ad)){
		e.preventDefault();
		alert('입력해');
	}else{
		e.preventDefault();
		$("#email").val($("#email").val().slice(0,$("#email").val().length-4));
		alert('가입됨');
		$("form[action='/member/signup']").submit();
	}
})





