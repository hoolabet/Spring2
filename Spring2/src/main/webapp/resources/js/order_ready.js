/**
 * 
 */
const id = $("input[name='id']").val();
let lastPrice = 0;
sumPrice();
$(".prices").on("change", function() {
	sumPrice();
})
function sumPrice() {	
	$(".prices").each(function(i,p) {
		lastPrice += Number(p.innerText);
	})
	$("#last_price").html(lastPrice);
	$("input[name='price']").val(lastPrice);
	lastPrice = 0;
}

$("input[name='destination']").on("change", function() {
	$("#dname").val($(`#${$(this).attr("id")}_dname`).val());
	$("#name").val($(`#${$(this).attr("id")}_name`).val());
	$("#phone").val($(`#${$(this).attr("id")}_phone`).val());
	$("#address").val($(`#${$(this).attr("id")}_address`).val());
	$("#dmemo").val($(`#${$(this).attr("id")}_dmemo`).val());
})

let pnoArr = [];
$(".order_pno").each(function(i,p) {
	pnoArr = [...pnoArr,...p.value];
})
console.log(pnoArr)

$("#pay").on("click", function(e) {
	e.preventDefault();
	pnoArr.forEach(function(p) {
		const dataP = {id:id, pno:p};
		$.getJSON("/orderlist",dataP,function(res){
			console.log(res);
		})
	})
})