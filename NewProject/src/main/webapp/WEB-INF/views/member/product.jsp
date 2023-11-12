<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Product</title>
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
	href="../resources/main/vendor/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/slick/slick.css">
<!--===============================================================================================-->
<link rel="stylesheet" type="text/css"
	href="../resources/main/vendor/MagnificPopup/magnific-popup.css">
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
	

		var m_id = $('#logid').val();
		//console.log(m_id);
		var wishlistState = [];

		// Ajax 요청으로 서버에서 찜 목록 및 하트 색깔 정보 가져오기
		$.ajax({
		    type: 'post',
		    data: { m_id: m_id },
		    url: 'wishlist_all',
		    success: function (response) {
		        //console.log(response);

		        // 제이슨 스트링 변환
		        var data = JSON.stringify(response);
		        // 다시 제이슨 변환
		        var wishlistArray = JSON.parse(data);
		        //console.log(wishlistArray[0].wishstate);

		        wishlistState = wishlistArray;
		        
		        console.log(wishlistState);

		        // 각 상품에 대해 화면 업데이트
		        $('.js-addwish-b2, .js-addwish-detail').each(function (index) {
		            var selIdProduct = $(this).parent().parent().find('.js-selid-b2').val();
		            console.log(selIdProduct)
		            var heartImage = $(this).find('img');
		            var isWishlistItem = wishlistArray[index].wishstate;
		            updateHeartColor(selIdProduct, isWishlistItem);

		            if (isWishlistItem) {
		                // 찜 목록에 있는 경우, 필요한 추가 작업 수행
		                // 예: 찜 목록에서 제거할 수 있는 버튼 추가 등
		            }
		        });

		        // 클릭 이벤트 핸들러 등록
		        $('.js-addwish-b2, .js-addwish-detail').on('click', function (e) {
		            e.preventDefault();
		            var selIdProduct = $(this).parent().parent().find('.js-selid-b2').val();
		            var heartImage = $(this).find('img');

		            var isWishlistItem = wishlistState.find(item => item.p_selid === selIdProduct);

		            if (isWishlistItem) {
		                // 이미 찜한 경우, 제거
		                $(heartImage).attr('src', $(heartImage).attr('src').replace('heart-02', 'heart-01'));
		                deleteItemFromWishlist(selIdProduct);
		                var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		                swal(nameProduct, "찜 삭제하였습니다", "success");
		            } else {
		                // 찜하지 않은 경우, 추가
		                var nameProduct = $(this).parent().parent().find('.js-name-b2').val();
		                var priceProduct = $(this).parent().parent().find('.js-price-b2').val();
		                var imgProduct = $(this).parent().parent().find('.js-img-b2').val();
		                var param = {
		                    m_id: m_id,
		                    p_selid: selIdProduct,
		                    p_name: nameProduct,
		                    p_price: priceProduct,
		                    p_imgrn: imgProduct
		                };
		                addItemToWishlist(param);
		                wishlistState.push({ p_selid: selIdProduct, /* other properties */ });
		                $(heartImage).attr('src', $(heartImage).attr('src').replace('heart-01', 'heart-02'));
		                var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
		                swal(nameProduct, "찜 추가하였습니다", "success");
		            }
		        });
		    },
		    error: function (err) {
		        console.log(err);
		    }
		}); // ajax
		
		 // 실제 위시리스트에 항목 추가
	    function addItemToWishlist(param) {
	        $.ajax({
	            type: 'post',
	            data: param,
	            url: 'product_wishlist',
	            success: function (result) {
	                if (result === "error") {
	                    console.log(result);
	                } else {
	                    //alert(result);
	                }
	            },
	            error: function (err) {
	                console.log(err);
	            }
	        });
	    }

	    // 위시리스트에서 항목 제거
	    function removeItemFromWishlist(selId) {
	        $.ajax({
	            type: 'post',
	            data: { p_selid: selId },
	            url: 'delete_wishlist',
	            success: function (result) {
	                if (result === "delete") {
	                    //alert(result);
	                } else if (result === "fail") {
	                    //alert(result);
	                }
	            },
	            error: function (err) {
	                console.log(err);
	            }
	        });
	    }

		function updateHeartColor(selId, isWishlistItem) {
		    // isWishlistItem이 true이면 하트를 색깔 있는 상태로 업데이트,
		    // false이면 하트를 색깔 없는 상태로 업데이트
		    var heartImage = $('.js-addwish-b2, .js-addwish-detail').find('img');
					    

		    if (isWishlistItem && isWishlistItem.wishstate === 1) {
		        $(heartImage).attr('src', $(heartImage).attr('src').replace('heart-01', 'heart-02'));
		    } else {
		        $(heartImage).attr('src', $(heartImage).attr('src').replace('heart-02', 'heart-01'));
		    }
		}
		
		
		

	
	    
	    // quick-view
	 /*    $.ajax({
	$(function(){
		
	    	
	    	type:'post',
	    	data:{p:selid : }
	    	
	    	
	    	
	    });// ajax */


		/*---------------------------------------------*/
		
		// 대분류
	 	$('.filter-tope-group button').on('click', function(){
	 		 var fstdivid = $(this).data('filter');
	 		 var logid = $('#logid').val();
	 		 $.ajax({
	 			 type : 'post',
	 			 data : {fstdivid : fstdivid},
	 			 dataType :'JSON',
	 			 url : 'fishAll',
	 			 success : function(response){
	 				$('.isotope-grid').empty();
	 			

	 				$.each(response, function(index, item) {
	 					
	 					var leftPercentage = (index % 4) * 25; // 0%, 25%, 50%, 75%
	 				    var topValue = Math.floor(index / 4) * 485;
	 				   var productHTML = 
	 					    '<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item" style="position: absolute; left: ' + leftPercentage + '%; top: ' + topValue + 'px;">' +
	 					        '<div class="block2">' +
	 					            '<div class="block2-pic hov-img0">' +
	 					                '<img src="../resources/productImages/' + item.p_imgrn + '" alt="IMG-PRODUCT">' +
	 					                '<a href="product_quickview?p_selid=' + item.p_selid + '" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 quickView">Quick View</a>' +
	 					            '</div>' +
	 					            '<div class="block2-txt flex-w flex-t p-t-14">' +
	 					                '<div class="block2-txt-child1 flex-col-l">' +
	 					                    '<a href="product-detail?m_id=' + logid + '&p_selid=' + item.p_selid + '" class="stext-104 cl4 hov-cl1 trans-04 p-b-6 js-name-b2" data-name="' + item.p_name + '">' + item.p_name + '</a>' +
	 					                    '<input type="hidden" value="' + logid + '" id="logid"/>' +
	 					                    '<input type="hidden" value="' + item.p_selid + '" class="js-selid-b2"/>' +
	 					                    '<input type="hidden" value="' + item.p_name + '" class="js-name-b2" id="p_name"/>' +
	 					                    '<input type="hidden" value="' + item.p_price + '" id="p_price" class="js-price-b2"/>' +
	 					                    '<input type="hidden" value="' + item.p_imgrn + '" class="js-img-b2"/>' +
	 					                    '<span class="stext-105 cl3" id="p_price">' + item.p_price + '원</span>' +
	 					                '</div>' +
	 					                '<div class="block2-txt-child2 flex-r p-t-3">' +
	 					                    '<div class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">' +
	 					                        '<img class="icon-heart1 dis-block trans-04" src="../resources/main/images/icons/icon-heart-01.png" alt="ICON" id="empty-heart">' +
	 					                    '</div>' +
	 					                '</div>' +
	 					            '</div>' +
	 					        '</div>' +
	 					    '</div>';


	 				      // 높이 동적으로 계산하여 설정
	 				      var currentHeight = $('.isotope-grid').height();
	 				      var newHeight = topValue + 485; // 높이를 현재 높이와 topValue+485 중 큰 값으로 설정
	 				      $('.isotope-grid').css("position","relative");
	 				      $('.isotope-grid').css("height", Math.max(currentHeight, newHeight) + "px");

	 				    $('.isotope-grid').append(productHTML);
	 				});
	 				// each 끝
	 				 
	 	            
	 			 } 
	 			 //
	 		 });
	 		 // ajax
	 	}); // 클릭 시 - 대분류
	    
	    
	    
	    // 필터링 바
	    $('.price-link').on('click', function(e){
	    	e.preventDefault(); 
	    	$('.price-link').removeClass('filter-link-active');
	    	var condition = $(this).data('filter');
	    	$(this).addClass('filter-link-active');
	 		 alert(condition)
	 		 var logid = $('#logid').val();
	 		 $.ajax({
	 			 type : 'post',
	 			 data : {condition : condition},
	 			 dataType :'JSON',
	 			 url : 'priceAll',
	 			 success : function(response){
	 			
	 				$('.isotope-grid').empty();

	 				$.each(response, function(index, item) {
	 					
	 					var leftPercentage = (index % 4) * 25; // 0%, 25%, 50%, 75%
	 				    var topValue = Math.floor(index / 4) * 485;
	 				   var productHTML = 
	 					    '<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item" style="position: absolute; left: ' + leftPercentage + '%; top: ' + topValue + 'px;">' +
	 					        '<div class="block2">' +
	 					            '<div class="block2-pic hov-img0">' +
	 					                '<img src="../resources/productImages/' + item.p_imgrn + '" alt="IMG-PRODUCT">' +
	 					                '<a href="product_quickview?p_selid=' + item.p_selid + '" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 quickView">Quick View</a>' +
	 					            '</div>' +
	 					            '<div class="block2-txt flex-w flex-t p-t-14">' +
	 					                '<div class="block2-txt-child1 flex-col-l">' +
	 					                    '<a href="product-detail?m_id=' + logid + '&p_selid=' + item.p_selid + '" class="stext-104 cl4 hov-cl1 trans-04 p-b-6 js-name-b2" data-name="' + item.p_name + '">' + item.p_name + '</a>' +
	 					                    '<input type="hidden" value="' + logid + '" id="logid"/>' +
	 					                    '<input type="hidden" value="' + item.p_selid + '" class="js-selid-b2"/>' +
	 					                    '<input type="hidden" value="' + item.p_name + '" class="js-name-b2" id="p_name"/>' +
	 					                    '<input type="hidden" value="' + item.p_price + '" id="p_price" class="js-price-b2"/>' +
	 					                    '<input type="hidden" value="' + item.p_imgrn + '" class="js-img-b2"/>' +
	 					                    '<span class="stext-105 cl3" id="p_price">' + item.p_price + '원</span>' +
	 					                '</div>' +
	 					                '<div class="block2-txt-child2 flex-r p-t-3">' +
	 					                    '<div class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">' +
	 					                        '<img class="icon-heart1 dis-block trans-04" src="../resources/main/images/icons/icon-heart-01.png" alt="ICON" id="empty-heart">' +
	 					                    '</div>' +
	 					                '</div>' +
	 					            '</div>' +
	 					        '</div>' +
	 					    '</div>';


	 				      // 높이 동적으로 계산하여 설정
	 				      var currentHeight = $('.isotope-grid').height();
	 				      var newHeight = topValue + 485; // 높이를 현재 높이와 topValue+485 중 큰 값으로 설정
	 				      $('.isotope-grid').css("position","relative");
	 				      $('.isotope-grid').css("height", Math.max(currentHeight, newHeight) + "px");

	 				    $('.isotope-grid').append(productHTML);
	 				});
	 				// each 끝
	 				 
	 	            
	 			 } 
	 			 //
	 		 });
	 		 // ajax
	 	}); // 클릭 시 - 가격
	 	
	 	// 컬러
	 	$('.color-link').on('click', function(e){
	    	e.preventDefault(); 
	    	$('.color-link').removeClass('filter-link-active');
	    	var color = $(this).data('filter');
	 		//alert(color)
	    	
	    	$(this).addClass('filter-link-active');
	 				$('.isotope-grid').empty();
	 		 var logid = $('#logid').val();
	 		 $.ajax({
	 			 type : 'post',
	 			 data : {color : color},
	 			 dataType :'JSON',
	 			 url : 'colorAll',
	 			 success : function(response){
	 			

	 				$.each(response, function(index, item) {
	 					
	 					var leftPercentage = (index % 4) * 25; // 0%, 25%, 50%, 75%
	 				    var topValue = Math.floor(index / 4) * 485;
	 				   var productHTML = 
	 					    '<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item" style="position: absolute; left: ' + leftPercentage + '%; top: ' + topValue + 'px;">' +
	 					        '<div class="block2">' +
	 					            '<div class="block2-pic hov-img0">' +
	 					                '<img src="../resources/productImages/' + item.p_imgrn + '" alt="IMG-PRODUCT">' +
	 					                '<a href="product_quickview?p_selid=' + item.p_selid + '" class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 quickView">Quick View</a>' +
	 					            '</div>' +
	 					            '<div class="block2-txt flex-w flex-t p-t-14">' +
	 					                '<div class="block2-txt-child1 flex-col-l">' +
	 					                    '<a href="product-detail?m_id=' + logid + '&p_selid=' + item.p_selid + '" class="stext-104 cl4 hov-cl1 trans-04 p-b-6 js-name-b2" data-name="' + item.p_name + '">' + item.p_name + '</a>' +
	 					                    '<input type="hidden" value="' + logid + '" id="logid"/>' +
	 					                    '<input type="hidden" value="' + item.p_selid + '" class="js-selid-b2"/>' +
	 					                    '<input type="hidden" value="' + item.p_name + '" class="js-name-b2" id="p_name"/>' +
	 					                    '<input type="hidden" value="' + item.p_price + '" id="p_price" class="js-price-b2"/>' +
	 					                    '<input type="hidden" value="' + item.p_imgrn + '" class="js-img-b2"/>' +
	 					                    '<span class="stext-105 cl3" id="p_price">' + item.p_price + '원</span>' +
	 					                '</div>' +
	 					                '<div class="block2-txt-child2 flex-r p-t-3">' +
	 					                    '<div class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">' +
	 					                        '<img class="icon-heart1 dis-block trans-04" src="../resources/main/images/icons/icon-heart-01.png" alt="ICON" id="empty-heart">' +
	 					                    '</div>' +
	 					                '</div>' +
	 					            '</div>' +
	 					        '</div>' +
	 					    '</div>';


	 				      // 높이 동적으로 계산하여 설정
	 				      var currentHeight = $('.isotope-grid').height();
	 				      var newHeight = topValue + 485; // 높이를 현재 높이와 topValue+485 중 큰 값으로 설정
	 				      $('.isotope-grid').css("position","relative");
	 				      $('.isotope-grid').css("height", Math.max(currentHeight, newHeight) + "px");

	 				    $('.isotope-grid').append(productHTML);
	 				});
	 				// each 끝
	 				 
	 	            
	 			 } 
	 			 //
	 		 });
	 		 // ajax
	 	}); // 클릭 시 - 컬러
	    
	 
 
	
	});// end
	
	
	</script>
	
