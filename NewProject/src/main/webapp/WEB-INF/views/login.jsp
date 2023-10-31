<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta http-equiv="X-UA-Compatible" content="ie=edge">
  <title>AQU I CITY 로그인</title>
	<link rel="icon" href="img/Fevicon.png" type="image/png">
  <link rel="stylesheet" href="resources/join_login/vendors/bootstrap/bootstrap.min.css">
  <link rel="stylesheet" href="resources/join_login/vendors/fontawesome/css/all.min.css">
	<link rel="stylesheet" href="resources/join_login/vendors/themify-icons/themify-icons.css">
	<link rel="stylesheet" href="resources/join_login/vendors/linericon/style.css">
  <link rel="stylesheet" href="resources/join_login/vendors/owl-carousel/owl.theme.default.min.css">
  <link rel="stylesheet" href="resources/join_login/vendors/owl-carousel/owl.carousel.min.css">
  <link rel="stylesheet" href="resources/join_login/vendors/nice-select/nice-select.css">
  <link rel="stylesheet" href="resources/join_login/vendors/nouislider/nouislider.min.css">

  <link rel="stylesheet" href="resources/join_login/css/style.css">
</head>
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
									<input type="checkbox" id="f-option2" name="selector">
									<label for="f-option2">약관을 읽었습니다.</label>
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


  <script src="resources/join_login/vendors/jquery/jquery-3.2.1.min.js"></script>
  <script src="resources/join_login/vendors/bootstrap/bootstrap.bundle.min.js"></script>
  <script src="resources/join_login/vendors/skrollr.min.js"></script>
  <script src="resources/join_login/vendors/owl-carousel/owl.carousel.min.js"></script>
  <script src="resources/join_login/vendors/nice-select/jquery.nice-select.min.js"></script>
  <script src="resources/join_login/vendors/jquery.ajaxchimp.min.js"></script>
  <script src="resources/join_login/vendors/mail-script.js"></script>
  <script src="resources/join_login/js/main.js"></script>
</body>
</html>