/**
 * 
 */

const id=$("#id").val();
function getDes(){
	$.ajax({
		type:"get",
		url:"/destination/select/"+id+".json",
		data:id,
		contentType:"application/json; charset=utf-8"
	})
	.done(function(res){
		let des='';
		console.log(res);
		if(res.length==0){
			$("#des").html("없음")
		}else{
			res.forEach(function(r){
				des+=`
					<div class="modi_div" id="${r.dno}">
					<p>배송지명 : <input type="text"id="dname${r.dno}" value="${r.dname}"></p>
					<p>수령인 : <input type="text" id="name${r.dno}" value="${r.name}"></p>
					<p>수령인 번호 : <input type="text" id="phone${r.dno}" value="${r.phone}"></p>
					<p>주소 : <input type="text" id="address${r.dno}" value="${r.address}"></p>
					<p>배송 요청사항 : <input type="text" id="dmemo${r.dno}" value="${r.dmemo}"></p>
					<img class="modi_input" width="50px" src="https://illustoon.com/photo/dl/3122.png">
					<img class="remove_input" width="50px" src="https://cdn-icons-png.flaticon.com/512/75/75519.png">
					</div>
					<br>
					`
			})
			$("#des").html(des)
			$(".modi_input").on("click",function(){
				const values={
						dno:$(this).parent().attr("id"),
						dname:$("#dname"+$(this).parent().attr("id")).val(),
						name:$("#name"+$(this).parent().attr("id")).val(),
						phone:$("#phone"+$(this).parent().attr("id")).val(),
						address:$("#address"+$(this).parent().attr("id")).val(),
						dmemo:$("#dmemo"+$(this).parent().attr("id")).val()
				}
				modifyDes(values);
			})
			$(".remove_input").on("click",function(){
				if(confirm("삭제하시겠습니까?")){
				const values=$(this).parent().attr("id")
				removeDes(values);
				}
			})
		}
	})
}
getDes();

function modifyDes(a){
	$.ajax({
		type:"put",
		url:"/destination/update",
		data:JSON.stringify(a),
		contentType:"application/json; charset=utf-8",
		success:function(){
			alert("수정성공");
			getDes();
		}
	})
}

function removeDes(a){
	console.log(a);
	$.ajax({
		type:"delete",
		url:"/destination/delete",
		data:a,
		contentType:"application/json; charset=utf-8",
		success:function(){
			alert("삭제성공");
			getDes();
		}
	})
}

$("#input_toggle").on("click",function(){
	$(".toggle").toggle();
	$("#address").val("");
	if($(this).val()=="입력창 닫기"){
		$(this).val("배송지 추가");
	}else{
		$(this).val("입력창 닫기");
	}
})


let dn = false;
$("#dname").on("blur",function(){
	if($(this).val()==""){
		dn=false;
	}else{
		dn=true;
	}
})

let na = false;
$("#name").on("blur",function(){
	if($(this).val()==""){
		na=false;
	}else{
		na=true;
	}
})

let ph = false;
$("#phone").on("blur",function(){
	if($(this).val()==""){
		ph=false;
	}else{
		ph=true;
	}
})

let ad = false;
$("#address").on("blur",function(){
	if($(this).val()==""){
		ad=false;
	}else{
		ad=true;
	}
})

let dm = false;
$("#dmemo").on("blur",function(){
	if($(this).val()==""){
		dm=false;
	}else{
		dm=true;
	}
})

$("#add_btn").on("click",function(){
	if(!(dn && na && ph && ad && dm)){
		alert('모두 입력하세요.');
	}else{
		const values={
				id:id,
				dname:$("#dname").val(),
				name:$("#name").val(),
				phone:$("#phone").val(),
				address:$("#address").val(),
				dmemo:$("#dmemo").val()
		}
		addDes(values)
	}
})


function addDes(a){
	$.ajax({
		type:"post",
		url:"/destination/insert",
		data:JSON.stringify(a),
		contentType:"application/json; charset=utf-8",
		success:function(){
			alert("성공");
//			setTimeout(function(){
//			getDes();
//			},1000)
			getDes();
		}
	})
}








