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
<!-- 제이쿼리CDN -->
<script src="https://code.jquery.com/jquery-latest.min.js"></script>
<!-- JS -->
<script type="text/javascript">
   $(function() {
      $("#delete-button").click(function(){
          if (confirm("해당 게시물을 삭제하시겠습니까?")) {
			alert("삭제되었습니다.");
      	} else {
			// 사용자가 "취소"를 클릭한 경우 추가 동작을 수행하거나 아무것도 하지 않을 수 있습니다.
      	}
      });
   });
</script>

<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css"
	rel="stylesheet" type="text/css">
	<link rel="stylesheet" type="text/css" href="../resources/main/css/QnA게시판글.css">
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

						<!-- DataTales Example -->
						<div class="card shadow mb-4">
							<div class="card-header py-3">
								
    <form action="/qnaview_do" method="post">
    <div class="addcontainer">
        	<label for="inquiry_select">작성자ID</label>
            <input type="text" id="q_import_product" name="q_import_product" value="${qnacontent.m_id}" readonly>
    		<hr/>
        	<label for="inquiry_select">Q&A유형</label>
            <input type="text" id="q_import_product" name="q_import_product" value="${qnacontent.q_inquiry}" readonly>
            <hr/>
            <label for="type_select">세부유형, 제품선택</label>
            <div style="display: flex;">
            	<input type="text" id="q_import_product" name="p_inq_type" value="${qnacontent.p_inq_type}" readonly>
            	<input type="text" id="q_import_product" name="q_import_product" value="" readonly>
            </div>
            <hr/>
            <label for="title">Q&A제목</label>
            <input type="text" id="q_import_title" name="q_import_title" value="${qnacontent.q_title}" required readonly>
            <hr/>
            <label for="content">Q&A내용</label>
            <textarea id="q_import_content" name="q_import_content" rows="13" value="" required readonly>${qnacontent.q_content}</textarea>
            <hr/>
            <label for="title">답글제목</label>
            <input type="text" id="r_title_import" name="r_title_import" value="${qnacontent.q_answertitle}"
                   required readonly>
                   <hr/>
			<label for="content">답글내용</label>
            <textarea id="r_import_content" name="r_import_content" rows="13"required readonly>${qnacontent.q_answercontent}</textarea>

        
        <div class="button-container">
            <a class="list-button" href="qna">목록</a>
            
           	<a class="re_edit-button" href="qnaeditForm_do?q_postnum=${qnacontent.q_postnum}">답글 작성 및 수정</a>
			<a class="cancel-button" id="delete-button" href="qnadelete_do?q_postnum=${qnacontent.q_postnum}">삭제</a>
        </div>
    </div>
</form>
								
								
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