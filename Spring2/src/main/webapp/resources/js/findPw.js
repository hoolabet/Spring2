/**
 * 비밀번호 찾기
 */




$("input[type=radio]").on("change", function(){
	findPw();
})

findPw();



function findPw(){
	let value = $("input[type=radio][name=findPw]:checked").val();
	if (value==="p") {
		$("#findPwEP").attr("placeholder","전화번호");
		$("#findPwEP").attr("name","phone");	  	
    }else if(value==="e"){
    	$("#findPwEP").attr("placeholder","이메일");
    	$("#findPwEP").attr("name","email");
    }
	  
}