<style>

form {
	width: 100%;
	display : flex;
}

</style>
</head>
<body class="animsition">

	<!-- Header -->
	<header>
		<!-- Header desktop -->

		<!-- Topbar -->
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
	<c:if test="${not empty sessionScope.logname}">
	<%@include file="../main/wishlist.jsp" %>
	</c:if>
	
	<input type="hidden" value="${sessionScope.logid }" id="logid"/>
	
	

	<!-- Title page -->
	<section class="bg-img1 txt-center p-lr-15 p-tb-92" style="background-image: url('../resources/main/images/bg-01.jpg');">
		<h2 class="ltext-105 cl0 txt-center">
			Shop
		</h2>
	</section>

	<!-- Product -->
	<div class="bg0 m-t-23 p-b-140">
		<div class="container">
			<div class="flex-w flex-sb-m p-b-52">
				<div class="flex-w flex-l-m filter-tope-group m-tb-10">
					<button
						class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5 how-active1"
						data-filter="A">All Products</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5" id="F"
						data-filter="F">물고기</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter="D">조경용품</button>

					<button class="stext-106 cl6 hov1 bor3 trans-04 m-r-32 m-tb-5"
						data-filter="E">기타용품</button>

				</div>

				<div class="flex-w flex-c-m m-tb-10">
					<div
						class="flex-c-m stext-106 cl6 size-104 bor4 pointer hov-btn3 trans-04 m-r-8 m-tb-4 js-show-filter">
						<i
							class="icon-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-filter-list"></i>
						<i
							class="icon-close-filter cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Filter
					</div>

					<div
						class="flex-c-m stext-106 cl6 size-105 bor4 pointer hov-btn3 trans-04 m-tb-4 js-show-search">
						<i class="icon-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-search"></i>
						<i
							class="icon-close-search cl2 m-r-6 fs-15 trans-04 zmdi zmdi-close dis-none"></i>
						Search
					</div>
				</div>

				<!-- Search product -->
				<div class="dis-none panel-search w-full p-t-10 p-b-15">
					<div class="bor8 dis-flex p-l-15">
					<form>
						<button class="size-113 flex-c-m fs-16 cl2 hov-cl1 trans-04" id="search_btn" type="submit">
							<i class="zmdi zmdi-search"></i>
						</button>

						<input class="mtext-107 cl2 size-114 plh2 p-r-15" type="text"
							name="search" placeholder="Search">
					
					</form>
					</div>
				</div>

				<!-- Filter -->
				<div class="dis-none panel-filter w-full p-t-10">
					<div
						class="wrap-filter flex-w bg6 w-full p-lr-40 p-t-27 p-lr-15-sm">
						<!-- <div class="filter-col1 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">대표 물고기</div>

							<ul class="fish-set">
								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04" data-filter="구피"> 구피 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04" data-filter="금붕어"> 금붕어 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04" data-filter="디스커스"> 디스커스 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04 filter-link-active" data-filter="베타">
										베타 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04" data-filter="low"> 가격 낮은 순
								</a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link stext-106 trans-04" data-filter="high"> 가격 높은 순
								</a></li>
							</ul>
						</div> -->

						<div class="filter-col2 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">가격</div>

							<ul>
								<li class="p-b-6"><a href="#"
									class="filter-link price-link stext-106 trans-04 filter-link-active">
										All </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link price-link stext-106 trans-04" data-filter="0"> 0 - 1000 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link price-link stext-106 trans-04" data-filter="1"> 1000 - 5000 </a></li>

								<li class="p-b-6"><a href="#"
									class="filter-link price-link stext-106 trans-04" data-filter="2"> 5000 - 10000 </a>
								</li>

								<li class="p-b-6"><a href="#"
									class="filter-link price-link stext-106 trans-04" data-filter="3"> 10000 - 50000 </a>
								</li>

								<li class="p-b-6"><a href="#"
									class="filter-link price-link stext-106 trans-04" data-filter="4"> 50000 - </a></li>
							</ul>
						</div>

						<div class="filter-col3 p-r-15 p-b-27">
							<div class="mtext-102 cl2 p-b-15">색깔</div>

							<ul>
								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #1DDB16;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link color-link stext-106 trans-04 filter-link-active" data-filter="그린"> Green </a>
								</li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #FFA500;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#"
									class="filter-link stext-106 trans-04" data-filter="오렌지">
										Orange </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #FFE400;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link color-link stext-106 trans-04" data-filter="옐로우"> Yellow </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #FF9090;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link color-link stext-106 trans-04" data-filter="스트로베리"> Strawberry </a>
								</li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #fa4251;"> <i class="zmdi zmdi-circle"></i>
								</span> <a href="#" class="filter-link color-link stext-106 trans-04" data-filter="레드"> Red </a></li>

								<li class="p-b-6"><span class="fs-15 lh-12 m-r-6"
									style="color: #aaa;"> <i class="zmdi zmdi-circle-o"></i>
								</span> <a href="#" class="filter-link color-link stext-106 trans-04" data-filter="화이트"> White </a>
								</li>
							</ul>
						</div>

						<div class="filter-col4 p-b-27">
							<div class="mtext-102 cl2 p-b-15">Tags</div>

							<div class="flex-w p-t-4 m-r--5">
								<a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Fashion </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Lifestyle </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Denim </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Streetstyle </a> <a href="#"
									class="flex-c-m stext-107 cl6 size-301 bor7 p-lr-15 hov-tag1 trans-04 m-r-5 m-b-5">
									Crafts </a>
							</div>
						</div>
					</div>
				</div>
			</div>
			
			
		<!-- 상품 불러오기 -->
			<div class="row isotope-grid" >
			
			<c:forEach items="${productAll }" var="product">
			
				
				<div class="col-sm-6 col-md-4 col-lg-3 p-b-35 isotope-item *">
					<!-- Block2 -->
					<div class="block2">
						<div class="block2-pic hov-img0">
							<img src="../resources/productImages/${product.p_imgrn }" alt="IMG-PRODUCT"> 
							<a href="product_quickview?p_selid=${product.p_selid }"
								class="block2-btn flex-c-m stext-103 cl2 size-102 bg0 bor2 hov-btn1 p-lr-15 trans-04 js-show-modal1 quickView">
								Quick View </a>
						</div>
						<div class="block2-txt flex-w flex-t p-t-14">
							<div class="block2-txt-child1 flex-col-l ">
								<a href="product-detail?m_id=${sessionScope.logid }&p_selid=${product.p_selid }" class="stext-104 cl4 hov-cl1 trans-04 p-b-6" id="p_name">
									${product.p_name }
								</a> 
								
						<input type="hidden" value="${sessionScope.logid }" id="logid"/>
						<input type="hidden" value="${product.p_selid }" id="p_selid" class="js-selid-b2">
						<input type="hidden" value="${product.p_name }" id="p_name" class="js-name-b2">
						<input type="hidden" value="${product.p_price }" id="p_price" class="js-price-b2">
						<input type="hidden" value="${product.p_imgrn }" id="p_imgrn" class="js-img-b2">
								<span class="stext-105 cl3" id="p_price"> ${product.p_price }원</span>
							</div>

							<div class="block2-txt-child2 flex-r p-t-3">

								<div class="btn-addwish-b2 dis-block pos-relative js-addwish-b2">
									<!-- 위시리스트에 없을 때는 불꺼진 하트 -->
									<img class="icon-heart1 dis-block trans-04" 
									src="../resources/main/images/icons/icon-heart-01.png"
									alt="ICON" id="empty-heart"> 
									
									
								</div>

							</div>
						</div>
					</div>
				</div>
				
				
				
			
			</c:forEach>

			</div>
			
			
			
			</div>
	
			<!-- Load more -->
			<!-- <div class="flex-c-m flex-w w-full p-t-45">
				<a href="#"
					class="flex-c-m stext-101 cl5 size-103 bg2 bor1 hov-btn1 p-lr-15 trans-04">
					Load More </a>
			</div> -->
		</div>


	<!-- Footer -->
	<%@include file="../main/main-footer.jsp" %>


	<!-- Back to top -->
	<div class="btn-back-to-top" id="myBtn">
		<span class="symbol-btn-back-to-top"> <i
			class="zmdi zmdi-chevron-up"></i>
		</span>
	</div>

	<!-- Modal1 -->
	<div class="wrap-modal1 js-modal1 p-t-60 p-b-20">
		<div class="overlay-modal1 js-hide-modal1"></div>

		<div class="container">
			<div class="bg0 p-t-60 p-b-30 p-lr-15-lg how-pos3-parent">
				<button class="how-pos3 hov3 trans-04 js-hide-modal1">
					<img src="../resources/main/images/icons/icon-close.png"
						alt="CLOSE">
				</button>

				<div class="row">
					<div class="col-md-6 col-lg-7 p-b-30">
						<div class="p-l-25 p-r-30 p-lr-0-lg">
							<div class="wrap-slick3 flex-sb flex-w">
								<div class="wrap-slick3-dots"></div>
								<div class="wrap-slick3-arrows flex-sb-m flex-w"></div>

								<div class="slick3 gallery-lb">
									<div class="item-slick3"
										data-thumb="../resources/productImages/${productQuick.p_imgrn}">
										<div class="wrap-pic-w pos-relative">
											<img src="../resources/productImages/${productQuick.p_imgrn}"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="../resources/productImages/${productQuick.p_imgrn}"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="../resources/main/images/product-detail-02.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="../resources/main/images/product-detail-02.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="../resources/main/images/product-detail-02.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>

									<div class="item-slick3"
										data-thumb="../resources/main/images/product-detail-03.jpg">
										<div class="wrap-pic-w pos-relative">
											<img src="../resources/main/images/product-detail-03.jpg"
												alt="IMG-PRODUCT"> <a
												class="flex-c-m size-108 how-pos1 bor0 fs-16 cl10 bg0 hov-btn3 trans-04"
												href="../resources/main/images/product-detail-03.jpg"> <i
												class="fa fa-expand"></i>
											</a>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<div class="col-md-6 col-lg-5 p-b-30">
						<div class="p-r-50 p-t-5 p-lr-0-lg">
							<h4 class="mtext-105 cl2 js-name-detail p-b-14">Lightweight
								Jacket</h4>

							<span class="mtext-106 cl2"> $58.79 </span>

							<p class="stext-102 cl3 p-t-23">Nulla eget sem vitae eros
								pharetra viverra. Nam vitae luctus ligula. Mauris consequat
								ornare feugiat.</p>

							<!--  -->
							<div class="p-t-33">
								<div class="flex-w flex-r-m p-b-10">
									<div class="size-203 flex-c-m respon6">Size</div>

									<div class="size-204 respon6-next">
										<div class="rs1-select2 bor8 bg0">
											<select class="js-select2" name="time">
												<option>Choose an option</option>
												<option>Size S</option>
												<option>Size M</option>
												<option>Size L</option>
												<option>Size XL</option>
											</select>
											<div class="dropDownSelect2"></div>
										</div>
									</div>
								</div>

								<div class="flex-w flex-r-m p-b-10">
									<div class="size-204 flex-w flex-m respon6-next">
										<div class="wrap-num-product flex-w m-r-20 m-tb-10">
											<div
												class="btn-num-product-down cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-minus"></i>
											</div>

											<input class="mtext-104 cl3 txt-center num-product"
												type="number" name="num-product" value="1">

											<div
												class="btn-num-product-up cl8 hov-btn3 trans-04 flex-c-m">
												<i class="fs-16 zmdi zmdi-plus"></i>
											</div>
										</div>

										<button
											class="flex-c-m stext-101 cl0 size-101 bg1 bor1 hov-btn1 p-lr-15 trans-04 js-addcart-detail">
											Add to cart</button>
									</div>
								</div>
							</div>

							<!--  -->
							<div class="flex-w flex-m p-l-100 p-t-40 respon7">
								<div class="flex-m bor9 p-r-10 m-r-11">
									<a href="#"
										class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 js-addwish-detail tooltip100"
										data-tooltip="Add to Wishlist"> <i
										class="zmdi zmdi-favorite"></i>
									</a>
								</div>

								<a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Facebook"> <i class="fa fa-facebook"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Twitter"> <i class="fa fa-twitter"></i>
								</a> <a href="#"
									class="fs-14 cl3 hov-cl1 trans-04 lh-10 p-lr-5 p-tb-2 m-r-8 tooltip100"
									data-tooltip="Google Plus"> <i class="fa fa-google-plus"></i>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
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
	<script src="../resources/main/vendor/daterangepicker/moment.min.js"></script>
	<script
		src="../resources/main/vendor/daterangepicker/daterangepicker.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/main/vendor/slick/slick.min.js"></script>
	<script src="../resources/main/js/slick-custom.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/main/vendor/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
	<!--===============================================================================================-->
	<script
		src="../resources/main/vendor/MagnificPopup/jquery.magnific-popup.min.js"></script>
	<script>
		$('.gallery-lb').each(function() { // the containers for all your galleries
			$(this).magnificPopup({
		        delegate: 'a', // the selector for gallery item
		        type: 'image',
		        gallery: {
		        	enabled:true
		        },
		        mainClass: 'mfp-fade'
		    });
		});
	</script>
	<!--===============================================================================================-->
	<script src="../resources/main/vendor/isotope/isotope.pkgd.min.js"></script>
	<!--===============================================================================================-->
	<script src="../resources/main/vendor/sweetalert/sweetalert.min.js"></script>
	
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
		$('.main-menu > li:eq(1)').addClass('active-menu');
	</script>
</body>
</html>