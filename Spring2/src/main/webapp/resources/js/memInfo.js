
const emailArr=$("#email_all").val().split("@")	
$("#email_val").val(emailArr[0]);
$("#email_address").val($("#user_email").val());

let emailAddChk = true;
$(".NG_email").each(function(i,mm){
	if(mm.value.includes(emailArr[1])){
		$("#email_address").val(mm.value);
		$("#direct").val(emailArr[1]);
		$("#direct").attr("readonly",true);
		$("#direct").css("background-color","#e7e7e7");
		emailAddChk = false;
	}
})
console.log(emailAddChk)
if(emailAddChk){

	$("#direct").val(emailArr[1])
}else{

}




$("#email_address").on("change",function(){
	$("#direct").val(this.value.slice(1));
	if($("#email_address").val()==$("#user_email").val()){
		$("#direct").val(emailArr[1]);
		$("#direct").attr("readonly",false);
		$("#direct").css("background-color","white");
	}else{
		$("#direct").attr("readonly",true);
		$("#direct").css("background-color","#e7e7e7");
	}
})



//이메일 수정

var email_chk = true;
$("#email_val").on("blur",function(){
	const Email = /^([a-z0-9_\.-]+)$/g;
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
		$("input[name='email']").val($("#email_val").val()+"@"+$("#direct").val());
		const emc=$("input[name='email']").val()
		console.log(emc);
		emcheck(emc);


	}else{
		alert("이메일 주소를 다시 확인해 주세요.");
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
	})
	.fail(function(){
		var id=$("#id").val();
		var email=$("input[name='email']").val();
		alert("id="+id+", email="+email);
		modifyEmail({id:id,email:email});
	})
}
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




//전화번호 수정

let userPhoneNum=($("input[name='phone']").val()).slice(3);
let userPhone=($("input[name='phone']").val()).slice(0,-8);
$("#phone_val").val(userPhoneNum);
$("#phone_number").val("!"+userPhone);
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

	if(phone_chk){
		$("input[name='phone']").val($("#phone_number").val()+$("#phone_val").val());
		const pmc=$("input[name='phone']").val()
		console.log(pmc);
		phcheck(pmc);


	}else{
		alert("전화번호를 다시 확인해 주세요.");
	}
})
function phcheck(pmc){
	console.log(pmc);
	$.ajax({
		type: "get",
		url: "/member/signup/"+pmc,
		data: pmc,
		contentType: "application/json; charset=utf-8"
	})
	.done(function(r){
		alert("중복된 전화번호 입니다.");
		$("#phone_msg").text("중복된 전화번호 입니다.");
		$("#phone_msg").css("color","red");
	})
	.fail(function(){
		var id=$("#id").val();
		var phone=($("input[name='phone']").val()).slice(1);
		alert("id="+id+", phone="+phone);
		modifyPhone({id:id,phone:phone});
	})
}

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




//비밀번호 수정	

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


//계정삭제

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


$("#modify_img").on("click",function(){
	$("#user_imgfile").click();
})

$("#user_imgfile").on("change",function(){
	var formData=new FormData();

	var inputFile=$("#user_imgfile");

	// console.log(inputFile);
	var files=inputFile[0].files;

	console.log(files);

	for(var i=0;i<files.length;i++){

		// 함수호출(checkExtension)
		if(!checkExtension(files[i].name,files[i].size)){
			return false;
		}


		// .jap의 파일선택을 통해 선택한 파일들을 form태그에 추가
		formData.append("uploadFile",files[i]);
	}

	// ajax를 통해서 UploadController에 파일 관련 데이터 전송
	$.ajax({
		type:"post",
		url:"/member/uploadAjaxAction",
		data:formData,
		contentType:false,
		processData:false,
		dataType:"json",
		success:function(result){
			console.log(result);

			var input="";
			result.forEach(function(a,i){
				// 만약 image결과가 true면 아래에 있는것 실행
				if(a.checkI==true){  //if(a.image)라고만 해도 true임

					var filePath=encodeURIComponent(`${a.path}/s_${a.uuid}_${a.fileName}`);
					console.log(filePath);
					input+=
						`
						<input type="hidden" id="fullPath" name="member[${i}].userImg" value="${filePath}">`;
					$("#user_img").css("background-image","url(display?fileName="+filePath+")")


				}else{  //그렇지 않으면 다운로드 할 수 있도록 실행
					alert("이미지를 선택해주세요.")						
				}
			})// for end

			$("#form").html(input);
		}
	})

})



//함수선언
//정규식을 이용하여 확장자 제한
var reg = new RegExp("(.*?)\.(exe|zip|alz)$")
//최대크기를 설정하여 그 이상이면 제한
var maxSize=5242880;  // 5MB
//파일이름, 파일크기
function checkExtension(fileName, fileSize){
	// 파일 크기 제한
	// 실제파일의 크기 >= 최대크기
	if(fileSize >= maxSize){
		alert("파일 사이즈 초과");
		return false;
	}
	// 확장자 제한
	// 실제 파일명의 확장자와 정규식 비교
	// 정규식이면
	if(reg.test(fileName)){
		alert("해당종류의 파일은 업로드 할 수 없습니다.");
		return false;
	}
	return true;
}

$("#modify_u_img").on("click",function(){
	const id=$("#id").val();
	let userImg;
	if($("#fullPath").val()==null){
		alert("사진을 업로드 하세요.");
		return false;
	}else{
		userImg=`display?fileName=${$("#fullPath").val()}`;
		
	}
	const D={id:id,userImg:userImg};
	modifyUserImg(D);
})
function modifyUserImg(D){
	$.ajax({

		type:"put",
		url:"/member/modifyUImg",
		data:JSON.stringify(D),
		contentType:"application/json; charset=utf-8",
		success:function(result){
			if(result=="success"){
				alert("프로필 사진 수정 성공")
			}
		}
	})
}



