<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>MyPage</title>
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
<style>

.container > .row > .wrap-table-shopping-cart > table {
	  border-collapse: collapse;
	  width: 100%;
	  min-width: 300px;
	  height:300px;
}
    
.container > .row > .wrap-table-shopping-cart > table .column-1 {
  width: 150px;
  padding-left : 100px;
}
form {
    display: inline-block; /* 인라인 블록 요소로 표시하여 가로로 정렬 */
    margin: 0 20px; /* 요소 사이의 간격을 조절 */
}


div#point {
    display: flex;
    justify-content: flex-end;
}
td > a > img {
	width:100px;
	height:100px;
}
.start h4, h6 {
	width:100px;
	text-align : center;
	justify-content: center;
	align-content: center;
}

 
</style>

</head>
<body class="animsition">

	<!-- Header -->
	<header>
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
	<%@include file="../main/wishlist.jsp" %>

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../resources/main/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			MyPage
		</h2>
	</section>

	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="home" class="stext-109 cl8 hov-cl1 trans-04"> Home <i
				class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> <span class="stext-109 cl4"> MyPage </span>
		</div>
	</div>



	<!-- Shoping Cart -->
	
	<div class="start" style="display: flex; justify-content: center; align-items: center;">
	<form class="bg0 p-t-75 p-b-85" id="first">
		<div class="container">
			<div class="row">

				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tbody id="mypage_menu">
							
							<tr class="table_row">
								<td class="column-1">
									<a href="member-info?m_id=${sessionScope.logid }">
										<img src="../resources/main/images/member.png" alt="IMG">
										<h4>MEMBER</h4>
										<h6>회원정보수정</h6>
									</a>
								</td>

							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</form>
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">

				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tbody id="mypage_menu">
							

							<tr class="table_row">
								<td class="column-1">
									<a href="order_search?m_id=${sessionScope.logid}">
										<img src="../resources/main/images/order.png" alt="IMG">
										<h4>ORDER</h4>
										<h6>주문정보</h6>
									</a>
									
								</td>

							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</form>
	<form class="bg0 p-t-75 p-b-85">
		<div class="container">
			<div class="row">

				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tbody id="mypage_menu">
							

							<tr class="table_row">
								<td class="column-1">
									<a href="qna?sltfilter=m_id&search=${sessionScope.logid}">
										<img src="../resources/main/images/qna.png" alt="IMG">
										<h4>Q&A</h4>
										<h6>게시판</h6>
									</a>
								
								</td>

							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</form>
	<form class="bg0 p-t-75 p-b-85" style="padding-top: 10px;">
	
			<div class="flex-w flex-m m-r-20 m-tb-5" id="point" style="margin-right: 2px;">
		<input class="stext-104 cl2 plh4 size-117 bor13 p-lr-20 m-r-10 m-tb-5"
			type="text" name="coupon" placeholder="POINT" value="${member.m_point}" readonly style="text-align: center; width: 160px;">

		<div
			class="flex-c-m stext-101 cl2 size-118 bg8 bor13 hov-btn3 p-lr-15 trans-04 pointer m-tb-5"  style="min-width: 100px !important;">
			Point</div>
	</div>
	
		<div class="container">
			<div class="row">

				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tbody id="mypage_menu">
							
							<tr class="table_row">
								<td class="column-1">
									<a href="re-ex">
										<img src="../resources/main/images/re-ex.png" alt="IMG">
										<h4>RE/EX</h4>
										<h6 style="width: 109px;">환불/교환</h6>
									</a>
									
								
								</td>

							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</form>
</div>




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