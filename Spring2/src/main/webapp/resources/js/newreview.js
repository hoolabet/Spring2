/**
 * 리뷰 더보기 페이지
 */

var pnoVal=$("#pno").val();
var idVal = $("#id").val();
var scVal = $(".Star_scope").val();

const Rtotal = document.getElementById('Rtotal')
const list_element = document.getElementById('scopecnt');
const pagination_element = document.getElementById('pagination');

let current_page = 1; // 현재페이지
let amount = 5; // 페이지에 나타낼 갯수

scope(pnoVal);



// 평점 함수 선언
function scope(pno){
	$.getJSON("/reviewlist/"+pno+".json",function(data){
		var str2="";
		if(idVal!=""){	// 주문내역이 있는 경우 보이게 추가해야함
			str2+=`<div id='Rwritelink'><a href="/board/reviewwrite?pno=${pnoVal}" id='rwlink'>리뷰 작성하기</a></div>`;
		}else{
			str2+=`<div id='Rwritelink'><p>리뷰를 작성하시려면 <a href="../member/login">로그인</a>해 주세요</p></div>`;
		}
		
		// console.log(data);
		
		if(data==""){
			str2+=`<p>작성된 리뷰가 없습니다.`;
		}else{
		str2+=`<div id="index">
					<a href="javascript:void(0)" id="recent">최신순 /</a>
					<a href="javascript:void(0)" id="best"> 베스트순</a>
				</div> 
				<h3>리뷰 목록</h3>`	
		// 리뷰 평균 평점
		var sum=0;
		console.log(data.length)
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
		str2+=`<div id='Rscopecnt'>
		<table class='t_score'>
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
		</table>
		</div>
		`
		
	}
		$("#reviewl").html(str2);
		
		let startPage = 1;
		let endPage = startPage + 9;
		let total = Math.ceil(data.length / amount);
		console.log(total)

		DisplayList(data, list_element, amount, current_page);
		SetupPagination(data, pagination_element, amount, current_page,1);
		if(data!=''){
			$("#next").on("click", function (e) {
				console.log(current_page)
				startPage = startPage+10;
		        if(startPage > total){
		            startPage = startPage -10;
		        }else{
		        	current_page = startPage;
		        }
		        console.log(current_page)
		        DisplayList(data, list_element, amount, current_page);
		        console.log(current_page)
		        SetupPagination(data, pagination_element, amount, current_page,startPage);
		        
			})
			$("#prev").on("click",function(e){
				if(startPage = 1){
					e.preventDefault();
				}else{
					startPage = startPage-10;
					if(startPage<1){
						startPage = 1;
						DisplayList(data, list_element, amount, current_page);
					}else{
						endPage= startPage+9
						DisplayList(data, list_element, amount, endPage);
					}
					current_page = endPage;
					SetupPagination(data, pagination_element, amount, current_page,startPage);	
				}
				
			})
		}
		//최신순 클릭
		$("#recent").on("click",function(){
			$("#best").removeClass("click")
			$("#recent").addClass("click")
			const orderedDate = data.sort((a,b)=>new Date(b.regdate)-new Date(a.regdate))
			DisplayList(orderedDate,list_element, amount, 1)
			current_page = 1;
			SetupPagination(data, pagination_element, amount, current_page,1);
		})
		//베스트순 클릭
		$("#best").on("click",function(){
			$("#recent").removeClass("click")
			$("#best").addClass("click")
			const reverseOrderDate = data.sort((a,b) => a.rno - b.rno)
			const likeBest = reverseOrderDate.sort((a,b)=> b.likeNum - a.likeNum)
			DisplayList(likeBest, list_element, amount, 1);
			current_page = 1;
			SetupPagination(data, pagination_element, amount, current_page,1);
		})
		// 리뷰삭제
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
    					location.reload();
    				}
    				
    			}
    	})
    })

    // 리뷰수정
    $(".btn_modify").on("click",function(){
    	console.log("수정클릭")
    	var rnoVal = $(this).data("rno")
    	if(confirm("리뷰를 수정하시겠습니까?")){
    		location.href=`/board/reviewmodify?pno=${pnoVal}&rno=${rnoVal}`	
    	}
    	
    })
	
	})// getJSON끝

} // scope 끝

