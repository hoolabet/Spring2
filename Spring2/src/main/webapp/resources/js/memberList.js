/**
 * 
 */


loadMemberList("");

	
function loadMemberList(id) {	
console.log("id="+id);

$.getJSON("/memberList/select.json",{id:id},function(list){
	console.log(list);
	let mem='';
	list.forEach(function(m){
		mem+=`
			<p><img src="${m.userImg}" width="100px"> <a href="memberDetail?id=${m.id}">${m.id}</a></p>
			`
	})
	$("#member_list").html(mem);
})
//	$.ajax({
//		type:"get",
//		url:"/memberList/select/"+id+".json",
//		data:id,
//		contentType:"application/json; charset=utf-8",
//		success:function(list){
//			let mem='';
//			list.forEach(function(m){
//				mem+=`
//					<p><img src="${m.userImg}" width="100px"> <a href="memberDetail?id=${m.id}">${m.id}</a></p>
//					`
//			})
//			$("#member_list").html(mem);
//		},error:function(){
//			alert("aaa");
//		}
//	})
	
}	
	
$("input[type='button']").on("click",function(){
	const id= $("#id").val();
	console.log(id);
	loadMemberList(id);	
})