<%@page import="com.dogpro.memberDAO.foodDAO"%>
<%@page import="com.dogpro.memberDAO.memberDAO"%>
<%@page import="java.io.Console"%>
<%@page import="com.dogpro.memberDTO.foodDTO"%>
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
	width: 300px;
	height: 350px;
	display: bolck;
	margin-left: auto;
	margin-right: auto;
	margin: 20px;
	align: bottom;
}
</style>
<script type="text/javascript"
	src="https://www.gstatic.com/charts/loader.js"></script>

</head>
<body class="homepage is-preload">
	<div id="page-wrapper"></div>
	<!-- Header -->
	<section id="header">
		<div class="container">
			<%
				memberDAO dao = new memberDAO();
			foodDAO f_dao = new foodDAO();
			ArrayList<foodDTO> arr = dao.selectFood();
			%>
			<!-- Logo -->
			<h1 id="logo">
				<a href="Mainpage.jsp">DOGPRO+</a>
			</h1>
			<!--  <p></p>-->

			<!-- Nav -->
			<nav id="nav">
				<ul>

					<li><a class="icon solid fa-file-alt"
						href="Mypage_Firstjsp.jsp"><span>마이 페이지</span></a></li>
					<%
						foodDTO f_dto = (foodDTO) session.getAttribute("fdto");

					memberDTO dto = (memberDTO) session.getAttribute("dto");
					if (dto == null) {
					%>
					<li><a class="icon solid fa-sign-in-alt" href="Login.jsp"><span>로그인</span></a></li>
					<%
						} else {
					%>
					<li><a class="icon solid fa-sitemap" href="LogoutCon.do">로그아웃</a>
						<%
							}
						%>
				</ul>
			</nav>

		</div>
	</section>

	<section id="features">

		<div class="container">
			<header>
				<div style="width: 1200px; heigh: 4000px; margin-left: 90px;">
					<img src="images/메인사진3.png"
						style="width: 100%; heigh: 100%; margin-bottom: 40px;">
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
				<h1
					style="float: left; font-size: xx-large; margin-left: 450px; margin-top: 50px; margin-bottom: 20px;">
					어서오세요
					<%
					out.print(cnt);
				%>
					번째 방문자 입니다 ♥
				</h1>
				<br> <br> <br>
				<%
					} else {
				%>
				<h style=" font-size: xx-large;"> <strong> <%
 	out.print(dto.getNickname());
 %></strong>님 환영합니다.
				</h1>

				<%--   <div class="row aln-center">
               <div class="col-4 col-6-medium col-12-small">

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
				--%>
		</div>

		<%
			}
		%>






		<!-- Feature -->

		<%
			if (dto == null) {
		%>

		<%
			} else {
		%>
		<div align="left" style="margin-left: 270px;">
			<h1>
				<%
					System.out.println("현재로그인한 강아지의 이름 : " + dto.getDogname());
				out.print(dto.getDogname());
				%>를 위한 추천 사료
			</h1>
			<%
				for (int i = 25; i < 29; i++) {
			%>
			<div
				style="width: 300px; heigh: 1000px; border: 3px; margin-left: 40px; float: left;">
				<a href="<%=arr.get(i).getF_SITE()%>"> <img
					src="<%out.print(arr.get(i).getF_IMG());%>" id="imgfood"
					style="height: 500px; width: 300px; margin-bottom: 50px; float: right;"></a>
			</div>
			<%
				}
			%>

		</div>

		</h1>
		<%
			}
		%>


		<br>

		<h2 align="left" style="float: left; margin-left: 90px;">
			기능별 사료

			<h2 align="left" style="float: left; margin-left: 280px;">기능별 사료

				검색</h2>
			<br> <br> <br> <br>
			<h6 align="left" style="float: left; margin-left: 90px;">기능별 사료
				검색에 대한 설명!</h6>
			<br> <br>
	</section>


	<!-- 일반쇼팡 -->
	<section>


		<img id="imgfood" src="images/터키앤치킨독.jpg"> <img id="imgfood"
			src="images/터키앤치킨독.jpg"> <img id="imgfood"
			src="images/터키앤치킨독.jpg"> <img id="imgfood"
			src="images/터키앤치킨독.jpg"> <img id="imgfood"
			src="images/터키앤치킨독.jpg">
		<h2 align="right" style="float: left; margin-left: 550px;"></h2>
		<img id="imgfood" src="images/터키앤치킨독.jpg"> <img id="imgfood"
			src="images/터키앤치킨독.jpg"> <img id="imgfood"
			src="images/터키앤치킨독.jpg">
	</section>

	<!--  기능 여기 아래 숨겨둠 -->
	<section id="features">
		<select id="browsers" name="browsers"
			class="browsers" onchange="selectBoxChange1(this.value);">
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
		</select> <select id="browsers1" name="browsers1" class="browsers1"
			onchange="selectBoxChange2(this.value);">
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
		</select> <select id="browsers2" name="browsers2" class="browsers2"
			onchange="selectBoxChange3(this.value);">
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
		</select> <br> <br>
	</section>
	<!-- 일반쇼핑 -->
	<section id="features">


		<!-- 
