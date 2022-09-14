/**
 * 아이디 찾기
 */




$("input[type=radio]").on("change", function(){
	$("#findIdEP").val("");
	findId();
})

findId();



function findId(){
	let value = $("input[type=radio][name=findId]:checked").val();
	if (value==="p") {
		$("#findIdEP").attr("placeholder","전화번호");
		$("#findIdEP").attr("name","phone");	  	
    }else if(value==="e"){
    	$("#findIdEP").attr("placeholder","이메일");
    	$("#findIdEP").attr("name","email");
    }
	  
}
	
	
