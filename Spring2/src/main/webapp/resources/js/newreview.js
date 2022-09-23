/**
 * 리뷰 더보기 페이지
 */


var pnoVal=$("#pno").val();
var idVal = $("id").val();
scope(pnoVal);

// 평점 함수 선언
function scope(pno){
	$.getJSON("/reviewlist/"+pno+".json",function(data){
		var str="";
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
 
		//str+=`<a href='/board/reviewwrite?pno=${pnoVal}'>리뷰 작성하기</a>`
		str+="<table class='t_score'>";
		str+="<tr><th rowspan='5' class='RStitle'>평균평점</th>"
		str+="<td rowspan='5'>"+Math.round(avg*100)/100+"</td>"
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
		}
		$("#scopecnt").html(str);	
	})



} // scope 끝



r();
function r(){
	$(".rno").each(function(i,r){
		var rno = $(this).val();
		var id = $("#userId").val();
		var rdata = {rno:rno, id:id}
		likecheck(rdata);
		
	})
}


function likecheck(rdata){
	$.getJSON("/likecheck",rdata,function(d){
		console.log(rdata.rno+">셀렉");
		$(`img[data-rno="${rdata.rno}"]`).attr("src","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Love_Heart_symbol.svg/1125px-Love_Heart_symbol.svg.png")
	})
}

$(".btn_like").on("click",function(e){
	console.log(e)
	var rno = $(this).data("rno")
	var id =  $("#userId").val();
	var datacheck = {rno:rno, id:id}
	$.getJSON("/likecheck",datacheck,function(d){
		$.ajax({
			type:"delete",
			url:"/likeremove",
			data : JSON.stringify(datacheck),
			contentType : "application/json;charset=utf-8",
			success: function(){
				alert(rno);
				$(`img[data-rno="${datacheck.rno}"]`).attr("src","https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Heart_icon_red_hollow.svg/497px-Heart_icon_red_hollow.svg.png");
				const uuid = "d";
				const lData = {
						rno:rno,
						uuid:uuid
				}
				console.log(lData);
				$.ajax({
					type:"put",
					url:"/likeupdate",
					data:JSON.stringify(lData),
					contentType : "application/json;charset=utf-8",
					success: function(){
						console.log("-");
						location.reload();
						//location.href="/board/detail?pno="+pnoVal+"#reviewlist"
					}
				})
				r();
			}

		})
	})
	.fail(function(){
		$.ajax({
			type:"post",
			url:"/likeadd",
			data : JSON.stringify(datacheck),
			contentType : "application/json;charset=utf-8",
			success: function(){
				alert(rno);
				$(`img[data-rno="${datacheck.rno}"]`).attr("src","https://upload.wikimedia.org/wikipedia/commons/thumb/c/c8/Love_Heart_symbol.svg/1125px-Love_Heart_symbol.svg.png")
				const uuid = "u";
				const lData = {
						rno:rno,
						uuid:uuid
				}
				console.log(lData);
				
				$.ajax({
					type:"put",
					url:"/likeupdate",
					data:JSON.stringify(lData),
					contentType : "application/json;charset=utf-8",
					success: function(){
						console.log("+");
						location.reload();
						//location.href="/board/detail?pno="+pnoVal+"#reviewlist"
					}
				})
				r();
			}
		})
	})
})
//리뷰삭제
$(".btn_remove").on("click",function(){
	var rno = $(this).data("rno")
	var id =  $("#userId").val();
	var datacheck = {rno:rno, id:id}
	$.ajax({
		type:"delete",
			url:"/board/reviewremove",
			data : JSON.stringify(datacheck),
			contentType : "application/json;charset=utf-8",
			success: function(){
				alert('삭제되었습니다.')
				location.href="/board/detail?pno="+pnoVal
			}
	})
})

//리뷰수정
$(".btn_modify").on("click",function(){
	var rnoVal = $(this).data("rno")
	location.href=`/board/reviewmodify?pno=${pnoVal}&rno=${rnoVal}`
})
