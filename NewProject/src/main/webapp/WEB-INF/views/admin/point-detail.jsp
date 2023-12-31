<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<style>
.btn_confirm {
	text-align: center;
	margin-top: 20px;
}
</style>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>전체회원관리</title>

<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<!-- Bootstrap core JavaScript-->
	<script src="../resources/admin/vendor/jquery/jquery.min.js"></script>
	<script
		src="../resources/admin/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Core plugin JavaScript-->
	<script
		src="../resources/admin/vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- Custom scripts for all pages-->
	<script src="../resources/admin/js/sb-admin-2.min.js"></script>

	<!-- Page level plugins -->
	<script
		src="../resources/admin/vendor/datatables/jquery.dataTables.min.js"></script>
	<script
		src="../resources/admin/vendor/datatables/dataTables.bootstrap4.min.js"></script>

	<!-- Page level custom scripts -->
	<script src="../resources/admin/js/demo/datatables-demo.js"></script>
<script>
$(function(){
	$('.btn_medium').click(function(event){
		event.preventDefault();
		
		var params = { m_id:$('#m_id').val(), m_point:$('#m_point').val() }
		$.ajax({
			type:"get",
			data: params,
			url:"member-point-content",
			success:function(result){
				if(result === "error"){
					console.log(result)
				} else {
					location.reload();
					// console.log("#point").text();
					$('#point').text(memberPoint.m_point);
				}
				
			},
			error : function(err) {
				console.log(err);
			}
		});
	});
	
})
	

</script>

</head>

<body id="page-top">



	<!-- 사이드바  -->
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
	<!-- TOP  -->
	<%@ include file="/WEB-INF/views/admin/top.jsp"%>




	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">포인트관리</h1>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">포인트</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<form name="point" id="point" method="get" action="member-point-content">
							<div class="tbl_frm01">
								<table>
									<colgroup>
										<col class="w100">
										<col>
									</colgroup>
									<tbody>
										
										<tr>
											<th scope="row"><label for="m_point">포인트</label></th>
											<td>
											<input type="text" name="m_point" id="m_point"
												class="required frm_input" size="10"
												style="background-position: right top; background-repeat: no-repeat;">
												<em>포인트 차감시 예) -3000</em>
											</td>
											
											<td>
											<input type="hidden" name="m_id" id="m_id"
												class="required frm_input" size="10" value="${memberPoint.m_id}"
												style="background-position: right top; background-repeat: no-repeat;">
											</td>
										</tr>
										
										<!-- <tr>
											<th scope="row"><label for="p_point_plus">포인트</label></th>
											<td><input type="text" name="p_point_plus" id="p_point_plus"
												class="required frm_input" size="10"
												style="background-position: right top; background-repeat: no-repeat;">
												<em>포인트 추가시 예) +3000</em></td>
										</tr> -->
									</tbody>
								</table>
							</div>
							<div class="btn_confirm">
								<input type="submit" value="확인" class="btn_medium" /> 
							</div>
						</form>
					</table>
				</div>
			</div>
			<div id="result">
    <!-- 결과를 표시할 위치 -->
</div>



			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">

					<h6 class="m-0 font-weight-bold text-primary">회원</h6>

				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<label>Show <select name="dataTable_length"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option>
								</select>
								</label>
								<tr>
									<th>번호</th>
									<th>회원명</th>
									<th>아이디</th>
									<th>포인트 내용</th>
									<th>날짜</th>
									<th>포인트</th>
									<th>포인트 합</th>

								</tr>
							</thead>

							<tbody>


								<tr>
									<td>1</td>
									<td>${memberPoint.m_name}</td>
									<td>${memberPoint.m_id}</td>
									<td>${memberPoint.m_email}</td>
									<td>${memberPoint.m_tel}</td>
									<td id="point">${memberPoint.m_point}</td>
									<td>${memberPoint.m_point}</td>

								</tr>


							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>
		<!-- /.container-fluid -->


	</div>
	<!-- End of Main Content -->

	<!-- 포터바  -->
	<%@ include file="/WEB-INF/views/admin/footer.jsp"%>

	</div>
	<!-- End of Content Wrapper -->

	</div>
	<!-- End of Page Wrapper -->

	<!-- Scroll to Top Button-->


	




</body>
</html>