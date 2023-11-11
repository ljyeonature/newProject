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

 table {
        border-spacing: 10px; /* 원하는 간격 (픽셀)으로 조정하세요 */
    }

    th, td {
        padding: 10px; /* 셀 내부 여백을 조정하세요 */
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
<!-- 카테고리 대분류 선택 시 중분류 내용 각각 나오게 설정 -->


</head>

<body id="page-top">



   <!-- 사이드바  -->
   <%@ include file="/WEB-INF/views/admin/sidebar.jsp"%>
   <!-- TOP  -->
   <%@ include file="/WEB-INF/views/admin/top.jsp"%>




   <div class="container-fluid">

      <!-- Page Heading -->
      <h1 class="h3 mb-2 text-gray-800">상품 재고 수정</h1>

      <div class="card shadow mb-4">
         <div class="card-header py-3">
            <h6 class="m-0 font-weight-bold text-primary">재고 수정</h6>
         </div>

         <div class="card-body">
            <div class="table-responsive">
               <table class="table table-bordered" id="dataTable" width="100%"
                  cellspacing="0">
                  <form name="fsearch" id="fsearch" method="get"
                     enctype="multipart/form-data" action="option_see">
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
                                 <!-- p_selid 들어가게 입력 -->
									<h3 class="m-0 font-weight-bold text-primary"id="p_selid">${param.p_selid}</h3>
                                 
                                    <div class="card-body">
					
                           
                                 <form name="fsearch" id="fsearch" method="post">
                                    <input type="hidden" name="code" value="list">
                                    <div class="card-body">
                        <div class="table-responsive">
                           <table class="table table-bordered" id="dataTable" width="100%"
                              cellspacing="0">
                              <thead>
                        
                                 <tr role="row">
                        
                              <th class="sorting" tabindex="0" aria-controls="dataTable"
                                 rowspan="1" colspan="1" style="width: 130px;">옵션아이디</th>
                                 <th class="sorting" tabindex="0" aria-controls="dataTable"
                                 rowspan="1" colspan="1" style="width: 130px;">옵션명</th>
                                 <th class="sorting" tabindex="0" aria-controls="dataTable"
                                 rowspan="1" colspan="1" style="width: 130px;">재고</th>
                                   <th class="sorting" tabindex="0" aria-controls="dataTable"
                                 rowspan="1" colspan="1" style="width: 130px;">개별 등록</th>
                             
                           
                           </tr>
                              <tbody id="option_item">
							    <c:forEach items="${product_stock_res}" var="oplist">
							        <tr>
							            <td>${oplist.p_optionID}</td>
							            <td>${oplist.o_name }</td>
							            <td><input type="text" class="stockInput" name="stockInput" value="${oplist.p_stock }"></td>
							            <td><input type="button" value="등록" class="btn_medium option_insert"></td>
							        </tr>
							    </c:forEach>
							</tbody>
                           </table>
                        </div>
                                             </td>
                                             </tr>


                                          </tbody>
                           <div class="btn_confirm" id="option_data">
<input type="button" value="확인" class="btn_medium" onclick="window.location.href = 'product_stock';">
                                
                           </div>
                                       </table>
                                    </div>
                                    </section>
                                    </tbody>
                              </table>
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
   
   <script>
   $(document).ready(function() {

	   $('.option_insert').on('click', function () {
           var stockValue = $(this).closest('tr').find('.stockInput').val();
           var p_optionID = $(this).closest('tr').find('td:first').text();

           var dataToSend = {
               p_optionID: p_optionID,
               p_stock: stockValue,
           };

           $.ajax({
               type: 'post',
               data: JSON.stringify(dataToSend),
               contentType: "application/json",
               url: 'update_stock',
               success: function (response) {
                   alert('저장되었습니다.');
               },
               error: function (err) {
                   console.log(err);
                   alert('저장 실패하였습니다.');
               }
           });
       });


   
   });
</script>
</body>
</html>