기능을 어떻게 저장시킬 것인가? 
1) if option value = "체중유지" 
2) "체중유지" -> f_weight
3) select * from t_food where f_weight = 1;
4) 나온 사료 값들을 
5) img 태그 안에 넣어준다

how?
서블릿?
포문? 와일?


-->
		<%
			if (dto == null) {
		%>
		<div style="width: 1200px; height: 2000px; margin-left: 333px;">
			<%
				for (int i = 0; i < 9; i++) {
			%>
			<div style="float: right; width: 380px; height: 620px; margin-left:">
				<a href="<%=arr.get(i).getF_SITE()%>"><img
					src="<%out.print(arr.get(i).getF_IMG());%>" id="imgfood"></a>
				<div style="width: 300px; margin: auto;">
					<%
						out.print(arr.get(i).getF_NAME());
					%>
				</div>
				<div style="width: 100%; margin: auto;">
					<%
						out.print(arr.get(i).getF_PRICE());
					%>
				</div>
			</div>
			<%
				}
			%>
		</div>

		<%
			} else {
		%>
		<div style="width: 1200px; height: 2000px; margin-left: 333px;">
			<%
				for (int i = 10; i <= 21; i++) {
			%>
			<div style="float: right; width: 380px; height: 620px; margin-left:">
				<a href="<%=arr.get(i).getF_SITE()%>"> <img
					src="<%out.print(arr.get(i).getF_IMG());%>" id="imgfood"></a>
				<div style="width: 300px; margin: auto;">
					<%
						out.print(arr.get(i).getF_NAME());
					%>
				</div>
				<div style="width: 100%; margin: auto;">
					<%
						out.print(arr.get(i).getF_PRICE());
					%>
				</div>
			</div>
			<%
				}
			}
			%>

		</div>
		<select id="browsers" name="browsers" class="browsers"
			onchange="selectBoxChange1(this.value);">
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
		</select> <select id="browsers1" name="browsers1" class="browsers1"
			onchange="selectBoxChange2(this.value);">
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
		</select> <select id="browsers2" name="browsers2" class="browsers2"
			onchange="selectBoxChange3(this.value);">
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
		</select> <br> <br>
	</section>

	<!-- 일반쇼팡 -->
	<section id="features">


<!-- 
기능을 어떻게 저장시킬 것인가? 
1) if option value = "체중유지" 
2) "체중유지" -> f_weight
3) select * from t_food where f_weight = 1;
4) 나온 사료 값들을 
5) img 태그 안에 넣어준다

how?
서블릿?
포문? 와일?


