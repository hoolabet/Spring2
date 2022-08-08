//장바구니 플러스 마이너스버튼
const num = document.querySelector('#num');

const plus = document.querySelector('#btn_plus');

plus.addEventListener('click',()=>{
	let quantity = parseInt(num.value);
	num.value = quantity+ 1;
})

const minus = document.querySelector('#btn_minus');

minus.addEventListener('click',()=>{
	let quantity = parseInt(num.value);
	num.value = quantity - 1;
	if(quantity<1){
		num.value =0;
	}else{
		num.value = quantity -1;
	}
})

// 스크롤에 따라 고정되는 내비게이션바
const marker=document.querySelector(".marker");
function setMarker(e) {
    marker.style.left = e.offsetLeft+"px";
    marker.style.width = e.offsetWidth+"px";
}
const sections = document.querySelectorAll("section");
const menus = document.querySelectorAll(".nav__menu > li > a")
const nav = document.querySelector('#nav')
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


