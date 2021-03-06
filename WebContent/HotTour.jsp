<%@page import="com.DAO.realVO"%>
<%@page import="java.net.URLEncoder"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.resultMapVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
/* css [line] */
.dot {
	overflow: hidden;
	float: left;
	width: 12px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');
}

.dotOverlay {
	position: relative;
	bottom: 10px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
	font-size: 12px;
	padding: 5px;
	background: #fff;
}

.dotOverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.number {
	font-weight: bold;
	color: #ee6152;
}

.dotOverlay:after {
	content: '';
	position: absolute;
	margin-left: -6px;
	left: 50%;
	bottom: -8px;
	width: 11px;
	height: 8px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')
}

.distanceInfo {
	position: relative;
	top: 5px;
	left: 5px;
	list-style: none;
	margin: 0;
}

.distanceInfo .label {
	display: inline-block;
	width: 50px;
}

.distanceInfo:after {
	content: none;
}

/* css [customoverlay] */
.customoverlay {
	position: relative;
	bottom: 85px;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	float: left;
}

.customoverlay:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.customoverlay a {
	display: block;
	text-decoration: none;
	color: #000;
	text-align: center;
	border-radius: 6px;
	font-size: 14px;
	font-weight: bold;
	overflow: hidden;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.customoverlay .title {
	display: block;
	text-align: center;
	background: #fff;
	margin-right: 35px;
	padding: 10px 15px;
	font-size: 14px;
	font-weight: bold;
}

.customoverlay:after {
	content: '';
	position: absolute;
	margin-left: -12px;
	left: 50%;
	bottom: -12px;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

/* css [category map] */
.map_wrap, .map_wrap * {
	margin: 0px;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 100%;
	top: 50px;
	height: 500px;
}

#category {
	position: absolute;
	top: 0px;
	left: 1px;
	border-radius: 5px;
	border: 1px solid #909090;
	box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);
	background: #fff;
	overflow: hidden;
	z-index: 2;
}

#category li {
	float: left;
	list-style: none;
	width: 50px; px;
	border-right: 1px solid #acacac;
	padding: 6px 0;
	text-align: center;
	cursor: pointer;
}

#category li.on {
	background: #eee;
}

#category li:hover {
	background: #ffe6e6;
	border-left: 1px solid #acacac;
	margin-left: -1px;
}

#category li:last-child {
	margin-right: 0;
	border-right: 0;
}

#category li span {
	display: block;
	margin: 0 auto 3px;
	width: 27px;
	height: 28px;
}

#category li .category_bg {
	background:
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png)
		no-repeat;
}

#category li .bank {
	background-position: -10px 0;
}

#category li .mart {
	background-position: -10px -36px;
}

#category li .pharmacy {
	background-position: -10px -72px;
}

#category li .oil {
	background-position: -10px -108px;
}

#category li .cafe {
	background-position: -10px -144px;
}

#category li .store {
	background-position: -10px -180px;
}

#category li.on .category_bg {
	background-position-x: -46px;
}

.placeinfo_wrap {
	position: absolute;
	bottom: 28px;
	left: -150px;
	width: 300px;
}

.placeinfo {
	position: relative;
	width: 100%;
	border-radius: 6px;
	border: 1px solid #ccc;
	border-bottom: 2px solid #ddd;
	padding-bottom: 10px;
	background: #fff;
}

.placeinfo:nth-of-type(n) {
	border: 0;
	box-shadow: 0px 1px 2px #888;
}

.placeinfo_wrap .after {
	content: '';
	position: relative;
	margin-left: -12px;
	left: 50%;
	width: 22px;
	height: 12px;
	background:
		url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
}

.placeinfo a, .placeinfo a:hover, .placeinfo a:active {
	color: #fff;
	text-decoration: none;
}

.placeinfo a, .placeinfo span {
	display: block;
	text-overflow: ellipsis;
	overflow: hidden;
	white-space: nowrap;
}

.placeinfo span {
	margin: 5px 5px 0 5px;
	cursor: default;
	font-size: 13px;
}

.placeinfo .title {
	font-weight: bold;
	font-size: 14px;
	border-radius: 6px 6px 0 0;
	margin: -1px -1px 0 -1px;
	padding: 10px;
	color: #fff;
	background: #d95050;
	background: #d95050
		url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png)
		no-repeat right 14px center;
}

.placeinfo .tel {
	color: #0f7833;
}

.placeinfo .jibun {
	color: #999;
	font-size: 11px;
	margin-top: 0;
}
#songha{
background-color: #FBFBFB;
color:#C73430;
border-top-left-radius: 10%;
}
#soul{
color: #002141;
}
</style>
<title>Hot Tour</title>
<meta charset="euc-kr">
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css">
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.js"></script>
<script src="js/script.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script>
	$(document).ready(function() {
		$().UItoTop({
			easingType : 'easeOutQuart'
		});
	});
</script>
<!--[if lt IE 8]>
      <div style=' clear: both; text-align:center; position: relative;'>
         <a href="http://windows.microsoft.com/en-US/internet-explorer/products/ie/home?ocid=ie6_countdown_bannercode">
            <img src="http://storage.ie6countdown.com/assets/100/images/banners/warning_bar_0000_us.jpg" border="0" height="42" width="820" alt="You are using an outdated browser. For a faster, safer browsing experience, upgrade for free today." />
         </a>
      </div>
      <![endif]-->
