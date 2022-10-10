/**
 *  게시글 목록
 */

const Rtotal = document.getElementById('Rtotal');
const list_element = document.getElementById('review_list');
const pagination_element = document.getElementById('pagination');

let current_page = 1; // 현재페이지
let amount = 3; // 페이지에 나타낼 갯수
let startPage = 1;
let endPage = startPage + 9;






const id = $("#id").val();
console.log("id="+id);

console.log("total="+$("#Rtotal").val());

//$.getJSON("/member/mypageBoardList",{id},function(res){
//	
//})


let str='';
let strqna='';

$.getJSON("/mypagereviewlist",{id},function(res){
	console.log(res.length);
	console.log(res);
//	res.forEach(function(r){
//		let uploadpath = encodeURIComponent(r.uploadpath+"/s_"+r.uuid+"_"+r.filename);
//		str+=`
//			<div id="review_box">
//			<img src=/display?fileName=${uploadpath}>
//			<p>${r.regdate}</p>
//			<p>${r.content}</p>
//			<p>${r.likeNum}</p>
//			<a href="/board/detail?pno=${r.pno}">상품상세이동</a>
//			</div>
//			`
//	})
//	$("#review_list").html(str);
	
	let total = Math.ceil(res.length / amount);
	console.log("내가쓴리뷰총갯수="+total)

	DisplayList(res, list_element, amount, current_page);
	SetupPagination(res, pagination_element, amount, current_page, startPage);
	if(res!=''){
		$("#next").on("click", function (e) {
			startPage = startPage+10;
	        if(startPage > total){
	            startPage = startPage -10;
	        }else{
	        	current_page = startPage;
	        }
	        DisplayList(res, list_element, amount, current_page);
	        SetupPagination(res, pagination_element, amount, current_page,startPage);
	        
		})
		$("#prev").on("click",function(e){
			if(startPage === 1){
				e.preventDefault();
			}else{
				startPage = startPage-10;
				if(startPage<1){
					startPage = 1;
					DisplayList(res, list_element, amount, current_page);
				}else{
					endPage= startPage+9
					DisplayList(res, list_element, amount, endPage);
				}
				current_page = endPage;
				SetupPagination(res, pagination_element, amount, current_page,startPage);	
			}
			
		})
	}
})


function DisplayList(res, wrapper, amount, page) {
    wrapper.innerHTML = "";
    page--; // 페이지번호를 1 다운

    let start = amount * page; // 현재페이지:(2-1)*5 = 5
    let end = start + amount; // 5+5 = 10
    let paginatedItems = res.slice(start, end); // 6-10번까지 불러오기
    str="";
    // 데이터 jsp에 보여질 곳
    for (let i = 0; i < paginatedItems.length; i++) { // 5개까지 불러옴
    	console.log(paginatedItems[i]);
    	let uploadpath = encodeURIComponent(paginatedItems[i].uploadpath+"/s_"+paginatedItems[i].uuid+"_"+paginatedItems[i].filename);
		str+=`
			<table class="review_list_table">
			<thead>
			<tr>
				<td class="user_box_img">
					<img src=/display?fileName=${paginatedItems[i].bvo.img.fullPath} width="70px">
				</td>
				<td>
					상품 : <a href="/board/detail?pno=${paginatedItems[i].pno}">${paginatedItems[i].bvo.pname}</a>
				</td>
				<td class="user_box_regdate">
					${paginatedItems[i].regdate}
				</td>
				<td class="user_box_likeNum">
					like : ${paginatedItems[i].likeNum}
				</td>
			</tr>
			</thead>
			<tbody>
			<tr>
				<td colspan=4>
					${paginatedItems[i].content}
				</td>
			</tr>
				`			
		str+=
			(paginatedItems[i].image==1?
			`
			<tr>
				<td colspan=4>
					<img src=/display?fileName=${uploadpath} width="150px">
				</td>
			</tr>
			</tbody>
			</table>`
			:`</tbody></table>`)
    }
    wrapper.innerHTML = str;
//    
//    res.forEach(function(r){
//		let uploadpath = encodeURIComponent(r.uploadpath+"/s_"+r.uuid+"_"+r.filename);
//		str+=`
//			<div id="review_box">
//			<img src=/display?fileName=${uploadpath}>
//			<p>${r.regdate}</p>
//			<p>${r.content}</p>
//			<p>${r.likeNum}</p>
//			<a href="/board/detail?pno=${r.pno}">상품상세이동</a>
//			</div>
//			`
//	})
//	wrapper.innerHTML = str;
}
//버튼 안에 숫자를 넣는 함수
function SetupPagination(items, wrapper, amount, current_page , startPage) {
	if(Rtotal.value != 0){
    	wrapper.innerHTML = "";
    	console.log(items.length);
        let page_count = Math.ceil(items.length / amount); 
        console.log(page_count);
        let PageGroup = Math.ceil(current_page / 10) * 10;
        console.log(PageGroup);
        let endPage = startPage + 9;
        console.log(endPage);
        let RealEnd = page_count; // 21
        console.log(RealEnd);
        if (RealEnd < endPage) {
            endPage = RealEnd ;
        }
        if(startPage===1){
        	$("#prev").css("display","none")
        }else{
        	$("#prev").css("display","")
        }
        if(endPage === RealEnd){
        	$("#next").css("display","none")
        }else{
        	$("#next").css("display","")
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
        btn_act.classList.remove("active");
        button.classList.add("active");
        DisplayList(items, list_element, amount, page);
        //SetupPagination(items, wrapper, amount, current_page , startPage)
        // location.href=`/board/detail?pno=${pnoVal}#scopecnt`;
    })
    return button;
}


