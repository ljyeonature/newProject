<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>새 비밀번호 설정</title>
</head>
<body>
	<form action="pw_new" method="POST" class="content">
		<div class="textbox">
			<input id="m_pass" name="m_pass" type="password"><label>새비밀번호</label>
			<!-- <div class="error">Invalid password</div> -->
		</div>
		
		<span id=same></span> <br>
		<br> <input type="submit" id="check" value="비밀번호변경"> 
		<input type="hidden" name="m_email" value="${m_email }">
	</form>
</body>
</html>