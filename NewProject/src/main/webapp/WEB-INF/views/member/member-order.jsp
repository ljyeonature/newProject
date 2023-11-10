<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Order</title>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->
<link rel="icon" type="image/png"
	href="../resources/main/images/icons/favicon.png" />
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/animate/animate.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/select2/select2.min.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/css/util.css">
<link rel="stylesheet" type="text/css"
	href="../resources/main/css/main.css">
<link rel="stylesheet" type="text/css"
	href="../resources/main/css/주문페이지.css">
<!--===============================================================================================-->

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>


<script src="../resources/main/jquery/jquery-3.2.1.min.js"></script>
<style>
div.order, .m-r-40, .m-lr-40, .m-all-40 {
	margin-right:-50px;
}
div.order, .m-l-63, .m-lr-63, .m-all-63 {
	margin-left:21px;
}
.order_title {
 margin-bottom: 80px;
 margin-top : 100px;
}

select {
	position : relative;
	left : 100px;
	bottom : 28px;
}

.top-radiobtn {
	display: flex;
    flex-direction: row;
    justify-content: flex-start;
    align-items: baseline;
        margin-left: 5px;
}

#check {
	margin-left:10px;
	margin-right:10px;
}

#addr {
    height: 206px;
    width: 100%;
    margin-top: 10px;
    border:1px solid #EDEDED;
}

#addr-detail {
	    width: 100%;
    height: 80px;


}

</style>

<!-- 제이쿼리CDN -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- JS -->
<script>
  // 페이지 로딩 후 실행되는 함수
  $(document).ready(function() {
    // 각 상품의 shopping_total 값을 가져와서 더하는 함수
   function updateTotalAmount() {
   var totalAmount = 0; // 초기값 설정

  // 각 상품에 대한 반복문
  $('.column-5').each(function() {
    var shoppingTotal = $(this).text().replace(/[^0-9.-]+/g, ''); // 숫자 이외의 문자 제거
    console.log(shoppingTotal); // 개발자 도구의 콘솔에서 값 확인
    totalAmount += parseFloat(shoppingTotal) || 0; // 숫자로 변환하여 더하고, NaN이면 0으로 처리
  });

  // 총 합계를 표시하는 요소에 결과값 설정
  $('#totalAmount').text(totalAmount.toFixed(0)); // 소수점 둘째 자리까지 표시
}

    // 페이지 로딩 후 총 합계 업데이트 실행
    updateTotalAmount();
    
    $('.pay_btn').on('click', function(e){
    	alert(1);
    	e.preventDefault();
    	iamport();
	})
	function iamport(){
		//가맹점 식별코드
		IMP.init('imp22600537');
		IMP.request_pay({
		    pg : 'kcp',
		    pay_method : 'card',
		    merchant_uid : 'merchant_' + new Date().getTime(),
		    name : $('#o_name').text() , //결제창에서 보여질 이름
		    amount : $('#totalAmount').text(), //실제 결제되는 가격
		    buyer_email : $('#m_email').val(),
		    buyer_name : $('#oder_rc').val(),
		    buyer_tel : $('#rec_tel').val(),
		    buyer_addr : $('#rc_addr_detail').val(),
		    buyer_postcode : $('#rc_addr').val()
		}, function(rsp) {
			console.log(rsp);
			// 결제검증
			$.ajax({
	        	type : "POST",
	        	url : "verifyIamport/" + rsp.imp_uid 
	        }).done(function(data) {
	        	
	        	console.log(data);
	        	
	        	// 위의 rsp.paid_amount 와 data.response.amount를 비교한후 로직 실행 (import 서버검증)
	        	if(rsp.paid_amount == data.response.amount){
		        	alert("결제 및 결제검증완료");
	        	} else {
	        		alert("결제 실패");
	        	}
	        });
		});
	}

    
  });
  
 
</script>


