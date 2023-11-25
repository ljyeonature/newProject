<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>관리자페이지</title>

<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="../resources/main/jquery/jquery-3.2.1.min.js"></script>
<script>

$(function(){
	// 대분류
	var jsonData = ${json}
	var jsonObject = JSON.stringify(jsonData);
	var jData = JSON.parse(jsonObject);
			
	var labelList = new Array();
	var valueList = new Array();
	var colorList = new Array();
			
	for(var i = 0; i<jData.length; i++) {
		var d = jData[i];
		labelList.push(d.Fstdivname);
		valueList.push(d.Count);
		colorList.push(colorize());
	}
	
	var data = {
		labels: labelList,
		datasets: [{
				backgroundColor: colorList,
				data : valueList
		}],
	
	};
	
	var option = {
			legend: {
	            display: true,
	            position: 'top', // 'top', 'bottom', 'left', 'right' 중 선택
	            align: 'center' // 범례를 중앙에 배치
	        }
				
	}
			
	var ctx1 = document.getElementById('logNameChart').getContext('2d');
	new Chart(ctx1, {
		      type: 'pie',
			  data: data,
			  options:option
	});
	
	function colorize() {
		var r = Math.floor(Math.random()*200);
		var g = Math.floor(Math.random()*200);
		var b = Math.floor(Math.random()*200);
		var color = 'rgba(' + r + ', ' + g + ', ' + b + ', 0.7)';
		return color;
	}
	
	
	var jsonData2 = ${json2}
	var jsonObject2 = JSON.stringify(jsonData2);
	var jData2 = JSON.parse(jsonObject2);
	
	// 현재 월을 기준으로 최근 6개월의 월 데이터 생성
	var currentDate = new Date();
	var labels2 = [];
	for (var i = 5; i >= 0; i--) {
	    var currentMonth = new Date(currentDate.getFullYear(), (currentDate.getMonth()+2) - i, 1);
	    labels2.push(currentMonth.toISOString().split('T')[0].substring(0, 7));
	}
	
	var labelList2 = new Array();
	var valueList2 = new Array();
	var colorList2 = new Array();
	
	for(var i = 0; i<labels2.length; i++) {
		var currentLabel = labels2[i];
		var data = jData2.find(item => item.Month === currentLabel);
		// var d = jData2[i];
		if (data) {
        labelList2.push(data.Month);
        valueList2.push(data.Total);
        colorList2.push(colorize());
	    } else {
	        labelList2.push(currentLabel);
	        valueList2.push(0);
	        colorList2.push(colorize());
	    }
	}
	
	 var ctx = document.getElementById('myAreaChart').getContext('2d');
	    var myChart = new Chart(ctx, {
	        type: 'line',
	        data: {
	            labels: labelList2,
	            datasets: [{
	                label: '월별 매출',
	                data: valueList2,
	                backgroundColor: 'rgba(75, 192, 192, 0.2)', // 채우기 색
	                borderColor: 'rgba(75, 192, 192, 1)', // 선 색
	                borderWidth: 1
	            }]
	        },
	        options: {
	            scales: {
	                y: {
	                    beginAtZero: true
	                }
	            }
	        }
	    });
	
	
	
	
}); // end jquery





</script>


</head>

<body id="page-top">
	<!-- 사이드바  -->
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
	<!-- TOP  -->
	<%@ include file="/WEB-INF/views/admin/top.jsp"%>


	<!-- Nav Item - Tables -->
	<!--         <li class="nav-item">
                <a class="nav-link" href="tables.html">
                    <i class="fas fa-fw fa-table"></i>
                    <span>Tables</span></a>
            </li> -->



	<!-- Sidebar Message -->
	<!-- <div class="sidebar-card d-none d-lg-flex">
                <img class="sidebar-card-illustration mb-2" src="img/undraw_rocket.svg" alt="...">
                <p class="text-center mb-2"><strong>SB Admin Pro</strong> is packed with premium features, components, and more!</p>
                <a class="btn btn-success btn-sm" href="https://startbootstrap.com/theme/sb-admin-pro">Upgrade to Pro!</a>
            </div> -->


	<!-- End of Sidebar -->





	<!-- TOP바  -->





	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">Dashboard</h1>
			<a href="#"
				class="d-none d-sm-inline-block btn btn-sm btn-primary shadow-sm"><i
				class="fas fa-download fa-sm text-white-50"></i> Generate Report</a>
		</div>

			<!-- Content Row -->

			<div class="row">

				<!-- Area Chart -->
				<div class="col-xl-8 col-lg-7">
					<div class="card shadow mb-4">
						<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">월별 매출</h6>


					</div>
					<!-- Card Body -->
						<div class="card-body">
							<div class="chart-area" style="width: 100%; margin: auto;">
								<canvas id="myAreaChart" width="1500" height="450"></canvas>
							</div>
						</div>
					</div>
				</div>
			

			<!-- Pie Chart -->
			<div class="col-xl-4 col-lg-5">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">카테고리별 주문 내역</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body" style="text-align: center;">
						<div class="chart-pie pt-7 pb-2" style="display: flex;align-items: center;flex-direction: column-reverse;">
							<canvas id="logNameChart"></canvas>
						</div>
						
					</div>
				</div>
			</div>
		</div>

		<!-- Content Row -->


		<!-- Content Column -->


		<!-- Project Card Example -->


		<div class="card shadow mb-4" style="width: 100%;">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">최근 회원가입</h6>
			</div>
			<div class="col-sm-12" width="100%">
				<table class="table table-bordered dataTable" id="dataTable"
					width="100%" cellspacing="0" role="grid"
					aria-describedby="dataTable_info" style="width: 100%;">
					<thead>

						<tr role="row">
							<th class="sorting sorting_asc" tabindex="0"
								aria-controls="dataTable" rowspan="1" colspan="1"
								aria-sort="ascending"
								aria-label="Name: activate to sort column descending"
								style="width: 130px;">이름</th>
							<th class="sorting" tabindex="0" aria-controls="dataTable"
								rowspan="1" colspan="1" style="width: 130px;">이메일</th>
							<th class="sorting" tabindex="0" aria-controls="dataTable"
								rowspan="1" colspan="1" style="width: 130px;">아이디</th>
							<th class="sorting" tabindex="0" aria-controls="dataTable"
								rowspan="1" colspan="1" style="width: 130px;">비밀번호</th>
							<th class="sorting" tabindex="0" aria-controls="dataTable"
								rowspan="1" colspan="1" style="width: 130px;">주소</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${memberList}" var="member">

							<tr>
								<td>${member.m_name}</td>
								<td>${member.m_email}</td>
								<td>${member.m_id}</td>
								<td>${member.m_pass}</td>
								<td>${member.m_addr}</td>

							</tr>

						</c:forEach>



					</tbody>


				</table>

			</div>
		</div>
	</div>




	<!-- Bootstrap core JavaScript-->
	<script src="../resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="../resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="../resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages -->
	<script src="../resources/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<!-- <script src="../resources/admin/vendor/chart.js/Chart.min.js"></script>

	Page level custom scripts
	<script src="../resources/admin/js/demo/chart-area-demo.js"></script>
	<script src="../resources/admin/js/demo/chart-pie-demo.js"></script> -->
</body>

</html>