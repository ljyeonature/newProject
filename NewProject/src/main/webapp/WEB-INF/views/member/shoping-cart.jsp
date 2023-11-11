<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>장바구니</title>
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
<!--===============================================================================================-->
<script src="../resources/main/jquery/jquery-3.2.1.min.js"></script>
<script>
$(function(){
	var m_id = $('#m_id').val();
	console.log(m_id);
	//수량 + 버튼 클릭시 -> 총합 업데이트
	$('.plus-button').on('click', function() {
	    // 옵션명
	    var o_name = $(this).closest('tr').find('.column-2').text();
	    // 개별 가격
	    var p_price = parseFloat($(this).closest('tr').find('.column-3').text());
	    // 개별 수량
	    var cart_cnt = parseInt($(this).closest('tr').find('.num-product').val());
	    // 총합
	    var shopping_total = parseFloat($(this).closest('tr').find('.column-5').text());
	
	    // 총합 업데이트
	    shopping_total = shopping_total + p_price;
	    $(this).closest('tr').find('.column-5').text(shopping_total);
	
	    // Ajax 요청을 보내서 서버에 수량 업데이트 요청
	    $.ajax({
	        type: "POST",
	        url: "plusCartCnt", // 서버의 컨트롤러 엔드포인트
	        data: { o_name: o_name, cart_cnt: cart_cnt, shopping_total: shopping_total, p_price: p_price, m_id:m_id },
	        success: function(response) {
	            // 서버에서 업데이트된 총합을 반환하면 화면에 업데이트
	            $(this).closest('tr').find('.column-5').text(response);
	            updateCartTotalAmount();
	        }.bind(this)
	    });
	});
	
	
    
	// + 버튼
	// 수량 - 버튼 클릭시 -> 총합 업데이트
		//수량 + 버튼 클릭시 -> 총합 업데이트
	$('.minus-button').on('click', function() {
    var o_name = $(this).closest('tr').find('.column-2').text();
    var p_price = parseFloat($(this).closest('tr').find('.column-3').text());
    var cart_cnt = parseInt($(this).closest('tr').find('.num-product').val());
    var shopping_total = parseFloat($(this).closest('tr').find('.column-5').text());
		//console.log(cart_cnt)

    shopping_total = shopping_total - p_price;
    $(this).closest('tr').find('.num-product').val(cart_cnt);
    $(this).closest('tr').find('.column-5').text(shopping_total);

    if (cart_cnt >= 1) {
        $.ajax({
            type: "POST",
            url: "minusCartCnt",
            data: { o_name: o_name, cart_cnt: cart_cnt, shopping_total: shopping_total, p_price: p_price, m_id: m_id },
            success: function(response) {
                $(this).closest('tr').find('.column-5').text(response);
                updateCartTotalAmount();
            }.bind(this)
        });
    } else {
        $(this).closest('tr').find('.num-product').val(1);
        shopping_total = p_price;
        $(this).closest('tr').find('.column-5').text(shopping_total);
        updateCartTotalAmount();
    }
});
		// 수량 - 끝
		
	// 총합계 구하기
	// 합계 구하기
	function updateCartTotalAmount() {
	    var m_id = $('#m_id').val();

	    // Ajax 요청을 보내서 서버에 장바구니 총합 요청
	    $.ajax({
	        type: "post",
	        url: "getCartTotal",
	        data: { m_id: m_id },
	        success: function(response) {
	            // 서버에서 계산된 총합을 받아와 화면에 업데이트
	            $('#totalAmount').text(response+"원");
	        },
	        error: function(error) {
	            console.log("Error fetching cart total:", error);
	        }
	    });
	}

	// 장바구니 총합 업데이트 호출
	updateCartTotalAmount();
	
        
    
    
	// 장바구니 삭제 - 이미지 클릭 시 삭제
	$('.how-itemcart1').on('click', function (){
		var oName = $(this).closest('tr').find('#o_name').text();
       	//console.log(oName);
		 // 사용자 확인 후 삭제 여부 묻기 (선택적)
        if (confirm('장바구니에서 이 상품을 삭제하시겠습니까?')) {
            // AJAX를 사용하여 서버에 삭제 요청 보내기
            $.ajax({
                type: 'POST',
                url: 'removeCartItem', // 실제 서버의 삭제 요청을 처리하는 URL로 변경
                data: { o_name: oName },
                success: function (response) {
                    // 서버에서 성공적으로 처리된 경우에만 화면에서 해당 상품 제거
                    if (response == "ok") {
                        alert('상품이 성공적으로 삭제되었습니다.');
                        //swal("", "장바구니에서 삭제되었습니다", "success");
                        location.reload();
                        // 화면에서 해당 행 제거
                        $(this).closest('tr').remove();
                    } else {
                        alert('상품 삭제에 실패하였습니다.');
                        //swal("", "장바구니에서 삭제되지 않았습니다", "success");
                    }
                },
                error: function () {
                    alert('상품 삭제 중 오류가 발생했습니다.');
                }
            });
        }
    });
	
	// 장바구니에 상품이 없는 경우 주문 페이지로 못가게 해야 함.
	$('.pay').on('click', function(){
		if($('#totalAmount').text() !== '원') {
			$('#pay').submit();
		} else {
			alert("주문할 상품이 없습니다.");
		}
		
	})

	
	
}); // 스크립트 끝

</script>


</head>
<body class="animsition">

	<!-- Header -->
	<header class="header-v4">
		<!-- Header desktop -->
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
							href="#" class="flex-c-m p-lr-10 trans-04"> My Account </a> <a
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
	<c:if test="${not empty sessionScope.logname}">
	<%@include file="../main/wishlist.jsp" %>
	</c:if>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="member/home" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
				class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> Shoping Cart </span>
		</div>
	</div>


	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" method="post" action="member-order" id="pay">
		<input type="hidden" value="${sessionScope.logid }" id="m_id" name="m_id"/>
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
									<th class="column-4"  style="text-align: center;">>Quantity</th>
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
											<div class="wrap-num-product flex-w m-l-auto m-r-0">
												<div
													class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m minus-button"  id="minus">
													<i class="fs-16 zmdi zmdi-minus"></i>
												</div>
	
												<input class="mtext-104 cl3 txt-center num-product"
													type="number" value="${shopping.cart_cnt}" id="cart_cnt">
	
												<div class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m plus-button" id="plus">
													<i class="fs-16 zmdi zmdi-plus"></i>
												</div>
											</div>
										</td>
										<td class="column-5" id="shopping_total" >${shopping.shopping_total }</td>
										
									</tr>
								
								</c:forEach>

							</table>
						</div>

					</div>
				</div>

				<div class="col-sm-10 col-lg-7 col-xl-5 m-lr-auto m-b-50">
					<div
						class="bor10 p-lr-40 p-t-30 p-b-40 m-l-63 m-r-40 m-lr-0-xl p-lr-15-sm">
						<h4 class="mtext-109 cl2 p-b-30">Cart Totals</h4>


						<div class="flex-w flex-t p-t-27 p-b-33">
							<div class="size-208">
								<span class="mtext-101 cl2"> Total: </span>
							</div>

							<div class="size-209 p-t-1">
								<span id="totalAmount" class="mtext-110 cl2">0원</span>
							</div>
						</div>
						<button type="button" class="flex-c-m stext-101 cl0 size-116 bg3 bor14 hov-btn3 p-lr-15 trans-04 pointer pay">주문</button>
					</div>
				</div>
			</div>
		</div>
	</form>




	<!-- Footer -->
	<%@include file="../main/main-footer.jsp" %>


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
	

</body>
</html>