<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" type="text/css" href="./style.css">
<style type="text/css">
* {
	margin: 0px;
	padding: 0px;
	text-decoration: none;
	font-family: sans-serif;
}

body {
	background-image: #34495e;
}

.loginForm {
	position: absolute;
	width: 300px;
	height: 400px;
	padding: 30px, 20px;
	background-color: #FFFFFF;
	text-align: center;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	border-radius: 15px;
}

.loginForm h1 {
	text-align: center;
	margin: 30px;
	color: #FF28A7;
}

.idForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.passForm {
	border-bottom: 2px solid #adadad;
	margin: 30px;
	padding: 10px 10px;
}

.id {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.pw {
	width: 100%;
	border: none;
	outline: none;
	color: #636e72;
	font-size: 16px;
	height: 25px;
	background: none;
}

.btn {
	position: relative;
	left: 40%;
	transform: translateX(-50%);
	margin-bottom: 40px;
	width: 80%;
	height: 40px;
	background-color: pink;
	background-position: left;
	background-size: 200%;
	color: white;
	font-weight: bold;
	border: none;
	cursor: pointer;
	transition: 0.4s;
	display: inline;
}

.btn:hover {
	background-position: right;
}

.bottomText {
	text-align: center;
}
</style>
</head>

<body width="100%" height="100%">
	<form action="index.html" method="post" class="loginForm">
		<h1>L O I G N</h1>
		
			<input type="text" name ="id" class="id" placeholder="ID">
			<input type="password" name = "pw" class="pw" placeholder="PW">
		<button type="button" class="btn" value="LogIn">LOG IN</button>
		<button type="button" href="회원가입.html">Sign Up</button>
	</form>

<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>로그인 페이지</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
</head>
<body class="no-sidebar is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container">

				<!-- Logo -->
				<h1 id="logo">
					<a href="index.html">로그인</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon solid fa-home" href="Mainpage.jsp"><span>메인 페이지</span></a></li>
						<li><a href="#" class="icon fa-chart-bar"><span>두번째 탭</span></a>
							<ul>
								<li><a href="#">Lorem ipsum dolor</a></li>
								<li><a href="#">Magna phasellus</a></li>
								<li><a href="#">Etiam dolore nisl</a></li>
								<li><a href="#">Phasellus consequat</a>
									<ul>
										<li><a href="#">Magna phasellus</a></li>
										<li><a href="#">Etiam dolore nisl</a></li>
										<li><a href="#">Phasellus consequat</a></li>
									</ul></li>
								<li><a href="#">Veroeros feugiat</a></li>
							</ul></li>
						<li><a class="icon solid fa-cog" href="left-sidebar.html"><span>세번째 탭
									</span></a></li>
						<li><a class="icon solid fa-retweet"
							href="right-sidebar.html"><span>마이 페이지</span></a></li>
						<li><a class="icon solid fa-sitemap" href="Login.html"><span>로그인
									</span></a></li>
					</ul>
				</nav>

			</div>
		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div id="content">

					<!-- Post -->
					<article class="box post">
						<header>
							
						</header>
						<ul class="links" >
							<h5>로그인</h5>
							<form action="LoginCon.do" method="post">
								<input type="text" name="m_id" placeholder="ID을 입력하세요"><br>
								<h5>비밀번호</h5>
								<input type="password" name="m_pw" placeholder="PW를 입력하세요"><br>
								<input type="submit" value="Login" class="button fit" style="margin-right: 10px;">
								<input type="submit" value="Sign Up" class="button fit"><br>
							</form>
						</ul>
						
					</article>

				</div>
			</div>
		</section>

		<!-- Footer -->
		
			


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>