/**
 * 아이디 찾기
 */


let str="";

$("input[type=radio]").on("change", function(){
	findId();
})

findId();

function findId(){
	let value = $("input[type=radio][name=findId]:checked").val();
	  if (value==="p") {
		  str=`<input type="text" placeholder="전화번호" name="phone" class="findIdInput" id="findIdPhone">
			  	`
    }else if(value==="e"){
  	  str=`<input type="text" placeholder="이메일" name="email" class="findIdInput" id="findIdEmail">`
    }
	  $("#EorP").html(str);
}


	
	
