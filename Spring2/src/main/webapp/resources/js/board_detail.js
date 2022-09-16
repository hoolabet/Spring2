//상세페이지 이미지 불러오기
const pno = $("input[name='pno']").val();
$.getJSON("/attachlist", {pno:pno},function(attachlist){
	//console.log(attachlist)
	var str="";
	$(attachlist).each(function(i,attach){
		//만약 image결과가 true이면
		if(attach.image){
			//아래를 실행
			var filePath = encodeURIComponent(attach.uploadPath+"/" + attach.uuid + "_" + attach.fileName); 
			console.log(filePath)
			str+=`<img src = "/display?fileName=${filePath}" id="img">`;
		}else{//그렇지 않으면
			//다운로드 할 수 있도록 실행
			var filePath = encodeURIComponent(attach.uploadPath+"/" + attach.uuid + "_" + attach.fileName); 
			str = `<a href="/download?fileName=${filePath}">${attach.fileName}</a>`
		}//if문 끝
	})//each문 끝
	$("#uploadimg").html(str);	
})//getJSON끝	


//장바구니 플러스 마이너스버튼, 총가격 변화시키기
const num = document.querySelector('#num');

const plus = document.querySelector('#btn_plus');

const price = document.querySelector("#price");

const totalPrice = document.querySelector("#totalPrice");

const total = parseInt(totalPrice.innerText);

const p = parseInt(price.innerText);

plus.addEventListener('click',()=>{
	let quantity = parseInt(num.value);
	num.value = quantity+ 1;
	
	totalPrice.innerText = priceToString(p * num.value);
	
})

const minus = document.querySelector('#btn_minus');

minus.addEventListener('click',()=>{
	let quantity = parseInt(num.value);
	num.value = quantity - 1;
	if(quantity<1){
		num.value = 1;
		totalPrice.innerText = p;
	}else{
		num.value = quantity -1;
		totalPrice.innerText = priceToString(p * num.value);
	}
})

function priceToString(price) {
    return price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
}
price.innerText = priceToString(price.innerText);

totalPrice.innerText = priceToString(totalPrice.innerText);



// 스크롤에 따라 고정되는 내비게이션바
const marker=document.querySelector(".marker");
function setMarker(e) {
    marker.style.left = e.offsetLeft+"px";
    marker.style.width = e.offsetWidth+"px";
}
const sections = document.querySelectorAll("section");
const menus = document.querySelectorAll(".nav__menu > li > a");
const nav = document.querySelector('#nav');
const list = document.querySelectorAll(".nav__menu > li");
window.addEventListener("scroll",()=>{
  // 현재 영역의 id 값
    let current=""

    sections.forEach(section=>{
        // 각 section의 top 위치(절대적 위치)
  
        const sectionTop = window.scrollY + section.getBoundingClientRect().top;
      
      // 누적된 스크롤이 section의 top위치에 도달했거나 section의 안에 위치할 경우
        if(window.scrollY >= sectionTop-100) {
           current = section.getAttribute("id");
           //console.log(current);
        }
        menus.forEach(menu=>{
            menu.classList.remove("navfocused");
            const href = menu.getAttribute("href").substring(1);
            //console.log(href);
            if(href===current) {
                // 현재 있는 영역의 id와 메뉴의 링크주소가 일치할때
                menu.classList.add("navfocused");
                setMarker(menu);
            }
        })
        
    })
})


//문의하기 버튼 클릭시 문의작성페이지 이동
const gotoqna = document.querySelector("#btn_qna");
gotoqna.addEventListener("click",()=>{
	location.href=`/board/inquirywrite?pno=${pno}`;
})

//구매하기 버튼 클릭시 구매페이지 이동
$("#btn_pay").on("click",function(){
	location.href = `/cart/payment`
})

//장바구니 클릭시 장바구니담기
$("#add_cart").on("click",function(){
	const data_ = {
			pno:$("#pno").val(),
			id:$("#id").val(),
			quantity:$("#num").val()
	}

	$.getJSON("/cartcheck", data_,function(){
		if(confirm("이미 장바구니에 담긴 상품입니다. 수량을 추가하시겠습니까?")){
			$.ajax({
				type:"put",
				url:"/cartupdate",
				data:JSON.stringify(data_),
				contentType:"application/json; charset=utf-8",
				success:function(){
					if(confirm("추가되었습니다. 장바구니로 가시겠습니까?")){
						location.href = "/cart/list";
					}
				},
				error:function(){
					alert("추가하는데 실패했습니다.")
				}
			})
		}
	})
	.fail(function() {
		$.ajax({
			type:"post",
			url:"/cartadd",
			data:JSON.stringify(data_),
			contentType:"application/json; charset=utf-8",
			success:function(){
				if(confirm("장바구니로 가시겠습니까?")){
					location.href = "/cart/list";
				}
			},
			error:function(){
				alert("장바구니 담기 실패")
			}
		})
	})
})


