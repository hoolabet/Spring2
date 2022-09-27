/**
 * 리뷰 리스트 in detail
 */
$(document).ready(function(){
	
	var pnoVal=$("#pno").val();
	var idVal=$("#id").val();
	var page = 1;
	// 리뷰 리스트 in detail함수 사용
	list(pnoVal,num);
	
	// 리뷰 리스트 in detail 함수 선언
	 function list(pno,num){
		
		var str=""
		var input=""
		var curPage = num.value;
		console.log(curPage)
		str+="<div class='title'>리뷰보기</div>";
		
		$.getJSON("/reviewlist/"+pno+".json",function(data){
			const total = data.length;
			var totalPages = Math.ceil(total/10);
			if(idVal!=""){	// 주문내역이 있는 경우 보이게 추가해야함
				str+=`<div id='Rwritelink'><p>리뷰를 작성하시려면 <a href="../member/login">로그인</a>해 주세요</p></div>`;
			}else{
				str+=`<div id='Rwritelink'><a href='/board/reviewwrite?pno="+pno+"' id='rwlink'>리뷰 작성하기</a></div>`
			}
			
			console.log(data);
			
			if(data==""){
				str+=`<p>작성된 리뷰가 없습니다.`;
			}else{
				str+=`<div id="index">
						<a href="/board/detail?pno=${pro.pno}&array=recent#reviewlist">최신순 /</a>
						<a href="/board/detail?pno=${pro.pno}#reviewlist"> 베스트순</a>
					</div> 
					<h3>리뷰 목록</h3>`
				
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
					str+="<tr><th rowspan='5' class='RStitle'>평균평점</th>"
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
				
				
				
				for( i=0; i<data.length; i++){
					
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
						str+="<tr><th>사진</th>";										
						str+="<td colspan='3'><img src='/display?fileName="+filePath+"'></td></tr>";
						str+="<tr><th>내용</th>";
						str+="<td colspan='3'>"+data[i].content+"</td></tr>";
					str+="</table>";
					
					if(i==4){
						break;
					}
					
				}//for문 끝
				
				str+="</div>";
				str+="<div id='Rmore'>";
				str+="<a href='/board/newreview?pno="+pno+"'>리뷰 더보기</a>";
				str+="</div>";
			}
			$("#reviewlist").html(str);
			//paging(curPage,totalPages,"list",data);
			//Reviewlist(curPage,5,data);
			
		})
		$("#reviewlist").html(str);
		
	} // list 끝
	
	 function paging(curPage,total,fun,data){
		 	
			const amount = 5;
			let pageNum = 1;
			let endPage = Math.ceil(pageNum/10.0)*10;
			let startPage = endPage-9;
			let realEnd = Math.ceil(total*10/amount);
			let input = "";
			
			if(realEnd< endPage){
				endPage = realEnd;
			}
			if(curPage>1 && amount<curPage){
			input += `<a href="javascript:${fun}(${pno},1);" id="p-1">1</a>`;
			}
			
			for(let j=startPage; j<=endPage; j++){
				
			if(j ==curPage){
				input += `<a href="javascript:void(0);"><strong>${j}</strong></a>`;
				}
			else{
				input += `<a href="javascript:${fun}(${pno},${j})" id="p-${j}">${j}</a>`;
			}
			}
			console.log(input)
			$("#reviewPaging").html(input);
		}
	
	 function Reviewlist(curPage,amount,data){
			let li = "";
			curPage = Number(curPage);
			amount = Number(amount);
			
			for(var i = (curPage-1)*amount; i< (curPage-1)*amount+amount;i++){
				li+=`image[${i}]`
			}
			$("#reviewl").html(li);
		}
	
	
	 
	
	
});