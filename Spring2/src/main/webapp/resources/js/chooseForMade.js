/**
 * 
 */

const choose = ["1","2","3"];

choose.forEach((x) => {
	$(".choose_" + x).on("change",function(){
		$("#result_" + x).text(this.value);
	})
})

$(".opt_color").on("click",function(){
	$(".opt_color").css("width","30px");
	$(".opt_color").css("height","30px");
	$(".opt_color").css("borderRadius", "15px");
    $("#result").css("backgroundColor",$(this).css("backgroundColor"));
	$(this).css("width","40px");
	$(this).css("height","40px");
	$(this).css("borderRadius", "20px");
	if(this.id == "white" || this.id == "yellow"){
		$("#result").css("color","black");
	}else {
		$("#result").css("color","white");
	}
})

