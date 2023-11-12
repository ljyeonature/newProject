<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WishList</title>
	<meta charset="UTF-8">
	<meta name="viewport" content="width=device-width, initial-scale=1">
<!--===============================================================================================-->	
	<link rel="icon" type="image/png" href="../resources/main/images/icons/favicon.png"/>
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/bootstrap/css/bootstrap.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/fonts/font-awesome-4.7.0/css/font-awesome.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/fonts/iconic/css/material-design-iconic-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/fonts/linearicons-v1.0.0/icon-font.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/animate/animate.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/main/css-hamburgers/hamburgers.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/animsition/css/animsition.min.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/select2/select2.min.css">
<!--===============================================================================================-->	
	<link rel="stylesheet" type="text/css" href="../resources/main/daterangepicker/daterangepicker.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/slick/slick.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/MagnificPopup/magnific-popup.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/perfect-scrollbar/perfect-scrollbar.css">
<!--===============================================================================================-->
	<link rel="stylesheet" type="text/css" href="../resources/main/css/util.css">
	<link rel="stylesheet" type="text/css" href="../resources/main/css/main.css">
<!--===============================================================================================-->
<script src="../resources/main/jquery/jquery-3.2.1.min.js"></script>
<script>

$(function(){
	 var total = 0;
     <c:forEach items="${wishList}" var="wish">
         total += ${wish.p_price};
     </c:forEach>
     $('#totalPrice').text('Total: ' + total.toFixed(0));   
 
     
     
     // 이미지 클릭 시 위시리스트에서 삭제
     $('.header-cart-item-img').on('click', function () {
         // 현재 클릭된 이미지의 부모인 li를 찾아 삭제
         //console.log(1);
         var selectedItem = $.trim($(this).next().find('#p_selid').val());
         console.log(selectedItem);
        

         if (confirm('위시리스트에서 삭제하시겠습니까?')) {
             // AJAX를 사용하여 서버에 삭제 요청 보내기
             $.ajax({
                 type: 'POST',
                 url: 'delete_wishlist', // 실제 서버의 삭제 요청을 처리하는 URL로 변경
                 data: { p_selid: selectedItem },
                 success: function (response) {
                     // 서버에서 성공적으로 처리된 경우에만 화면에서 해당 상품 제거
                     if (response == "delete") {
                         alert('상품이 성공적으로 삭제되었습니다.');
                         //swal("", "장바구니에서 삭제되었습니다", "success");
                         location.reload();
                         // 화면에서 해당 행 제거
                         selectedItem.remove();
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

         // 가격 업데이트
        /*  updateTotalPrice(); */
     });
     
})
</script>

</head>
<body class="animsition">


<div class="wrap-header-cart js-panel-cart">
		<div class="s-full js-hide-cart"></div>

		<div class="header-cart flex-col-l p-l-65 p-r-25">
			<div class="header-cart-title flex-w flex-sb-m p-b-8">
				<span class="mtext-103 cl2">
					Your WishList
				</span>

				<div class="fs-35 lh-10 cl2 p-lr-5 pointer hov-cl1 trans-04 js-hide-cart">
					<i class="zmdi zmdi-close"></i>
				</div>
			</div>
			<!-- 위시리스트 -->
			<div class="header-cart-content flex-w js-pscroll">
				<ul class="header-cart-wrapitem w-full">
				<c:forEach items="${wishList}" var="wish">
					<li class="header-cart-item flex-w flex-t m-b-12">
							<div class="header-cart-item-img" id="deleteWish">
								<img src="../resources/productImages/${wish.p_imgrn }" alt="IMG">
							</div>
	
							<div class="header-cart-item-txt p-t-8">
			
							<input type="hidden" value="${wish.p_selid }" id="p_selid"/>
							<a href="#" class="header-cart-item-name m-b-18 hov-cl1 trans-04" id="p_name">
									${wish.p_name }
								</a>
	
								<span class="header-cart-item-info">
									${wish.p_price }원
								</span>
							</div>
						</li>
				
				</c:forEach>
				
				
				</ul>
				
				<div class="w-full">
					<div class="header-cart-total w-full p-tb-40" id="totalPrice">
						
					</div>

					<div class="header-cart-buttons flex-w w-full">
						<a href="shoping-cart?m_id=${sessionScope.logid }" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-r-8 m-b-10">
							장바구니
						</a>

						<a href="../member/member-order?m_id=${sessionScope.logid }" class="flex-c-m stext-101 cl0 size-107 bg3 bor2 hov-btn3 p-lr-15 trans-04 m-b-10">
							결제
						</a>
					</div>
				</div>
			</div>
		</div>
	</div>
<!--===============================================================================================-->	
	<script src="../resources/main/jquery/jquery-3.2.1.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/main/animsition/js/animsition.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/main/bootstrap/js/popper.js"></script>
	<script src="../resources/main/bootstrap/js/bootstrap.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/main/select2/select2.min.js"></script>
	<script>
		$(".js-select2").each(function(){
			$(this).select2({
				minimumResultsForSearch: 20,
				dropdownParent: $(this).next('.dropDownSelect2')
			});
		})
	</script>
	
<!--===============================================================================================-->
	<script src="../resources/main/daterangepicker/moment.min.js"></script>
	<script src="../resources/main/daterangepicker/daterangepicker.js"></script>
<!--===============================================================================================-->
	<script src="../resources/main/slick/slick.min.js"></script>
	<script src="../resources/main/js/slick-custom.js"></script>
<!--===============================================================================================-->
	<script src="../resources/main/parallax100/parallax100.js"></script>
	<script>
        $('.parallax100').parallax100();
	</script>
<!--===============================================================================================-->
	<script src="../resources/main/MagnificPopup/jquery.magnific-popup.min.js"></script>
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
	<script src="../resources/main/isotope/isotope.pkgd.min.js"></script>
<!--===============================================================================================-->
	<script src="../resources/main/sweetalert/sweetalert.min.js"></script>
	<script>
		$('.js-addwish-b2').on('click', function(e){
			e.preventDefault();
		});

		$('.js-addwish-b2').each(function(){
			var nameProduct = $(this).parent().parent().find('.js-name-b2').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-b2');
				$(this).off('click');
			});
		});

		$('.js-addwish-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().find('.js-name-detail').html();

			$(this).on('click', function(){
				swal(nameProduct, "is added to wishlist !", "success");

				$(this).addClass('js-addedwish-detail');
				$(this).off('click');
			});
		});

		/*---------------------------------------------*/

		$('.js-addcart-detail').each(function(){
			var nameProduct = $(this).parent().parent().parent().parent().find('.js-name-detail').html();
			$(this).on('click', function(){
				swal(nameProduct, "is added to cart !", "success");
			});
		});
	
	</script>
<!--===============================================================================================-->
	<script src="../resources/main/perfect-scrollbar/perfect-scrollbar.min.js"></script>
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