<!--[if lt IE 9]>
      <script src="js/html5shiv.js"></script>
      <link rel="stylesheet" media="screen" href="css/ie.css">
      <![endif]-->
      <style type="text/css">
      .content {
	background-color: #FBFBFB;
	background-image: url('images/large.jpg');
	background-repeat: repeat;
	padding-bottom: 120px;
}
div.grid_4.prefix_1 > ul > li:hover{
color:#C73430;
}
      </style>
</head>
<body>

	<%
		String nick = null;
		if (session.getAttribute("nick") != null) {
			nick = (String) session.getAttribute("nick");
		}
	%>
	<!-- ==========================설문조사 팝업  입니다.============================ -->
	<!-- 1차 여행 설문 form -->
	<a href="#x" class="overlay2" id="trip_form1"></a>
	<div class="popup2">

		<div class="container_12">
			<span>SELECT YOUR TRAVEL TYPE</span><br>
			<p style="font-size: 1.4em;">당신이 마음에 드는 사진을 선택하세요!</p>
			<div class="clear"></div>
			<ul align="center">

				<li><div class="grid_4" id="no1">
						<img style="width: 300px; height: 200px;" class="tripImg"
							id="first1" src="images/Activity/A.jpg" onclick="moveFrom(1)">
					</div></li>
				<li><div class="grid_4" id="no2">
						<img style="width: 300px; height: 200px;" class="tripImg"
							id="first2" src="images/Learning/L.jpg" onclick="moveFrom(2)">
					</div></li>
				<div class="clear"></div>
				<li><div class="grid_4" id="no3">
						<img style="width: 300px; height: 200px;" class="tripImg"
							id="first3" src="images/Relaxation/R.jpg" onclick="moveFrom(3)">
					</div></li>
				<li><div class="grid_4" id="no4">
						<img style="width: 300px; height: 200px;" class="tripImg"
							id="first4" src="images/View/V.jpg" onclick="moveFrom(4)">
					</div></li>
				<div class="clear"></div>

			</ul>
			<div class="grid_8" align="center"></div>
		</div>
		<a class="close2" href="#close2"></a> <a class="close2" href="#close2"></a>
	</div>
	<!--=====================================설문조사 도달 자바스크립트JAVA SCRIPT===========================================-->
	<!-- 2차 설문 조사로 이동-->
	<script type="text/javascript">
		document.getElementById("no1").addEventListener("mouseover",
				function(e) {
					no1.style.border = "3px solid #C73430";
				});
		document.getElementById("no1").addEventListener("mouseout",
				function(e) {
					no1.style.border = "none";
				});
		document.getElementById("no2").addEventListener("mouseover",
				function(e) {
					no2.style.border = "3px solid #C73430";
				});
		document.getElementById("no2").addEventListener("mouseout",
				function(e) {
					no2.style.border = "none";
				});
		document.getElementById("no3").addEventListener("mouseover",
				function(e) {
					no3.style.border = "3px solid #C73430";
				});
		document.getElementById("no3").addEventListener("mouseout",
				function(e) {
					no3.style.border = "none";
				});
		document.getElementById("no4").addEventListener("mouseover",
				function(e) {
					no4.style.border = "3px solid #C73430";
				});
		document.getElementById("no4").addEventListener("mouseout",
				function(e) {
					no4.style.border = "none";
				});

		var aa = 1;
		var type1 = null;
		var type2 = null;
		function moveFrom(result1) {
			if (aa == 1) {
				aa += 1;
				if (result1 == 1) {
					var first1 = document.getElementById("first1"); /*형선 : Activity*/
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first1").src;
					
					first1.src = "images/Activity/amu/A_amu_1.jpg"; /*형선 : Activity_amu_1*/
					first2.src = "images/Activity/amu/A_amu_2.jpg"; /*형선 : Activity_amu_2*/
					first3.src = "images/Activity/spo/A_spo_1.jpg"; /*형선 : Activity_spo_1*/
					first4.src = "images/Activity/spo/A_spo_2.jpg"; /*형선 : Activity_spo_2*/

				} else if (result1 == 2) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2"); /* 형선 : Learning */
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first2").src;
					
					first1.src = "images/Learning/art/L_art_1.jpg"; /* 형선 : Learning_art_1 */
					first2.src = "images/Learning/art/L_art_2.jpg"; /* 형선 : Learning_art_2 */
					first3.src = "images/Learning/mus/L_mus_1.jpg"; /* 형선 : Learning_mus_1 */
					first4.src = "images/Learning/mus/L_mus_2.jpg"; /* 형선 : Learning_mus_1 */

				} else if (result1 == 3) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3"); /* 형선 : Relaxation */
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first3").src;
					
					first1.src = "images/Relaxation/res/R_res_1.jpg"; /* 형선 : Relaxation_res_1 */
					first2.src = "images/Relaxation/res/R_res_2.jpg"; /* 형선 : Relaxation_res_2 */
					first3.src = "images/Relaxation/res/R_res_3.jpg"; /* 형선 : Relaxation_res_3 */
					first4.src = "images/Relaxation/res/R_res_4.jpg"; /* 형선 : Relaxation_res_4 */

				} else if (result1 == 4) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4"); /* 형선 : View */
					type1 = document.getElementById("first4").src;
					 /*형선 : 이미지 값 넘어 가는 부분*/
					first1.src = "images/View/his/V_his_1.jpg"; /* 형선 : View_his_1 */
					first2.src = "images/View/his/V_his_2.JPG"; /* 형선 : View_his_2 */
					first3.src = "images/View/nat/V_nat_1.jpg"; /* 형선 : View_nat_1 */
					first4.src = "images/View/nat/V_nat_2.JPG"; /* 형선 : View_nat_2 */

				}
			} else if (aa == 2) {
				if (result1 == 1) {
					type2 = document.getElementById("first1").src;
			
					location.href = "TypeUpdateCon?type1=" + type1 + "&type2="
							+ type2; /*형선 : TypeUpdateCon으로 이동*/
				} else if (result1 == 2) {
					type2 = document.getElementById("first2").src;
				
					location.href = "TypeUpdateCon?type1=" + type1 + "&type2="
							+ type2;
				} else if (result1 == 3) {
					type2 = document.getElementById("first3").src;

					location.href = "TypeUpdateCon?type1=" + type1 + "&type2="
							+ type2;
				} else if (result1 == 4) {
					type2 = document.getElementById("first4").src;
			
					location.href = "TypeUpdateCon?type1=" + type1 + "&type2="
							+ type2;
				}

			}
		}

		function makeLine(result) {
			if (result == 1) {
				first1.style.border = "2px solid red";
			}
		}
	</script>

	<!-- ==========================^설문조사 팝업 만들기============================ -->
