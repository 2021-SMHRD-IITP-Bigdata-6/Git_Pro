<%@page import="java.text.SimpleDateFormat"%>
<%@page import="org.apache.catalina.tribes.util.Arrays"%>
<%@page import="com.dogpro.memberDTO.memberDTO"%>
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
<title>MyPage</title>
<meta charset="utf-8" />
<meta name="viewport"
	content="width=device-width, initial-scale=1, user-scalable=no" />
<link rel="stylesheet" href="assets/css/main.css" />
<style>
<!--
.imgimg>img {
	maring: 10px;
	width: 30%;
}

.mgmg {
	maring: 10px;
	width: 30%;
}
-->
</style>
</head>
<body class="left-sidebar is-preload">
	<div id="page-wrapper">

		<!-- Header -->
		<section id="header">
			<div class="container">

				<!-- Logo -->
				<h1 id="logo">
					<a href="index.html">MY PAGE</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<li><a class="icon solid fa-home" href="Mainpage.jsp"><span>메인페이지</span></a></li>

						<li><a class="icon solid fa-cog" href="left-sidebar.html"><span>두번째
									탭</span></a></li>
						<li><a class="icon solid fa-retweet"
							href="right-sidebar.html"><span>Right Sidebar</span></a></li>
						<li><a class="icon solid fa-sitemap" href="LogoutCon.do">로그아웃</a>
					</ul>
				</nav>

			</div>
		</section>

		<!-- Main -->
		<section id="main">
			<div class="container">
				<div class="row">

					<!-- Sidebar -->
					<div id="sidebar" class="col-4 col-12-medium">

						<!-- Highlights -->
						<section>
							<ul class="divided">
								<li>
									<!-- Highlight -->
									<article class="box highlight">
										<header>
											<h3>
												환영합니다 <br>
												<%
                                       memberDTO dto = (memberDTO) session.getAttribute("dto");
                                    %>
												<%
                                       out.print(dto.getNickname());
                                    %>
												님
											</h3>

										</header>
										<img src="images/pic06.jpg" width=58%>

										<!-- Excerpt -->
										<article class="box excerpt">
											<header>

												<br>
												<h3>
													<%dto.getId();%>
												</h3>
											</header>
											<p>
											
											        				 		
											 
											
												<%out.print(dto.getDogname());%>와(과) 함께한지 <br>
												<%out.print(dto.getDate()); %>일째
											</p>
										</article>

										<!--  <p>Phasellus </p>-->
										<ul class="actions">
											<li><a href="회원정보수정.jsp"
												class="button icon solid fa-file">회원 정보 수정</a></li>
										</ul>
									</article>

								</li>
							</ul>
						</section>

					</div>

					<!-- Content -->
					<div id="content" class="col-8 col-12-medium imp-medium">

						<!-- Post -->
						<article class="box post">
							<header>
								<h5>반려견 정보</h5>

								<h5>
									<%
                              out.print(dto.getNickname());
                           %>님의 반려견
									<%
                              out.print("   " + dto.getDogname());
                           %>는
									<%
                              out.print("   " + dto.getDogage());
                           %>살의
									<%
                              out.print("   " + dto.getDogweight());
                           %>kg의
									<%
                              String userDogKind = dto.getDogkind(); //사용자의 개의 종류
                              out.print("   " + userDogKind);
                           %>입니다.
								</h5>
								<p class="chart_info"></p>
								<br>
							</header>

							<!-- 차트 -->
							<div>


								<script type="text/javascript"
									src="https://www.gstatic.com/charts/loader.js"></script>
								<script src="./assets/js/jquery.min.js"></script>
								<script type="text/javascript">
                        let userDogKind = "<%=userDogKind%>"; //사용자의 강아지 종류를 가져옴!
                        $.ajax({
                           url:"GetDogInfo",
                           type : "get",
                           data:{
                              kind:userDogKind
                           },
                           success:function(){
                              //alert("성공");
                           },
                           error:function(){
                              //alert("실패");
                           }                  
                              
                        });
                        
                        
                        <% //시도 1
                           String[] dogData = (String[])request.getAttribute("dogData");
                         System.out.println(Arrays.toString(dogData));
                         %>
                        
                        console.log("test"+userDogKind);
                           google.charts.load("current", {
                              packages : [ 'corechart' ]
                           });
                           google.charts.setOnLoadCallback(drawChart);
                           function drawChart() {
                        
                              var data = google.visualization
                                    .arrayToDataTable([
                                          ["분류", "값",{role : "style"} ],
                                          [ "나이", <%=dto.getDogage()%>,"pink" ],
                                          [ "몸무게",<%=dto.getDogweight()%>,"#ed786a" ],
                                          [ "평균 몸무게", <%//dogData[0]%>,"silver" ],
                                          [ "최대 몸무게", <%//dogData[1];%>, "silver" ],
                                        ]);
                                        
                              
                              /* var data = google.visualization
                              .arrayToDataTable([
                                    [
                                          "Element","Density",{role : "style"} ],
                                    [ "Copper", 8.94,"#b87333" ],
                                    [ "Silver", 10.49,"silver" ],
                                    [ "Gold", 19.30, "gold" ],
                                    [ "Platinum", 21.45,
                                          "color: #e5e4e2" ] ]); */
                              
                              console.log(data);
                              var view = new google.visualization.DataView(
                                    data);
                              view.setColumns([ 0, 1, {
                                 calc : "stringify",
                                 sourceColumn : 1,
                                 type : "string",
                                 role : "annotation"
                              }, 2 ]);

                              var options = {
                                 title : "",
                                 width : 800,
                                 height : 500,
                                 bar : {
                                    groupWidth : "60%"
                                 },
                                 legend : {
                                    position : "none"
                                 },
                              };
                              var chart = new google.visualization.ColumnChart(
                                    document
                                          .getElementById("columnchart_values"));
                              chart.draw(view, options);
                           }
                        </script>
								<div id="columnchart_values"
									style="width: 900px; height: 300px;"></div>
							</div>
							<br> <br> <br> <br> <br>


							<header>
								<h5>추천 상품</h5>
								<br>

							</header>
							<p>나이에 따른 추천 사료</p>
							<div>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>

							</div>
							<br>
							<p>몸무게에 따른 추천 사료</p>
							<div>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>

							</div>
							<br>
						</article>

						<!-- Post -->
						<article class="box post">
							<header>
								<h5>최근 본 상품</h5>
								<br>
							</header>
							<div>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
								<img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>

							</div>

							<br>



						</article>

					</div>

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
	<!-- <script src="assets/js/main.js"></script> -->

</body>
</html>