const RtotalQna = document.getElementById('RtotalQna');
const list_elementQna = document.getElementById('qna_list');
const pagination_elementQna = document.getElementById('paginationQna');
$.getJSON("/mypageqnalist",{id},function(res){
	console.log("qna="+res);
	DisplayListQna(res, list_elementQna, amount, current_page);
	SetupPaginationQna(RtotalQna,res, pagination_elementQna, amount, current_page, startPage);
	if(res!=''){
		$("#nextQ").on("click", function (e) {
			startPage = startPage+10;
	        if(startPage > total){
	            startPage = startPage -10;
	        }else{
	        	current_page = startPage;
	        }
	        DisplayListQna(res, list_elementQna, amount, current_page);
	        SetupPaginationQna(RtotalQna,res, pagination_elementQna, amount, current_page,startPage);
	        
		})
		$("#prevQ").on("click",function(e){
			if(startPage === 1){
				e.preventDefault();
			}else{
				startPage = startPage-10;
				if(startPage<1){
					startPage = 1;
					DisplayListQna(res, list_elementQna, amount, current_page);
				}else{
					endPage= startPage+9
					DisplayListQna(res, list_elementQna, amount, endPage);
				}
				current_page = endPage;
				SetupPaginationQna(RtotalQna,res, pagination_elementQna, amount, current_page,startPage);	
			}
			
		})
	}
	
	
	
	
	
//	res.forEach(function(r){
//		strqna+=`
//			<div id="qna_box">
//			<p>${r.regdate}</p>
//			<p>${r.question}</p>
//			<p>${r.answer}</p>
//			<a href="/board/detail?pno=${r.pno}">상품상세이동</a>
//			</div>
//			`
//	})
//	$("#qna_list").html(strqna);
})

function DisplayListQna(res, wrapper, amount, page) {
  wrapper.innerHTML = "";
  page--; // 페이지번호를 1 다운

  let start = amount * page; // 현재페이지:(2-1)*5 = 5
  let end = start + amount; // 5+5 = 10
  let paginatedItems = res.slice(start, end); // 6-10번까지 불러오기
  strqna="";
// 데이터 jsp에 보여질 곳
  for (let i = 0; i < paginatedItems.length; i++) { // 5개까지 불러옴
  	console.log(paginatedItems[i]);
  	
  	strqna+=`
			<table class="qna_table">
				<thead>
					<tr>
						<td>
  							<a href="/board/detail?pno=${paginatedItems[i].pno}">문의 상품 상세페이지로 이동 <span class="qna_icon">&nbsp;> </span></a>
						</td>
						<td class="qna_table_regdate">
  							${paginatedItems[i].regdate}
						</td>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td colspan=2>
  							<span class="qna_text">Q</span>${paginatedItems[i].question}
						</td>
					</tr>
					<tr>
						<td colspan=2>
  							<span class="qna_text">A</span>${paginatedItems[i].answer}
						</td>
					</tr>
				</tbody>
			</table>
			`
  }
  wrapper.innerHTML = strqna;
}









//버튼 안에 숫자를 넣는 함수
function SetupPaginationQna(Rtotal,items, wrapper, amount, current_page , startPage) {
	if(Rtotal.value != 0){
  	wrapper.innerHTML = "";
      let page_count = Math.ceil(items.length / amount); 
      let PageGroup = Math.ceil(current_page / 10) * 10; 
      let endPage = startPage + 9;
      let RealEnd = page_count; // 21
      if (RealEnd < endPage) {
          endPage = RealEnd ;
      }
      if(startPage===1){
      	$("#prevQ").css("display","none")
      }else{
      	$("#prevQ").css("display","")
      }
      if(endPage === RealEnd){
      	$("#nextQ").css("display","none")
      }else{
      	$("#nextQ").css("display","")
      }
      
      for (let i = startPage; i < endPage+1; i++) {
          let btn = PaginationButtonQna(i, items);
          wrapper.appendChild(btn);
      }
      
  }
}

//버튼만들어 페이징 하는 함수
function PaginationButtonQna(page, items) {
  let button = document.createElement('button');
  button.innerText = page;
  button.classList.add("btn_pa")
  if (current_page == page) {
      button.classList.add("active")
  }
  button.addEventListener("click", function () {
      current_page = page;
      const btn_act = document.querySelector(".active");
      btn_act.classList.remove("active");
      button.classList.add("active");
      DisplayListQna(items, list_elementQna, amount, page);
      
  })
  return button;
}