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
<title>사료 영양소 그래프</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style type="text/css">
</style>
</head>
<body class="homepage is-preload">
	<div id="page-wrapper"></div>
	<!-- Header -->
	<section id="header">
		<div class="container">
			<%
				memberDAO dao = new memberDAO();
			foodDAO dao2 = new foodDAO();
			ingDAO dao3 = new ingDAO();
			ArrayList<foodDTO> arr = dao.selectFood();
			ArrayList<ingDTO> arr1 = dao.selectIng();
			String img = request.getParameter("img");
			String name = request.getParameter("name");
			String price = request.getParameter("price");
			String site = request.getParameter("site");
			String seq = request.getParameter("seq");
			ingDTO dto = dao3.selectIng(Integer.parseInt(seq));

			System.out.print(dto.getPH());
			%>
			<script type="text/javascript"
				src="https://www.gstatic.com/charts/loader.js"></script>
			<script type="text/javascript">
	google.charts.load("current", {
		packages : [ "corechart" ]
	});
	google.charts.setOnLoadCallback(drawChart);
	function drawChart() {
		var data = google.visualization.arrayToDataTable([
				[ 'Task', 'Hours per Day' ],
				 [ '인(PH)',<%=dto.getPH()%>],
				[ 'DHA',<%=dto.getDHA()%>],
				[ 'EPA',
<%=dto.getEPA()%>
	],
				[ '수분(HYD)',
<%=dto.getHYD()%>
	],
				[ '오메가3(O3)',
					<%=dto.getO3()%>
	],
				[ '오메가6(O6)',
					<%=dto.getO6()%>
	],
				[ '조단백(PRO)',
					<%=dto.getPROT()%>
	],
				[ '조섬유(FIB)',
					<%=dto.getFIB()%>
	],
				[ '조지방(FAT)',
					<%=dto.getFAT()%>
	],
				[ '조회분(ASH)',
					<%=dto.getASH()%>
	],
				[ '칼슘(CAL)',
					<%=dto.getCAL()%>
	],
				[ '탄수화물(CAR)',
					<%=dto.getCAR()%>
	] ]);

		var options = {
			title : '사료 영양소 그래프',
			pieHole : 0.4,
		};

		var chart = new google.visualization.PieChart(document
				.getElementById('donutchart'));
		chart.draw(data, options);
	}
</script>
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


				</ul>
			</nav>

		</div>
	</section>





	<section id="features">

		<body>
			<div style="width: 1200px; margin-left: 333px;">
				<div>
					<h2 style="margin-left: 60px; padding-top: 50px;"><%=name%></h2>
					<br>
					<h5 align="right" style="margin-bottom: 5px; margin-right: 20px;"><%=price%>원
					</h5>

				</div>
				<div
					style="width: 380px; height: 620px; position: absolute; left: 400px; top: 100px">
					<a href="<%out.print(site);%>"><img src="<%out.print(img);%>"
						id="imgfood" style="width: 90%; height: 90%"></a>
				</div>
				<div id="donutchart"
					style="width: 1000px; height: 500px; position: relative; left: 500px; top: 10px;">
				</div>
				<button onclick="location.href='<%out.print(site);%>';"
					style="margin-left: 550px; margin-bottom: 80px;">구매하기</button>
			</div>

		</body>

	</section>



	<!-- Scripts -->
	<script src="assets/js/jquery.min.js"></script>
	<script src="assets/js/jquery.dropotron.min.js"></script>
	<script src="assets/js/browser.min.js"></script>
	<script src="assets/js/breakpoints.min.js"></script>
	<script src="assets/js/util.js"></script>
	<script src="assets/js/main.js"></script>

	<script type="text/javascript">
	
</body>
</html>