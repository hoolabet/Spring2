/**
 * 
 */

const choose = ["1","2","3","4","5"];

choose.forEach((x) => {
	$(".choose_" + x).on("change",function(){
		$("#result_" + x).text(this.value);
	})
})

let checkColor = false

$(".opt_color").on("click",function(){
	$(".opt_color").css("width","30px");
	$(".opt_color").css("height","30px");
	$(".opt_color").css("borderRadius", "15px");
    $("#result").css("backgroundColor",$(this).css("backgroundColor"));
	$(this).css("width","40px");
	$(this).css("height","40px");
	$(this).css("borderRadius", "20px");
	$("#value_color").val(this.id);
	if(this.id == "white" || this.id == "yellow"){
		$("#result").css("color","black");
	}else {
		$("#result").css("color","white");
	}
	checkColor = true;
})

$("#sub").on("click",function(e){
	e.preventDefault();
	if($("input[name='id']").val()==""){
		alert("로그인이 필요합니다.");
		location.href = "/member/login";
		return false;
	}
	let checkSelect = true;
	choose.forEach((x) => {
		if($("#result_"+x).text() == "" || !checkColor){
			checkSelect = false;
		}
	})
	if(checkSelect){
		try {
			alert("저장되었습니다.");
			$('form[action="/made/chooseForMade"]').submit();
		} catch (e) {

		}
	}else{
		alert("옵션을 선택해주세요.");
	}
})