<!--==========================로그인/회원가입 모달 창입니다.==============================-->

	<!-- login form -->
	<a href="#x" class="overlay" id="login_form2"></a>
	<div class="popup">
		<span>Warning!</span>
		<p>로그인 후 이용가능한 서비스 입니다.</p>
		<form action="LoginCon" method="post">
			<table>
				<tr>
					<td>Login ID</td>
					<td><input type="text" name="id" required /></td>
					<td rowspan="2" align="center"><input type="submit"
						value="Log In" class="submit" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pw" required /></td>
			</table>
		</form>
		<p>
			If you don't have account >><a href="#join_form" id="join_pop">Join</a>
		</p>
		<a class="close" href="#close"></a>
	</div>
	<div class="popup">
		<span>Welcome Guest!</span>
		<p>Please enter your login and password here</p>
		<form action="LoginCon" method="post">
			<table>
				<tr>
					<td>Login ID</td>
					<td><input type="text" name="id" required /></td>
					<td rowspan="2" align="center"><input type="submit"
						value="Log In" class="submit" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pw" required /></td>
			</table>
		</form>
		<a class="close" href="#close"></a>
	</div>
	<!-- /login form -->

	<!-- login form -->
	<a href="#x" class="overlay" id="login_form"></a>
	<div class="popup">
		<span>Welcome Guest!</span>
		<p>아이디와 비밀번호를 입력하세요.</p>
		<form action="LoginCon" method="post">
			<table>
				<tr>
					<td>Login ID</td>
					<td><input type="text" name="id" required /></td>
					<td rowspan="2" align="center"><input type="submit"
						value="Log In" class="submit" /></td>
				</tr>
				<tr>
					<td>Password</td>
					<td><input type="password" name="pw" required /></td>
			</table>
		</form>
		<p>
			If you don't have account >><a href="#join_form" id="join_pop">Join</a>
		</p>
		<a class="close" href="#close"></a>
	</div>
	<!-- /login form -->



	<!-- join form -->
	<a href="#x" class="overlay" id="join_form"></a>
	<div class="popup">
		<span>Join Us</span>
		<p>아래의 항목을 채워주세요.</p>
		<form action="JoinCon" method="post">
			<table>
				<tr>
					<td>아이디</td>
					<td><input type="text" id="id" name="id" required
						maxlength="10" size="10" onkeydown="nonHangulSpecialKey()">
						<button onclick="idCheck()">중복확인</button></td>
				</tr>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" required maxlength="10"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nick" required maxlength="10"></td>
				</tr>
				<tr>
					<td>성별</td>
					<td>남자<input type="radio" name="gender" value="0" required>여자<input
						type="radio" name="gender" value="1" required></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" required
						onfocus="OnCheckPhone(this)" onKeyup="OnCheckPhone(this)" size=14></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="date" name="birth" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Join Us"
						class="submit" /></td>
				</tr>
			</table>
		</form>
		<p>
			If you have account >><a href="#login_form" id="login_pop">Log In</a>
		</p>
		<a class="close" href="#close"></a>
	</div>

	<script>
		function idCheck() {
			var id = document.getElementById("id");
			$.ajax({
				url : "SearchId",
				data : "id=" + id.value,
				success : function(result) {
					alert(result);
				}
			})

		}
	</script>

	<!-- /join form -->

	<!-- update form -->
	<a href="#x" class="overlay" id="update_form"></a>
	<div class="popup">
		<span>Update your Information!</span>
		<p>수정할 개인정보를 입력하세요</p>
		<form action="UpdateCon" method="post">
			<table>
				<tr>
					<td>비밀번호</td>
					<td><input type="password" name="pw" required maxlength="10"></td>
				</tr>
				<tr>
					<td>닉네임</td>
					<td><input type="text" name="nick" required maxlength="10"></td>
				</tr>
				<tr>
					<td>전화번호</td>
					<td><input type="text" name="phone" required
						onfocus="OnCheckPhone(this)" onKeyup="OnCheckPhone(this)" size=14></td>
				</tr>
				<tr>
					<td>생일</td>
					<td><input type="date" name="birth" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="개인정보 수정"
						class="submit" /></td>
				</tr>
			</table>
		</form>
		<a class="close" href="#close"></a>
	</div>
	<!-- /update form -->

