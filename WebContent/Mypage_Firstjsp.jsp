<%@page import="com.dogpro.memberDAO.imgfileDAO"%>
<%@page import="com.dogpro.memberDTO.imgfileDTO"%>
<%@page import="java.util.Date"%>
<%@page import="java.util.Calendar"%>
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
                                 <h5>
                                    환영합니다 <br><br>
                                    
                                    <%//여기에 넣어주는 곳에서 img값도 넣어서 가져와야한다 / 현재 memberDTO에 img를 넣을 곳이 없음 (추가해줘야함)
                                   
                                       memberDTO dto = (memberDTO) session.getAttribute("dto");
                                    %>
                                    <%
                                       out.print(dto.getNickname());
                                    %>님
                                 </h5><br>

                              </header>
                              
                              
                                    <%
                                    ServletContext context = getServletContext(); 
                            		String saveDir = context.getRealPath("Upload");
                                    System.out.println(saveDir+"BGM10.PNG");
                                    
                                    %>
                                    <!-- 그러면 자동적으로 값을 가져올꺼같음 -->
                                    <img src="Upload/<%=dto.getFilename1()%>" width=58% />
                             
                             

                              <!-- Excerpt -->
                              <article class="box excerpt">
                                 <header>

                                    <br>
                                    <h3>
                                       <%
                                         dto.getId();
                                       %>
                                    </h3>
                                 </header>

                                 <%
                                    out.print(dto.getDogname());
                                 %>와(과) 함께한지<br>
                                 
                                 <%
                                    Calendar getToday = Calendar.getInstance();
                                 getToday.setTime(new Date()); //금일 날짜

                                 String s_date = dto.getDate();
                                 Date date = new SimpleDateFormat("yy/MM/dd").parse(s_date);
                                 Calendar cmpDate = Calendar.getInstance();
                                 cmpDate.setTime(date); //특정 일자

                                 long diffSec = (getToday.getTimeInMillis() - cmpDate.getTimeInMillis()) / 1000;
                                 long diffDays = diffSec / (24 * 60 * 60); //일자수 차이

                                 out.println(diffDays);
                                 %> 일째

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
                        <h5>반려견 정보</h5><br>

                        <h5>
                        
                           <%
                              out.print(dto.getNickname());
                           %>님의 반려견
                           <%
                              out.print("   " + dto.getDogname());
                           %>는
                           <%
                              out.print("   " + dto.getDogage());
                           String age = dto.getDogage();
                           %>살의
                           <%
                              out.print("   " + dto.getDogweight());
                           String weight = dto.getDogweight();
                           %>kg의
                           <%
                              String userDogKind = dto.getDogkind(); //사용자의 개의 종류
                           out.print("   " + userDogKind);
                           %>입니다.
                        </h5>
                        <p class="chart_info"></p>

                     </header>

                     <!-- 차트 -->
                     <div>

                        <script type="text/javascript"
                           src="https://www.gstatic.com/charts/loader.js"></script>
                        <script src="./assets/js/jquery.min.js"></script>
                        <script type="text/javascript">
                        let userDogData = []; //
                        let dogAge = "<%=age%>";
                        let dogWeight = "<%=weight%>";
                        let userDogKind = "<%=userDogKind%>"; //사용자의 강아지 종류를 가져옴!
                           $.ajax({
                                    url : "GetDogInfo",
                                    type : "get",
                                    dataType : "json",
                                    data : {
                                       kind : userDogKind
                                    },
                                    success : function(dogData) {
                                       //alert("성공");

                                       userDogData.push(dogData.avg);
                                       userDogData.push(dogData.Max);
                                       console.log(userDogData);

                                       console.log("test"+ userDogKind);
                                       google.charts.load(
                                             "current",
                                                   {packages : [ 'corechart' ]});

                                       google.charts.setOnLoadCallback(drawChart);

                                       function drawChart() {
                                          console.log("testDog222"+ userDogData[0]);
                                          var data = google.visualization.arrayToDataTable([
                                                      [
                                                            "분류",
                                                            "값",
                                                            {
                                                               role : "style"
                                                            } ],
                                                      [
                                                            "나이",
                                                            Number(dogAge),
                                                            "pink" ],
                                                      [
                                                            "몸무게",
                                                            Number(dogWeight),
                                                            "#ed786a" ],
                                                      [
                                                            "평균 몸무게",
                                                            Number(userDogData[0]),
                                                            "silver" ], // ??위에 dogData에 있는 값을 적으면 되는데 안됩니다
                                                      [
                                                            "최대 몸무게",
                                                            Number(userDogData[1]),
                                                            "silver" ], // 
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
                                          var view = new google.visualization.DataView(data);
                                          view.setColumns([
                                                      0,
                                                      1,
                                                      {
                                                         calc : "stringify",
                                                         sourceColumn : 1,
                                                         type : "string",
                                                         role : "annotation"
                                                      }, 2 ]);

                                          var options = {
                                             title : "",
                                             width : 750,
                                             height : 500,
                                             bar : {
                                                groupWidth : "60%"
                                             },
                                             legend : {
                                                position : "none"
                                             },
                                          };
                                          var chart = new google.visualization.ColumnChart(
                                                document.getElementById("columnchart_values"));
                                          chart.draw(view,options);
                                       }

                                    },
                                    error : function() {
                                       alert("실패");
                                    }

                                 });
                        <%-- 
                        <% //시도 1
                           String[] dogData = (String[])request.getAttribute("dogData"); // 어디서 받아와요? 이 값
                         // System.out.println(Arrays.toString(dogData)); // 여기까지 됐었어요
                         for(int i=0; i<dogData.length; i++){
                            System.out.println(dogData[i]);
                         }
                         %> --%>
                           
                        </script>
                        <div id="columnchart_values"
                           style="width: 750px; height: 300px;"></div>
                     </div>
                     <br> <br> <br> <br> <br> <br> <br>



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
                     <br><br>
                     <p>몸무게에 따른 추천 사료</p>
                     <div>
                        <img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
                        <img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
                        <img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>

                     </div>
                     
                  </article>

                  <!-- Post -->
                  <article class="box post">
                     <!--  <header>
                        <h5>최근 본 상품</h5>
                        <br>
                     </header>
                     <div>
                        <img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
                        <img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>
                        <img style="margin: 10px;" src="images/터키앤치킨독.jpg" width=30%;>

                     </div>

                     <br>-->



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