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
					<a href="Login.jsp">로그인</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<!-- <li><a class="icon solid fa-home" href="Mainpage.jsp"><span>메인 페이지</span></a></li> -->

						<h1 id="logo">
							<a href="Mainpage.jsp">DOGPRO+</a>
						</h1>

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
						<header> </header>
						<section>
							<ul class="links">
								<h5>로그인</h5>
								<form action="LoginCon2.do" method="post">
									<input type="text" name="m_id" placeholder="ID"><br>
									<h5>비밀번호</h5>
									<input type="password" name="m_pw" placeholder="PW"><br>
									<input type="submit" value="Login" class="button fit"
										style="margin-right: 10px;">
									<!-- <input type="submit" value="Sign Up" class="button fit"><br> -->
								</form>
							</ul>
						</section>
						<section>
							<br>
							<h5>회원가입</h5>
							<form action="JoinCon.do" method="post">
								<input type="text" name="m_id1" placeholder="아이디"><br>
								<input type="password" name="m_pw1" placeholder="비밀번호"><br>
								<input type="text" name="m_tel" placeholder="닉네임"><br>
								<input type="text" name="m_nick"
									placeholder="전화번호 ex) 010-1234-5678"><br> <input
									type="text" name="m_dogname" placeholder="반려견 이름"><br>
								<input type="text" name="m_dog" placeholder="견종"><br>
								<input type="text" name="m_dogage" placeholder="반려견 나이(살) ex) 7"><br>
								<input type="text" name="m_dogweight"
									placeholder="반려견 무게(kg) ex) 5.5"><br> <input
									type="text" name="date" placeholder="입양날짜  ex) 20/01/01"><br>
								<!--     </form>
                      <form action="UploadService" method="post" enctype="multipart/form-data">
                     <tr>
                     <td>강아진 사진 : </td>
                     <td><input type="file" value="파일 선택" name="file"/></td>
                    </tr>
                    <br>
                    <div> </div>-->
								<input type="submit" value="Sign up" class="button fit"
									style="margin-right: 10px;">
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
		<script>
			$('#dog_imgFile').filebox({
				buttonText : '파일 찾아보기',
				buttonAlign : 'right'
			});
		</script>
</body>
</html>