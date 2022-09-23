/*
 * 문의 in detail
 */
$(document).ready(function(){
	var pnoVal=$("#pno").val();
	var idVal=$("#id").val();
	var login=$("input[id=id]").val();
	
	// 문의 리스트 in detail함수 사용
	ilid(pnoVal);
	
	
	// 아이디 마스킹 처리
	$(".name").each(function(j){
		var idval = $(this).val();
		
		console.log(idval)
	})
	
	
	
	
	// 문의 리스트 in detail함수 선언
	function ilid(pno){
		
		var str="";
		str+="<div class='title'>문의사항 보기</div>";
		
		$.getJSON("/inquirylist/"+pno+".json",function(data){
			str+=	`<div id="Iwritelink">`;
			if(idVal!=""){
				str+=`<a href="/board/inquirywrite?pno=${pno}" id="iwlink">문의 작성하기</a>`
			}else{
				str+=`<p>문의사항을 작성하시려면 <a href="../member/login">로그인</a>해 주세요</p>`;
			}	
			str+=	`</div>`;	
			
			
			console.log(data)
			
			
			
			if(data==""){
				str+=`<p>작성된 문의사항이 없습니다.`;
			}else{
				str+="<div id='Ilist'>";
				
				for(var i=0; i<data.length; i++){
					
					// 아이디 마스킹
					var idi = data[i].id
					var msk = idi.replace(/(?<=.{1})(?=.{2})./gi, "*");
//					console.log("아이디 마스킹 처리"+i+":"+msk)
					
					// secret 여부
					var sc = data[i].secret;
//					console.log("secret 여부"+i+":"+sc);
					
					// 글 작성 id
					console.log("글 작성 id"+i+":"+idi);
					
					
					str+="<table border='1'>";
						str+="<tr class='hidden'><th>문의번호</th>";
						str+="<td colspan='3'>"+data[i].ino+"</td></tr>";
						str+="<tr><th>아이디</th>";
						str+="<td class ='id'>"+msk+"</td>";
						str+="<th>등록일</th>";
						str+="<td>"+data[i].regdate+"</td></tr>";
						str+="<tr><th>문의</th>";
						// question
						if(sc == 1){
							str+="<td colspan='3'>비밀글 입니다.</td></tr>";
						}else{
							str+="<td colspan='3'>"+data[i].question+"</td></tr>";
						}
						// answer
						
						if(data[i].answer!=null && sc == 1 && login != data[i].id && login != 'aaaaa'){
							str+="<tr id='answer'><th>답변</th>";
							str+="<td colspan='3'>비밀글 입니다.</td></tr>";
						}else if(data[i].answer!=null){
							str+="<tr id='answer'><th>답변</th>";
							str+="<td colspan='3'>"+data[i].answer+"</td></tr>";
						}else{
							
						}
					str+="</table>";
					if(i==4){
						break;
					}
				
				}
	
				
				str+="</div>";
				str+="<div id='Imore'>";
				str+="<a href='/board/inquiry?pno="+pno+"'>문의사항 더보기</a>";
				str+="</div>";
			}
	
			console.log("check");
			
			$("#privqna").html(str);
		})
	} // ilid 끝
	
	// 아이디 마스킹 처리
	$(".name").each(function(j){
		var idval = $(this).val();
		
		console.log(idval)
	})
	
	
	
	
});