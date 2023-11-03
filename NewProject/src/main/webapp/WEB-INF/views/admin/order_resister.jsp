<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" type="text/css"
	href="../resources/admin/css/order_resister.css">
<style>
.btn_confirm {
	text-align: center;
	margin-top: 20px;
}

.scroll-table {
	width: 100%;
	overflow-x: auto;
}
</style>



<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>주문내역수정</title>

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



	<!------------------------------------------------------------------------------------------------------  -->

	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">주문내역수정</h1>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">기본검색</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
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
											<td><select name="sfl">
													<option value="id">주문번호</option>
													<option value="pt_id">아이디</option>

											</select> <input type="text" name="stx" value="" class="frm_input"
												size="30"></td>
										</tr>


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

			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!----------------------------- 여기서부터 쓰면 됨 ----------------------  -->


			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">

					<h6 class="m-0 font-weight-bold text-primary">주문상품 목록</h6>

				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<label> 주문일시 (-----) | 주문총액: 
								<tr role="row">
									<th scope="col" rowspan="2" style="width: 8px;"><input
										type="checkbox" name="chkall" value="1"
										onclick="check_all(this.form);"></th>
									<th class="sorting sorting_asc" tabindex="0"
										aria-controls="dataTable" rowspan="1" colspan="1"
										aria-sort="ascending"
										aria-label="Name: activate to sort column descending"
										style="width: 130px;">이미지</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">주문상품</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">주문상태</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">수량</th>

									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">상품금액</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">포인트결제</th>
									<th class="sorting" tabindex="0" aria-controls="dataTable"
										rowspan="1" colspan="1" style="width: 130px;">실결제액</th>

								</tr>
							</thead>

							<tbody>



							</tbody>
						</table>
					</div>
				</div>
			</div>


			<!--------------------------------------여기 아래로 쓰면 안됌 제발 ㅜ---------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!------------------------------------------------------------------------------------------------------  -->
			<!----------------------------- 여기서부터 쓰면 됨 ----------------------  -->


			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">

					<h6 class="m-0 font-weight-bold text-primary">주문 결제 내역</h6>

				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<thead>
								<label> 주문일시 (-----) | 주문총액: 
							</thead>

							<tbody>
								<form name="frmorderreceiptform"
									action="./pop_orderformupdate.php" method="post"
									autocomplete="off">
									<input type="hidden" name="od_id" value="23043013364001">
									<input type="hidden" name="mod_type" value="receipt">

									<div class="compare_wrap">
										<section id="anc_sodr_chk" class="compare_left">
											<h3>결제상세정보 확인</h3>

											<div class="tbl_frm01">
												<table>
													<colgroup>
														<col class="w150">
														<col>
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">총 주문금액</th>
															<td class="td_price">36,720원</td>
														</tr>
														<tr>
															<th scope="row">총 상품금액</th>
															<td class="td_price bg0">36,720원</td>
														</tr>
														<tr>
															<th scope="row">총 배송비</th>
															<td class="td_price fc_197">(+) 0원</td>
														</tr>
														<tr>
															<th scope="row">총 쿠폰할인</th>
															<td class="td_price fc_red">(-) 0원</td>
														</tr>
														<tr>
															<th scope="row">포인트결제</th>
															<td class="td_price fc_red">(-) 0원</td>
														</tr>
														<tr>
															<th scope="row">실 결제금액</th>
															<td class="td_price bg0">36,720원</td>
														</tr>
														<tr>
															<th scope="row" class="fc_red">환불액(PG승인취소)</th>
															<td class="td_price bg1 fc_red">(-) 0원</td>
														</tr>
														<tr>
															<th scope="row">포인트적립</th>
															<td class="tar">0원</td>
														</tr>
													</tbody>
												</table>
											</div>
										</section>

										<section id="anc_sodr_paymo" class="compare_right">
											<h3>결제상세정보 수정</h3>

											<div class="tbl_frm01">
												<table>
													<colgroup>
														<col class="w150">
														<col>
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">주문번호</th>
															<td>23043013364001</td>
														</tr>
														<tr>
															<th scope="row">주문일시</th>
															<td>2023-04-30 13:37:20 (일)</td>
														</tr>
														<tr>
															<th scope="row">주문채널</th>
															<td><strong>admin</strong> PC 쇼핑몰에서 주문</td>
														</tr>
														<tr>
															<th scope="row"><label for="pt_id">가맹점 ID</label></th>
															<td><input type="text" name="pt_id" value=""
																id="pt_id" class="frm_input" placeholder="없음">
																(배송완료 후 수정불가)</td>
														</tr>
														<tr>
															<th scope="row">결제방법</th>
															<td>무통장</td>
														</tr>
														<tr>
															<th scope="row"><label for="bank">계좌번호</label></th>
															<td><select id="bank" name="bank">
																	<option value="">선택하십시오</option>
																	<option value="우리은행 1005-123-316074 샘플샵"
																		selected="selected">우리은행 1005-123-316074 샘플샵</option>
															</select></td>
														</tr>
														<tr>
															<th scope="row"><label for="deposit_name">입금자명</label></th>
															<td><input type="text" name="deposit_name"
																value="관리자" id="deposit_name" class="frm_input"
																placeholder="실 입금자명"></td>
														</tr>
														<tr>
															<th scope="row">무통장 입금액</th>
															<td>36,720원</td>
														</tr>
														<tr>
															<th scope="row">입금확인일시</th>
															<td>입금 확인일시 정보가 없습니다.</td>
														</tr>





														<tr>
															<th scope="row">개별 전자결제(PG)</th>
															<td><strong>admin</strong> PG설정으로 주문</td>
														</tr>
													</tbody>
												</table>
											</div>
										</section>
									</div>

									<div class="btn_confirm">
										<input type="submit" value="결제정보 수정" class="btn_medium">
										<a href="javascript:window.close();"
											class="btn_medium bx-white">닫기</a>
									</div>
								</form>


							</tbody>
						</table>
					</div>
				</div>
			</div>

		</div>

	</div>




	<!--------------------------------------여기 아래로 쓰면 안됌 제발 ㅜ---------------------------------------------  -->
	<!------------------------------------------------------------------------------------------------------  -->
	<!------------------------------------------------------------------------------------------------------  -->
	<!------------------------------------------------------------------------------------------------------  -->
	<!------------------------------------------------------------------------------------------------------  -->
	<!------------------------------------------------------------------------------------------------------  -->

	</div>

	</div>
	</div>
	</div>

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