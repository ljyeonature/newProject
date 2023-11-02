<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix='c' uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<link rel="stylesheet" type="text/css"
	href="../resources/admin/css/product_resister.css">


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
						<form name="fsearch" id="fsearch" method="get">
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
											<div class="local_desc02 local_desc">
												<p>
													선택된 카테고리에 <span class="fc_084">최상위 카테고리는 대표 카테고리로
														자동설정</span>되며, 최소 1개의 카테고리는 등록하셔야 합니다.
												</p>
											</div>
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
																				<td class="w20p bg1"><select id="sel_ca1"
																					name="sel_ca1" size="5" class="multiple-select">
																						<option value="">=카테고리선택=</option>
																						<option value="001">패션의류/잡화/뷰티</option>
																						<option value="002">식품/생필품</option>
																						<option value="004">생활/건강</option>
																						<option value="008">도서/여행/e쿠폰/취미</option>
																						<option value="005">가구/인테리어</option>
																						<option value="003">출산/유아동</option>
																						<option value="006">가전/디지털/컴퓨터</option>
																						<option value="007">스포츠/레저/자동차/공구</option>
																				</select></td>
																				<td class="w20p bg1"><select id="sel_ca2"
																					name="sel_ca2" size="5" class="multiple-select">
																						<option value="">=카테고리선택=</option>
																				</select></td>
																				<td class="w20p bg1"><select id="sel_ca3"
																					name="sel_ca3" size="5" class="multiple-select">
																						<option value="">=카테고리선택=</option>
																				</select></td>
																				<td class="w20p bg1"><select id="sel_ca4"
																					name="sel_ca4" size="5" class="multiple-select">
																						<option value="">=카테고리선택=</option>
																				</select></td>
																				<td class="w20p bg1"><select id="sel_ca5"
																					name="sel_ca5" size="5" class="multiple-select">
																						<option value="">=카테고리선택=</option>
																				</select></td>
																			</tr>
																		</tbody>
																	</table>
																</div> <script>
																	$(function() {
																		$(
																				"#sel_ca1")
																				.multi_select_box(
																						"#sel_ca",
																						5,
																						tb_admin_url
																								+ "/ajax.category_select_json.php",
																						"=카테고리선택=");
																		$(
																				"#sel_ca2")
																				.multi_select_box(
																						"#sel_ca",
																						5,
																						tb_admin_url
																								+ "/ajax.category_select_json.php",
																						"=카테고리선택=");
																		$(
																				"#sel_ca3")
																				.multi_select_box(
																						"#sel_ca",
																						5,
																						tb_admin_url
																								+ "/ajax.category_select_json.php",
																						"=카테고리선택=");
																		$(
																				"#sel_ca4")
																				.multi_select_box(
																						"#sel_ca",
																						5,
																						tb_admin_url
																								+ "/ajax.category_select_json.php",
																						"=카테고리선택=");
																		$(
																				"#sel_ca5")
																				.multi_select_box(
																						"#sel_ca",
																						5,
																						"",
																						"=카테고리선택=");
																	});
																</script>
															</td>
														</tr>


													</tbody>
												</table>
											</div>
										</section>

									</tbody>
								</table>
							</div>
							<div class="btn_confirm">
								<input type="submit" value="등록" class="btn_medium">
							</div>
						</form>
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
													<th scope="row">상품코드</th>
													<td><input type="text" name="gcode" value="1698826491"
														required="" itemname="상품코드" class="required frm_input">

													</td>
												</tr>
												<tr>
													<th scope="row">상품명</th>
													<td><input type="text" name="gname" value=""
														required="" itemname="상품명" class="required frm_input"
														size="80"></td>
												</tr>
												<tr>
													<th scope="row">판매여부</th>
													<td class="td_label"><label><input
															type="radio" name="isopen" value="1" checked="checked">
															진열</label> <label><input type="radio" name="isopen"
															value="2"> 품절</label>
												</tr>


											</tbody>
										</table>
									</div>
							</table>
						</div>
						</section>
						<div class="btn_confirm">
							<input type="submit" value="등록" class="btn_medium">
						</div>
						</tbody>
						</table>
					</div>

					</form>
					</table>
				</div>
			</div>

			<!-- ------------------------------------------------------------------------------------------------------------------------------------------------ -->

			<div class="container-fluid">

				<!-- Page Heading -->
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">옵션정보</h6>
					</div>
					<div class="card-body">
						<div class="table-responsive" id='table-responsive'>
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
																				<th scope="row">옵션1</th>
																				<td><input type="text" name="opt1_subject"
																					value="" id="opt1_subject" class="frm_input wfull"></td>
																				<th scope="row">옵션1 항목</th>
																				<td><input type="text" name="opt1" id="opt1"
																					value="" class="frm_input wfull"></td>
																			</tr>
																			<tr>
																				<th scope="row">옵션2</th>
																				<td><input type="text" name="opt2_subject"
																					value="" id="opt2_subject" class="frm_input wfull"></td>
																				<th scope="row">옵션2 항목</th>
																				<td><input type="text" name="opt2" id="opt2"
																					value="" class="frm_input wfull"></td>
																			</tr>
																			<tr>
																				<th scope="row">옵션3</th>
																				<td><input type="text" name="opt3_subject"
																					value="" id="opt3_subject" class="frm_input wfull"></td>
																				<th scope="row">옵션3 항목</th>
																				<td><input type="text" name="opt3" id="opt3"
																					value="" class="frm_input wfull"></td>
																			</tr>
																		</tbody>
																	</table>
																	<p class="btn_confirm02">
																		<button type="button" id="toggleOptions">옵션추가</button>
																	</p>
																	<div id="optionInfo" style="display: none;">
																		<div id="sit_option_frm">
																			<table class="mart20">
																				<colgroup>
																					<col class="w40">
																					<col>
																					<col class="w100">
																					<col class="w100">
																					<col class="w100">
																					<col class="w100">
																					<col class="w90">
																				</colgroup>
																				<thead>
																					<tr>
																						<th scope="col" class="tac"><input
																							type="checkbox" name="opt_chk_all" value="1"
																							id="opt_chk_all"></th>
																						<th scope="col" class="tac">옵션</th>


																						<th scope="col" class="tac">재고수량</th>


																					</tr>
																				</thead>
																				<tbody>
																					<tr>
																						<td class="tac"><input type="hidden"
																							name="opt_id[]" value="22"><input
																							type="checkbox" name="opt_chk[]" value="1">
																						</td>
																						<td class="opt1-cell"><input type="text"
																							name="opt_stock_qty[]" class="frm_input wfull"></td>

																						<td class="tac"><input type="text"
																							name="opt_stock_qty[]" value="0"
																							class="frm_input wfull"></td>



																					</tr>
																				</tbody>
																			</table>

																			<div class="mart5">
																				<button type="button" id="sel_option_delete"
																					class="btn_small bx-white">선택삭제</button>
																			</div>


																		</div>
																	</div> <script>
																		function opt_unlimited(
																				fld,
																				num) {
																			document
																					.getElementById(fld).value = num;
																		}
																	</script>
																	</div> <script>
																		$(
																				document)
																				.ready(
																						function() {
																							// 옵션추가 버튼 클릭 이벤트
																							$(
																									"#toggleOptions")
																									.click(
																											function() {
																												// 옵션정보를 숨겼다가 보이도록 토글
																												$(
																														"#optionInfo")
																														.toggle();
																											});
																						});

																		$(function() {

																			// 옵션목록생성
																			$(
																					"#option_table_create")
																					.click(
																							function() {
																								var gs_id = $
																										.trim($(
																												"input[name=gs_id]")
																												.val());
																								var opt1_subject = $
																										.trim($(
																												"#opt1_subject")
																												.val());
																								var opt2_subject = $
																										.trim($(
																												"#opt2_subject")
																												.val());
																								var opt3_subject = $
																										.trim($(
																												"#opt3_subject")
																												.val());
																								var opt1 = $
																										.trim($(
																												"#opt1")
																												.val());
																								var opt2 = $
																										.trim($(
																												"#opt2")
																												.val());
																								var opt3 = $
																										.trim($(
																												"#opt3")
																												.val());
																								var $option_table = $("#sit_option_frm");

																								if (!opt1_subject
																										|| !opt1) {
																									alert("옵션명과 옵션항목을 입력해 주십시오.");
																									return false;
																								}

																								$
																										.post(
																												tb_admin_url
																														+ "/goods/goods_option.php",
																												{
																													gs_id : gs_id,
																													w : "",
																													opt1_subject : opt1_subject,
																													opt2_subject : opt2_subject,
																													opt3_subject : opt3_subject,
																													opt1 : opt1,
																													opt2 : opt2,
																													opt3 : opt3
																												},
																												function(
																														data) {
																													$option_table
																															.empty()
																															.html(
																																	data);
																												});
																							});

																			// 모두선택
																			$(
																					document)
																					.on(
																							"click",
																							"input[name=opt_chk_all]",
																							function() {
																								if ($(
																										this)
																										.is(
																												":checked")) {
																									$(
																											"input[name='opt_chk[]']")
																											.attr(
																													"checked",
																													true);
																								} else {
																									$(
																											"input[name='opt_chk[]']")
																											.attr(
																													"checked",
																													false);
																								}
																							});

																			// 선택삭제
																			$(
																					document)
																					.on(
																							"click",
																							"#sel_option_delete",
																							function() {
																								var $el = $("input[name='opt_chk[]']:checked");
																								if ($el
																										.size() < 1) {
																									alert("삭제하려는 옵션을 하나 이상 선택해 주십시오.");
																									return false;
																								}

																								$el
																										.closest(
																												"tr")
																										.remove();
																							});

																			// 일괄적용
																			$(
																					document)
																					.on(
																							"click",
																							"#opt_value_apply",
																							function() {
																								if ($(
																										".opt_com_chk:checked")
																										.size() < 1) {
																									alert("일괄 수정할 항목을 하나이상 체크해 주십시오.");
																									return false;
																								}

																								var opt_supply_price = $
																										.trim($(
																												"#opt_com_supply_price")
																												.val());
																								var opt_price = $
																										.trim($(
																												"#opt_com_price")
																												.val());
																								var opt_stock = $
																										.trim($(
																												"#opt_com_stock")
																												.val());
																								var opt_noti = $
																										.trim($(
																												"#opt_com_noti")
																												.val());
																								var opt_use = $(
																										"#opt_com_use")
																										.val();
																								var $el = $("input[name='opt_chk[]']:checked");

																								// 체크된 옵션이 있으면 체크된 것만 적용
																								if ($el
																										.size() > 0) {
																									var $tr;
																									$el
																											.each(function() {
																												$tr = $(
																														this)
																														.closest(
																																"tr");

																												if ($(
																														"#opt_com_supply_price_chk")
																														.is(
																																":checked"))
																													$tr
																															.find(
																																	"input[name='opt_supply_price[]']")
																															.val(
																																	opt_supply_price);

																												if ($(
																														"#opt_com_price_chk")
																														.is(
																																":checked"))
																													$tr
																															.find(
																																	"input[name='opt_price[]']")
																															.val(
																																	opt_price);

																												if ($(
																														"#opt_com_stock_chk")
																														.is(
																																":checked"))
																													$tr
																															.find(
																																	"input[name='opt_stock_qty[]']")
																															.val(
																																	opt_stock);

																												if ($(
																														"#opt_com_noti_chk")
																														.is(
																																":checked"))
																													$tr
																															.find(
																																	"input[name='opt_noti_qty[]']")
																															.val(
																																	opt_noti);

																												if ($(
																														"#opt_com_use_chk")
																														.is(
																																":checked"))
																													$tr
																															.find(
																																	"select[name='opt_use[]']")
																															.val(
																																	opt_use);
																											});
																								} else {
																									if ($(
																											"#opt_com_supply_price_chk")
																											.is(
																													":checked"))
																										$(
																												"input[name='opt_supply_price[]']")
																												.val(
																														opt_supply_price);

																									if ($(
																											"#opt_com_price_chk")
																											.is(
																													":checked"))
																										$(
																												"input[name='opt_price[]']")
																												.val(
																														opt_price);

																									if ($(
																											"#opt_com_stock_chk")
																											.is(
																													":checked"))
																										$(
																												"input[name='opt_stock_qty[]']")
																												.val(
																														opt_stock);

																									if ($(
																											"#opt_com_noti_chk")
																											.is(
																													":checked"))
																										$(
																												"input[name='opt_noti_qty[]']")
																												.val(
																														opt_noti);

																									if ($(
																											"#opt_com_use_chk")
																											.is(
																													":checked"))
																										$(
																												"select[name='opt_use[]']")
																												.val(
																														opt_use);
																								}
																							});
																		});
																	</script>
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
								<input type="submit" value="등록" class="btn_medium">
							</div>
						</div>
						</section>

						</tbody>
						</table>
					</div>


					<!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
					<div class="container-fluid">

						<!-- Page Heading -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								<h6 class="m-0 font-weight-bold text-primary">가격 및 재고</h6>
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
															<th scope="row">판매가격</th>
															<td><input type="text" name="goods_price" value="0"
																class="frm_input w80" onkeyup="addComma(this);">
																원 <span class="fc_197 marl5">실제 판매가 입력 (대표가격으로
																	사용)</span></td>
														</tr>
														<tr>
															<th scope="row">포인트</th>
															<td><input type="text" name="gpoint" value="0"
																class="frm_input w80" onkeyup="addComma(this);">
																P <input type="text" name="marper" class="frm_input w50">
																%</td>
														</tr>
														<tr>
															<th scope="row">가격 대체문구</th>
															<td><input type="text" name="price_msg" value=""
																class="frm_input"> <span class="fc_197 marl5">가격대신
																	보여질 문구를 노출할 때 입력, 주문불가</span></td>
														</tr>
														<tr>
															<th scope="row">수량</th>
															<td><input type="radio" name="stock_mod" value="0"
																id="ids_stock_mode1" checked="checked"
																onclick="chk_stock(0);"> <label
																for="ids_stock_mode1" class="marr10">무제한</label> <input
																type="radio" name="stock_mod" value="1"
																id="ids_stock_mode2" onclick="chk_stock(1);"> <label
																for="ids_stock_mode2">한정</label> <input type="text"
																name="stock_qty" value="0" class="frm_input w80"
																onkeyup="addComma(this);"> 개, <b class="marl10">재고
																	통보수량</b> <input type="text" name="noti_qty" value="999"
																class="frm_input w80" onkeyup="addComma(this);"
																disabled="disabled"> 개
																<p class="fc_197 mart7">
																	상품의 재고가 통보수량보다 작을 때 상품 재고관리에 표시됩니다.<br>옵션이 있는 상품은
																	개별 옵션의 통보수량이 적용됩니다. 설정이 무제한이면 재고관리에 표시되지 않습니다.
																</p></td>
														</tr>
														<tr>
															<th scope="row">주문한도</th>
															<td>최소 <input type="text" name="odr_min" value=""
																class="frm_input w80"> ~ 최대 <input type="text"
																name="odr_max" value="" class="frm_input w80"> <span
																class="fc_197 marl5">미입력시 무제한</span>
															</td>
														</tr>



													</tbody>
												</table>
											</div>
									</table>
								</div>
								</section>
								<div class="btn_confirm">
									<input type="submit" value="등록" class="btn_medium">








									</form>
									</table>


								</div>


							</div>

							</form>
							</table>


						</div>
						<!-------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------->
						<div class="container-fluid">

							<!-- Page Heading -->
							<div class="card shadow mb-4">
								<div class="card-header py-3">
									<h6 class="m-0 font-weight-bold text-primary">관련상품</h6>
								</div>
								<div class="card-body">
									<div class="table-responsive">
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

															<div class="srel">
																<div class="compare_wrap">
																	<section class="compare_left" id='compare_left'>
																		<h3>등록된 전체상품 목록</h3>
																		<label for="sch_relation" class="sound_only">카테고리</label>
																		<span class="srel_pad"> <select
																			id="sch_relation" name="sch_relation">

																		</select> <label for="sch_name" class="sound_only">상품명</label>
																			<input type="text" name="sch_name" id="sch_name"
																			class="frm_input" size="15">
																			<button type="button" id="btn_search_item"
																				class="btn_small">검색</button>
																		</span>
																		<div id="relation" class="srel_list">
																			<p>카테고리를 선택하시거나 상품명을 입력하신 후 검색하여 주십시오.</p>
																		</div>
																		<script>
																			$(function() {
																				$(
																						"#btn_search_item")
																						.click(
																								function() {
																									var sca = $(
																											"#sch_relation")
																											.val();
																									var gname = $
																											.trim($(
																													"#sch_name")
																													.val());
																									var mb_id = $
																											.trim($(
																													"#mb_id")
																													.val());
																									var $relation = $("#relation");

																									if (sca == ""
																											&& gname == "") {
																										$relation
																												.html("<p>카테고리를 선택하시거나 상품명을 입력하신 후 검색하여 주십시오.</p>");
																										return false;
																									}

																									$(
																											"#relation")
																											.load(
																													tb_admin_url
																															+ "/goods/goods_form_relation.php",
																													{
																														gs_id : "",
																														mb_id : mb_id,
																														sca : sca,
																														gname : gname
																													});
																								});

																				$(
																						document)
																						.on(
																								"click",
																								"#relation .add_item",
																								function() {
																									// 이미 등록된 상품인지 체크
																									var $li = $(
																											this)
																											.closest(
																													"li");
																									var gs_id = $li
																											.find(
																													"input:hidden")
																											.val();
																									var gs_id2;
																									var dup = false;
																									$(
																											"#reg_relation input[name='re_gs_id[]']")
																											.each(
																													function() {
																														gs_id2 = $(
																																this)
																																.val();
																														if (gs_id == gs_id2) {
																															dup = true;
																															return false;
																														}
																													});

																									if (dup) {
																										alert("이미 선택된 상품입니다.");
																										return false;
																									}

																									var cont = "<li>"
																											+ $li
																													.html()
																													.replace(
																															"add_item",
																															"del_item")
																													.replace(
																															"추가",
																															"삭제")
																											+ "</li>";
																									var count = $(
																											"#reg_relation li")
																											.size();

																									if (count > 0) {
																										$(
																												"#reg_relation li:last")
																												.after(
																														cont);
																									} else {
																										$(
																												"#reg_relation")
																												.html(
																														"<ul>"
																																+ cont
																																+ "</ul>");
																									}

																									$li
																											.remove();
																								});

																				$(
																						document)
																						.on(
																								"click",
																								"#reg_relation .del_item",
																								function() {
																									// if(!confirm("상품을 삭제하시겠습니까?"))
																									//    return false;

																									$(
																											this)
																											.closest(
																													"li")
																											.remove();

																									var count = $(
																											"#reg_relation li")
																											.size();
																									if (count < 1)
																										$(
																												"#reg_relation")
																												.html(
																														"<p>선택된 상품이 없습니다.</p>");
																								});
																			});
																		</script>
																	</section>

																	<section class="compare_right" id='compare_right'>
																		<h3>선택된 관련상품 목록</h3>
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
									<div class="btn_confirm">
										<input type="submit" value="등록" class="btn_medium">

									</div>
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