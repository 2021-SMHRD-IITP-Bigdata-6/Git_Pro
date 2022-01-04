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

#join {
	width: 500px;
	margin: 0 auto;
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
			<div style="padding-bottom: 150px;" class="container" >

				<!-- Logo -->
				<h1 id="logo">
				<br><br>
					<a href="Login.jsp">로그인</a>
				</h1>

				<!-- Nav -->
				<nav id="nav">
					<ul>
						<h1 id="logo">
							<br><br><br>
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
								<h5 align="center">로그인</h5><br>
								<form id="join" action="LoginCon2.do" method="post">
									<input type="text" name="m_id" placeholder="ID"><br>
									<!--  <h5 align="center">비밀번호</h5><br>-->
									<input type="password" name="m_pw" placeholder="PW"><br>
									<div align="center">
									<input type="submit" value="Login" class="button fit" style="margin-right: 10px;" align="center">
									</div>
									<!-- <input type="submit" value="Sign Up" class="button fit"><br> -->
								</form>
							</ul>
						</section>
						<br><br>
						<div align="center">
						<hr style ="width:37%;margin-bottom: 10px;"><hr style =width:37%;>
						</div>
						<section>
							<br>
							<h5 align="center">회원가입</h5><br>
							<form id = "join"action="UploadService" method="post"
								enctype="multipart/form-data" id="fileUploadForm">
								<input type="text" name="m_id1" id="m_id2" placeholder="아이디"><br>
								<div align="center">
								<button type="button" id="check" onclick="idCheck()" align="center">중복체크</button>
								</div>
								<p id="result"></p>
								<br> <input type="password" name="m_pw1" placeholder="비밀번호"><br>
								<input type="text" name="m_tel" placeholder="닉네임"><br>
								<input type="text" name="m_nick"
									placeholder="전화번호 ex) 01012345678" class="phone-number-check"><br>
								<input type="text" name="m_dogname" placeholder="반려견 이름"><br>
								<input type="text" name="m_dog" placeholder="견종"><br>
								<input type="text" name="m_dogage" placeholder="반려견 나이(살) ex) 7"><br>
								<input type="text" name="m_dogweight"
									placeholder="반려견 무게(kg) ex) 5.5"><br> <input
									type="text" name="date" placeholder="입양날짜  ex) 20/01/01"><br>
									<input type="text"  placeholder="강아진 사진">
								<tr>
									<td><div id="image_container">
											<img src="/" style="width: 10%; display: none" id="user_img">
										</div></td>
									<td><input id="btnSubmit" type="submit" value="업로드"
										style="display: none" /></td>
									<br>
									<td><input type="file" id="image" accept="image/*"
										onchange="setThumbnail(event);" name="filename1" /></td>
									<br>
								</tr>
								<br> 
								<div align="center">
								<input type="submit" value="Sign up"
									class="button fit" style="margin-right: 10px;">
	</div>
							</form>

						</section>
					</article>

					<script src="assets/js/jquery.min.js"></script>
					<script src="assets/js/jquery.dropotron.min.js"></script>
					<script src="assets/js/browser.min.js"></script>
					<script src="assets/js/breakpoints.min.js"></script>
					<script src="assets/js/util.js"></script>
					<script src="assets/js/main.js"></script>

					<script type="text/javascript">
			var src = null;

			function setThumbnail(event) {

				var reader = new FileReader();
				reader.onload = function(event) {
					var img = document.getElementById("user_img");
					img.setAttribute("src", event.target.result);
					document.getElementById("user_img").style = "width: 100%; display:block;"
					src = jQuery('#user_img').attr("src");
					console.log('src 출력:');
					console.log(src);

				};
				reader.readAsDataURL(event.target.files[0]);
			}
		</script>
					<script type="text/javascript">
		function idCheck() {

			$.ajax({
				url : 'check.do',
				type : 'get',
				data : {
					"m_id1" : $('#m_id2').val()
				},
				success : function(res) {
					console.log(res);
					//rs.next() ==> true : 중복이 있다.
					//fales : 중복이 없다

					//기본적으로 out객체로 응답받은 데이터는 text/html
					//boolean false =====> String "false"
					if (res == 'true') {
						$('#result').html("중복된 아이디입니다.").css('color', 'red');
					} else {
						$('#result').html("사용가능한 아이디입니다.")
								.css('color', 'green');
					}
				},
				error : function() {
					alert('요청했어요? 아닐텐데....');
					//404,405,500:요청자체가 실패
				}
			});

		}
	</script>
					<script type="text/javascript">
	$(function(){

	    $(".phone-number-check").on('keydown', function(e){
	       // 숫자만 입력받기
	        var trans_num = $(this).val().replace(/-/gi,'');
		var k = e.keyCode;
					
		if(trans_num.length >= 11 && ((k >= 48 && k <=126) || (k >= 12592 && k <= 12687 || k==32 || k==229 || (k>=45032 && k<=55203)) ))
		{
	  	    e.preventDefault();
		}
	    }).on('blur', function(){ // 포커스를 잃었을때 실행합니다.
	        if($(this).val() == '') return;

	        // 기존 번호에서 - 를 삭제합니다.
	        var trans_num = $(this).val().replace(/-/gi,'');
	      
	        // 입력값이 있을때만 실행합니다.
	        if(trans_num != null && trans_num != '')
	        {
	            // 총 핸드폰 자리수는 11글자이거나, 10자여야 합니다.
	            if(trans_num.length==11 || trans_num.length==10) 
	            {   
	                // 유효성 체크
	                var regExp_ctn = /^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})([0-9]{3,4})([0-9]{4})$/;
	                if(regExp_ctn.test(trans_num))
	                {
	                    // 유효성 체크에 성공하면 하이픈을 넣고 값을 바꿔줍니다.
	                    trans_num = trans_num.replace(/^(01[016789]{1}|02|0[3-9]{1}[0-9]{1})-?([0-9]{3,4})-?([0-9]{4})$/, "$1-$2-$3");                  
	                    $(this).val(trans_num);
	                }
	                else
	                {
	                    alert("유효하지 않은 전화번호 입니다.");
	                    $(this).val("");
	                    $(this).focus();
	                }
	            }
	            else 
	            {
	                alert("유효하지 않은 전화번호 입니다.");
	                $(this).val("");
	                $(this).focus();
	            }
	      }
	  });  
	});
	</script>
</body>
</html>