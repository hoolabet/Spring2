/**
 * 
 */
function categorySelect(data){
	
	$.getJSON("/categoryget",{cname:data},function(res){
		let str = "";
		res.forEach(function(r) {
			str =`<option value="${r.cno}">${r.cname}</option>`;
			$("#category_"+data).append(str);
		})
	})
}

categorySelect("area");
categorySelect("type");

$("#send").on("click",function(){
	$.getJSON("/memberList/select",{id:null},function(res){
		let cnt = 0;
		console.log(res.length);
		res.forEach(function(r) {
			cnt++;
			const cData = {
					id:r.id,
					category_area:$("#category_area").val(),
					category_type:$("#category_type").val(),
					cpno:$("#cpno").val()
			};
			$.ajax({
				type:"post",
				url:"/sendcoupon",
				data:JSON.stringify(cData),
				contentType:"application/json; charset=utf-8",
				success:function(){
				}
			})
		})
		if(res.length == cnt){
			alert("지급이 완료되었습니다.");
			location.href = "/coupon/create";
		}
	})
})