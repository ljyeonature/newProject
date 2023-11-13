<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>주문조회</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../resources/main/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/vendor/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/vendor/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/main/vendor/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/vendor/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/vendor/select2/select2.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/vendor/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resources/main/css/main.css">
	<link rel="stylesheet" type="text/css" href="../resources/main/css/order_search.css">
<!--===============================================================================================-->

<!-- 제이쿼리CDN -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- JS -->
<script type="text/javascript">
	$(document).ready(function() {

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
	
		<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92"
		style="background-image: url('../resources/main/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">My Order</h2>
	</section>

	<div class="board_wrap">
        <div class="board_title">
            <h1>내 주문목록</h1>
            <p>주문하신 상품들을 확인하세요.</p>
        </div>
        
        <div class="board_list_wrap">
            <div class="board_list">
                <div class="top">
                    <div class="date">주문일시</div>
                    <div class="product">주문번호</div>
                    <div class="price">구매금액</div>
                    <div class="status">주문상태</div>
                </div>
                <c:forEach items="${orderList}" var="o">
                <div>
                    <div class="date">${o.o_date}</div>
                    <div class="product"><a href="#">${o.o_id}</a></div>
                    <div class="price">${o.pay_amount}</div>
                    <div class="status">${o.o_status}</div>
                </div>
                </c:forEach>
            </div>

            </div>
        </div>
<!--     <div class="addcontainer">
        <form>      
            <h2>수령자 정보</h2>
            <div style="display: flex;">
                <input type="text" id="import_name" name="import_name" value="홍길동" required readonly>
                <input type="text" id="import_tel" name="import_tel" value="010-1234-5678" required readonly>
                <input type="text" id="import_postcode" name="import_postcode" value="22678" required readonly>
                <input type="text" id="import_addr" name="import_addr" value="서울특별시 마포구 백범로23" required readonly>
            </div>
            <h2>구매상품정보</h2>
            <textarea id="q_import_content" name="q_import_content" rows="10" required readonly style="width: 100%;">구피,테트라 어항</textarea>
            <h2>결제정보</h2>
            <div style="display: flex;">
            <input type="text" id="import_pay" name="import_pay" value="무통장입금" required readonly>
                <input type="text" id="import_price" name="import_price" value="120000" required readonly>
                </div>
            
        </form>
    </div> -->
        
        


	<!-- Footer -->
	<%@include file="../main/main-footer.jsp" %>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top">
			<i class="zmdi zmdi-chevron-up"></i>
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
	<script src="../resources/main/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/main/vendor/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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
</body>
</html>