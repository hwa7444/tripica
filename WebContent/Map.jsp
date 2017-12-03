<%@page import="com.DAO.mymapVO"%>
<%@page import="com.DAO.MymaplistVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.mymapDAO"%>
<%@page import="com.DAO.memberVO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<style>
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
	margin: 0;
	padding: 0;
	font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
	font-size: 12px;
}

.map_wrap {
	position: relative;
	width: 90%;
	height: 550px;
	left: 70px;
	top: 50px;
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
</style>
<!-- <style type="text/css">
.mapPost tr td {
	padding: 10px;
	border: 1px solid #dddddd;
	background-color: white;
}

.mapPost tr th {
	padding: 10px;
}
</style> -->

<style type="text/css">
#songha{
background-color: #FBFBFB;
color:#C73430;
border-top-left-radius: 10%;
}
#soul{
color: #002141;
}
</style>

<title>MAP DIY</title>
<meta charset="utf-8">
<%
	request.setCharacterEncoding("EUC-KR");
%>
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="css/style.css?ver=1">
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
	background-image: url("images/large.jpg");
	background-repeat: repeat;
	padding-bottom: 120px;
}
</style>

</head>
<body>
	<%
		memberVO vo1 = null; // 닉네임
		String nick = "";

		if (session.getAttribute("vo1") != null) {
			vo1 = (memberVO) session.getAttribute("vo1");
			nick = vo1.getNick();
		}
		/* String nick = null;
		if (session.getAttribute("nick") != null) {
			nick = (String) session.getAttribute("nick");
		} */
	%>
	<%
		mymapDAO dao = new mymapDAO();
		ArrayList<MymaplistVO> mlist = null;
		mlist = dao.getAllMaplist();

		/*  
		
		int num;			게시글번호
		String pgroup;		지도이름
		String nick;		작성자닉네임
		int recom;			추천수
		String day;			작성일
		
		*/
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
	<!--==========================로그인/회원가입 모달입니다.==============================-->

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


	<!--==========================로그인/회원가입 모달 끗==============================-->

	<div class="allFor">
		<!-- ======SIDE MENU 옆의 메뉴 입니다.===== -->
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

		<!-- ======^SIDE MENU 옆의 메뉴 끗===== -->
		<div class="allFor">

			<!--==============================header 위의 메뉴=================================-->
			<header>
				<div class="container_12">
					<div class="grid_12">
						<div class="menu_block">
							<nav class="horizontal-nav full-width horizontalNav-notprocessed">
								<ul class="sf-menu">
									<li><a href="Main.jsp">HOME</a></li>
									<c:choose>
										<c:when test="${empty vo1.id}">
											<li><a href="#login_form2">HOT TOURS</a></li>
										</c:when>
										<c:otherwise>
											<li><a href="#trip_form1" onclick="move()">HOT TOURS</a></li>
										</c:otherwise>
									</c:choose>
									<li><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
									<li><a href="SelectService?start=0&end=8">POST</a></li>
									<li class="current"><a href="Map.jsp">MAP DIY</a></li>
								</ul>
							</nav>
							<div class="clear"></div>
						</div>
					</div>
					<div class="grid_12">
						<h1>
							<a href="Map.jsp"> <img src="images/logo/tripickerLogo9.png"
								alt="Your Happy Family">
							</a>
						</h1>
					</div>
				</div>
			</header>
			<!--==============================header 위의 메뉴 끗=================================-->

			<!--==============================Content=================================-->
			<div class="content">
				<div class="ic"></div>
				<h3 style="margin-left: 100px;!important">MAEK YOUR ROUT</h3>
				<span id="ya" style="margin-left: 100px; font-size:1.3em;">당신만의 특색있는 여행 루트를 만들어 보세요!</span>
			<!-- </div>
			<div class="content">
				<div class="ic"></div>
				<div class="grid_12" style="margin-left: 100px;">
					<div clas="special_banner"
						style="background-color: red; position: absolute; width: 800px; height: 10px;">
						///위에 공간 입니당///
						위에 공간 입니다. <br>지도가 저장될 공간?
					</div>
				</div>
			</div>
			<div class="content">
				<div class="ic"></div> -->
				<div class="map_wrap choice">
					<div id="map" style="width: 100%; height: 100%;"></div>
				</div>
				<button onclick="ist()"
					style="margin-top: 80px; margin-left: 88%;font-family: SeoulNamsanEB; font-size:1.5em; 100px; position: relative; padding:10px; background-color: #C73430; border-color: #C73430; color:#FFFAF0; border-radius: 10%; ">등록하기</button>

				<!--====================================지도 게시판 만들기=======================================-->

				<h3 style="margin-left: 100px; ! important top: 0;">
					<span style="color: #C73430;">HOT</span> ROUT
				</h3>
				<%
					int max = 0;
					for (int i = 0; i < mlist.size(); i++) {
						if (mlist.get(i).getRecom() > mlist.get(max).getRecom()) {
							max = i;
						}
					}
		/* 시퀀스 뽑기 */
		
				%>
				<span id="ya2" style="margin-left: 100px; font-size:1.6em; padding-bottom:30px;">제목 : <span style="color:#002141;"><%= mlist.get(max).getPgroup()%></span>
				 &nbsp작성자 : <span style="color:#002141;"><%= mlist.get(max).getNick()%></span>&nbsp 추천수 : <span style="color:#002141;"><%= mlist.get(max).getRecom()%></span></span>
				<p></p>
				<div id="minimap6"></div>

				<div class="grid_12" style="margin-left: 150px; top: 50px;">
					<!-- 지도 게시판 -->
					<h3 style="margin-left: 100px; ! important top: 0;">POST YOUR
						ROUT</h3>
					<table class="mapPost"
						style="margin: 20px; border: 1px solid #dddddd; text-align: center; width: 1300px; font-size: 1.2em;">
						<tr style="background-color: #002141; color: #F6F6F6;">
							<th>번호</th>
							<th>지도 이름</th>
							<th>작성자</th>
							<th>작성일자</th>
							<th>추천 수</th>
							<th>추천하기</th>
						</tr>

						<!-- 	/*  
	리스트 이름은 mlist
	
	int num;			게시글번호
	String pgroup;		지도이름
	String nick;		작성자닉네임
	int recom;			추천수
	String day;			작성일
	
	*/ -->
						<%
							for (int i = 0; i < mlist.size(); i++) {
						%>
						<tr>
							<td><%=mlist.get(i).getNum()%></td>
							<td><a onclick="showMap(<%=mlist.get(i).getNum()%>)"><%=mlist.get(i).getPgroup()%></a></td>
							<td><%=mlist.get(i).getNick()%></td>
							<td><%=mlist.get(i).getDay()%></td>
							<td><%=mlist.get(i).getRecom()%></td>
							<td><a href="MapBest?num=<%=mlist.get(i).getNum()%>&recom=<%=mlist.get(i).getRecom()%>"><span style="background-color: #;">추천</span></a></td>
						</tr>
						<%
							}
						%>

					</table>
				</div>
				<div class="clear"></div>
			</div>
			<script type="text/javascript">
				function showMap(num) {
					window
							.open(
									'showMap.jsp?num=' + num,
									'showMap',
									'width=900px,left=100px,top=100px,height=450px,scrollbars = no,resizeable = no,menubar = no,menubar = no');
				}
			</script>

			<!--===================================^지도 게시판 만들기=======================================-->

			<!--================================여기는 지도 스크랩트 문!!======================================-->
