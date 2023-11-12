<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
	<title>교환문의</title>
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
	<link rel="stylesheet" type="text/css" href="../resources/main/css/QnA게시판글.css">
<!--===============================================================================================-->

<!-- 제이쿼리CDN -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>

<script src="https://code.jquery.com/jquery-3.6.4.min.js"></script>
<script>
    $(document).ready(function () {
        $('#product_category').change(function () {
            var selectedCategory = $(this).val();
            var targetSelect = $('#q_product');
            targetSelect.empty();
            switch (selectedCategory) {
                case 'fish':
                    targetSelect.append('<option selected disabled value="물고기" name="product_type">물고기</option>');
                    targetSelect.append('<option value="구피" name="product_type">구피</option>');
                    targetSelect.append('<option value="플레티" name="product_type">플레티</option>');
                    targetSelect.append('<option value="금붕어" name="product_type">금붕어</option>');
                    targetSelect.append('<option value="잉어" name="product_type">잉어</option>');
                    targetSelect.append('<option value="디스커스" name="product_type">디스커스</option>');
                    targetSelect.append('<option value="시클리드" name="product_type">시클리드</option>');
                    targetSelect.append('<option value="베타" name="product_type">베타</option>');
                    targetSelect.append('<option value="구라미" name="product_type">구라미</option>');
                    targetSelect.append('<option value="복어" name="product_type">복어</option>');
                    targetSelect.append('<option value="테트라" name="product_type">테트라</option>');
                    break;
                case 'deco':
                    targetSelect.append('<option selected disabled value="조경용품" name="product_type">조경용품</option>');
                    targetSelect.append('<option value="subo바닥재" name="product_type">subo바닥재</option>');
                    targetSelect.append('<option value="마이스터소일" name="product_type">마이스터소일</option>');
                    targetSelect.append('<option value="녹색공원수초" name="product_type">녹색공원수초</option>');
                    targetSelect.append('<option value="초보자수초" name="product_type">초보자수초</option>');
                    targetSelect.append('<option value="그로비타큐브" name="product_type">그로비타큐브</option>');
                    targetSelect.append('<option value="그로비타와이드" name="product_type">그로비타와이드</option>');
                    targetSelect.append('<option value="복주머니" name="product_type">복주머니</option>');
                    break;
                case 'etc':
                    targetSelect.append('<option selected disabled value="기타용품" name="product_type">기타용품</option>');
                    targetSelect.append('<option value="라글라스뜰채" name="product_type">라글라스뜰채</option>');
                    targetSelect.append('<option value="이스타뜰채" name="product_type">이스타뜰채</option>');
                    targetSelect.append('<option value="아로와나" name="product_type">아로와나</option>');
                    targetSelect.append('<option value="테트라푸드" name="product_type">테트라푸드</option>');
                    targetSelect.append('<option value="핑퐁스타" name="product_type">핑퐁스타</option>');
                    targetSelect.append('<option value="아마존818" name="product_type">아마존818</option>');
                    targetSelect.append('<option value="아마존" name="product_type">아마존</option>');
                    targetSelect.append('<option value="필그린" name="product_type">필그린</option>');
                    targetSelect.append('<option value="아마존LED" name="product_type">아마존LED</option>');
                    targetSelect.append('<option value="웨이브포인트" name="product_type">웨이브포인트</option>');
                    targetSelect.append('<option value="온도계모음" name="product_type">온도계모음</option>');
                    targetSelect.append('<option value="테트라디지털" name="product_type">테트라디지털</option>');
                    break;
                default:
                    targetSelect.append('<option selected disabled value="선택하세요" name="product_type">선택하세요</option>');
                    break;
            }
        });
    });
</script>




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

<!-- 				<form class="wrap-search-header flex-w p-l-15">
					<button class="flex-c-m trans-04">
						<i class="zmdi zmdi-search"></i>
					</button>
					<input class="plh3" type="text" name="search"
						placeholder="Search...">
				</form> -->
			</div>
		</div>
	</header>

	<!-- Cart -->
	<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2"> Your Cart </span>

				<div
					class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>

			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="../resources/main/images/item-cart-01.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								White Shirt Pleat </a> <span class="header-cart-item-info"> 1
								x $19.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="../resources/main/images/item-cart-02.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Converse All Star </a> <span class="header-cart-item-info"> 1
								x $39.00 </span>
						</div>
					</li>

					<li class="header-cart-item flex-w flex-t m-b-12">
						<div class="header-cart-item-img">
							<img src="../resources/main/images/item-cart-03.jpg" alt="IMG">
						</div>

						<div class="header-cart-item-txt p-t-8">
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04">
								Nixon Porter Leather </a> <span class="header-cart-item-info">
								1 x $17.00 </span>
						</div>
					</li>
				</ul>

				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40">Total: $75.00</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							View Cart </a> <a href="shoping-cart"
							class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							Check Out </a>
					</div>
				</div>
			</div>
		</div>
	</div>

	

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92"
		style="background-image: url('../resources/main/images/bg-02.jpg');">
		<h2 class="ltext-105 cl0 txt-center">Q&A</h2>
	</section>

    <h1>교환문의</h1>
    <p>궁금하신 모든것을 물어보세요.</p>
    <form action="qna-add_do" method="post">
    	<input type="text" id="q_import_inquiry" name="q_inquiry" value="상품문의" required readonly>
    <br/>
    <div class="addcontainer">
    		<input type="hidden" id="m_id" value="${sessionScope.logid}" name="m_id">
            <label for="type_select">제품선택</label>
			<div style="display: flex;">
			<input type="text" id="q_product_inquiry" name="p_inq_type" value="교환문의" readonly>
            <select id="product_category"
					style="width: 130px; text-align: center;">
					<option selected disabled>카테고리</option>
					<option value="fish">물고기</option>
					<option value="deco">조경용품</option>
					<option value="etc">기타용품</option>
				</select>
				<select id="q_product" name="q_product"
					style="width: 130px; text-align: center;">
					<option selected disabled>선택하세요</option>
				</select>
			</div>
            
            <label for="title">제목</label>
            <input type="text" id="q_title" name="q_title" required>
            
            <label for="content">내용</label>
            <textarea id="q_content" name="q_content" rows="13" required></textarea>
            
            <label>게시글 비밀번호</label>
            <input type="password" id="q_pass" name="q_pass" required>
        
        <div class="button-container">
            <a class="list-button" href="qna">목록</a>
            <input class="submit-button" type="submit" value="작성완료">
            <a class="cancel-button" href="re-ex">취소</a>
        </div>					
          </form>  
    </div>



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