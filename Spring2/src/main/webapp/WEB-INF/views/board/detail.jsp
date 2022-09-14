<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../resources/css/board_detail.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				<h1>상품상세페이지</h1>
				<input type="hidden" value="${userInfo.id}" id="id">
				<input type="hidden" value="${detail.pno}" id="pno">
				<div id="d_title">
					<span id="uploadimg"></span>
					<div id="sell">
						<div id="s_form">
							<table id="t_sell">
								<tr>
									<td colspan="2"><h3>${detail.pname}</h3></td>
								</tr>
								<tr>
									<td>판매가</td>
									<td id="price">${detail.price}</td>
								</tr>
								<tr>
									<td>배송방법</td>
									<td>${detail.delivery}</td>
								</tr>
								<tr>
									<td>소재</td>
									<td>${detail.quality}</td>
								</tr>
								<tr>
									<td>구매수량</td>
									<td><input type="text" value="1" id="num">
										<button id="btn_minus" type="button">-</button>
										<button id="btn_plus" type="button">+</button></td>
								</tr>
								<tr>
									<td>총가격</td>
									<td><span id="totalPrice">${detail.price}</span></td>
								</tr>
								<tr>
									<td colspan="2"><button class="btn_p">구매하기</button>
										<button class="btn_p" id="add_cart">장바구니</button>
										<button class="btn_p">관심상품</button>
								</tr>
							</table>
						</div>
					</div>
				</div>

				<div id="detail">
					<nav id="nav">
						<ul class="nav__menu">
							<li><a href="#d_img" class="navfocused">상세보기</a></li>
							<li><a href="#reviewlist">리뷰보기</a></li>
							<li><a href="#privqna">상품문의</a></li>
							<li><a href="#exchange">배송/교환환불</a></li>
							<div class="marker"></div>
						</ul>
					</nav>
				</div>
				<section id="d_img">
					<div>${detail.content}</div>
					<div id="back">
						<form action="/board/remove" method="post" id="form_back">
							<a href="/board/modify?pno=${detail.pno}">수정하기</a> 
							<input type="hidden" value="${detail.pno}" name="pno">
							<button id="remove">삭제</button>
							<a href="/board/list">목록보기</a>
						</form>
					</div>
				</section>
				<section id="reviewlist">
					<div id="totalRe">
						<div>총평점 ★★★★★(5)</div>
						<button>리뷰쓰기</button>
					</div>
					<div id="privRe">
						<div class="title">리뷰보기</div>
						<table>
							<tr>
								<td>개별평점 ★★★★★(5)</td>
							</tr>
							<tr>
								<td><span>아이디</span><span>등록일</span></td>
							</tr>
							<tr>
								<td>제품이름</td>
							</tr>
							<tr>
								<td><img alt="가구사진"
									src="https://image.ohou.se/i/bucketplace-v2-development/uploads/cards/snapshots/165890122221285125.jpeg?gif=1&w=144&h=144&c=c&webp=1"></td>
							</tr>
							<tr>
								<td>잘 쓰고 있습니다.</td>
							</tr>
						</table>
					</div>
				</section>
				<section id="privqna">
					<div class="title">상품문의</div>
					<button id="btn_qna">문의하기</button>
					<table id="t_privqna">
						<tr>
							<td>글내용</td>
							<td>글쓴이</td>
							<td>글등록일</td>
							<td>답변상태</td>
						</tr>
						<tr>
							<td>상품크기가 어떻게 되나요?</td>
							<td>aaaa</td>
							<td>2022-08-08</td>
							<td>답변</td>
						</tr>
					</table>

				</section>
				<section id="exchange">
					<div class="title">교환환불사항</div>
					<table id="t_exchange">
						<tr>
							<td>지정택배사</td>
							<td colspan="3">cj대한통운</td>
						</tr>
						<tr>
							<td>반품배송비</td>
							<td>편도 3,000원</td>
							<td>교환배송비</td>
							<td>6,000원</td>
						</tr>
						<tr>
							<td>보낼실곳</td>
							<td colspan="3">울산광역시</td>
						</tr>
						<tr>
							<td rowspan="2">반품/교환 사유에 따른 요청 가능 시간</td>
							<td colspan="3">구매자 단순 변심은 상품 수령 후 7일 이내 (구매자 반품배송비 부담)</td>
						</tr>
						<tr>
							<td colspan="3">표시/광고와 상이, 계약 내용과 다르게 이행된 경우 상품 수령 후 3개월 이내
								혹은 표시/광고와 다른 사실을 안 날로부터 30일 이내 (판매자 반품 배송비 부담)<br>둘 중 하나 경과
								시 반품/교환 불가
							</td>
						</tr>
						<tr>
							<td rowspan="6">반품/교환 불가능 사유</td>
							<td colspan="3">1.반품요청기간이 지난 경우</td>
						</tr>
						<tr>
							<td colspan="3">2.구매자의 책임 있는 사유로 상품 등이 멸실 또는 훼손된 경우</td>
						</tr>
						<tr>
							<td colspan="3">3.구매자의 책임있는 사유로 포장이 훼손되어 상품 가치가 현저히 상실된 경우</td>
						</tr>
						<tr>
							<td colspan="3">4.구매자의 사용 또는 일부 소비에 의하여 상품의 가치가 현저히 감소한 경우</td>
						</tr>
						<tr>
							<td colspan="3">5.고객의 경과에 의하여 재판매가 곤란할 정도로 상품 등의 가치가 현저히 감소한
								경우</td>
						</tr>
						<tr>
							<td colspan="3">6.고객의 요청사항에 맞춰 제작에 들어가는 맞춤제작상품의 경우</td>
						</tr>
					</table>
				</section>

			</div>
		</div>

		<%@ include file="../footer.jsp"%>
	</div>
	<script
		src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
	<script src="../resources/js/home.js"></script>
	<script type="text/javascript" src="../resources/js/board_detail.js"></script>
</body>

</html>

