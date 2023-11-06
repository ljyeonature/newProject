<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">
						회원가입 시 4000포인트 지급
					</div>

					<div class="right-top-bar flex-w h-full">
						<c:if test="${ not empty sessionScope.logname }">
							<a href="#" class="flex-c-m trans-04 p-lr-25">
								${sessionScope.logname}님
							</a>
						</c:if>
							
						<c:if test="${ empty sessionScope.logname }">
							<a href="../member/login" class="flex-c-m trans-04 p-lr-25">
								My Account
							</a>
						</c:if>
						
						<c:if test="${ not empty sessionScope.logname }">
							<a href="../member/logout_do" class="flex-c-m trans-04 p-lr-25">
								로그아웃
							</a>
						</c:if>
						
						<c:if test="${ not empty sessionScope.logname }">
							<a href="../member/mypage?m_id=${sessionScope.logname}" class="flex-c-m trans-04 p-lr-25">
								마이페이지
							</a>
						</c:if>

						<a href="../admin/admin-index" class="flex-c-m trans-04 p-lr-25">
							관리자
						</a>

						<!-- <a href="#" class="flex-c-m trans-04 p-lr-25">
							USD
						</a> -->
					</div>
				</div>
			</div>

</body>
</html>