<!--==========================로그인/회원가입 모달 창입니다.끗==============================-->

	<div class="allFor">
		<!-- ======SIDE MENU===== -->
		<div class="grid_13">
			<img src="images/logo/tripickerLogo9.png">
			<c:choose>
				<c:when test="${empty vo1.id}">
					<ul>
						<li><a href="#login_form" id="login_pop">로그인</a></li>
						<li><a href="#join_form" id="join_pop">회원가입</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li><h1 style="color: white;">${vo1.nick}님</h1></li>
						<li><a href="Logout.jsp" id="login_pop">로그아웃</a></li>
						<li><a href="#update_form" id="join_pop">개인정보수정</a></li>
						<li><a href="#trip_form1" id="trip_pop" onclick="move()">여행지추천 받기</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>
		<script type="text/javascript">
function move() {
document.getElementById("move").scrollIntoView(true);
		}
</script>
		<!-- ======^SIDE MENU===== -->
		<!--==============================header 상단의 메뉴 창입니다.=================================-->
		<header>
			<div class="container_12">
				<div class="grid_12">
					<div class="menu_block">
						<nav class="horizontal-nav full-width horizontalNav-notprocessed">
							<ul class="sf-menu">
								<li><a href="Main.jsp">HOME</a></li>
								<c:choose>
									<c:when test="${empty vo1.id}">
										<li class="current"><a href="#" onclick="warning()">HOT
												TOURS</a></li>
									</c:when>
									<c:otherwise>
										<li><a href="#trip_form1" onclick="move()">HOT TOURS</a></li>
									</c:otherwise>
								</c:choose>
								<li><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
								<li><a href="SelectService?start=0&end=8">POST</a></li>
								<li><a href="Map.jsp">MAP DIY</a></li>
							</ul>
						</nav>
						<div class="clear"></div>
					</div>
				</div>
				<div class="grid_12">
					<h1>
						<a href="HotTour.jsp"> <img
							src="images/logo/tripickerLogo9.png" alt="Your Happy Family">
						</a>
					</h1>
				</div>
			</div>
		</header>

		<script type="text/javascript">
			function warning() {
				alert("로그인하세요!")
				location.href = "Main.jsp#login_form";
			}
		</script>
		<!--==============================header 상단의 메뉴 창입니다. 끗=================================-->
		
		<!--==============================Content 본문내용=================================-->
		<%
			ArrayList<realVO> resultMap = (ArrayList<realVO>)request.getAttribute("alist");
			
			/* 0순위로 출력된 여행지정보를 변수에담아 el식으로 출력 */
			String testname = resultMap.get(0).getPname();			/* 이름불러오는법 */
			String testcontent = resultMap.get(0).getPcontent();	/* 설명불러오는법 */
			String testimg = resultMap.get(0).getPimg();		/* img값불러오는법 */
			
			
			request.setAttribute("testna", testname);
			request.setAttribute("testcon", testcontent);
			request.setAttribute("testim", testimg);
		%>
								
		<div class="content">
			<div class="ic"></div>
			<div class="container_12">
				<!--================ blogPost ================-->
				<div class="grid_8">
					<h3>Recommend Tour Info</h3>
					<span style="font-size:1.3em;">추천 받은 여행지 기본 정보입니다.</span>
					<p></p>
					<!-- 경도 : 여행지 사진, 설명 이 출력되는 부분-->
				
						
					<div class="blog">
						<!-- 경도 :기본 틀입니다. 카테고리클릭시 여기 div에 id 값을 주어 불러 들이면 됩니다.-->
						<%-- <c:choose>
							<c:when test="${empty vo.num}">
							</c:when>
							<c:otherwise>
								<time datetime="2014-10-01">
									<!-- 경도 : 날짜가 출력도니느 부분이지만 여행지 순서출력하면 좋을 합니다.  -->${vo.num}<span>번째</span>
								</time>
							</c:otherwise>
						</c:choose> --%>
						<div class="extra_wrapper">
							<div class="text1 col1">
								<div id="mytitle">${testna }</div>
								<!-- 경도 : 여행지 제목 출력하기 -->
							</div>
							<!-- 경도 : 원한다면 여기에 여행지 타입 출력 -->
							${vo.type }
							<!-- 경도 : 원한다면 여기에 여행지 타입 출력 end -->
						</div>
						<div class="clear"></div>
						<!-- 그대로 두면되는 클래스 입니다. -->
						<img src="${testim}" alt="" id="myimg" style="max-width:500px; max-height:460px;">
						<!-- 경도: 여행지 사진 출력 -->
						<p></p>
						<p id="mycon" style="font-size:1.3em; padding:7px; margin:3px;">
							<!-- 경도: 여행설명 출력-->
							${testcon }
						</p>
						<br>


						<!-- <a href="#" class="link1">LEARN
						MORE</a>  -->
						<!-- 필요없는 버튼입니다 -->
					</div>
				</div>

				<!-- 경도 : 여행지 사진, 설명 이 출력되는 부분 end-->

				<!--================= ^blogPost ==================-->
				<!--================================= Category 사용자 맞춤 루트가 출력되는 부분입니다.=================================-->

				<div class="grid_4 prefix_1">
					<h3 class="head1">YOUR ROUT</h3>
					<span style="font-size:1.4em; color:#C73430;">여행지를 클릭하세요!</span><p></p>
					<!-- 경도 : 여행지 목록 출력 부분-->
					<ul class="list">
						<!--foransdms li 태그 안에서 돌리면 됩니다.-->
						
							<% 
								/*  
								vo형식
								1.여행지이름
								2.평점
								3.위도
								4.경도
								
								*/
								for(int i=0;i<resultMap.size();i++){
									String name = String.valueOf(i+1)+". " + resultMap.get(i).getPname();
									String name2 = URLEncoder.encode(name,"euc-kr");
							%>
						<li onclick="change(<%=i%>)" style="cursor:pointer;"><%=name %></li>
						<%} %>
												
					</ul>
				</div>
			</div>

			<!--======================================== 지도 출력부분입니다 밑에는 안보셔도 되요 ======================================-->
			<div class="container_12">
				<div class="content">
					<div class="ic"></div>
					<div class="grid_12">
