/**
 * 리뷰 더보기 페이지
 */


var pnoVal=$("#pno").val();
var idVal = $("#id").val();
var scVal = $(".Star_scope").val();
scope(pnoVal);
$(".Star_scope").each(function(i,scope){
		let rate = "";
		for(let j=0; j<scope.value; j++){
			rate += "★";
		}
		for(let i=0; i<5-scope.value ;i++){
			rate+="☆";
		}
		rate+=`(${scope.value})`;
		$(".scopeS").eq(i).text(rate);
})

// 평점 함수 선언
function scope(pno){
	$.getJSON("/reviewlist/"+pno+".json",function(data){
		var str="";
		if(idVal!=""){	// 주문내역이 있는 경우 보이게 추가해야함
			str+=`<div id='Rwritelink'><a href="/board/reviewwrite?pno=${pnoVal}" id='rwlink'>리뷰 작성하기</a></div>`;
		}else{
			str+=`<div id='Rwritelink'><p>리뷰를 작성하시려면 <a href="../member/login">로그인</a>해 주세요</p></div>`;
		}
		
		//console.log(data);
		
		if(data==""){
			str+=`<p>작성된 리뷰가 없습니다.`;
		}else{
		str+=`<div id="index">
					<a href="/board/detail?pno=${pnoVal}&array=recent#reviewlist">최신순 /</a>
					<a href="/board/detail?pno=${pnoVal}#reviewlist"> 베스트순</a>
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
 
		//str+=`<a href='/board/reviewwrite?pno=${pnoVal}'>리뷰 작성하기</a>`
		str+=`<table class='t_score'>
		<tr><th rowspan='5' class='RStitle'>평균평점</th>
		<td rowspan='5'>
		<div class="star-ratings">
			<div class="star-ratings-fill" style="font-size:30px;width:${avg*30}px">
            	<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span>
			</div>
			<div class="star-ratings-base" style="font-size: 30px;">
            	<span>★</span><span>★</span><span>★</span><span>★</span><span>★</span><span style="font-size:20px">(${Math.round(avg*100)/100})</span>
			</div>
		</div>
		</td>
		<th class='RStitle'>5점</th>
		<td>${sc5}</td></tr>
		<th class='RStitle'>4점</th>
		<td>${sc4}</td></tr>
		<th class='RStitle'>3점</th>
		<td>${sc3}</td></tr>
		<th class='RStitle'>2점</th>
		<td>${sc2}</td></tr>
		<th class='RStitle'>1점</th>
		<td>${sc1}</td></tr>
		</table>`
		}
		$("#scopecnt").html(str);	
	})
	


} // scope 끝

//좋아요버튼 클릭
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
	if(id==''){
		alert("로그인 후 이용가능합니다.")
	}
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
						
					},
					
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
				if(confirm("리뷰를 삭제하시겠습니까?")){
					alert('삭제되었습니다.')
					location.href="/board/detail?pno="+pnoVal
				}
				
			}
	})
})

//리뷰수정
$(".btn_modify").on("click",function(){
	var rnoVal = $(this).data("rno")
	if(confirm("리뷰를 수정하시겠습니까?")){
		location.href=`/board/reviewmodify?pno=${pnoVal}&rno=${rnoVal}`	
	}
	
})
//리뷰작성
function link(){
		console.log("aaaa")
		$(".pay").each(function(i,pay){
			console.log(pay.value)
			if(pay.value === idVal){
				location.href=`/board/reviewwrite?pno=${pnoVal}`
				console.log("heeee")
			}else{
				alert("구매후 작성가능합니다.")
		}
	})
	
}
