/**
 * 
 */
$("#dcp").html($("#pp").val());
const proto = Number($("#pp").val());
const already = $("#already").val();
$("#cpno_val").val(already);
$(`#r${already}`).attr("checked",true);
const dc = Number($("#"+already).val());
if(dc < 100){
	$("#dcp").html(Math.floor(proto * (100-dc) / 100));
}else{
	$("#dcp").html(proto - dc);
}

$("input[name='sel']").on("click",function(){
	const cpreq = $(this).data("cpreq");
	const apply = $(this).data("apply");
	console.log($(this).data("apply"));
	if(apply){
		alert("이미 다른 상품에 적용된 쿠폰입니다.");
		return false;
	}else{
		if(cpreq > $("#bPriceS").val()){
			alert("최소주문금액보다 적어 쿠폰을 사용 하실 수 없습니다.");
			return false;
		}
	}
})

$("input[name='sel']").on("change",function(){
	$("#cpno_val").val($(this).val());
	$("#area_val").val($(this).data("area"));
	$("#type_val").val($(this).data("type"));
	console.log($("#area_val").val());
	console.log($("#type_val").val());
	const dc = Number($("#"+$(this).val()).val());
	if(dc < 100){
		if((proto * dc / 100) > $(this).data("cpmax")){
			$("#dcp").html(proto - $(this).data("cpmax"));
		}else{
			$("#dcp").html(Math.floor(proto * (100-dc) / 100));
		}
	}else{
		$("#dcp").html(proto - dc);
	}
})

const id = $("#id").val();
const pno = $("#pno_val").val();

$("#done").on("click", function() {
	const area = $("#area_val").val();
	const type = $("#type_val").val();
	const cpno = $("#cpno_val").val();
	const cData = {
			cpno:cpno,
			pno:pno,
			b_quantity:area,
			add_date:type,
			id:id
	}
	console.log(cData);
	if(cpno == 0){
		alert("쿠폰을 선택하세요.");
	}else{
		$.ajax({
			type:"put",
			url:"/applycoupon",
			data:JSON.stringify(cData),
			contentType:"application/json; charset=utf-8",
			success:function(){
				window.close();
			}
		})
	}
})

$(".cancel").on("click",function(){
	const cpno = $(this).data("cpno");
	if(!$("#r"+cpno).attr("checked")){
		alert("해당 쿠폰은 적용 되지않았습니다.");
	}else{
		if($("#cpno_val").val() == 0){
			alert("적용된 쿠폰이 없습니다.");
		}else{
			if(confirm("해당 쿠폰의 적용을 취소하시겠습니까?")){
				const cData = {
						cpno:0,
						pno:pno,
						b_quantity:area,
						add_date:type,
						id:id
				}
				$.ajax({
					type:"put",
					url:"/applycoupon",
					data:JSON.stringify(cData),
					contentType:"application/json; charset=utf-8",
					success:function(){
						alert("취소되었습니다.");
						$(`#r${$("#cpno_val").val()}`).removeAttr("checked");
						$("#dcp").html($("#pp").val());
						$("#cpno_val").val(0);
					}
				})
			}
		}
	}
})

$("#close").on("click",function(){
	window.close();
})

