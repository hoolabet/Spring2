<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>상품상세페이지</title>
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
<link rel="stylesheet" href="../resources/css/board_detail.css"
	type="text/css">
<link rel="stylesheet" href="../resources/css/home.css">
<link rel="stylesheet" href="../resources/css/reviewInDetail.css">
<link rel="stylesheet" href="../resources/css/inquiryInDetail.css">

</head>
<body>
	<div id="entry_area">
		<%@ include file="../header.jsp"%>
		<div id="content_area">
			<div id="container">
				
				<c:forEach items="${pay}" var="pay">
				<input type="text" value="${pay.id}" class="pay" id="pay">
				</c:forEach>
				<input type="hidden" value="${userInfo.id}" id="id">
				<input type="hidden" value="${userInfo.admin}" id="admin">
				<input type="hidden" value="${detail.pno}" id="pno">
				<input type="hidden" value="${detail.quantity}" id="quantity">
				<div id="d_title">
					<span id="uploadimg"></span>
					<div id="sell">
						<div id="s_form">
							<table id="t_sell">
								<tr>
									<td colspan="2"><h2>${detail.pname}</h2></td>
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
									<td><input type="text" value="1" id="num" readonly>
									<input type="button" value="▼"id="btn_minus">
									<input type="button"  value="▲" id="btn_plus">
										</td>
								</tr>
								<tr>
									<td>총가격</td>
									<td><span id="totalPrice">${detail.price}</span></td>
								</tr>
								<tr>
									<td colspan="2" id="btn_s_form"><button class="btn_p" id="buy">구매하기</button>
										<button class="btn_p" id="add_cart">장바구니</button>
										<button class="btn_p" id="add_wishlist">찜</button>
										</td>
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
							<input type="hidden" value="${detail.pno}" name="pno">
							<c:if test="${userInfo.admin eq true}">
							<button id="modify">수정</button>
							<button id="remove">삭제</button>
							</c:if>
							<a href="/board/list" id="goList">상품목록보기</a>
						</form>
					</div>
				</section>
				
				<section id="reviewlist">
				<div class='title'>리뷰보기</div>
				<div id='reviewl'></div>
				<div id="scopecnt"></div>				
				</section>
				<input type="hidden" value="${paging.total}" id="Rtotal">
				<c:if test="${paging.total != 0}">
					<button id="prev" class="paging">&#60;</button>
    				<span id="pagination"></span>
    				<button id="next" class="paging">&#62;</button>
				</c:if>
				
				<section id="privqna">
				

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
	<script type="text/javascript" src="../resources/js/inquiryindetail.js"></script>	
	 <script type="text/javascript" src="../resources/js/newreview.js"></script>	
</body>

</html>

