<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
@keyframes moveText {
    from {
        transform: translateX(150%);
    }
    to {
        transform: translateX(-150%);
    }
}


.left-top-bar {
    white-space: nowrap;
    overflow: hidden;
    animation: moveText 20s linear infinite;
    z-index: 1;
}

.right-top-bar {
    display: flex;
    align-items: center;
    position: relative;
    z-index: 2;
    background: #222222;
}
</style>
</head>
<body>

			<!-- Topbar -->
			<div class="top-bar">
				<div class="content-topbar flex-sb-m h-full container">
					<div class="left-top-bar">★ ☆ ★ 아쿠아이씨티 신규 오픈기념 이벤트 ☆ ★ ☆ 신규가입 회원 대상 4000 포인트 증정 ☆ ★ ☆ 신제품 다량 입고 ☆ ★ ☆ 구피, 테트라, 베타 등등 각종 인기어 재입고 ☆ ★ ☆ </div>

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
							<a href="../member/mypage?m_id=${sessionScope.logid}" class="flex-c-m trans-04 p-lr-25">
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