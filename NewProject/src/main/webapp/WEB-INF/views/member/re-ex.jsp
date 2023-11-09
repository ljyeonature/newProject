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
	  min-width: 430px;
  	  height:600px;
    }
    
.container > .row > .wrap-table-shopping-cart > table .column-1 {
  width: 133px;
  padding-left: 176px;
}
form {
    display: inline-block; /* 인라인 블록 요소로 표시하여 가로로 정렬 */
    margin: 0 20px; /* 요소 사이의 간격을 조절 */
}

form#re{
	padding-left : 400px
}
form#ex {
	padding-left : 100px
}

div#point {
	margin-top:30px;
	margin-bottom:30px;
	margin-right : 300px;
    display: flex;
    justify-content: flex-end;
}
td > a > img {
	width:100px;
	height:100px;
}
h4, h6 {
	width:100px;
	text-align : center;
	justify-content: center;
	align-content: center;
}



#title {
    position:  absolute;
    top: 300px;
}

#small-title {
	position:  relative;
    top: 82px;
    left:-55px;
    width:210px
}

#content {
	position:  relative;
    bottom: -128px;
    
}

td.column-1 {
	width: 10px;
}

#content {
    text-align: center; /* 가운데 정렬 */
    margin: 0 auto; /* 수평 가운데 위치 */
    max-width: 600px; /* 최대 너비 지정 (원하는 값으로 조절) */
    position: relative; /* 위치 지정을 위해 상대 위치로 설정 */
    top: 134px; /* 위로 조절 (원하는 값으로 조절) */
}

#content {
    text-align: left; /* 텍스트를 왼쪽 정렬 */
    margin-left: -163px; /* 왼쪽 여백을 조절 (원하는 값으로 조절) */
}

a#ex {
	position:relative;
	top:179px;
	left:-31px
}

a#re {
	position:relative;
	top:179px;
	left:-31px
}

td.column-1 a {
	text-decoration : none;
	color : white;
	font-size : 20px;
	border : none;
	width : 200px;
	height : 50px;
	border-radius : 10px;
	padding : 10px 50px;
	background-color : black;
}

td.column-1 a:hover {
	color : white;
	background-color : gray;
}
 
</style>

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
	<%@include file="../main/wishlist.jsp" %>


	<!-- breadcrumb -->
	<div class="container">
		<div class="bread-crumb flex-w p-l-25 p-r-15 p-t-30 p-lr-0-lg">
			<a href="home" class="stext-109 cl8 hov-cl1 trans-04"> Home 
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a> 
			<a href="home" class="stext-109 cl8 hov-cl1 trans-04"> MyPAge 
			<i class="fa fa-angle-right m-l-9 m-r-10" aria-hidden="true"></i>
			</a>
			<span class="stext-109 cl4"> RE/EX </span>
		</div>
	</div>



	<!-- Shoping Cart -->
	<form class="bg0 p-t-75 p-b-85" id="re">
		<div class="container">
			<div class="row">

				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tbody id="mypage_menu">
							
							<tr class="table_row">
								<td class="column-1">
									<h1 id="title">교환</h1>
									<h4 id="small-title">교환 처리 시</h4>
									<p id="content">아래 교환 버튼을 누르면 Q&A 게시판에 자동으로 제목으로 <br/> <span>‘교환입니다’</span>의 게시물 등록 페이지로 넘어감</p>
									<a href="qna-add_ex" id="ex"> 교환 </a>
								</td>
								

							</tr>
						</tbody>
					</table>
				</div>

			</div>
		</div>
	</form>
	<form class="bg0 p-t-75 p-b-85" id="ex">
		<div class="container">
			<div class="row">

				<div class="wrap-table-shopping-cart">
					<table class="table-shopping-cart">
						<tbody id="mypage_menu">
							

							<tr class="table_row">
								<td class="column-1">
								<h1 id="title">환불</h1>
									<h4 id="small-title">환불 처리 시</h4>
									<p id="content">아래 환불 버튼을 누르면 Q&A 게시판에 자동으로 제목으로 <br/> <span>‘환불입니다’</span>의 게시물 등록 페이지로 넘어감</p>
									<a href="qna-add_re" id="re"> 환불 
									</a>
									
								</td>

							</tr>
						</tbody>
					</table>
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