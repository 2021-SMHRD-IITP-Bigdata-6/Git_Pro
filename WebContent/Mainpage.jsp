<%@page import="com.dogpro.memberDTO.memberDTO"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!--
   Strongly Typed by HTML5 UP
   html5up.net | @ajlkn
   Free for personal and commercial use under the CCA 3.0 license (html5up.net/license)
-->
<html>
<head>
<title>Main Page</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style type="text/css">
#browsers {
	background-color: white;
	border: 1px solid black;
	border-radius: 10px;
	display: inline-block;
	font: inherit;
	line-height: 1.5em;
	padding: 0.5em 3.5em 0.5em 1em;
	margin-left: 10px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-image: linear-gradient(45deg, transparent 50%, gray 50%),
		linear-gradient(135deg, gray 50%, transparent 50%),
		radial-gradient(#ddd 70%, transparent 72%);
	background-position: calc(100% - 20px) calc(1em + 2px),
		calc(100% - 15px) calc(1em + 2px), calc(100% - .5em) .5em;
	background-size: 5px 5px, 5px 5px, 1.2em 1.2em;
	background-repeat: no-repeat;
}

#browsers1 {
	background-color: white;
	border: 1px solid black;
	border-radius: 10px;
	display: inline-block;
	font: inherit;
	line-height: 1.5em;
	padding: 0.5em 3.5em 0.5em 1em;
	margin-right: 50px;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-image: linear-gradient(45deg, transparent 50%, gray 50%),
		linear-gradient(135deg, gray 50%, transparent 50%),
		radial-gradient(#ddd 70%, transparent 72%);
	background-position: calc(100% - 20px) calc(1em + 2px),
		calc(100% - 15px) calc(1em + 2px), calc(100% - .5em) .5em;
	background-size: 5px 5px, 5px 5px, 1.2em 1.2em;
	background-repeat: no-repeat;
}

#browsers2 {
	background-color: white;
	border: 1px solid black;
	border-radius: 10px;
	display: inline-block;
	font: inherit;
	line-height: 1.5em;
	padding: 0.5em 3.5em 0.5em 1em;
	margin: 0;
	-webkit-box-sizing: border-box;
	-moz-box-sizing: border-box;
	box-sizing: border-box;
	-webkit-appearance: none;
	-moz-appearance: none;
	background-image: linear-gradient(45deg, transparent 50%, gray 50%),
		linear-gradient(135deg, gray 50%, transparent 50%),
		radial-gradient(#ddd 70%, transparent 72%);
	background-position: calc(100% - 20px) calc(1em + 2px),
		calc(100% - 15px) calc(1em + 2px), calc(100% - .5em) .5em;
	background-size: 5px 5px, 5px 5px, 1.2em 1.2em;
	background-repeat: no-repeat;
}