</head>
<body class="animsition">

	<!-- Header -->
	<header>
		<!-- Header -->
		<div class="container-menu-desktop">
			<!-- Header desktop -->
			<%@include file="../main/top-bar.jsp"%>
			<%@include file="../main/main-header.jsp"%>

		</div>

		<!-- Header Mobile -->
		<div class="wrap-header-mobile">
			<!-- Logo moblie -->
			<div class="logo-mobile">
				<a href="home"><img
					src="../resources/main/images/icons/logo-01.png" alt="IMG-LOGO"></a>
			</div>

			<!-- Icon header -->
			<div class="wrap-icon-header flex-w flex-r-m m-r-15">
				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-r-11 js-show-modal-search">
					<i class="zmdi zmdi-search"></i>
				</div>

				<div
					class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
					data-notify="2">
					<i class="zmdi zmdi-favorite-outline"></i>
					<!-- <i class="zmdi zmdi-shopping-cart"></i> -->
				</div>

				<a href="shoping-cart"
					class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
					data-notify="0"> <i class="zmdi zmdi-shopping-cart"></i>
				</a>
			</div>

			<!-- Button show menu -->
			<div class="btn-show-menu-mobile hamburger hamburger--squeeze">
				<span class="hamburger-box"> <span class="hamburger-inner"></span>
				</span>
			</div>
		</div>


		<!-- Menu Mobile -->
		<div class="menu-mobile">
			<ul class="topbar-mobile">
				<li>
					<div class="left-top-bar">Free shipping for standard order
						over $100</div>
				</li>

				<li>
					<div class="right-top-bar flex-w h-full">
						<a href="#" class="flex-c-m p-lr-10 trans-04"> Help & FAQs </a> <a
							href="login" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a
							href="#" class="flex-c-m p-lr-10 trans-04"> EN </a> <a href="#"
							class="flex-c-m p-lr-10 trans-04"> USD </a>
					</div>
				</li>
			</ul>

			<ul class="main-menu-m">
				<li><a href="home">Home</a>
					<ul class="sub-menu-m">
						<li><a href="home">Homepage 1</a></li>
						<li><a href="home-02">Homepage 2</a></li>
						<li><a href="home-03">Homepage 3</a></li>
					</ul> <span class="arrow-main-menu-m"> <i
						class="fa fa-angle-right" aria-hidden="true"></i>
				</span></li>

				<li><a href="product">Shop</a></li>

				<li><a href="shoping-cart" class="label1 rs1" data-label1="hot">Features</a>
				</li>

				<li><a href="blog">Blog</a></li>

				<li><a href="about">About</a></li>

				<li><a href="contact">Contact</a></li>
			</ul>
		</div>

		<!-- Modal Search -->
		<div
			class="modal-search-header flex-c-m trans-04 js-hide-modal-search">
			<div class="container-search-header">
				<button
					class="flex-c-m btn-hide-modal-search trans-04 js-hide-modal-search">
					<img src="../resources/main/images/icons/icon-close2.png"
						alt="CLOSE">
				</button>

				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search"
						placeholder="Search...">
				</form>
			</div>
		</div>
	</header>

	<!-- Cart -->
	<%@include file="../main/wishlist.jsp"%>


	<!-- Title page -->
	<form class="bg0 p-t-75 p-b-85">
 		<div class="order_title">
            <h1 class="header">상품 주문서</h1>
        </div>
		<div class="container-top">
			<div class="container-bottom-title">
                    <h5>배송지</h5>
            </div>
			<div class="top-radiobtn">
				<input type="radio" checked="checked" /><h6 id="check">회원정보와 동일</h6>
				<input type="radio" /><h6 id="check">새로운 배송지</h6>
			</div>
				<table border='1' id="addr">
				<tr>
					<td><label for="oder_rc" class="oder_rc">받는사람</label></td> 
					<td><input type="text" id="oder_rc" required value="${member.m_name }"/></td>
				
				</tr>
				<tr>
					<td><label for="rc_addr" class="addr-top">주소</label></td>
					<td>
						<table border='1' id="addr-detail">
							<tr>
								<td><input type="text" id="rc_addr" placeholder="우편번호" required value="${member.m_postcode }"/></td>
								<td><input type="button" value="주소검색" class="rc_addr"  /></td>
							
							</tr>
							<tr>
								<td  colspan='2'><input type="text" id="rc_addr_detail" placeholder="기본주소" required value="${member.m_addr }"/></td>
							</tr>
						</table>
						

					</td>
				</tr>
				<tr>
					<td><label for="m_email" class="m_email">이메일</label></td>
					<td><input type="email" id="m_email" required value="${member.m_email }"/></td>
				</tr>
				<tr>
					<td><label for="rec_tel" class="rec_tel">연락처</label></td>
					<td><input type="tel" id="rec_tel" required value="${member.m_tel }"/></td>
				</tr>
					
				</table>
		</div>
		
		<div class="container">
			<div class="row">
				<div class="col-lg-10 col-xl-7 m-lr-auto m-b-50">
					<div class="m-l-25 m-r--38 m-lr-0-xl">
						<div class="wrap-table-shopping-cart">
							<table class="table-shopping-cart">
								<tr class="table_head">
									<th class="column-1">Product</th>
									<th class="column-2"></th>
									<th class="column-3">Price</th>
									<th class="column-4">Quantity</th>
									<th class="column-5">Total</th>
								</tr>
								<!-- 장바구니 리스트 -->
								<c:forEach items="${shoppingCart }" var="shopping">
									<tr class="table_row">
										<td class="column-1">
											<div class="how-itemcart1">
												<img src="../resources/productImages/${shopping.p_imgrn }"
													alt="IMG">
											</div>
										</td>
										<td class="column-2" id="o_name">${shopping.o_name}</td>
										<td class="column-3" id="p_price">${shopping.p_price}</td>
										<td class="column-4">
											${shopping.cart_cnt}
										</td>
										<td class="column-5" id="shopping_total">${shopping.shopping_total }</td>

									</tr>

								</c:forEach>

							</table>
						</div>

					</div>
				</div>

			</div>
		</div>
		<div class="container-bottom">
                    <div class="container-bottom-title">
                    	<h5>결제정보 및 수단</h5>
                    </div>
                    <div>
                        <table class="container-bottom-table">
                            <tr>
                                <td>
                                    <label for="pay_by" id="pay_by">결제방법</label>
                                    <select>
                                        <option value="bank_acc">무통장입금</option>
                                        <option value="card_acc">카드결제</option>
                                    </select>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <span style="text-align: left; display:block; width:90px;">
                                    <label for="cashpay" id="cashpay">현금영수증</label></span>
                                    
                                </td>
                            </tr>

                        </table>
                    </div>
                </div>
                <div>
                
					<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
						<div
							class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm order">
							<h4 class="mtext-109 cl2 p-b-30">총 주문 금액</h4>
	
	
							<div class="flex-w flex-t p-t-27 p-b-33">
								<div class="size-208">
									<span class="mtext-101 cl2"> Total: </span>
								</div>
	
								<div class="size-209 p-t-1">
									<span id="totalAmount" class="mtext-110 cl2">0</span>
									<span class="mtext-110 cl2">원</span>
								</div>
							</div>
	
							<button class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer pay_btn">
								Pay</button>
						</div>
					</div>
                
                </div>
	</form>




	<!-- Footer -->
	<%@include file="../main/main-footer.jsp"%>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!--===============================================================================================-->
	<script src="../resources/main/vendor/jquery/jquery-3.2.1.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/main/vendor/animsition/js/animsition.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/main/vendor/bootstrap/js/popper.js"></script>
	<script src="../resources/main/vendor/bootstrap/js/bootstrap.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/main/vendor/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
	<!--===============================================================================================-->
	<script
		src="../resources/main/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<!--===============================================================================================-->
	<script
		src="../resources/main/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
	<script>
		$('.js-pscroll').each(function(){
			$(this).css('position','relative');
			$(this).css('overflow','hidden');
			var ps = new PerfectScrollbar(this, {
				wheelSpeed: 1,
				scrollingThreshold: 1000,
				wheelPropagation: false,
			});

			$(window).on('resize', function(){
				ps.update();
			})
		});
	</script>
	<!--===============================================================================================-->
	<script src="../resources/main/js/main.js"></script>
	<script>
		$('.main-menu > li').removeClass('active-menu');
		$('.main-menu > li:eq(2)').addClass('active-menu');
	</script>
	
	<!-- 다음 카카오 주소 가져오기 -->
	<script>
		$('.rc_addr').click(
				function() {

					new daum.Postcode({
						oncomplete : function(data) {
							// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

							// 각 주소의 노출 규칙에 따라 주소를 조합한다.
							// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
							var addr = ''; // 주소 변수
							var extraAddr = ''; // 참고항목 변수

							//사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
							if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
								addr = data.roadAddress;
							} else { // 사용자가 지번 주소를 선택했을 경우(J)
								addr = data.jibunAddress;
							}

							// 사용자가 선택한 주소가 도로명 타입일때 참고항목을 조합한다.
							if (data.userSelectedType === 'R') {
								// 법정동명이 있을 경우 추가한다. (법정리는 제외)
								// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
								if (data.bname !== ''
										&& /[동|로|가]$/g.test(data.bname)) {
									extraAddr += data.bname;
								}
								// 건물명이 있고, 공동주택일 경우 추가한다.
								if (data.buildingName !== ''
										&& data.apartment === 'Y') {
									extraAddr += (extraAddr !== '' ? ', '
											+ data.buildingName
											: data.buildingName);
								}
								// 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
								if (extraAddr !== '') {
									extraAddr = ' (' + extraAddr + ')';
								}
								addr += extraAddr;

							} else {
								addr += ' ';
							}

							// 우편번호와 주소 정보를 해당 필드에 넣는다.
							$('#rc_addr').val(data.zonecode);
							$('#rc_addr_detail').val(addr);
							// document.getElementById("sample6_address").value = addr;
							// 커서를 상세주소 필드로 이동한다.
							$("#rc_addr_detail").focus();
						}
					}).open();

				})
	</script>
</body>
</html>