<h3>Recommend Tour Map Info</h3>
<span style="font-size:1.3em;">추천 받은 여행지의 장소 정보입니다.지도에 위치를 찍어보고 이동경로를 계획하세요!</span>
						<div class="map_wrap">
							<ul id="category">
								<li id="BK9" data-order="0"><span class="category_bg bank"></span>
									은행</li>
								<li id="MT1" data-order="1"><span class="category_bg mart"></span>
									마트</li>
								<li id="PM9" data-order="2"><span
									class="category_bg pharmacy"></span> 약국</li>
								<li id="OL7" data-order="3"><span class="category_bg oil"></span>
									주유소</li>
								<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
									카페</li>
								<li id="CS2" data-order="5"><span class="category_bg store"></span>
									편의점</li>
								<li id="AD5" data-order="5"><span class="category_bg store"></span>
									숙박</li>
								<li id="AT4" data-order="5"><span class="category_bg store"></span>
									관광지</li>
								<li id="CT1" data-order="5"><span class="category_bg store"></span>
									문화시설</li>
							</ul>
							<div id="map" style="width: 100%; height: 100%;"></div>
						</div>

						<button id="hu3" onclick="drawing()" style="margin-top:100px; cursor:pointer; margin-left:83%;font-family: SeoulNamsanEB; font-size:1.1em; 100px; position: relative; padding:10px; background-color: #C73430; border-color: #C73430; color:#FFFAF0; border-radius: 10%; ">소요시간측정하기</button>
					</div>
				</div>
			</div>
		</div>
		<!--======================================스크립트 실행====================================-->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3&libraries=services"></script>
		<script>
		
		var hmlist = new Array();
		<c:forEach items="${alist}" var="item1">
		var mapobj = {
			name : '${item1.pname}',
			content : '${item1.pcontent}',
			lat : '${item1.plat}',
			lng : '${item1.plng}',
			pimg : '${item1.pimg}'
		};
		hmlist.push(mapobj);
		</c:forEach>
		
			var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(hmlist[0].lat, hmlist[0].lng), // 지도의 중심좌표
				level : 8
			// 지도의 확대 레벨
			};

			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

			// 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new daum.maps.MapTypeControl();

			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// 지도에 확대 축소 컨트롤을 생성한다
			var zoomControl = new daum.maps.ZoomControl();

			// 지도의 우측에 확대 축소 컨트롤을 추가한다
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);
			map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
				
				
				var hotpositions = [];

				var cnt = 1; //여행지순서 카운트변수 ex : 1. 카페베네 , 2. 우리집
				for (var i = 0; i < hmlist.length; i++) {
					var getposition = new daum.maps.LatLng(hmlist[i].lat, hmlist[i].lng);
					hotpositions[i] = {
							content :'<div class="customoverlay" id="songha">'
								+ '    <span class="title" id="soul">'+cnt+'. '+hmlist[i].name+ '</span>'
								+ '</div>',
						latlng : getposition
					};
					cnt += 1;
				}

				for (var i = 0; i < hotpositions.length; i++) {
					if(i==0){
						map.setCenter(hotpositions[0].latlng);
					}
					var marker = new daum.maps.Marker({
						map : map, // 마커를 표시할 지도
						clickable : true,
						position : hotpositions[i].latlng
					// 마커의 위치
					});
					marker.setMap(map);

					var customOverlay = new daum.maps.CustomOverlay({
						map : map,
						position : hotpositions[i].latlng,
						content : hotpositions[i].content,
						yAnchor : 1
					});
					customOverlay.setMap(map);
				}

				
				
				
				function change(num){
					document.getElementById("mytitle").innerHTML = hmlist[num].name;
					document.getElementById("myimg").src = hmlist[num].pimg;
					document.getElementById("mycon").innerHTML = hmlist[num].content;
					map.setCenter(hotpositions[num].latlng);
					map.setLevel(5);
				}
			/* ##############################LINE SCRIPT############################### */
			var drawingOK = false;
			function drawing() {
				if (!drawingOK) {
					document.getElementById("hu3").style.backgroundColor = "#eee";
					document.getElementById("hu3").style.borderColor = "#eee";
					document.getElementById("hu3").style.color = "#002141";
					drawingOK = true;
				} else {
					document.getElementById("hu3").style.backgroundColor = "#C73430";
					document.getElementById("hu3").style.borderColor = "#C73430";
					document.getElementById("hu3").style.color = "#FFFAF0";
					drawingOK = false;
					deleteClickLine();
					deleteDistnce();
					deleteCircleDot();
				}
			}

			var drawingFlag = false; // 선이 그려지고 있는 상태를 가지고 있을 변수입니다
			var moveLine; // 선이 그려지고 있을때 마우스 움직임에 따라 그려질 선 객체 입니다
			var clickLine // 마우스로 클릭한 좌표로 그려질 선 객체입니다
			var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
			var dots = {}; // 선이 그려지고 있을때 클릭할 때마다 클릭 지점과 거리를 표시하는 커스텀 오버레이 배열입니다.

			// 지도에 클릭 이벤트를 등록합니다
			// 지도를 클릭하면 선 그리기가 시작됩니다 그려진 선이 있으면 지우고 다시 그립니다
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {

				// 마우스로 클릭한 위치입니다 
				var clickPosition = mouseEvent.latLng;

				if (drawingOK) {
					// 지도 클릭이벤트가 발생했는데 선을 그리고있는 상태가 아니면
					if (!drawingFlag) {

						// 상태를 true로, 선이 그리고있는 상태로 변경합니다
						drawingFlag = true;

						// 지도 위에 선이 표시되고 있다면 지도에서 제거합니다
						deleteClickLine();

						// 지도 위에 커스텀오버레이가 표시되고 있다면 지도에서 제거합니다
						deleteDistnce();

						// 지도 위에 선을 그리기 위해 클릭한 지점과 해당 지점의 거리정보가 표시되고 있다면 지도에서 제거합니다
						deleteCircleDot();

						// 클릭한 위치를 기준으로 선을 생성하고 지도위에 표시합니다
						clickLine = new daum.maps.Polyline({
							map : map, // 선을 표시할 지도입니다 
							path : [ clickPosition ], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
							strokeWeight : 3, // 선의 두께입니다 
							strokeColor : '#db4040', // 선의 색깔입니다
							strokeOpacity : 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
							strokeStyle : 'solid' // 선의 스타일입니다
						});

						// 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
						moveLine = new daum.maps.Polyline({
							strokeWeight : 3, // 선의 두께입니다 
							strokeColor : '#db4040', // 선의 색깔입니다
							strokeOpacity : 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
							strokeStyle : 'solid' // 선의 스타일입니다    
						});

						// 클릭한 지점에 대한 정보를 지도에 표시합니다
						displayCircleDot(clickPosition, 0);

					} else { // 선이 그려지고 있는 상태이면

						// 그려지고 있는 선의 좌표 배열을 얻어옵니다
						var path = clickLine.getPath();

						// 좌표 배열에 클릭한 위치를 추가합니다
						path.push(clickPosition);

						// 다시 선에 좌표 배열을 설정하여 클릭 위치까지 선을 그리도록 설정합니다
						clickLine.setPath(path);

						var distance = Math.round(clickLine.getLength());
						displayCircleDot(clickPosition, distance);
					}
				}

			});

			// 지도에 마우스무브 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스무브 이벤트가 발생하면 그려질 선의 위치를 동적으로 보여주도록 합니다
			daum.maps.event
					.addListener(
							map,
							'mousemove',
							function(mouseEvent) {

								// 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
								if (drawingFlag) {

									// 마우스 커서의 현재 위치를 얻어옵니다 
									var mousePosition = mouseEvent.latLng;

									// 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
									var path = clickLine.getPath();

									// 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
									var movepath = [ path[path.length - 1],
											mousePosition ];
									moveLine.setPath(movepath);
									moveLine.setMap(map);

									var distance = Math.round(clickLine
											.getLength()
											+ moveLine.getLength()), // 선의 총 거리를 계산합니다
									content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">'
											+ distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다

									// 거리정보를 지도에 표시합니다
									showDistance(content, mousePosition);
								}
							});

			// 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
			// 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
			daum.maps.event
					.addListener(
							map,
							'rightclick',
							function(mouseEvent) {

								// 지도 오른쪽 클릭 이벤트가 발생했는데 선을 그리고있는 상태이면
								if (drawingFlag) {

									// 마우스무브로 그려진 선은 지도에서 제거합니다
									moveLine.setMap(null);
									moveLine = null;

									// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
									var path = clickLine.getPath();

									// 선을 구성하는 좌표의 개수가 2개 이상이면
									if (path.length > 1) {

										// 마지막 클릭 지점에 대한 거리 정보 커스텀 오버레이를 지웁니다
										if (dots[dots.length - 1].distance) {
											dots[dots.length - 1].distance
													.setMap(null);
											dots[dots.length - 1].distance = null;
										}

										var distance = Math.round(clickLine
												.getLength()), // 선의 총 거리를 계산합니다
										content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

										// 그려진 선의 거리정보를 지도에 표시합니다
										showDistance(content,
												path[path.length - 1]);

									} else {

										// 선을 구성하는 좌표의 개수가 1개 이하이면 
										// 지도에 표시되고 있는 선과 정보들을 지도에서 제거합니다.
										deleteClickLine();
										deleteCircleDot();
										deleteDistnce();

									}

									// 상태를 false로, 그리지 않고 있는 상태로 변경합니다
									drawingFlag = false;
								}
							});

			// 클릭으로 그려진 선을 지도에서 제거하는 함수입니다
			function deleteClickLine() {
				if (clickLine) {
					clickLine.setMap(null);
					clickLine = null;
				}
			}

			// 마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
			// 마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
			function showDistance(content, position) {

				if (distanceOverlay) { // 커스텀오버레이가 생성된 상태이면

					// 커스텀 오버레이의 위치와 표시할 내용을 설정합니다
					distanceOverlay.setPosition(position);
					distanceOverlay.setContent(content);

				} else { // 커스텀 오버레이가 생성되지 않은 상태이면

					// 커스텀 오버레이를 생성하고 지도에 표시합니다
					distanceOverlay = new daum.maps.CustomOverlay({
						map : map, // 커스텀오버레이를 표시할 지도입니다
						content : content, // 커스텀오버레이에 표시할 내용입니다
						position : position, // 커스텀오버레이를 표시할 위치입니다.
						xAnchor : 0,
						yAnchor : 0,
						zIndex : 3
					});
				}
			}

			// 그려지고 있는 선의 총거리 정보와 
			// 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
			function deleteDistnce() {
				if (distanceOverlay) {
					distanceOverlay.setMap(null);
					distanceOverlay = null;
				}
			}

			// 선이 그려지고 있는 상태일 때 지도를 클릭하면 호출하여 
			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 표출하는 함수입니다
			function displayCircleDot(position, distance) {

				// 클릭 지점을 표시할 빨간 동그라미 커스텀오버레이를 생성합니다
				var circleOverlay = new daum.maps.CustomOverlay({
					content : '<span class="dot"></span>',
					position : position,
					zIndex : 1
				});

				// 지도에 표시합니다
				circleOverlay.setMap(map);

				if (distance > 0) {
					// 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
					var distanceOverlay = new daum.maps.CustomOverlay(
							{
								content : '<div class="dotOverlay">거리 <span class="number">'
										+ distance + '</span>m</div>',
								position : position,
								yAnchor : 1,
								zIndex : 2
							});

					// 지도에 표시합니다
					distanceOverlay.setMap(map);
				}

				// 배열에 추가합니다
				dots.push({
					circle : circleOverlay,
					distance : distanceOverlay
				});
			}

			// 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
			function deleteCircleDot() {
				var i;

				for (i = 0; i < dots.length; i++) {
					if (dots[i].circle) {
						dots[i].circle.setMap(null);
					}

					if (dots[i].distance) {
						dots[i].distance.setMap(null);
					}
				}

				dots = [];
			}

			// 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
			// 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
			// HTML Content를 만들어 리턴하는 함수입니다
			function getTimeHTML(distance) {

				// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
				var walkkTime = distance / 67 | 0;
				var walkHour = '', walkMin = '';

				// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
				if (walkkTime > 60) {
					walkHour = '<span class="number">'
							+ Math.floor(walkkTime / 60) + '</span>시간 '
				}
				walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

				// 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
				var bycicleTime = distance / 227 | 0;
				var bycicleHour = '', bycicleMin = '';

				// 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
				if (bycicleTime > 60) {
					bycicleHour = '<span class="number">'
							+ Math.floor(bycicleTime / 60) + '</span>시간 '
				}
				bycicleMin = '<span class="number">' + bycicleTime % 60
						+ '</span>분'

				// 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
				var content = '<ul class="dotOverlay distanceInfo">';
				content += '    <li>';
				content += '        <span class="label">총거리</span><span class="number">'
						+ distance + '</span>m';
				content += '    </li>';
				content += '    <li>';
				content += '        <span class="label">도보</span>' + walkHour
						+ walkMin;
				content += '    </li>';
				content += '    <li>';
				content += '        <span class="label">자전거</span>'
						+ bycicleHour + bycicleMin;
				content += '    </li>';
				content += '</ul>'

				return content;

			}

			////////////////////////////// PLACE SCRIPT ///////////////////////////////////////////////

			//마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
			var placeOverlay = new daum.maps.CustomOverlay({
				zIndex : 1
			}), contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
			markers = [], // 마커를 담을 배열입니다
			currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다

			// 장소 검색 객체를 생성합니다
			var ps = new daum.maps.services.Places(map);

			// 지도에 idle 이벤트를 등록합니다
			daum.maps.event.addListener(map, 'idle', searchPlaces);

			// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
			contentNode.className = 'placeinfo_wrap';

			// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
			// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
			addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart',
					daum.maps.event.preventMap);

			// 커스텀 오버레이 컨텐츠를 설정합니다
			placeOverlay.setContent(contentNode);

			// 각 카테고리에 클릭 이벤트를 등록합니다
			addCategoryClickEvent();

			// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
			function addEventHandle(target, type, callback) {
				if (target.addEventListener) {
					target.addEventListener(type, callback);
				} else {
					target.attachEvent('on' + type, callback);
				}
			}

			// 카테고리 검색을 요청하는 함수입니다
			function searchPlaces() {
				if (!currCategory) {
					return;
				}

				// 커스텀 오버레이를 숨깁니다 
				placeOverlay.setMap(null);

				// 지도에 표시되고 있는 마커를 제거합니다
				removeMarker();

				ps.categorySearch(currCategory, placesSearchCB, {
					useMapBounds : true
				});
			}

			// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
			function placesSearchCB(data, status, pagination) {
				if (status === daum.maps.services.Status.OK) {

					// 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
					displayPlaces(data);
				} else if (status === daum.maps.services.Status.ZERO_RESULT) {
					// 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요
					alert("현재 범위에 검색 결과가 없습니다.")
				} else if (status === daum.maps.services.Status.ERROR) {
					// 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
					alert("error")
				}
			}

			// 지도에 마커를 표출하는 함수입니다
			function displayPlaces(places) {

				// 몇번째 카테고리가 선택되어 있는지 얻어옵니다
				// 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
				var order = document.getElementById(currCategory).getAttribute(
						'data-order');

				for (var i = 0; i < places.length; i++) {
					console.log(places[i].place_name);
					// 마커를 생성하고 지도에 표시합니다
					var marker = addMarker(new daum.maps.LatLng(places[i].y,
							places[i].x), order);

					// 마커와 검색결과 항목을 클릭 했을 때
					// 장소정보를 표출하도록 클릭 이벤트를 등록합니다
					(function(marker, place) {
						daum.maps.event.addListener(marker, 'click',
								function() {
									displayPlaceInfo(place);
								});
					})(marker, places[i]);
				}
			}

			// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
			function addMarker(position, order) {
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
				imageSize = new daum.maps.Size(27, 28), // 마커 이미지의 크기
				imgOptions = {
					spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
					spriteOrigin : new daum.maps.Point(46, (order * 36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
					offset : new daum.maps.Point(11, 28)
				// 마커 좌표에 일치시킬 이미지 내에서의 좌표
				}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
						imgOptions), marker = new daum.maps.Marker({
					position : position, // 마커의 위치
					image : markerImage
				});

				marker.setMap(map); // 지도 위에 마커를 표출합니다
				markers.push(marker); // 배열에 생성된 마커를 추가합니다

				return marker;
			}

			// 지도 위에 표시되고 있는 마커를 모두 제거합니다
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
			function displayPlaceInfo(place) {
				var content = '<div class="placeinfo">'
						+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
						+ place.place_name + '</a>';

				if (place.road_address_name) {
					content += '    <span title="' + place.road_address_name + '">'
							+ place.road_address_name
							+ '</span>'
							+ '  <span class="jibun" title="' + place.address_name + '">(지번 : '
							+ place.address_name + ')</span>';
				} else {
					content += '    <span title="' + place.address_name + '">'
							+ place.address_name + '</span>';
				}

				content += '    <span class="tel">' + place.phone + '</span>'
						+ '</div>' + '<div class="after"></div>';

				contentNode.innerHTML = content;
				placeOverlay
						.setPosition(new daum.maps.LatLng(place.y, place.x));
				placeOverlay.setMap(map);
			}

			// 각 카테고리에 클릭 이벤트를 등록합니다
			function addCategoryClickEvent() {
				var category = document.getElementById('category'), children = category.children;

				for (var i = 0; i < children.length; i++) {
					children[i].onclick = onClickCategory;
				}
			}

			// 카테고리를 클릭했을 때 호출되는 함수입니다
			function onClickCategory() {
				var id = this.id, className = this.className;

				placeOverlay.setMap(null);

				if (className === 'on') {
					currCategory = '';
					changeCategoryClass();
					removeMarker();
				} else {
					currCategory = id;
					changeCategoryClass(this);
					searchPlaces();
				}
			}

			// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
			function changeCategoryClass(el) {
				var category = document.getElementById('category'), children = category.children, i;

				for (i = 0; i < children.length; i++) {
					children[i].className = '';
				}

				if (el) {
					el.className = 'on';
				}
			}
		</script>

		<!--==============================footer=================================-->
		<footer>
			<div class="container_12">
				<div class="grid_12">
					<div class="socials">
						<a href="https://ko-kr.facebook.com/" class="fa fa-facebook"></a>
						<a href="https://twitter.com/" class="fa fa-twitter"></a> <a
							href="https://plus.google.com/" class="fa fa-google-plus"></a>
					</div>
					<div class="copy">
						Tripicker (c) 2017 | <a href="#">Privacy Policy</a> | Website
						Template Designed by <a href="http://www.templatemonster.com/"
							rel="nofollow">TemplateMonster.com</a>
					</div>
				</div>
			</div>
		</footer>
</body>
</html>