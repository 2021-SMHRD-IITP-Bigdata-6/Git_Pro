<%@page import="com.dogpro.memberDAO.ingDAO"%>
<%@page import="com.dogpro.memberDTO.ingDTO"%>
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
</head>
<body class="homepage is-preload">
	<div id="page-wrapper"></div>
	<!-- Header -->
	<section id="header">
		<div class="container">
			<%
				memberDAO dao = new memberDAO();
			ArrayList<foodDTO> arr = dao.selectFood();
			ArrayList<ingDTO> arr1 = dao.selectIng();
		
			%>
			<!-- Logo -->
			<h1 id="logo">
				<a href="Mainpage.jsp">DOGPRO+</a>
			</h1>
			<br>

			<!--  <p></p>-->

			<!-- Nav -->
			<nav id="nav">
				<ul>
					<li><a class="icon solid fa-home" href="Mainpage.jsp"><span>메인
								페이지</span></a></li>

					<%
						foodDTO f_dto = (foodDTO) session.getAttribute("fdto");
					memberDTO dto = (memberDTO) session.getAttribute("dto");
					if (dto == null) {
					%>
					<li><a class="icon solid fa-sign-in-alt" href="Login.jsp"><span>로그인</span></a></li>
					<%
						} else {
					%>
					<li><a class="icon solid fa-user-alt" href="Mypage_Firstjsp.jsp"><span>마이 페이지</span></a></li>
					<li><a class="icon solid fa-sign-out-alt" href="LogoutCon.do">로그아웃</a>
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
			<br><br><br><br><br><br>
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
				<br>
				<div style="width: 1200px; margin-left: 90px;">
					<h2>어서오세요
					<%
					out.print(cnt); 
				%>
					번째 방문자 입니다 ♥   </h2></div>
					<br><br>				               
					<div style="width: 1200px; margin-left: 90px;">
						<h2 align="left" style="color: #ed786a">기능별 사료 검색</h2></div>
	
		<div style="width: 1700px; margin-left: 90px;"> 
		<p style="margin-left: -1060px;">강아지에게 필요한 기능을 선택시 기능이 포함된 사료를 추천해 드립니다.</p></div>
	
		 <br><br>
				<%
					} else {
				%>
				<div style="width: 1200px; margin-left: 90px;"><h2><%
 	out.print(dto.getNickname());%>님 환영합니다
				</h2></div>
				
					<br><br>				               
					<div style="width: 1200px; margin-left: 90px;">
						<h2 align="left" style="color: #ed786a">기능별 사료 검색</h2></div>
		<div style="width: 1700px; margin-left: 90px;"> 
		<p style="margin-left: -1060px;">강아지에게 필요한 기능을 선택시 기능이 포함된 사료를 추천해 드립니다.</p></div>
	<br><br>

		<%
			}
		%>






		<!-- Feature -->



		
	</section>



	<!--  기능 여기 아래 숨겨둠 -->

	<section id="features">

		<select id="browsers" name="browsers" class="browsers"
			onchange="selectBoxChange1(this.value);">
			<option>기능</option>
			<option value="종합비타민">종합비타민</option>
			<option value="항산화">항산화</option>
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
				<option value="건식">건식</option>
			<option value="습식">습식</option>
		</select> <select id="browsers1" name="browsers1" class="browsers1"
			onchange="selectBoxChange1(this.value);">
			<option>기능</option>
			<option value="종합비타민">종합비타민</option>
			<option value="향산화">항산화</option>
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
				<option value="건식">건식</option>
			<option value="습식">습식</option>
		</select> <select id="browsers2" name="browsers2" class="browsers2"
			onchange="selectBoxChange1(this.value);">
			<option>기능</option>
			<option value="종합비타민">종합비타민</option>
			<option value="향산화">항산화</option>
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
	<option value="건식">건식</option>
			<option value="습식">습식</option>
		</select> <br> <br> <br>


	</section>
	<!-- 일반쇼핑 -->

	<section id="features">
<br>
		<div id=plz style="width: 1200px; height: 2000px; margin-left: 333px;">
			<%
				if (dto == null) {
			%>
			<%
				for (int i = 0; i < 9; i++) {
			%>
			<div style="float: right; width: 380px; height: 620px; margin-left:">
				<a href="food.jsp?img=<%=arr.get(i).getF_IMG()%>&seq=<%out.print(arr.get(i).getF_SEQ()); %>&name=<%=arr.get(i).getF_NAME()%>&price=<%=arr.get(i).getF_PRICE()%>&site=<%=arr.get(i).getF_SITE()%>">
				<img
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
		<%
			for (int i = 10; i <= 21; i++) {
		%>
		<div id=plz
			style="float: right; width: 380px; height: 620px; margin-left:">
			<a href="food.jsp?img=<%=arr.get(i).getF_IMG()%>&seq=<%out.print(arr.get(i).getF_SEQ()); %>&name=<%=arr.get(i).getF_NAME()%>&price=<%=arr.get(i).getF_PRICE()%>&site=<%=arr.get(i).getF_SITE()%>"><img
					src="<%out.print(arr.get(i).getF_IMG());%>" id="imgfood"></a>
			</a>
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
			console.log(" 선택한 기능 : " + value);
			$("#changeInput").val(value);

			$
					.ajax({
						url : "searchMuc.do",//디비에서 value 값에 맞는 데이터를 가져올 서블릿
						data : {
							input : value
						},
						dataType : "json",
						success : function(res) {
							console.log(res);
							console.log(res.length);
							for (let i = 0; i < res.length; i++) {
								var url = 'food.jsp?seq='+res[i].F_SEQ+'&img='+res[i].F_IMG+'&site='+res[i].F_SITE+'&price='+res[i].F_PRICE+'&name='+encodeURI(res[i].F_NAME)
								var encoded = encodeURI(url);
								$("#plz")
										.prepend(
												'<div style="float: right; width: 380px; height: 620px; ">'
												 
												+'<a href ="'+url+'">'
											+'	<img src="'+res[i].F_IMG+'"id="imgfood">'
														+ '</a>'
														+ '<div style="width: 300px; margin: auto;">'
														+ res[i].F_NAME
														+ '</div>'
														+ '<div style="width: 100%; margin: auto;">'
														+ res[i].F_PRICE
														+ '</div>' + '</div>'
														+ '</div>');

							}

						},
						error : function() {
							alert("실패");
						}
					});
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