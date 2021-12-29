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
	

<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>회원정보수정 페이지</title>
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
					<a href="회원가입.jsp">회원정보수정</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon solid fa-home" href="Mainpage.jsp"><span>메인 페이지</span></a></li>
						
						<li><a class="icon solid fa-cog" href="left-sidebar.html"><span>세번째 탭
									</span></a></li>
						<li><a class="icon solid fa-retweet"
							href="right-sidebar.html"><span>마이 페이지</span></a></li>
						<li><a class="icon solid fa-sitemap" href="Login.jsp"><span>로그인
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
                  <section>
                  <ul class="links" >
                  
                    
                      </ul>
                       <form action="UpdateCon.do" method="post">
                        <h5>변경할 닉네임</h5>
                        <input type="text" name="m_nick" placeholder="Nick"><br>
                        <h5>변경할 전화번호</h5>
                        <input type="text" name="m_tel" placeholder="Tel"><br>
                        <h5>변경할 강아지 이름</h5>
                        <input type="text" name="m_dogname" placeholder="Dogname"><br>
                        <h5>변경할 강아지 견종</h5>
                        <input type="text" name="m_dogkind" placeholder="Dogkind"><br>
                        <h5>변경할 강아지 나이</h5>
                        <input type="text" name="m_dogage" placeholder="숫자를 입력해 주세요"><br>
                        <h5>변경할 강아지 무게</h5>
                        <input type="text" name="m_dogweight" placeholder="숫자를 입력해 주세요"><br>
                        <input type="submit" value="Update" class="button fit" style="margin-right: 10px;">
                        <!-- <input type="submit" value="Sign Up" class="button fit"><br> -->
                     </form>
                     </section>
                   
                 
                  
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