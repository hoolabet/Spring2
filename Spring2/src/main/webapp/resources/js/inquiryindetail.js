/**
 * 문의 in detail
 */
$(document).ready(function(){
	var pnoVal=$("#pno").val();
	var idVal=$("#id").val();
	
	// 문의 리스트 in detail함수 사용
	ilid(pnoVal);
	
	// 문의 리스트 in detail함수 선언
	function ilid(pno){
		
		var str=""
		
		str+=`<div class="title">문의사항 보기</div>`;
		
		$.getJSON("/inquirylist/"+pno+".json",function(data){
			if(idVal!=""){	
				str+="<div id='Rwritelink'>";	
				str+="<a href='/board/inquirywrite?pno="+pno+"' id='iwlink'>문의하기</a>";
				str+="</div>";
			}
			if(data==""){
				str+=`<p>작성된 문의사항이 없습니다.`;
			}else{
				for(var i=0; i<data.length; i++){
					str+=`<p>dd
						<table>
							<tr>
								<th>아이디</th><td>${data.id}</td>
								<th>등록일</th><td>${data.regdate}</td>
							</tr>
							<tr id="question">
								<th>질문</th>
								<td colspan="3">${data.question}</td>
							</tr>
							<tr id="answer">
								<th>답변</th>
								<td colspan="3">${data.answer}</td>
							</tr>
						</table>`;
				}
			}
		})
		$("#privqna").html(str);
	} // ilid 끝
});