/**
 * 
 */




	
	
	$.ajax({
		type:"get",
		url:"/memberList/select.json",
		contentType:"application/json; charset=utf-8"
	})
	.done(function(list){
		let mem='';
		list.forEach(function(m){
			mem+=`
				<p><img src="${m.userImg}" width="100px"> <a href="memberDetail?id=${m.id}">${m.id}</a></p>
				`
		})
		$("#member_list").html(mem);
	})
	
	
	$("input[type='button']").on("click",function(){
	alert("aaa");
})