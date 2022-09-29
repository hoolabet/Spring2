/**
 * 
 */

$(".cart_btn").on("click",function(){
	const id = $(`#${$(this).data("mno")}`).data("id");
	const kind = $(`#${$(this).data("mno")}`).data("kind");
	const ingre = $(`#${$(this).data("mno")}`).data("ingre");
	const len1 = $(`#${$(this).data("mno")}`).data("len1");
	const len2 = $(`#${$(this).data("mno")}`).data("len2");
	const len3 = $(`#${$(this).data("mno")}`).data("len3");
	const color = $(`#${$(this).data("mno")}`).data("color");
	
	const price = 100000;
	const pname = id;
	const content = `가로:${len1},세로:${len2},높이:${len3},색상:${color}`;
	const quantity = 1;
	const delivery = "조립배송";
	const quality = ingre;
	const category_area = 100;
	const category_type = kind;
	
	const mData = {
			price,
			pname,
			content,
			quantity,
			delivery,
			quality,
			category_area,
			category_type
	}
	console.log(mData);
	$.ajax({
		type:"post",
		url:"/madeaddproduct",
		data:JSON.stringify(mData),
		contentType:"application/json; charset=utf-8",
		success:function(){
		},
		error:function(){
			$.ajax({
				type:"post",
				url:"/madeaddcart",
				data:JSON.stringify({id:pname}),
				contentType:"application/json; charset=utf-8",
				success:function(){
					alert("성공")
				},
			})
		}
	})
})

$(".made_remove").on("click",function(){
	const mno = {mno:$(this).data("mno")};
	
	$.ajax({
		type:"delete",
		url:"/maderemove",
		data:JSON.stringify(mno),
		contentType:"application/json; charset=utf-8",
		success:function(){
			alert("삭제되었습니다.");
			location.href="/made/list";
		}
	})
})