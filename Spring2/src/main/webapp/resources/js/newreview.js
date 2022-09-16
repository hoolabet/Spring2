/**
 * 리뷰 더보기 페이지
 */
$(document).ready(function(){
	
	var pnoVal=$("#pno").val();
	
	scope(pnoVal);
	
	// 평점 함수 선언
	function scope(pno){
		$.getJSON("/reviewlist/"+pno+".json",function(data){
			
			var str="";
			
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
	
			
			str+="<table>";
				str+="<tr><th rowspan='5' class='RStitle'>평균평점</th>"
				str+="<td rowspan='5'>"+avg+"</td>"
				str+="<th class='RStitle'>5점</th>"
				str+="<td>"+sc5+"</td></tr>"
				str+="<th class='RStitle'>4점</th>"
				str+="<td>"+sc4+"</td></tr>"
				str+="<th class='RStitle'>3점</th>"
				str+="<td>"+sc3+"</td></tr>"
				str+="<th class='RStitle'>2점</th>"
				str+="<td>"+sc2+"</td></tr>"
				str+="<th class='RStitle'>1점</th>"
				str+="<td>"+sc1+"</td></tr>"
			str+="</table>"
				
				$("#scopecnt").html(str);	
		})
		
		
		
	} // scope 끝
	
});