<%
ArrayList<mymapVO> hmlist = null;
mymapDAO mdao = new mymapDAO();
hmlist = mdao.getMymap(mlist.get(max).getNum());
request.setAttribute("hlist", hmlist);
%>
			<script type="text/javascript"
				src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3"></script>

			<script>
			var hmlist = new Array();
			<c:forEach items="${hlist}" var="item1">
			var mapobj = {
					name : '${item1.pname}',
					pcontent : '${item1.pcontent}',
					lat : '${item1.plat}',
					lng : '${item1.plng}',
					pgroup : '${item1.pgroup}'
			};
			hmlist.push(mapobj);
			</c:forEach>
			
			
			/* hotmap 생성 */
			var mapContainerhot = document.getElementById('minimap6'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
				level : 10
			// 지도의 확대 레벨
			};
			var hotmap = new daum.maps.Map(mapContainerhot, mapOption); // 지도를 생성합니다
			hotmap.setCenter(new daum.maps.LatLng(hmlist[0].lat, hmlist[0].lng));
			
			var linePath2 = [];
			var hotpositions = [];
			
			/* 세영아 여기야 여기 */
			var cnt = 1;	//여행지순서 카운트변수 ex : 1. 카페베네 , 2. 우리집
			for (var i = 0; i < hmlist.length; i++) {
				var getposition = new daum.maps.LatLng(hmlist[i].lat, hmlist[i].lng);
				hotpositions[i] = {
						content :'<div class="customoverlay" id="songha">'
							+ '    <span class="title" id="soul">'+cnt+'. '+hmlist[i].name+ '</span>'
							+     hmlist[i].pcontent
							+ '</div>',
						latlng : getposition
				};
				cnt+=1;
			}
			
			for (var i = 0; i < hotpositions.length; i++) {
				
				 var marker = new daum.maps.Marker({
				        map: hotmap, // 마커를 표시할 지도
				        clickable : true,
				        position: hotpositions[i].latlng // 마커의 위치
				    });
				 marker.setMap(hotmap);
				 
				 var customOverlay = new daum.maps.CustomOverlay({
					    map: hotmap,
					    position: hotpositions[i].latlng,
					    content: hotpositions[i].content,
					    yAnchor: 1 
					});
				 customOverlay.setMap(hotmap);
				 linePath2.push(hotpositions[i].latlng);
				 if (i >= 1) {
						hotline();
					}
			}
			
			function hotline() {
				// 지도에 표시할 선을 생성합니다
				var polyline2 = new daum.maps.Polyline({
					path : linePath2, // 선을 구성하는 좌표배열 입니다
					strokeWeight : 5, // 선의 두께 입니다
					strokeColor : '#F44336', // 선의 색깔입니다
					strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
					strokeStyle : 'solid' // 선의 스타일입니다
				});
				// 지도에 선을 표시합니다 
				polyline2.setMap(hotmap);

			}
			
			var n = 0;
			var lim = hmlist.length;
			setInterval(function() {
				if (n < lim) {
					hotmap.panTo(hotpositions[n].latlng);
					hotmap.setLevel(5, {anchor: hotpositions[n].latlng});
					n+=1;
				} else {
					n = 0;
					hotmap.panTo(hotpositions[n].latlng);
					hotmap.setLevel(9, {anchor: hotpositions[n].latlng});
				}
			}, 3000);
			
			/*################## 루트만들기script + 맵생성 ################################*/
			
	
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
				mapOption = {
					center : new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
					level : 9
				// 지도의 확대 레벨
				};

				var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

				// 지도를 클릭했을때 클릭한 위치에 마커를 추가하도록 지도에 클릭이벤트를 등록합니다
				daum.maps.event.addListener(map, 'click', function(mouseEvent) {
					// 클릭한 위치에 마커를 표시합니다 
					addMarker(mouseEvent.latLng);
				});

				// 지도에 표시된 마커 객체를 가지고 있을 배열입니다
				var markers = [];
				var getposition;
				var infowindow;
				var titleok = false;
				// 마커를 생성하고 지도위에 표시하는 함수입니다
				function addMarker(position) {

					if (markers.length == 0) {
						getposition = position;
						// 마커를 생성합니다
						var marker = new daum.maps.Marker({
							position : position
						});
						console.log(markers.length);
						// 마커가 지도 위에 표시되도록 설정합니다
						markers.push(marker);
						markers[0].setMap(map);

						if (!titleok) {
							titleok = true;
							// 마커에 표시할 인포윈도우를 생성합니다 
							infowindow = new daum.maps.InfoWindow(
									{
										content : '여행경로의 제목을 입력하세요.<br><input type="text" id = "tname"><button id="button1" onclick="o();">넹!</button><button id="button1" onclick="no();">다시할래!</button>' // 인포윈도우에 표시할 내용
									});
							infowindow.open(map, marker);
						} else {
							// 마커에 표시할 인포윈도우를 생성합니다 
							infowindow = new daum.maps.InfoWindow(
									{
										content : '이 장소의 이름은?<br><input type="text" id = "title"><button id="button1" onclick="ok();">넹!</button><button id="button1" onclick="no();">다시할래!</button>' // 인포윈도우에 표시할 내용
									});
							infowindow.open(map, marker);
						}

					}
				}

				var openok = true;
				var pname;
				var pcon;
				var parr = new Array();
				var pobj = new Object();
				var plat;
				var plng;
				var pgroup;
				//선을 구성하는 좌표 배열입니다. 이 좌표들을 이어서 선을 표시합니다
				var linePath = [];
				var pok = "f";
				function ist() {
					pok = "t";
					send();
				}
				function o() {
					pgroup = document.getElementById("tname").value;
					alert("이번 나만의여행 제목은 " + pgroup + " 입니다. 이제 시작해보세요!");
					markers[0].setMap(null);
					infowindow.close();
					markers = [];
				}

				function ok() {
					pname = document.getElementById("title").value;
					infowindow
							.setContent('이 장소는 어떤 곳 인가요?<br><input type="text" id = "pcon"><button id="button1" onclick="ok2();">넹!</button><button id="button1" onclick="no();">다시할래!</button>');
				}

				function ok2() {
					pcon = document.getElementById("pcon").value;
					plat = getposition.getLat().toString();
					plng = getposition.getLng().toString();
					//	var r = new daum.maps.LatLng(plat,plng);
					linePath.push(getposition);
					markers[0].setMap(null);
					infowindow.close();
					markers = [];
					rcd();
					makearr();
				}

				var userid;
				var real;
				function makearr() {

					pobj.pname = pname;
					pobj.pcontent = pcon;
					pobj.plat = plat;
					pobj.plng = plng;

					parr.push(pobj);
					alert(parr[0].pname);
					send();

				}

				function send() {
					$.ajax({
						url : "mymap",
						data : "pname=" + pname + "&pcon=" + pcon + "&plat="
								+ plat + "&plng=" + plng + "&pgroup=" + pgroup
								+ "&pok=" + pok,
						success : function(data) {
							if (data == "reload") {
								alert("작성완료!!");
								location.reload();
							} else if (data == "nologin") {
								alert("로그인이 필요한 작업입니다.");
								location.reload();
							}
						}
					});
				}

				function no() {
					alert("Cancel OK, Select again! :D")
					markers[0].setMap(null);
					infowindow.close();
					markers = [];
				}
				var markers2 = [];
				function rcd() {
					addMarker2(pname, getposition);
				}
				function addMarker2(pname, position) {

					// 마커를 생성합니다
					var marker2 = new daum.maps.Marker({
						position : position
					});
					markers2.push(marker2);
					for (var i = 0; i < markers2.length; i++) {
						markers2[i].setMap(map);
					}

					// 마커에 표시할 인포윈도우를 생성합니다 
					infowindow = new daum.maps.InfoWindow({
						content : '<span class="number">' + markers2.length
								+ '. ' + pname + '</span>'
					});
					infowindow.open(map, marker2);

					if (markers2.length > 1) {
						line();
					}
				}

				function line() {
					// 지도에 표시할 선을 생성합니다
					var polyline = new daum.maps.Polyline({
						path : linePath, // 선을 구성하는 좌표배열 입니다
						strokeWeight : 5, // 선의 두께 입니다
						strokeColor : '#F44336', // 선의 색깔입니다
						strokeOpacity : 0.7, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
						strokeStyle : 'solid' // 선의 스타일입니다
					});
					daum.maps.event.addListener(polyline, 'mouseover',
							function(mouseEvent) {
								//alert("d");
							});
					// 지도에 선을 표시합니다 
					polyline.setMap(map);

					// 마우스 클릭으로 그린 선의 좌표 배열을 얻어옵니다
					var path = polyline.getPath();

					// 선을 구성하는 좌표의 개수가 2개 이상이면
					if (path.length > 1) {

						var distance = Math.round(polyline.getLength()), // 선의 총 거리를 계산합니다
						content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다

						// 그려진 선의 거리정보를 지도에 표시합니다
						showDistance(content, path[path.length - 1]);

					}

				}
				var distanceOverlay; // 선의 거리정보를 표시할 커스텀오버레이 입니다
				//마우스 드래그로 그려지고 있는 선의 총거리 정보를 표시하거
				//마우스 오른쪽 클릭으로 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 생성하고 지도에 표시하는 함수입니다
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

				//마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
				//그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
				//HTML Content를 만들어 리턴하는 함수입니다
				function getTimeHTML(distance) {

					// 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
					var walkkTime = distance / 67 | 0;
					var walkHour = '', walkMin = '';

					// 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
					if (walkkTime > 60) {
						walkHour = '<span class="number">'
								+ Math.floor(walkkTime / 60) + '</span>시간 '
					}
					walkMin = '<span class="number">' + walkkTime % 60
							+ '</span>분'

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
					content += '        <span class="label">도보</span>'
							+ walkHour + walkMin;
					content += '    </li>';
					content += '    <li>';
					content += '        <span class="label">자전거</span>'
							+ bycicleHour + bycicleMin;
					content += '    </li>';
					content += '</ul>'

					return content;
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