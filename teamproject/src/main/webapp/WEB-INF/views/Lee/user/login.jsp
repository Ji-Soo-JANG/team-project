<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>로그인:차박차박</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.0/jquery.min.js"></script>
<link rel="stylesheet" href="/resources/Lee/css/user/login.css">
<script src="/resources/Lee/js/user/login.js"></script>

</head>
<body>
	<div class="logoContainer">
		<a href="/"><img alt="logo" src="/resources/Lee/image/logo2.png"></a>
	</div>
    <div class="form-content">
    	<!-- <span class="close-modal" id="close-modal">&times;</span> -->
   		<h2>로그인</h2>
	    <form class="form-item" id="form-login" action="/Lee/user/loginRun" method="post">
	    	<label for="username">아이디:</label>
	        <input type="text" id="u_id" placeholder="아이디" name="userid" value="206dev">
	        <label for="password">비밀번호:</label>
	        <input type="password" id="userpw" placeholder="비밀번호" value="1234">
	        <p id="checkResult"></p>
	        <div class="idCheckContainer">
	        	<input type="checkbox" name="checked"> <span>자동 로그인</span>
	        </div>
	        <button type="button" class="btn" id="btnLogin">Login</button>
	   </form>
	   <div class="form-links-container">
	       <a href="/Lee/user/join">회원가입</a>
	       <a href="/Lee/user/forgot-id">아이디 찾기</a>
	       <a href="/Lee/user/forgot-password">비밀번호 찾기</a>
	   </div>
   </div>

</body>
</html>