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
   $(document).ready(function() {
      
	    $(document).ready(function() {
	        $('#blind_change').on('click', function() {
	            $('#q_title').val('관리자에 의해 블라인드 처리된 게시물입니다.');
	            $('#q_content').val('관리자에 의해 블라인드 처리되었음을 알려드립니다.');
	            $('#r_title').val('관리자에 의해 블라인드 처리된 게시물입니다.');
	            $('#r_content').val('관리자에 의해 블라인드 처리된 게시물입니다.');
	            $('form').submit();
	            alert("블라인드 처리되었습니다.")
	        });
	    });
	   
   });
   
</script>




<!-- Custom fonts for this template-->
<link href="../resources/admin/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
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
							
								<h6 class="m-0 font-weight-bold text-primary">게시글 조회</h6>
								
				<form action="qnaedit_do" method="post">
					<input name="q_postnum" type="hidden" value="${qnacontent.q_postnum}" />
					
       				 <select id="inquiry_type" name="q_inquiry" required>
            			<option selected disabled id="sltid" value="문의유형">문의유형</option>
            			<option value="일반문의" ${qnacontent.q_inquiry == '일반문의' ? 'selected' : ''} >일반문의</option>
            			<option value="상품문의" ${qnacontent.q_inquiry == '상품문의' ? 'selected' : ''}>상품문의</option>
        			</select>
       				 
					<div class="addcontainer">
						<input type="hidden" id="m_id" value="${qnacontent.m_id}" name="m_id">

						
						<label for="inquiry_select">작성자ID</label>
            			<input type="text" id="q_import_product" name="q_import_product" value="${qnacontent.m_id}" readonly>
    					<hr/>
						<label for="type_select">세부유형, 제품선택</label>
            			<div style="display: flex;">
            				<input type="text" id="q_import_product" name="p_inq_type" value="${qnacontent.p_inq_type}" readonly>
            				<input type="text" id="q_import_product" name="q_import_product" value="" readonly>
            			</div>
            			<hr/>

						<input name="" type="hidden" value="" />

						<label for="title">제목</label>
						<input type="text" id="q_title" name="q_title" value="${qnacontent.q_title}" required>
						<hr/>
						<label for="content">내용</label>
						<textarea id="q_content" name="q_content" rows="13" required>${qnacontent.q_content}</textarea>

						<input type="hidden" id="q_pass" name="q_pass" value="${qnacontent.q_pass}">
						<hr/>
						<label for="title">답글제목</label>
						<input type="text" id="r_title" name="q_answertitle" value="${qnacontent.q_answertitle}">
						<hr/>
						<label for="content">답글내용</label>
						<textarea id="r_content" name="q_answercontent" rows="13" required>${qnacontent.q_answercontent}</textarea>
						<div class="button-container">
						<a id="blind_change" class="list-button">블라인드</a>
							<input class="submit-button" type="submit" value="작성완료">
							<a class="cancel-button" href="qnaview_do?q_postnum=${qnacontent.q_postnum}">취소</a>
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