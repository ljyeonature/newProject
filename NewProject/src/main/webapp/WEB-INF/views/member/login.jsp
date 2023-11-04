<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>AQU I CITY 로그인</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="../resources/join_login/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="../resources/join_login/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="../resources/join_login/vendors/linericon/style.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="../resources/join_login/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="../resources/join_login/css/style.css">
  <script src="../resources/main/jquery/jquery-3.2.1.min.js"></script>
</head>
<!-- <script>
        $(document).ready(function(){
    var userInputId = getCookie("m_id");//저장된 쿠기값 가져오기
    $("input[name='m_id']").val(userInputId); 
     
    if($("input[name='m_id']").val() != ""){ // 그 전에 ID를 저장해서 처음 페이지 로딩
                                           // 아이디 저장하기 체크되어있을 시,
        $("#rememberme").attr("checked", true); // ID 저장하기를 체크 상태로 두기.
    }
     
    $("#rememberme").change(function(){ // 체크박스에 변화가 발생시
        if($("#rememberme").is(":checked")){ // ID 저장하기 체크했을 때,
            var userInputId = $("input[name='m_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }else{ // ID 저장하기 체크 해제 시,
            deleteCookie("userInputId");
        }
    });
     
    // ID 저장하기를 체크한 상태에서 ID를 입력하는 경우, 이럴 때도 쿠키 저장.
    $("input[name='m_id']").keyup(function(){ // ID 입력 칸에 ID를 입력할 때,
        if($("#rememberme").is(":checked")){ // ID 저장하기를 체크한 상태라면,
            var userInputId = $("input[name='m_id']").val();
            setCookie("userInputId", userInputId, 7); // 7일 동안 쿠키 보관
        }
    });
});
 
function setCookie(cookieName, value, exdays){
    var exdate = new Date();
    exdate.setDate(exdate.getDate() + exdays);
    var cookieValue = escape(value) + ((exdays==null) ? "" : "; expires=" + exdate.toGMTString());
    document.cookie = cookieName + "=" + cookieValue;
}
 
function deleteCookie(cookieName){
    var expireDate = new Date();
    expireDate.setDate(expireDate.getDate() - 1);
    document.cookie = cookieName + "= " + "; expires=" + expireDate.toGMTString();
}
 
function getCookie(cookieName) {
    cookieName = cookieName + '=';
    var cookieData = document.cookie;
    var start = cookieData.indexOf(cookieName);
    var cookieValue = '';
    if(start != -1){
        start += cookieName.length;
        var end = cookieData.indexOf(';', start);
        if(end == -1)end = cookieData.length;
        cookieValue = cookieData.substring(start, end);
    }
    return unescape(cookieValue);
}
     </script> -->
<body>
	
  
  <!--================Login Box Area =================-->
	<section class="login_box_area section-margin">
		<div class="container">
			<div class="row">
				<div class="col-lg-6">
					<div class="login_box_img" id="login_box">
						<div class="hover">
							<h4>New to our website?</h4>
							<p>There are advances being made in science and technology everyday, and a good example of this is the</p>
							<a class="button button-account" href="join">Create an Account</a>
						</div>
					</div>
				</div>
				<div class="col-lg-6">
					<div class="login_form_inner">
						<h3>Log in to enter</h3>
						<form class="row login_form login" action="login_do" id="contactForm" method="post">
							<div class="col-md-12 form-group">
								<input type="text" class="form-control" id="m_id" name="m_id" placeholder=Id onfocus="this.placeholder = ''" onblur="this.placeholder = 'Id'">
								
							</div>
							<div class="col-md-12 form-group">
								<input type="password" class="form-control" id="m_pass" name="m_pass" placeholder="Password" onfocus="this.placeholder = ''" onblur="this.placeholder = 'Password'">
							</div>
							<div class="col-md-12 form-group">
								<div class="creat_account">
									<input type="checkbox" id="rememberme" name="rememberme">
									<label for="rememberme">아이디 저장</label>
								</div>
							</div>
							<div class="col-md-12 form-group">
								<button type="submit" value="submit" class="button button-login w-100">Log In</button>
								<a href="forgot-password">Forgot Password?</a>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!--================End Login Box Area =================-->


  <script src="../resources/join_login/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="../resources/join_login/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="../resources/join_login/vendors/skrollr.min.js"></script>
  <script src="../resources/join_login/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="../resources/join_login/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="../resources/join_login/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="../resources/join_login/vendors/mail-script.js"></script>
  <script src="../resources/join_login/js/main.js"></script>
</body>
</html>