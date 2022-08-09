/**
 * 주문 상세
 */

// 저장하기 버튼을 누르면 저장

function savebtn(){
	var result = window.confirm("저장하시겠습니까?");
	if(result==true){ // 확인을 누르면 update하면서 목차로 이동
		btnForm.submit();
	}else{ // 취소를 누르면 상세페이지 유지
		alert("취소되었습니다")
	}
}

