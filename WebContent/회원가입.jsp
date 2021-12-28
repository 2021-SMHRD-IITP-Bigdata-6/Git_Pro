<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<!--
	Strongly Typed by HTML5 UP
	html5up.net | @ajlkn
	Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>회원가입 페이지</title>
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
					<a href="index.html">회원가입 페이지</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon solid fa-home" href="MainPage.html"><span>메인 페이지</span></a></li>
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
					<article class="box post" style="text-align-last:center;">

			
						<ul class="actions vertical" style="align:center;">
							<li><h5>회원가입</h5></li>
							<form action="JoinCon.do" method="post">
								<li><input id="Join_id" type="text" name="id" placeholder="아이디을 입력하세요"></li>
								<button id="check" onclick="idCheck()">중복체크</button><br>
								<li><input type="password" name="pw" placeholder="비밀번호를 입력하세요"></li> <br>
								<p id="result"></p><br>
								<li><input type="text" name="nickname" placeholder="닉네임을 입력하세요"></li> 
								<button id="check" onclick="nicknameCheck()">중복체크</button>
								<p id="result"></p><br>
								<li><input type="text" name="email" placeholder="이메일을 입력하세요" ></li>
								<button id="check" onclick="emailCheck()">중복체크</button>
								<p id="result"></p><br>
								<li><input type="text" name="tel" placeholder="전화번호를 입력하세요" ></li><br>
								
								<br><br>
								<li><input type="submit" value="가입하기" class="button fit"></li>
								<br>
							</form>
						</ul>
						<script>
						const yes = document.querySelector('#yes');
						const no = document.querySelector('#no');
						String nextpage = "";
						
						function yes() {
							if(yes.checked == true) {
							    no.checked = false;
							    </select>
							    <script id="browsers" name="browsers" class="browsers" required
					               autofocus>
					               <option value="종합비타민">종합비타민</option>
					               <option value="향산화">향산화</option>
					               <option value="식욕증진">식욕증진</option>
					               <option value="영양공급">영양공급</option>
					               <option value="결석예방">결석예방</option>
					               <option value="보습">보습</option>
					               <option value="구강관리">구강관리</option>
					               <option value="냄새제거">냄새제거</option>
					               <option value="다이어트">다이어트</option>
					               <option value="중성화">중성화</option>
					               <option value="인도어">인도어</option>
					               <option value="눈물개선">눈물개선</option>
					               <option value="눈건강">눈건강</option>
					               <option value="저알러지">저알러지</option>
					               <option value="피부개선">피부개선</option>
					               <option value="털개선">털개선</option>
					               <option value="러너리비뇨계">러너리비뇨계</option>
					               <option value="뼈관절강화">뼈관절강화</option>
					               <option value="퍼포먼스">퍼포먼스</option>
					               <option value="소화 장기능 개선">소화 장기능 개선</option>
					               <option value="치석제거">치석제거</option>
					               <option value="체중유지">체중유지</option>
					               <option value="처방식">처방식</option>
					               <option value="신장요로">신장요로</option>
					            
							    nextpage="Login.html";
							    }
							return nextpage;
							   }
							function no() {
							if(no.checked == true) {
							    yes.checked = false;
							    nextpage="Login.html";
							    }
							return nextpage;
							   }
						</script>

					</article>

				</div>
			</div>
		</section>

	

	</div>

	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

</body>
</html>