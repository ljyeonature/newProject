<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<script src="../resources/main/jquery/jquery-3.2.1.min.js"></script>
</head>
<body>
	<div class="wrap-menu-desktop">
		<nav class="limiter-menu-desktop container">

			<!-- Logo desktop -->
			<a href="home" class="logo"> <img
				src="../resources/main/images/icons/슬로건 로고.png" alt="IMG-LOGO">
			</a>

			<!-- Menu desktop -->
			<div class="menu-desktop">
				<ul class="main-menu">
				<c:if test="${empty sessionScope.logid }">

					<li class="active-menu"><a href="home">Home</a></li>

					<li><a href="product">Shop</a></li>


					<li><a href="qna">Q&A</a></li>
				
					<li><a href="about">About</a></li>
				</c:if>
				<c:if test="${not empty sessionScope.logid }">
					<li class="active-menu"><a href="home?m_id=${sessionScope.logid }">Home</a>
					</li>

					<!-- 찜 상품이 있으면.. -->
					<li><a href="product?m_id=${sessionScope.logid }">Shop</a></li>


					<li><a id="mainqna" href="qna?m_id=${sessionScope.logid }">Q&A</a></li>

					<li><a href="about?m_id=${sessionScope.logid }">About</a></li>
				</c:if>
				</ul>
				</div>

				<!-- Icon header -->
				<div class="wrap-icon-header flex-w flex-r-m">
					<div
						class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 js-show-modal-search">
						<i class="zmdi zmdi-search"></i>
					</div>
					<div class="icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti js-show-cart"
						data-notify="2" id="wishlist">
						<i class="zmdi zmdi-favorite-outline"></i>
						<!-- <i class="zmdi zmdi-shopping-cart"></i> -->
					</div>
					
					<a href="shoping-cart?m_id=${sessionScope.logid }"
						class="dis-block icon-header-item cl2 hov-cl1 trans-04 p-l-22 p-r-11 icon-header-noti"
						data-notify="0" id="shopping-cart"> 
						<i class="zmdi zmdi-shopping-cart"></i>
					</a>
					<input type="hidden" value="${ sessionScope.logid}" id="logid"/>
					<c:if test="${ empty sessionScope.logname }">
					
						<script type="text/javascript">
							$(function(){
								$('#shopping-cart').click(function(event){
									 event.preventDefault();
									alert("로그인 후 이용해주세요.");
								});
								
								$('#wishlist').click(function(event){
									 event.preventDefault();
									alert("로그인 후 이용해주세요.")
								});
								
								$('#mainqna').click(function(event){
									 event.preventDefault();
									alert("로그인 후 이용해주세요.")
								});
									
							});
							
						</script>
					
					</c:if>
				
				</div>
		</nav>
	</div>
</body>
</html>