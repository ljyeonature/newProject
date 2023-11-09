<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" type="text/css"
	href="../resources/admin/css/product_resister.css">
<style type="text/css">
body {
	margin: 10px;
}
</style>


<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>상품등록</title>

<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
	rel="stylesheet">

<!-- Custom styles for this template-->
<link href="../resources/admin/css/sb-admin-2.min.css" rel="stylesheet">
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script src="../resources/static/js/service/HuskyEZCreator.js"></script>
<!-- 카테고리 대분류 선택 시 중분류 내용 각각 나오게 설정 -->
<
<!-- 카테고리 대분류 선택 시 중분류 내용 각각 나오게 설정 -->
<script>
	$(document).ready(function() {

		$('#sel_ca2 > option').hide();
		$('#sel_ca3 > option').hide();

		$('#sel_ca1').on('click', function() {
			$('#sel_ca2 > option').hide();
			$('#sel_ca3 > option').hide();
			//alert($(this).val());
			if ($(this).val() === 'F') {
				$('#sel_ca2 > option[value^="F"]').show();
			} else if ($(this).val() === 'D') {
				$('#sel_ca2 > option[value^="D"]').show();

			} else {
				$('#sel_ca2 > option[value^="E"]').show();

			}
		});

		$('#sel_ca2').on('click', function() {
			$('#sel_ca3 > option').hide();
			var selectedValue = $('#sel_ca2').val();
			switch (selectedValue) {
			case 'F1':
				$('#sel_ca3 > option[value^="F1"]').show();
				break;
			case 'F2':
				$('#sel_ca3 > option[value^="F2"]').show();
				break;
			case 'F3':
				$('#sel_ca3 > option[value^="F3"]').show();
				break;
			case 'F4':
				$('#sel_ca3 > option[value^="F4"]').show();
				break;
			case 'F5':
				$('#sel_ca3 > option[value^="F5"]').show();
				break;
			case 'D1':
				$('#sel_ca3 > option[value^="D1"]').show();
				break;
			case 'D2':
				$('#sel_ca3 > option[value^="D2"]').show();
				break;
			case 'D3':
				$('#sel_ca3 > option[value^="D3"]').show();
				break;
			case 'E1':
				$('#sel_ca3 > option[value^="E1"]').show();
				break;
			case 'E2':
				$('#sel_ca3 > option[value^="E2"]').show();
				break;
			case 'E3':
				$('#sel_ca3 > option[value^="E3"]').show();
				break;
			case 'E4':
				$('#sel_ca3 > option[value^="E4"]').show();
				break;
			case 'E5':
				$('#sel_ca3 > option[value^="E5"]').show();
				break;
			}
		});

		/* id가 option인 것을 눌렀을 때 -> 상품 코드에 해당 판매게시글 상품ID가 떠야 한다. */

		$('select#sel_ca3').on('click', function() {
			// alert(1);
			//alert($(this).val());
			$('#p_selid').val($(this).val());
			$('#p_name').val($(this).find('option:selected').text());

		});

		/* $('#option_see').on('click') */
		// 상품 등록
		$('#product_insert').click(function(){
			var p_selid = $('#p_selid').val();
		    var p_name = $('#p_name').val();
		    var p_price = $('#p_price').val();
		    var p_description = $('#p_description').val();
		    var p_care = $('#p_care').val();
		    
		    // FormData 객체를 생성하여 이미지 파일을 추가
		    var formData = new FormData();
		    formData.append('p_selid', p_selid);
		    formData.append('p_name', p_name);
		    formData.append('p_price', p_price);
		    formData.append('p_description', p_description);
		    formData.append('p_care', p_care);
		    formData.append('file', $('#file')[0].files[0]); // 이미지 파일 추가
			//alert(1);
 			$.ajax({
				type:'post',
				data: formData,
				url:'product_insert',
				processData: false, // FormData 처리 방지
			    contentType: false, // Content-Type 자동 설정 방지
				success : function(response){
					//alert(response);
				},
				error : function(err){
					console.log(err);
				}
			});// ajax  
			
		});// 상품 등록
		
		
		// 추가 사진
		$('#image_insert').click(function(e) {
	    e.preventDefault(); // 폼 제출 방지
	
	    var formData = new FormData();
	
	    for (var i = 1; i <= 8; i++) {
	        var fieldName = 'file' + i;
	        var fileInput = document.querySelector('input[name="' + fieldName + '"]');
	        var file = fileInput.files[0]; // 실제 파일 객체 가져오기
	        console.log(file);
	        if (file) {
	        	console.log(fieldName);
	            formData.append(fieldName, file); // 이미지 파일 추가
	        }
	    }
	
	    console.log(formData);
		    $.ajax({
		        url: 'upload-image', // 실제 서버 엔드포인트 URL로 대체
		        type: 'POST',
		        data: formData,
		        processData: false,
		        contentType: false,
		        success: function(response) {
		            if (response === "ok") {
		                alert(response);
		            } else {
		                alert(response);
		            }
		        },
		        error: function(err) {
		            console.log(err);
		        }
		    });
		});

		
		
		
		
		var optionContainer = $("#option_item");
		// 옵션 불려오기
		$.each(result, function(index, item) {
		    // 각 항목을 나타내는 HTML 생성
		    var optionItem = '<tr>' +
		        '<td><input type="text" id="p_finalID' + item.p_optionID + '" class="frm_input wfull" name="p_finalID" value="' + item.p_optionID + '"></td>' +
		        '<td><input type="text" id="o_name" class="frm_input wfull" name="o_name" value="' + item.o_name + '"></td>' +
		        '</tr>';
		    
		    // 중복 항목을 추가하지 않도록 확인
		    if (!optionContainer.find("tr[data-p_optionid='" + item.p_optionID + "']").length) {
		        // 옵션 컨테이너에 항목 추가
		        optionContainer.append(optionItem);
		    }
		});
		

	});
