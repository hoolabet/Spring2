/**
 * 
 */

function couponView() {
	$.getJSON("/viewcoupon",0,function(res){
		let str ="";
		res.forEach(function(r) {
			str += `
				<tr>
					<td>이름 : <a href="/coupon/send?cpno=${r.cpno}">${r.cpname}</a></td>
					<td>타입 : ${r.cptype}</td>
					<td>할인율 : ${r.cpvalue}</td>
					<td>최소사용금액 : ${r.cpreq}</td>
					<td>최대적용금액 : ${r.cpmax}</td>
					<td><span class="remove" data-cpno="${r.cpno}" style:"cursor:pointer">❌</span></td>
				</tr>
				`;
		})
		$("#list").html(str);
		$(".remove").on("click",function(){
			if(confirm("삭제하시겠습니까?")){
				const cpno = {
						cpno:$(this).data("cpno")
				};
				$.ajax({
					type:"delete",
					url:"/deletecoupon",
					data:JSON.stringify(cpno),
					contentType:"application/json; charset=utf-8",
					success:function(){
						alert("삭제되었습니다.");
						couponView();
					}
				})
			}
		})
	})
}

couponView();

let num = "";
for(i = 0;i <= 20;i++){
	num = `<option value="${i*5000}">${i*5000} ₩</option>`;
	$("#cpreq").append(num);
}


$("#cptype").on("change",function(){
	if($(this).val() =="p"){
		let cpval = "";
		for(i=1;i<20;i++){
			cpval += `<option value="${i*5}">${i*5} %</option>`;
			cpmax += `<option value="${i*5000}">${i*5000} ₩</option>`;
		}
		$("#cpvalue").html(cpval);
		$("#cpmax").html(cpmax);
	}else if($(this).val() =="s"){
		let cpval = "";
		for(i=1;i<=50;i++){
			cpval += `<option value="${i*1000}">${i*1000} ₩</option>`;
			cpmax = `<option value="${i*1000}">${i*1000} ₩</option>`;
		}
		$("#cpvalue").html(cpval);
		$("#cpmax").html(cpmax);
	}else{
		let cpval = "";
		$("#cpvalue").html(cpval);
	}
})



$("#create").on("click", function() {
	const cpname = $("#cpname").val();
	const cptype = $("#cptype").val();
	const cpvalue = $("#cpvalue").val();
	const cpreq = $("#cpreq").val();
	const cpmax = $("#cpmax").val();
	
	const cData = {
			cpname,
			cptype,
			cpvalue,
			cpreq,
			cpmax
	};
	
	if(cpname == "" || cptype == "" || cpvalue == null || cpmax == null){
		alert("쿠폰 정보를 모두 입력하세요.");
	}else{
		$.ajax({
			type:"post",
			url:"/createcoupon",
			data:JSON.stringify(cData),
			contentType:"application/json; charset=utf-8",
			success:function(){
				alert("쿠폰이 생성되었습니다.");
				couponView();
			}
		})
	}
})