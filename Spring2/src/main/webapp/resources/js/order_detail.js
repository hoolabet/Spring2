/**
 * 
 */
let pnoArr = [];
$(".pno").each(function() {
	pnoArr = [...pnoArr, $(this).val()];
})
$("#point_span").html(Math.ceil($("#point_span").data("point")));
pnoArr.forEach(function(p) {
	const bp = $(`#${p}_bp`).val();
	const cpvalue = $(`#${p}_cpvalue`).val();
	const cpmax = $(`#${p}_cpmax`).val();
	let ap = 0;
	
	if(cpvalue < 100){
		if((bp * cpvalue / 100) > cpmax){
			ap = bp - cpmax;
		}else{
			ap = Math.floor(bp * (100 - cpvalue) / 100);
		}
	}else{
		ap = bp - cpvalue;
	}
	$(`#${p}_p`).html(ap);
})