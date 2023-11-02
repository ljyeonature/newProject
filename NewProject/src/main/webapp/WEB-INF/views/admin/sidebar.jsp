<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar -->
		<ul
			class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion"
			id="accordionSidebar">

			<!-- Sidebar - Brand -->
			<a
				class="sidebar-brand d-flex align-items-center justify-content-center"
				href="../main/home">
				<div class="sidebar-brand-icon rotate-n-15">
					<i class="fas fa-laugh-wink"></i>
				</div> <!-- 제목  -->
				<div class="sidebar-brand-text mx-3">
					AQU I CITY <sup></sup>
				</div>
			</a>

			<!-- Divider -->
			<hr class="sidebar-divider my-0">

			<!-- Nav Item - Dashboard -->
			<li class="nav-item active"><a class="nav-link"
				href="admin-index"> <i class="fas fa-fw fa-tachometer-alt"></i>
					<span>Dashboard</span></a></li>

			<!-- Divider -->
			<hr class="sidebar-divider">

			<!-- Heading -->
			<div class="sidebar-heading"></div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseTwo"
				aria-expanded="true" aria-controls="collapseTwo"> <i
					class="fas fa-fw fa-cog"></i> <span>주문관리</span>
			</a> <!-- 주문관리 타래 -->
				<div id="collapseTwo" class="collapse" aria-labelledby="headingTwo"
					data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">

						<a class="collapse-item" href="buttons.html">총주문관리</a> <a
							class="collapse-item" href="cards.html">주문내역수정</a> <a
							class="collapse-item" href="">주문 취소/교환/반품/환불</a>

					</div>
				</div></li>
			<hr class="sidebar-divider">

			<!-- Nav Item - Utilities Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapseUtilities"
				aria-expanded="true" aria-controls="collapseUtilities"> <i
					class="fas fa-fw fa-wrench"></i> <span>회원정보관리</span>
			</a>
				<div id="collapseUtilities" class="collapse"
					aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<a class="collapse-item" href="member_all">전체회원관리</a> <a
							class="collapse-item" href="point">포인트관리</a> 
						
						<!-- <a class="collapse-item" href="utilities-other.html">Other</a> -->
					</div>
				</div></li>

			<!-- Divider -->
			<hr class="sidebar-divider">
			<!-- 흰색선 -->

			<!-- Heading -->
			<div class="sidebar-heading"></div>

			<!-- Nav Item - Pages Collapse Menu -->
			<li class="nav-item"><a class="nav-link collapsed" href="#"
				data-toggle="collapse" data-target="#collapsePages"
				aria-expanded="true" aria-controls="collapsePages"> <i
					class="fas fa-fw fa-folder"></i> <span>상품관리</span>
			</a>
				<div id="collapsePages" class="collapse"
					aria-labelledby="headingPages" data-parent="#accordionSidebar">
					<div class="bg-white py-2 collapse-inner rounded">
						<!--     <h6 class="collapse-header">Login Screens:</h6> -->
						<a class="collapse-item" href="login.html">전체 상품관리</a> <a
							class="collapse-item" href="register.html">카테고리</a> <a
							class="collapse-item" href="forgot-password.html"></a>
						<div class="collapse-divider"></div>
						<h6 class="collapse-header">Other Pages:</h6>
						<a class="collapse-item" href="404.html">404 Page</a> <a
							class="collapse-item" href="blank.html">Blank Page</a>
					</div>
				</div></li>
			<hr class="sidebar-divider">


			<!-- Nav Item - Charts -->
			<li class="nav-item"><a class="nav-link" href="charts.html">
					<i class="fas fa-fw fa-chart-area"></i> <span>1:1 상담문의</span>
			</a></li>
			
				<!-- Divider -->
			<hr class="sidebar-divider d-none d-md-block">

			<!-- Sidebar Toggler (Sidebar) -->
			<div class="text-center d-none d-md-inline">
				<button class="rounded-circle border-0" id="sidebarToggle"></button>
			</div>

			</ul>
			

</body>
</html>