//좋아요버튼 클릭
function r(){
	$(".rno").each(function(i,r){
		var rno = $(this).val();
		var id = $("#id").val();
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

// 데이터 리스트를 보여주는 함수 
function DisplayList(items, wrapper, amount, page) {
    wrapper.innerHTML = "";
    page--; // 페이지번호를 1 다운

    let start = amount * page; // 현재페이지:(2-1)*5 = 5
    let end = start + amount; // 5+5 = 10
    let paginatedItems = items.slice(start, end); // 6-10번까지 불러오기
    str="";
    //데이터 jsp에 보여질 곳
    for (let i = 0; i < paginatedItems.length; i++) { // 5개까지 불러옴
    	str+=`
    	<div id='Rlist'>
    	<table border='1'>
			<tr><th>리뷰번호</th>
			<input type="hidden" name="pno" value="${paginatedItems[i].pno}" id="pno" class="pno">
			<input type="hidden" name="rno" value="${paginatedItems[i].rno}" id="rno" class="rno">
			<td colspan='3'>${paginatedItems[i].rno}</td></tr>
			<tr><th>이름</th>
			<td><div style="border: 1px #abaaaa solid;
    width: 50px;
    height: 50px;
    border-radius: 25px;
    background-size: cover;
    display: inline-block; background-image:url(`
			
    		if(paginatedItems[i].mvo.userImg.includes("http")){
    			str += `${paginatedItems[i].mvo.userImg});"></div>`
    		}else{
    			str += `/member/${paginatedItems[i].mvo.userImg});"></div>`
    		}
    		
    		str+=`${paginatedItems[i].mvo.name}
			<input type="hidden" value="${paginatedItems[i].id}" class="id"></td>
			<th>등록일</th>
			<td>${paginatedItems[i].regdate}</td></tr>
			<tr><th>평점
			<input type="hidden" class="Star_scope" value="${paginatedItems[i].scope}"></th>
			<td colspan='3' class="scopeS">${paginatedItems[i].scope}</td></tr>`
			// console.log(data[i].filename)
			if(paginatedItems[i].filename != null){
				var filePath = encodeURIComponent(paginatedItems[i].uploadpath+"/s_"+paginatedItems[i].uuid+"_"+paginatedItems[i].filename);
				str+=`<tr><th>사진</th>
				<td colspan='3'><img src='/display?fileName=${filePath}'></td></tr>`
			}
			str +=`<tr><th>내용</th>
			<td colspan='3' class="rcontent">${paginatedItems[i].content}</td></tr>
			<tr><td colspan="4">
			<img data-rno="${paginatedItems[i].rno}" style ="width:30px" class="btn_like" id="${paginatedItems[i].rno}_btn" src="https://upload.wikimedia.org/wikipedia/commons/thumb/5/52/Heart_icon_red_hollow.svg/497px-Heart_icon_red_hollow.svg.png">
			<input type="text" name="likeNum" value="${paginatedItems[i].likeNum}" readonly class="likeNum" ldata-rno="${paginatedItems[i].rno}">
			</td></tr>`
			if($("#id").val()===paginatedItems[i].id){
				str+=`<tr><td colspan="4"><button data-rno="${paginatedItems[i].rno}" class="btn_remove" >삭제</button>
					<button data-rno="${paginatedItems[i].rno}" class="btn_modify" >수정</button></td></tr>`
			}
			str+=`</table></div>`				
    }
    wrapper.innerHTML = str;
    
    r();
    // 리뷰 별표찢기
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
	//좋아요 버튼 클릭이벤트
    $(".btn_like").on("click",function(e){
    	console.log(e)
    	var rno = $(this).data("rno")
    	var id =  $("#id").val();
    	var datacheck = {rno:rno, id:id}
    	if(id==''){
    		alert("로그인 후 이용가능합니다.")
    	}
    	$.getJSON("/likecheck",datacheck,function(d){
    		$.ajax({ // 좋아요버튼이 활성화 되었을 때 비활성화
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
    				$.ajax({ // review 테이블에서 likeNum 삭제
    					type:"put",
    					url:"/likeupdate",
    					data:JSON.stringify(lData),
    					contentType : "application/json;charset=utf-8",
    					success: function(){
    						console.log("-");
    						like_val = parseInt($(`input[ldata-rno="${lData.rno}"]`).val())
    						console.log(like_val)
    						$(`input[ldata-rno="${lData.rno}"]`).val(like_val-1)
    						//location.href = location.href;
    						}
    				})
    				r();
    				scope(pnoVal);
    				//const reverseOrderDate = items.sort((a,b) => a.rno - b.rno)
    				const likeBest = items.sort((a,b)=> b.likeNum - a.likeNum)
    				DisplayList(items, list_element, amount, 1);
    				SetupPagination(items, pagination_element, amount, current_page,1);
    			}

    		})//ajax끝
    	})//getJSON끝
    	.fail(function(){
    		$.ajax({  //비활성화 된 좋아요버튼클릭시 활성화
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
    				$.ajax({ //리뷰테이블 likeNum 삭제
    					type:"put",
    					url:"/likeupdate",
    					data:JSON.stringify(lData),
    					contentType : "application/json;charset=utf-8",
    					success: function(){
    						console.log("+");
    						like_val = parseInt($(`input[ldata-rno="${datacheck.rno}"]`).val())
    						console.log(like_val)
    						console.log($(`input[ldata-rno="${datacheck.rno}"]`).val())
    						$(`input[ldata-rno="${datacheck.rno}"]`).val(like_val+1)
    						//location.href = location.href;
    					},
    				})//ajax끝
    				
    				r();
    				scope(pnoVal);
    				//const reverseOrderDate = items.sort((a,b) => a.rno - b.rno)
    				const likeBest = items.sort((a,b)=> b.likeNum - a.likeNum)
    				DisplayList(items, list_element, amount, 1);
    				SetupPagination(items, pagination_element, amount, current_page,1);
    			}
    		})//ajax끝
    	})//.fail끝
    })//좋아요버튼 클릭이벤트 끝
	
}//DisplayList 끝

//버튼 안에 숫자를 넣는 함수
function SetupPagination(items, wrapper, amount, current_page , startPage) {
	if(Rtotal.value != 0){
    	wrapper.innerHTML = "";
        let page_count = Math.ceil(items.length / amount); 
        let PageGroup = Math.ceil(current_page / 10) * 10; 
        let endPage = startPage + 9;
        let RealEnd = page_count; // 21
        if (RealEnd < endPage) {
            endPage = RealEnd ;
        }
        for (let i = startPage; i < endPage+1; i++) {
            let btn = PaginationButton(i, items);
            wrapper.appendChild(btn);
        }
    }
}

// 버튼만들어 페이징 하는 함수
function PaginationButton(page, items) {
    let button = document.createElement('button');
    button.innerText = page;
    button.classList.add("btn_pa")
    if (current_page == page) {
        button.classList.add("active")
    }
    button.addEventListener("click", function () {
        current_page = page;
        const btn_act = document.querySelector(".active");
        btn_act.classList.remove("active")
        button.classList.add("active")
        r();
    	scope(pnoVal);
        DisplayList(items, list_element, amount, current_page);
        //location.href=`/board/detail?pno=${pnoVal}#scopecnt`;
    })
    return button;
}