</script>

</head>

<body id="page-top">



	<!-- 사이드바  -->
	<%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
	<!-- TOP  -->
	<%@ include file="/WEB-INF/views/admin/top.jsp"%>




	<div class="container-fluid">

		<!-- Page Heading -->
		<h1 class="h3 mb-2 text-gray-800">상품등록</h1>

		<div class="card shadow mb-4">
			<div class="card-header py-3">
				<h6 class="m-0 font-weight-bold text-primary">카테고리</h6>
			</div>

			<div class="card-body">
				<div class="table-responsive">
					<table class="table table-bordered" id="dataTable" width="100%"
						cellspacing="0">
						<form name="fsearch" id="fsearch" method="post"
							enctype="multipart/form-data">
							<input type="hidden" name="code" value="list">
							<div class="tbl_frm01">
								<table>
									<colgroup>
										<col class="w100">
										<col>
									</colgroup>
									<tbody>
										<section id="anc_sitfrm_cate">

											<ul class="anchor">

											</ul>
											<div class="local_desc02 local_desc"></div>
											<div class="tbl_frm02">
												<table>
													<colgroup>
														<col class="w180">
														<col>
													</colgroup>
													<td>
														<div class="sub_frm01">
															<table>
																<tr>
																	<th scope="row">카테고리 선택</th>
																	<td>
																		<div class="sub_frm01">
																			<table>
																				<tbody>
																					<tr>
																						<td class="w20p bg1"><select id="sel_ca1"
																							name="sel_ca1" size="5" class="multiple-select"
																							style="width: 200px">
																								<c:forEach items="${fstcate }" var="fstcate">
																									<option value="${fstcate.fstdivid }">${fstcate.fstdivname}</option>
																								</c:forEach>
																						</select></td>
																						<td class="w20p bg1"><select id="sel_ca2"
																							name="sel_ca2" size="5" class="multiple-select"
																							style="width: 200px">
																								<c:forEach items="${sndcate }" var="sndcate">
																									<option value="${sndcate.snddivid }">${sndcate.snddivname}</option>
																								</c:forEach>
																						</select></td>
																						<td class="w20p bg1"><select id="sel_ca3"
																							name="sel_ca3" size="5" class="multiple-select"
																							style="width: 200px">
																								<c:forEach items="${trdcate }" var="trdcate">
																									<option value="${trdcate.trddivid }">${trdcate.trddivname}</option>
																								</c:forEach>
																						</select></td>
																					</tr>
																			</table>
																		</div>
																	</td>
																</tr>


																</tbody>


																</div>
																<tr>
																	<th scope="row">선택된 카테고리</th>
																	<td>
																		<div class="sub_frm01">
																			<table>

																				<tr>
																					<!-- 선택된 카테고리를 띄우는 창 -->
																					<td><select name="sel_ca_id" id="sel_ca_id"
																						size="5" class="multiple-select"
																						style="width: 600px">
																					</select></td>




																				</tr>
																			</table>
																		</div>
																	</td>
																</tr>
																</tbody>
																</div>
																</td>
																</tr>


																</tbody>
															</table>
														</div>
														</section>
													</tbody>
												</table>
											</div>
											<!-- <div class="btn_confirm">
                        <input type="submit" value="등록" class="btn_medium">
                     </div> -->
								</table>
							</div>







							</div>
							<!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
							<div class="container-fluid">

								<!-- Page Heading -->
								<div class="card shadow mb-4">
									<div class="card-header py-3">
										<h6 class="m-0 font-weight-bold text-primary">기본정보</h6>
									</div>
									<div class="card-body">
										<div class="table-responsive">
											<table class="table table-bordered" id="dataTable"
												width="100%" cellspacing="0">
												<!--  <form name="fsearch" id="fsearch" method="get"> -->
												<input type="hidden" name="code" value="list">
												<div class="tbl_frm01">
													<table>
														<colgroup>
															<col class="w100">
															<col>
														</colgroup>
														<tbody>
															<tr>
																<th scope="row">상품코드</th>
																<td><input type="text" name="p_selid" id='p_selid'
																	itemname="상품코드" class="required frm_input">

																</td>
															</tr>
															<tr>
																<th scope="row">상품명</th>
																<td><input type="text" name="p_name" id='p_name'
																	itemname="상품명" class="required frm_input"
																	size="80"></td>
															</tr>
															<tr>
																<th scope="row">판매가격</th>
																<td><input type="text" name="p_price" id="p_price"
																	value="0" class="frm_input w80"
																	onkeyup="addComma(this);"> 원 <span
																	class="fc_197 marl5">실제 판매가 입력 (대표가격으로 사용)</span></td>
															</tr>


														</tbody>
													</table>
												</div>
											</table>
										</div>
										</section>
										<!--     <div class="btn_confirm">
                     <input type="submit" value="조회" class="btn_click">
                  </div> -->
										</tbody>
					</table>
				</div>


				</table>
			</div>
		</div>

		<!-- ------------------------------------------------------------------------------------------------------------------------------------------------ -->

		<!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->

		<!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
		<div class="container-fluid">

			<!-- Page Heading -->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">관련상품</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive">
						<table class="table table-bordered" id="dataTable" width="100%"
							cellspacing="0">
							<!--    <form name="fsearch" id="fsearch" method="get"> -->
							<div class="tbl_frm01">
								<table>
									<colgroup>
										<col class="w100">
										<col>
									</colgroup>
									<tbody>

										<div class="srel">
											<div class="compare_wrap">
												<section class="compare_left" id='compare_left'>
													<h5>등록된 전체상품 목록</h5>
													<label for="sch_relation" class="sound_only">카테고리</label> <span
														class="srel_pad"> <select id="sch_relation"
														name="sch_relation">

													</select> <label for="sch_name" class="sound_only">상품명</label> <input
														type="text" name="sch_name" id="sch_name"
														class="frm_input" size="15">
														<button type="button" id="btn_search_item"
															class="btn_small">검색</button>
													</span>
													<div id="relation" class="srel_list">
														<p>카테고리를 선택하시거나 상품명을 입력하신 후 검색하여 주십시오.</p>
													</div>
													
												</section>

												<section class="compare_right" id='compare_right'>
													<h5>선택된 관련상품 목록</h5>
													<span class="srel_pad"></span>
													<div id="reg_relation" class="srel_sel">
														<p>선택된 상품이 없습니다.</p>
													</div>
													<input type="hidden" name="gs_list" value="">
												</section>
											</div>
										</div>



									</tbody>
								</table>
							</div>
						</table>
					</div>
					</section>
					<!-- 						<div class="btn_confirm">
							<input type="submit" value="등록" class="btn_medium">

						</div> -->
				</div>
			</div>

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">상품이미지 및 상세정보</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive">
							<table class="table table-bordered" id="dataTable" width="100%"
								cellspacing="0">
								<!--  <form name="fsearch" id="fsearch" method="get"> -->
								<div class="tbl_frm01">
									<table>
										<colgroup>
											<col class="w100">
											<col>
										</colgroup>
										<tbody>

											<div class="tbl_frm02">
												<table style="width: 100%;">
													<colgroup>
														<col class="w180">
														<col>
													</colgroup>
													<tbody>
														<tr>
															<th scope="row">이미지 등록방식</th>
															<td class="td_label"><input type="radio"
																name="simg_type" id="simg_type_1" value="0"
																checked="checked" onclick="chk_simg_type(0);"> <label
																for="simg_type_1">직접 업로드</label> <input type="radio"
																name="simg_type" id="simg_type_2" value="1"
																onclick="chk_simg_type(1);"> <label
																for="simg_type_2">URL 입력</label></td>
														</tr>
														<tr class="item_img_fld">
															<th scope="row">이미지1 <span class="fc_197">(400
																	* 400)</span> <strong class="fc_red">[필수]</strong></th>
															<td>
																<div class="item_file_fld">
																	<input type="file" name="file" id="file">
																</div>
																<div class="item_url_fld" style="display: none;">
																	<input type="text" name="simg1" value=""
																		class="frm_input" size="80" placeholder="http://">
																</div>
															</td>
														</tr>
														<tr class="item_img_fld">
															<th scope="row">이미지1 <span class="fc_197">(400
																	* 400)</span> <strong class="fc_red">[필수]</strong></th>
															<td>
																<div class="item_file_fld">
																	<input type="file" name="file">
																</div>
																<div class="item_url_fld" style="display: none;">
																	<input type="text" name="simg1" value=""
																		class="frm_input" size="80" placeholder="http://">
																</div>
															</td>
														</tr>

														<tr>
															<th scope="row">상세설명</th>
															<td><span class="sound_only">웹에디터 시작</span> <textarea
																	name="p_description" id="p_description" rows="10"
																	cols="100" style="width: 100%;"></textarea>
														</tr>
														<tr>
															<th scope="row">사육방법</th>
															<td><textarea name="p_care" class="frm_textbox"
																	style="width: 100%;" id="p_care"></textarea></td>
														</tr>
													</tbody>
												</table>
											</div>

										</tbody>
									</table>
								</div>
								<div class="btn_confirm">
									<input type="button" value="등록" class="btn_medium" id="product_insert"> 

								</div>


							</table>
						</div>
						</section>

					</div>


					<!-- =================================================================================================================== -->
					<div class="container-fluid">

						<!-- Page Heading -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">추가 사진</h6>
							</div>
							<div class="card-body">
								<div class="table-responsive">
									<table class="table table-bordered" id="dataTable" width="100%"
										cellspacing="0">
										<form name="fsearch" id="file-upload-form" method="post" enctype="multipart/form-data" >
										<div class="tbl_frm01">
											<table>
												<colgroup>
													<col class="w100">
													<col>
												</colgroup>
												<tbody>

													<div class="tbl_frm02">
														<table style="width: 100%;">
															<colgroup>
																<col class="w180">
																<col>
															</colgroup>
															<tbody>

																<tr class="item_img_fld">
																	<th scope="row">물고기 옵션1 <span class="fc_197"></span> 
																	<strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file1">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>
																<tr class="item_img_fld">
																	<th scope="row">물고기 옵션2 <span class="fc_197"></span> 
																	<strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file2">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>
																<tr class="item_img_fld">
																	<th scope="row">물고기 옵션3 <span class="fc_197"></span>
																	 <strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file3">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>
																<tr class="item_img_fld">
																	<th scope="row">물고기 옵션4 <span class="fc_197"></span>
																	 <strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file4">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>
																<tr class="item_img_fld">
																	<th scope="row">물고기 옵션5 <span class="fc_197"></span> 
																	<strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file5">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>
																<tr class="item_img_fld">
																	<th scope="row">상세정보 <span class="fc_197"></span> 
																	<strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file6">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>
																<tr class="item_img_fld">
																	<th scope="row">상세정보 안내1 <span class="fc_197"></span> 
																	<strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file7">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>
																<tr class="item_img_fld">
																	<th scope="row">상세정보 안내2 <span class="fc_197"></span> 
																	<strong class="fc_red"></strong></th>
																	<td>
																		<div class="item_file_fld">
																			<input type="file" name="file8">
																		</div>
																		<div class="item_url_fld" style="display: none;">
																			<input type="text" name="simg1" value=""
																				class="frm_input" size="80" placeholder="http://">
																		</div>
																	</td>
																</tr>


															</tbody>
														</table>
													</div>

												</tbody>
											</table>
										</div>
										<div class="btn_confirm">
											<input type="button" value="등록" class="btn_medium" id="image_insert"> 

										</div>

									</table>
								</div>
								</section>

							</div>
						</div>




						<div class="container-fluid">

							<!-- Page Heading -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">옵션정보</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive" id='table-responsive'>
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">
											<form name="fsearch" id="fsearch" method="get">
												<input type="hidden" name="code" value="list">
												<div class="tbl_frm01">
													<table>
														<colgroup>
															<col class="w100">
															<col>
														</colgroup>
														<tbody>
															<div class="tbl_frm02" id='tb1_frm02'>
																<table>
																	<colgroup>
																		<col class="w180">
																		<col>
																	</colgroup>
																	<tbody>
																		<tr>
																			<th scope="row" id='th_row'>상품 주문옵션</th>
																			<td>
																				<table class="mart7">
																					<colgroup>
																						<col width="60px">
																						<col width="150px">
																						<col width="85px">
																						<col>
																					</colgroup>
																					<tbody>
																						<tr>
																							<th scope="row">옵션 아이디</th>
																							<td><input type="text" id='p_finalID'
																								value="" id="opt1_subject"
																								class="frm_input wfull" name='p_finalID'></td>
																							<th scope="row">옵션 이름</th>
																							<td><input type="text" id="o_name" value=""
																								class="frm_input wfull" name='o_name'></td>
																						</tr>
																						
																						<tr id="option_item">
																							
																						</tr>

																					</tbody>
																				</table>
																				<p class="btn_confirm02">
																			
																				
																			</td>
																		</tr>


																	</tbody>
																</table>
															</div>
															</section>
														</tbody>
													</table>
												</div>
										</table>
										<div class="btn_confirm">
											<input type="button" value="등록" class="btn_medium"
												id="option_see">
										</div>
									</div>
									</section>

									</tbody>
									</table>
								</div>
							</div>


							</form>
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

	<!— Page level custom scripts —>
	<script src="../resources/admin/js/demo/datatables-demo.js"></script>
</body>
</html>