-->
		
		
		<%if (dto == null) {%> 
		  <div style="width: 1200px; height: 2000px; margin-left: 333px;">
			<%  for(int i=0 ; i<9 ; i++){
                %>
			<div style="float: right; width: 380px; height: 620px; margin-left:">
				<a href="<%=arr.get(i).getF_SITE()%>"><img
					src="<%out.print(arr.get(i).getF_IMG()); %>" id="imgfood"></a>
				<div style="width: 300px; margin: auto;"><%out.print(arr.get(i).getF_NAME());  %></div>
				<div style="width: 100%; margin: auto;"><%out.print(arr.get(i).getF_PRICE());%></div>
			</div>
			<%      }%>
		</div>
		
		<%} else {%>
		<div style="width: 1200px; height: 2000px; margin-left: 333px;">
			<%  for(int i=10 ; i<=21 ; i++){
                %>
			<div style="float: right; width: 380px; height: 620px; margin-left:">
			<a href="<%=arr.get(i).getF_SITE()%>">	<img
					src="<%out.print(arr.get(i).getF_IMG()); %>"
					id="imgfood"></a>
				<div style="width: 300px; margin: auto;"><%out.print(arr.get(i).getF_NAME());  %></div>
				<div style="width: 100%; margin: auto;"><%out.print(arr.get(i).getF_PRICE());%></div>
			</div>
			<%     }}%>
			
		</div>
		
		

		<!-- <img src ="https://shop-phinf.pstatic.net/20211227_179/16405672092604Xbf3_PNG/41703043034370750_331789386.png?type=m510" id="imgfood"  style=""> <img id="imgfood"
				src="https://shop-phinf.pstatic.net/20190816_56/ymy3610_1565895228726Xcyrw_JPEG/3258617282284687_474009739.jpg?type=m510"> <img id="imgfood"
				src="https://shop-phinf.pstatic.net/20190816_208/ymy3610_1565893948450ro5hf_JPEG/3255491042927899_1148679319.jpg?type=m510"> <img id="imgfood"
				src="https://shop-phinf.pstatic.net/20200701_236/1593615442594HzO58_JPEG/30976181189313696_1668720815.jpg?type=m510">
				</section>
				<section id=features>
				 <img id="imgfood"
				src="https://shop-phinf.pstatic.net/20190425_62/jdog_1556162663833Jo0TX_JPEG/38793843487881718_1163767463.jpg?type=m510">
			<img id="imgfood" src="https://shop-phinf.pstatic.net/20211227_297/1640567258711SSGk2_PNG/41703092464969437_2001816975.png?type=m510" > <img id="imgfood"
				src="https://shop-phinf.pstatic.net/20190816_166/ymy3610_15658898547371n7ju_JPEG/3253243294775728_1306003153.jpg?type=m510"> <img id="imgfood"
				src="https://shop-phinf.pstatic.net/20211124_72/1637737440095jPQSV_JPEG/38873335829819376_918322601.jpg?type=m510"> -->


	</section>
	<section id=features>
		<img id="imgfood"
			src="https://shop-phinf.pstatic.net/20190425_62/jdog_1556162663833Jo0TX_JPEG/38793843487881718_1163767463.jpg?type=m510">
		<img id="imgfood"
			src="https://shop-phinf.pstatic.net/20211227_297/1640567258711SSGk2_PNG/41703092464969437_2001816975.png?type=m510">
		<img id="imgfood"
			src="https://shop-phinf.pstatic.net/20190816_166/ymy3610_15658898547371n7ju_JPEG/3253243294775728_1306003153.jpg?type=m510">
		<img id="imgfood"
			src="https://shop-phinf.pstatic.net/20211124_72/1637737440095jPQSV_JPEG/38873335829819376_918322601.jpg?type=m510">
	</section>


	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<script type="text/javascript">
		var selectBoxChange1 = function(value) {
			console.log("첫번째 선택한 기능 : " + value);
			$("#changeInput").val(value);
		}
		var selectBoxChange2 = function(value) {
			console.log("두번째 선택한 기능 : " + value);
			$("#changeInput").val(value);
		}
		var selectBoxChange3 = function(value) {
			console.log("세번째 선택한 기능 : " + value);
			$("#changeInput").val(value);
		}
	</script>
</body>
</html>