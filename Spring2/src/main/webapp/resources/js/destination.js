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
			$("#des").html("배송지를 추가하세요")
		}else{
			res.forEach(function(r){
				des+=`
					<div class="modi_box" id="${r.dno}">
						<div class="modi_box_text">
						<h4 class="modi_text">배송지명</h4>
						<input type="text" class="mody_text_input" id="dname${r.dno}" value="${r.dname}">
						<h4 class="modi_text">수령인</h4>
						<input type="text" class="mody_text_input" id="name${r.dno}" value="${r.name}">
						<h4 class="modi_text">수령인 번호</h4>
						<input type="text" class="mody_text_input" id="phone${r.dno}" value="${r.phone}">
						<h4 class="modi_text">주소</h4>
						<input type="text" class="mody_text_input" id="address${r.dno}" value="${r.address}">
						<h4 class="modi_text">배송 요청사항</h4>
						<input type="text" class="mody_text_input" id="dmemo${r.dno}" value="${r.dmemo}">
						<img class="modi_input" width="50px" src="https://illustoon.com/photo/dl/3122.png">
						<img class="remove_input" width="40px" src="https://cdn-icons-png.flaticon.com/512/75/75519.png">
						</div>
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


let dn = true;
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

let dm = true;
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
			alert("배송지가 등록되었습니다.");
			setTimeout(function(){
			getDes();
			},1000)
			$("#dname").val("집")
			$("#name").val("")
			$("#phone").val("")
			$("#address").val("")
			$("#dmemo").val("문 앞에 놓아주세요.")
			getDes();
		}
	})
}








