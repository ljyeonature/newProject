<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
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

<title>qna게시물관리</title>

<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<body id="page-top">
<!-- 사이드바  -->
<%@ include file="/WEB-INF/views/admin/sidebar.jsp" %>
<!-- TOP  -->
<%@ include file="/WEB-INF/views/admin/top.jsp" %>


					<!-- Begin Page Content -->
				<div class="container-fluid">

					<!-- Page Heading -->
					<h1 class="h3 mb-2 text-gray-800">Q&A 게시글관리</h1>

					<div class="card shadow mb-4">
						<div class="card-header py-3">
							<h6 class="m-0 font-weight-bold text-primary">기본검색</h6>
						</div>
						<div class="card-body">
							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">
									<form action="qna" name="fsearch" id="fsearch" method="POST">
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
														<td><select name="sltfilter">
																<option value="q_title">제목</option>
																<option value="m_id">작성자</option>

														</select> <input type="text" name="search" value="" class="frm_input"
															size="30"></td>
													</tr>


												</tbody>
											</table>
										</div>
										<div class="btn_confirm">
											<input type="submit" value="검색" class="btn_medium"> <input
												type="button" value="초기화" id="frmRest"
												class="btn_medium grey">
										</div>
									</form>
								</table>
							</div>
						</div>



						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
							
								<h6 class="m-0 font-weight-bold text-primary">게시글 목록</h6>
								
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<thead>
										
											<tr role="row">
										<th class="sorting sorting_asc" tabindex="0"
											aria-controls="dataTable" rowspan="1" colspan="1"
											aria-sort="ascending"
											aria-label="Name: activate to sort column descending"
											style="width: 10px; text-align: center;">번호</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 20px; text-align: center;">문의유형</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 20px; text-align: center;">세부유형</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 150px; text-align: center;">제목</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 250px; text-align: center;">내용</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 20px; text-align: center;">작성자</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 20px; text-align: center;">작성일</th>
										<th class="sorting" tabindex="0" aria-controls="dataTable"
											rowspan="1" colspan="1" style="width: 20px; text-align: center;">조회</th>
									</tr>
										</thead>

										<tbody>
											<c:forEach items="${qnaList}" var="boardd">

										<tr>
											<td style="text-align: center;"><a href="qnaview_do?q_postnum=${boardd.q_postnum}">${boardd.q_postnum}</a></td>
											<td style="text-align: center;">${boardd.q_inquiry}</td>
											<td style="text-align: center;">${boardd.p_inq_type}</td>
											<td style="text-align: center;"><a href="qnaview_do?q_postnum=${boardd.q_postnum}">${boardd.q_title}</a></td>
											<td style="text-align: center;">${boardd.q_content}</td>
											<td style="text-align: center;">${boardd.m_id}</td>
											<td style="text-align: center;">${boardd.q_date}</td>
											<td style="text-align: center;">${boardd.q_count}</td>

										</tr>

									</c:forEach>
										

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
<%@ include file="/WEB-INF/views/admin/footer.jsp" %>

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