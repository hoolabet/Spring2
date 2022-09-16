/**
 * 리뷰 리스트 in detail
 */
$(document).ready(function(){
	
	var pnoVal=$("#pno").val();
	var idVal=$("#id").val();
	
	// 리뷰 리스트 in detail함수 사용
	list(pnoVal);
	
	
	
	// 리뷰 리스트 in detail 함수 선언
	function list(pno){
		
		var str=""
		
		str+="<div class='title'>리뷰보기</div>";
		
		
		$.getJSON("/reviewlist/"+pno+".json",function(data){
			
			if(idVal!=""){	// 주문내역이 있는 경우 보이게 추가해야함
				str+="<div id='Rwritelink'>";	
				str+="<a href='/board/reviewwrite?pno="+pno+"' id='rwlink'>리뷰 작성하기</a>";
				str+="</div>";
			}
			
			
			console.log(data);
			
			if(data==""){
				str+=`<p>작성된 리뷰가 없습니다.`;
			}else{
				
				// 리뷰 평균 평점
				var sum=0;
				for(var i=0; i<data.length; i++){
					sum+=data[i].scope;
				}
				var avg=sum/data.length;
				
				// 리뷰 점수별 개수
				var sc5=0;
				var sc4=0;
				var sc3=0;
				var sc2=0;
				var sc1=0;
				
				for(let i=0; i < data.length; i++) {
				  if(data[i].scope === 5)  {
					  sc5++;
				  }
				  if(data[i].scope === 4)  {
					  sc4++;
				  }
				  if(data[i].scope === 3)  {
					  sc3++;
				  }
				  if(data[i].scope === 2)  {
					  sc2++;
				  }
				  if(data[i].scope === 1)  {
					  sc1++;
				  }
				}
				
				str+="<div id='Rscopecnt'>";
				str+="<table>";
					str+="<tr><td rowspan='5' class='RStitle'>평균평점</td>"
					str+="<td rowspan='5'>"+avg+"</td>"
					str+="<td class='RStitle'>5점</td>"
					str+="<td>"+sc5+"</td></tr>"
					str+="<td class='RStitle'>4점</td>"
					str+="<td>"+sc4+"</td></tr>"
					str+="<td class='RStitle'>3점</td>"
					str+="<td>"+sc3+"</td></tr>"
					str+="<td class='RStitle'>2점</td>"
					str+="<td>"+sc2+"</td></tr>"
					str+="<td class='RStitle'>1점</td>"
					str+="<td>"+sc1+"</td></tr>"
				str+="</table>"
				str+="</div>"
				
				str+="<div id='Rlist'>";
					
				for(var i=0; i<data.length; i++){
					
					var filePath = encodeURIComponent(data[i].uploadpath+"/s_"+data[i].uuid+"_"+data[i].filename);
					
					str+="<table border='1'>";
						str+="<tr><th>리뷰번호</th>";
						str+="<td colspan='3'>"+data[i].rno+"</td></tr>";
						str+="<tr><th>아이디</th>";
						str+="<td>"+data[i].id+"</td>";
						str+="<th>등록일</th>";
						str+="<td>"+data[i].regdate+"</td></tr>";
						str+="<tr><th>평점</th>";
						str+="<td colspan='3'>"+data[i].scope+"</td></tr>";
						str+="<tr><th>사진</th>";										// 사진 경로 오류
						str+="<td colspan='3'><img src='/display?fileName="+filePath+"'></td></tr>";
						str+="<tr><th>내용</th>";
						str+="<td colspan='3'>"+data[i].content+"</td></tr>";
					str+="</table>";
					if(i==4){
						break;
					}
				}
				
				str+="</div>";
				str+="<div id='Rmore'>";
				str+="<a href='/board/newreview?pno="+pno+"'>리뷰 더보기</a>";
				str+="</div>";
			}
				$("#reviewlist").html(str);
			
		})
		
		$("#reviewlist").html(str);
		
	} // list 끝
	
	
	
});