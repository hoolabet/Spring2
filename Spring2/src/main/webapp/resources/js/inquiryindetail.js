/*
 * 문의 in detail
 */
$(document).ready(function(){
	var pnoVal=$("#pno").val();
	var idVal=$("#id").val();
	
	// 문의 리스트 in detail함수 사용
	ilid(pnoVal);
	
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
					
					str+="<table border='1'>";
						str+="<tr><th>문의번호</th>";
						str+="<td colspan='3'>"+data[i].ino+"</td></tr>";
						str+="<tr><th>아이디</th>";
						str+="<td>"+data[i].id+"</td>";
						str+="<th>등록일</th>";
						str+="<td>"+data[i].regdate+"</td></tr>";
						str+="<tr><th>문의</th>";
						str+="<td colspan='3'>"+data[i].question+"</td></tr>";
						if(data[i].answer==null){
						}else{
							str+="<tr><th>답변</th>";
							str+="<td colspan='3'>"+data[i].answer+"</td></tr>";
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
});