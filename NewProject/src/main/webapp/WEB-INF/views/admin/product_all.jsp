<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- ========> -->
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

<title>전체상품관리</title>

<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>

</head>

<body id="page-top">



	<!-- 사이드바  -->
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
	<!-- TOP  -->
	<%@ include file="/WEB-INF/views/admin/top.jsp"%>




	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">전체상품관리</h1>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">기본검색</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
						<form name="fsearch" id="fsearch" method="get">
							<input type="hidden" name="code" value="list">
							<div class="tbl_frm01">
								<table>
									<colgroup>
										<col class="w100">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">검색어</th>
											<td colspan="3"><select name="sfl">
													<option value="gname" selected="selected">상품명</option>
													<option value="gcode">상품코드</option>

											</select> <input type="text" name="stx" value="" class="frm_input"
												size="30"></td>
										</tr>
										<tr>
											<th scope="row">카테고리</th>
											<td colspan="3">
											<select id="sel_ca1" name="sel_ca1">
													<option value="">=카테고리선택=</option>
													<option value="002">물고기</option>
													<option value="004">조경용품</option>
													<option value="008">기타용품</option>
											</select> 
											<select id="sel_ca2" name="sel_ca2">
													<option value="">=카테고리선택=</option>
													<option value="002001">구피,난태생송사리과</option>
													<option value="002002">금붕어,잉어과</option>
													<option value="002003">디스커스,시클리드과</option>
													<option value="002004">베타,구라미,기수어</option>
													<option value="002005">테트라,카라신과</option>
											</select> 
											
											<select id="sel_ca3" name="sel_ca3">
													<option value="">=카테고리선택=</option>
													<option value="00100"></option>
											</select> <select id="sel_ca4" name="sel_ca4">
													<option value="">=카테고리선택=</option>
											</select> 
											<select id="sel_ca5" name="sel_ca5">
													<option value="">=카테고리선택=</option>
											</select> 
											<script>
												$(function() {
													$("#sel_ca1")
															.multi_select_box(
																	"#sel_ca",
																	5,
																	tb_admin_url
																			+ "/ajax.category_select_json.php",
																	"=카테고리선택=");
													$("#sel_ca2")
															.multi_select_box(
																	"#sel_ca",
																	5,
																	tb_admin_url
																			+ "/ajax.category_select_json.php",
																	"=카테고리선택=");
													$("#sel_ca3")
															.multi_select_box(
																	"#sel_ca",
																	5,
																	tb_admin_url
																			+ "/ajax.category_select_json.php",
																	"=카테고리선택=");
													$("#sel_ca4")
															.multi_select_box(
																	"#sel_ca",
																	5,
																	tb_admin_url
																			+ "/ajax.category_select_json.php",
																	"=카테고리선택=");
													$("#sel_ca5")
															.multi_select_box(
																	"#sel_ca",
																	5, "",
																	"=카테고리선택=");
												});
											</script>
											</td>
										</tr>


										<th scope="row">판매여부</th>
										<td>
											<label>
												<input type="radio" name="q_isopen" value="" checked="checked"> 전체
											</label> 
											<label>
												<input type="radio" name="q_isopen" value="1"> 진열
											</label>
											<label>
												<input type="radio" name="q_isopen" value="2"> 품절
											</label>
										</td>
									</tbody>
								</table>
							</div>
							<div class="btn_confirm">
								<input type="submit" value="검색" class="btn_medium"> <input
									type="button" value="초기화" id="frmRest" class="btn_medium grey">
							</div>
						</form>
					</table>
				</div>
			</div>



			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">

					<h6 class="m-0 font-weight-bold text-primary">데이터 불러오기</h6>

				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<label> <select name="dataTable_length"
									aria-controls="dataTable"
									class="custom-select custom-select-sm form-control form-control-sm">
										<option value="10">10</option>
										<option value="25">25</option>
										<option value="50">50</option>
										<option value="100">100</option>
								</select>
								</label>
								<!-- =========> -->
								<a class="fr btn_lsmall red" href="product_resister"> <i
									class="ionicons ion-android-add"></i> 상품등록
								</a>
								<tr role="row">
									<th scope="col" rowspan="2" style="width: 8px;">
									<input
										type="checkbox" name="chkall" value="1"
										onclick="check_all(this.form);">
										</th>
									<th class="sorting sorting_asc" tabindex="0"
										aria-controls="dataTable" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Name: activate to sort column descending"
										style="width: 130px;">번호
										</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">상품코드</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">상품명</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">재고</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">가격</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">관리</th>

								</tr>
							</thead>
							<tbody>
							
							<c:forEach items="${productList }" var="product">
								<tr>
									<td><input type="checkbox" /></td>
									<td >${product.p_selid }</td>
									<td >${product.p_selid }</td>
									<td >${product.p_name }</td>
									<td >재고</td>
									<td >${product.p_price }</td>
									<td >관리</td>
								</tr>
							
							</c:forEach>

							
							
							</tbody>

							<tbody>

								<td rowspan="2"><a
									href="#"
									class="btn_small">수정</a></td>
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


</body>
</html>