#imgfood {
	border: 2px solid black;
	width: 250px;
	height: 400px;
	display: bolck;
	margin-left: auto;
	margin-right: auto;
	margin: 20px;
}
</style>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container">

				<!-- Logo -->
				<h1 id="logo">
					<a href="Mainpage.jsp">DOGPRO+</a>
				</h1>
				<!--  <p></p>-->

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon solid fa-home" href="Mainpage.jsp"><span>메인
									페이지</span></a></li>
						<li><a class="icon solid fa-cog" href="left-sidebar.html"><span>세번째
									탭</span></a></li>
						<li><a class="icon solid fa-retweet" href="Mypage_Rec.html"><span>마이
									페이지</span></a></li>
						<%
							memberDTO dto = (memberDTO) session.getAttribute("dto");
						if (dto == null) {
						%>
						<li><a class="icon solid fa-sitemap" href="Login.jsp"><span>로그인</span></a></li>
						<%
							} else {
						%>
						<li><a class="icon solid fa-sitemap" href="회원정보수정.jsp">회원정보수정</a>
						<li><a class="icon solid fa-sitemap" href="LogoutCon.do">로그아웃</a>
							<%
								}
							%>
					</ul>
				</nav>

			</div>
		</section>

		<section id="features" style =" padding: inherit">

			<div class="container">
				<header>
					<div style="width: 1200px; heigh: 4000px; margin-left: 90px;">
						<img src="images/메인사진3.png" style="width: 100%; heigh: 100%; margin-bottom: 40px;">
					</div>
					<%
						String id = (String) session.getAttribute("id");
					int cnt = 0;
					if (application.getAttribute("visit") == null) {
						application.setAttribute("visit", 1);
					} else {
						int visit = (int) application.getAttribute("visit");
						cnt = visit;
						application.setAttribute("visit", visit + 1);
					}
					%>
					<%
						if (dto == null) {
					%>
					<h1 style = "float: left ;font-size: xx-large;
    margin-left: 90px;
    margin-top: 50px; margin-bottom: 20px;" >어서오세요    <%out.print("   "+cnt); %>  번째 방문자 입니다 ♥</h1>
					<%
						} else {
					%>
					
					<h1>
						<%
							System.out.println("현재로그인한 아이디 : " + dto.getId()+" ");
						out.print(dto.getId());
						%> 님 환영합니다. 
						<div class="col-4 col-6-medium col-12-small">
							<div class="row aln-center">
								<!-- 	
						<section>
							<a href="#" class="image featured"
								style="border-radius: 80px/50px;"><img src="images/나이.jpeg"
								style="height: 200px; border-radius: 80px/50px;" />나이</a>
						</section> 

					</div>
					<div class="col-4 col-6-medium col-12-small">

						<section>
							<a href="#" class="image featured"
								style="border-radius: 80px/50px;"><img
								src="images/그래프1.jfif"
								style="height: 200px; border-radius: 80px/50px;" />몸무게</a>
						</section>

					</div>
					<div class="col-4 col-6-medium col-12-small">

						<section>
							<a href="#" class="image featured"
								style="border-radius: 80px/50px;"><img src="images/그래프2.png"
								style="height: 200px; border-radius: 80px/50px;" />기타</a>
						</section>
					</div>
  -->
							</div>
					</h1>
					<%
						}
					%>
				</header>
			</div>

			<!-- Feature -->
			<div align="left" style="margin-left: 270px;">
				<%
					if (dto == null) {
				%>

				<%
					} else {
				%>
				<h1 style="margin-left: 100px;">
				<br><br>
					<%
						System.out.println("현재로그인한 강아지의 이름 : " + dto.getDogname());
					out.print(dto.getDogname());
					%>을 위한 추천 사료
				</h1>
				<br>
				<div
					style="width: 300px; heigh: 1000px; border: 1px; margin-left: 90px; float: left;">
					<img src="images/ANF 그레인프리 연어와 병아리콩.png"
						style="float: right; height: 500px; width: 300px; margin-bottom: 50px; border-radius: 80px/50px;" />

				</div>




				<div
					style="width: 300px; heigh: 1000px; border: 1px; margin-left: 90px; float: left;">
					<img src="images/ANF 그레인프리 닭고기와 감자.png"
						style="float: right; height: 500px; width: 300px; margin-bottom: 50px; border-radius: 80px/50px;" />
				</div>





				<div
					style="width: 300px; heigh: 1000px; border: 1px; margin-left: 90px; float: left;">
					<img src="images/ANF 그레인프리 연어와 병아리콩.png"
						style="float: right; height: 500px; width: 300px; margin-bottom: 50px; border-radius: 80px/50px;" />

				</div>
				<div
					style="width: 300px; heigh: 1000px; border: 1px; margin-left: 90px; float: left;">
					<img src="images/ANF 그레인프리 연어와 병아리콩.png"
						style="float: right; height: 500px; width: 300px; margin-bottom: 50px; border-radius: 80px/50px;" />

				</div>



				<%
					}
				%>

			</div>
		
		</section>
		<section id="features" style =" padding: 0;">
		<h2 align="right" style="float: left; margin-left: 340px;font: menu; font-size:  xx-large;">기능별
				사료 검색</h2><
			<div class="dropdown-label" style="float: right"></div>
			<select id="browsers" name="browsers" class="browsers">
				<option>기능</option>
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
			</select> <select id="browsers1" name="browsers1" class="browsers1">
				<option>기능</option>
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
			</select> <select id="browsers2" name="browsers2" class="browsers2">
				<option>기능</option>
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
			</select>


			<!-- 일반쇼팡 -->
			

				<img id="imgfood" src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg">
				<h2 align="right" style="float: left; margin-left: 550px;"></h2>
				<img id="imgfood" src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg"> <img id="imgfood"
					src="images/터키앤치킨독.jpg">
			
		</section>
		
		<!-- Scripts -->
		<script src="assets/js/jquery.min.js"></script>
		<script src="assets/js/jquery.dropotron.min.js"></script>
		<script src="assets/js/browser.min.js"></script>
		<script src="assets/js/breakpoints.min.js"></script>
		<script src="assets/js/util.js"></script>
		<script src="assets/js/main.js"></script>
</body>
</html>