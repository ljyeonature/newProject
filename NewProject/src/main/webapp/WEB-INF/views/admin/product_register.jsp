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

<title>전체회원관리</title>

<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/admin/css/sb-admin-2.min.css" rel="stylesheet">

</head>

<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../resources/static/js/service/HuskyEZCreator.js"></script>
<!-- 카테고리 대분류 선택 시 중분류 내용 각각 나오게 설정 -->
<script>
    $(document).ready(function() {
    	
    	$('#sel_ca2 > option').hide();
    	$('#sel_ca3 > option').hide();
    		
    	$('#sel_ca1').on('click', function(){
    		$('#sel_ca2 > option').hide();
    		$('#sel_ca3 > option').hide();
    		//alert($(this).val());
    		if($(this).val() === 'F'){
    			$('#sel_ca2 > option[value^="F"]').show();
    		} else if($(this).val() === 'D') {
    			$('#sel_ca2 > option[value^="D"]').show();
    			
    		} else {
    			$('#sel_ca2 > option[value^="E"]').show();
    			
    		}
    	});
    	
    	$('#sel_ca2').on('click', function(){
    		$('#sel_ca3 > option').hide();
    		 var selectedValue = $('#sel_ca2').val();
    		switch(selectedValue){
    			case 'F1' : $('#sel_ca3 > option[value^="F1"]').show(); break;
    			case 'F2' : $('#sel_ca3 > option[value^="F2"]').show(); break;
    			case 'F3' : $('#sel_ca3 > option[value^="F3"]').show(); break;
    			case 'F4' : $('#sel_ca3 > option[value^="F4"]').show(); break;
    			case 'F5' : $('#sel_ca3 > option[value^="F5"]').show(); break;
    			case 'D1' : $('#sel_ca3 > option[value^="D1"]').show(); break;
    			case 'D2' : $('#sel_ca3 > option[value^="D2"]').show(); break;
    			case 'D3' : $('#sel_ca3 > option[value^="D3"]').show(); break;
    			case 'E1' : $('#sel_ca3 > option[value^="E1"]').show(); break;
    			case 'E2' : $('#sel_ca3 > option[value^="E2"]').show(); break;
    			case 'E3' : $('#sel_ca3 > option[value^="E3"]').show(); break;
    			case 'E4' : $('#sel_ca3 > option[value^="E4"]').show(); break;
    			case 'E5' : $('#sel_ca3 > option[value^="E5"]').show(); break;
    		}
    	});
    	
   

	    /* id가 option인 것을 눌렀을 때 -> 상품 코드에 해당 판매게시글 상품ID가 떠야 한다. */
	    
	    $('select#sel_ca3').on('click', function(){
	    	// alert(1);
	    	//alert($(this).val());
	    	$('#p_selid').val( $(this).val());
	    	$('#p_name').val($(this).find('option:selected').text());
	    	
	    }) 
    });
    
    
    
    
    
    
  </script>


<body id="page-top">
	<!-- 사이드바  -->
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
	<!-- TOP  -->
	<%@ include file="/WEB-INF/views/admin/top.jsp"%>


	<!-- Begin Page Content -->
	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">전체회원관리</h1>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">상품등록</h6>
			</div>
			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<form name="fsearch" id="fsearch" method="post" action="product_insert"  enctype="multipart/form-data">
						
							<!-- 카테고리 -->
							<div class="tbl_frm02">
								<table>
									<colgroup>
										<col class="w180">
										<col>
									</colgroup>
									<tbody>
										<tr>
											<th scope="row">카테고리 선택</th>
											<td>
												<div class="sub_frm01">
													<table>
														<tbody>
															<tr>
																<td class="w20p bg1">
																<select id="sel_ca1"
																	size="5" class="multiple-select"
																	style="width: 200px">
																		<c:forEach items="${fstcate }" var="fstcate">
																			<option value="${fstcate.fstdivid }">${fstcate.fstdivname}</option>
																		</c:forEach>
																</select></td>
																<td class="w20p bg1">
																<select id="sel_ca2"
																	 size="5" class="multiple-select"
																	style="width: 200px">
																		<c:forEach items="${sndcate }" var="sndcate">
																			<option value="${sndcate.snddivid }">${sndcate.snddivname}</option>
																		</c:forEach>
																</select>
																</td>
																<td class="w20p bg1">
																<select id="sel_ca3"
																	size="5" class="multiple-select"
																	style="width: 200px">
																		<c:forEach items="${trdcate }" var="trdcate">
																			<option value="${trdcate.trddivid }">${trdcate.trddivname}</option>
																		</c:forEach>
																</select>
																</td>
															</tr>
														</tbody>
													</table>
												</div>
											</td>
										</tr>


									</tbody>
								</table>
							</div>
							<!-- 이름 코드 가격 -->

							<div class="tbl_frm01">
								<table>

									<tbody>
										<tr>
											<th scope="row">상품코드</th>
											<td><input type="text" name="p_selid" id="p_selid"
												required="" itemname="상품코드" class="required frm_input">

											</td>
										</tr>
										<tr>
											<th scope="row">상품명</th>
											<td><input type="text" name="p_name" value=""
												id="p_name" required="" itemname="상품명"
												class="required frm_input" size="80"></td>
										</tr>
										<tr>
											<th scope="row">가격</th>
											<td class="td_label"><input type="text" name="p_price">
										</tr>

									</tbody>
								</table>
							</div>

							<!-- 이미지 상세설명 사육 방식 -->
							<div class="item_file_fld">
								<input type="file" name="file">
							</div>
							<table style="width: 100%;">
									<th scope="row">상세설명</th>
								
								<tr>
								<td>
								<span class="sound_only">웹에디터 시작</span> 
								<textarea name="p_description" id="ir1" rows="10" cols="100" style="width: 100%;"></textarea> 
								<!-- <script>
											oEditors = [];
											nhn.husky.EZCreator
													.createInIFrame({
														oAppRef : oEditors,
														elPlaceHolder : "ir1",
														sSkinURI : "../resources/static/SmartEditor2Skin.html",
														fCreator : "createSEditor2"
													});
										</script> -->
								</td>
								</tr>
									<th scope="row">사육 방식</th>
								<tr>
									
									<td><textarea name="p_care" class="frm_textbox"></textarea></td>
								</tr>
							
							</table>
								<tr>

							<div class="btn_confirm">
								<input type="submit" value="등록" class="btn_medium"> 
							</div>
						</form>
					</table>
				</div>
			</div>



			<!-- DataTales Example -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">

					<h6 class="m-0 font-weight-bold text-primary"></h6>

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
								<c:forEach items="${memberList}" var="memberr">

									<tr>
										<td>${memberr.m_name}</td>
										<td>${memberr.m_email}</td>
										<td>${memberr.m_id}</td>
										<td>${memberr.m_pass}</td>
										<td>${memberr.m_addr}</td>

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