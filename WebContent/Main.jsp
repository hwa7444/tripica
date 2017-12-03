<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	request.setCharacterEncoding("EUC-KR");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<style>
.menu_block nav {
	font-family: 'SeoulNamsanEB';
}

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
</style>
<title>Home</title>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="booking/css/booking.css">
<link rel="stylesheet" href="css/camera.css?ver=1">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css?ver=1">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="//code.jquery.com/jquery-1.11.0.min.js"></script>
<!-- ajax -->
<script src="js/jquery.js"></script>
<script src="js/jquery-migrate-1.2.1.js"></script>
<script src="js/script.js"></script>
<script src="js/superfish.js"></script>
<script src="js/jquery.ui.totop.js"></script>
<script src="js/jquery.equalheights.js"></script>
<script src="js/jquery.mobilemenu.js"></script>
<script src="js/jquery.easing.1.3.js"></script>
<script src="js/owl.carousel.js"></script>
<script src="js/camera.js"></script>
<!--[if (gt IE 9)|!(IE)]><!-->
<script src="js/jquery.mobile.customized.min.js"></script>
<!--<![endif]-->
<script src="booking/js/booking.js"></script>

<script>
	$(document).ready(function() {
		jQuery('#camera_wrap').camera({
			loader : false,
			pagination : false,
			minHeight : '444',
			thumbnails : false,
			height : '48.375%',
			caption : true,
			navigation : true,
			fx : 'mosaic'
		});
		/*carousel*/
		var owl = $("#owl");
		owl.owlCarousel({
			items : 2, //10 items above 1000px browser width
			itemsDesktop : [ 995, 2 ], //5 items between 1000px and 901px
			itemsDesktopSmall : [ 767, 2 ], // betweem 900px and 601px
			itemsTablet : [ 700, 2 ], //2 items between 600 and 0
			itemsMobile : [ 479, 1 ], // itemsMobile disabled - inherit from itemsTablet option
			navigation : true,
			pagination : false
		});
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

.color {
	width: 100%;
	height: 300px;
	background-image: url("images/Main/back5.jpg");
}
</style>

</head>
<body class="page1" id="top">

<!-- map로드를위한 서블릿호출 -->
<c:if test="${empty listmap}">
<jsp:forward page="MainmaploadService"/>
</c:if>
<!-- ////////////////////// -->

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

	<!--==========================로그인/회원가입모달창입니다.==============================-->

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
					<td><input type="text" id="aa" name="id" required
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

			var id = document.getElementById("aa").value;
			$.ajax({
				url : "SearchId2",
				data : "id=" + id,
				success : function(result) {
					alert(result);
				}
			})
			alert("1");
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

	<!-- allfor you -->
	<div class="allFor">
		<!-- ======SIDE MENU 옆의 메뉴 창===== -->
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
						<li><a href="#trip_form1" id="trip_pop" onclick="move()">여행지추천
								받기</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			<!-- 설문조사 위치 옮기기 -->
			<script type="text/javascript">
				function move() {
					document.getElementById("move").scrollIntoView(true);
				}
			</script>
		</div>

		<!-- ======^SIDE MENU===== -->
		<!--==============================header 위의 메뉴창=================================-->
		<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="menu_block">
					<nav class="horizontal-nav full-width horizontalNav-notprocessed">
					<ul class="sf-menu">
						<li class="current"><a href="Main.jsp">HOME</a></li>
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
						<li><a href="Map.jsp">MAP DIY</a></li>
					</ul>
					</nav>
					<div class="clear"></div>
				</div>
			</div>
			<div class="grid_12">
				<h1>
					<a href="Main.jsp" id="move"> <img
						src="images/logo/tripickerLogo9.png" alt="Your Happy Family">
					</a>
				</h1>
			</div>
		</div>
		</header>

		<!--==============================^header 첫화면에 큰 사진 슬라이드 나오는 부분=================================-->
		<div class="slider_wrapper">
			<div id="camera_wrap" class="">
				<div data-src="images/Main/slide5.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">이호테우 해변</h2>
						<div class="price">
							&nbsp<span>멋진 일몰을 보고 싶다면?</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">더 보기</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">더 보기</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
				<div data-src="images/Main/slide2.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">제주허브 동산</h2>
						<div class="price">
							&nbsp<span>향기로운 허브동산에서 멋있는 야경을!</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">더 보기</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">더 보기</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
				<div data-src="images/Main/slide3.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">한라산국립공원</h2>
						<div class="price">
							&nbsp<span>멋진 설경을 보고싶다면?</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">더 보기</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">더 보기</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
				<div data-src="images/Main/slide4.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">월령선인장군락지</h2>
						<div class="price">
							&nbsp<span>선인장이 가득한 해변가에서 산책을!</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">더 보기</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">더 보기</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
			</div>
		</div>

		<!--==============================Content 본문내용=================================-->
		<div class="content">
			<div class="ic"></div>
			<!-- ================= minimap5슬라이드 밑 움직이는 기다란 지도 출력부분입니다. ====================== -->
			<div class="container_12">
				<h3>
					<span style="color: #C73430;">Hot</span> Map
				</h3>
				<h2 style="font-size: 1.3em;">최근 여행자들의 인기 관광지 입니다.</h2>
				<div class="grid_12">
					<!-- MINIMAP 1번 사용자 맞춤 추천 루트 -->
					<div
						style="background-color: lightblue; width: 930px; height: 460px;"
						id="minimap5"></div>
				</div>
			</div>
		</div>

		<div class="color" id="lastCon">
			<!-- ===========================this week choice 사진위에 커서 올리면 사진이 변하는 부분입니다.=================================== -->
			<div class="container_12" align="center">
				<div class="grid_12">
					<h3 class="head1" style="color: #C73430">
						<span style="color: #002141">This</span> Week's <span
							style="color: #002141">Choice</span>
					</h3>
				</div>
				<div class="grid_4">
					<div class="block1" id="news1">
						<time datetime="2014-01-01">1<span></span></time>
						<div class="extra_wrapper">
							<div class="text1 col1">
								<a href="#" id="news1"
									style="text-shadow: 0.08em 0.08em 0.16em #193c46;">카멜리아힐</a>
							</div>
							<span
								style="color: #FFFAF0; font-size: 1.4em; text-shadow: 0.07em 0.07em 0.17em #193c46;">사계절
								이쁜 꽃들과 함께 인생사진 만들기!</span>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1" id="news2">
						<time datetime="2014-01-01">2<span></span></time>
						<div class="extra_wrapper">
							<div class="text1 col1">
								<a href="#" style="text-shadow: 0.08em 0.08em 0.16em #193c46;">세화해변</a>
							</div>
							<span
								style="color: #FFFAF0; font-size: 1.4em; text-shadow: 0.07em 0.07em 0.17em #193c46;">인생사진을
								남기고 싶다면 꼭 가야봐할 곳! </span>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1" id="news3">
						<time datetime="2014-01-01">3<span></span></time>
						<div class="extra_wrapper">
							<div class="text1 col1">
								<a href="#" style="text-shadow: 0.08em 0.08em 0.16em #193c46;">더럭분교</a>
							</div>
							<span
								style="color: #FFFAF0; font-size: 1.4em; text-shadow: 0.07em 0.07em 0.17em #193c46;">
								알록달록 이쁜 벽에서 친구, 연인과 함께 한 컷! </span>
						</div>
					</div>
				</div>


			</div>
		</div>
		<!-- ===========================^this week choice 사진위에 커서 올리면 사진이 변하는 부분 자바스크립트=================================== -->
		<script type="text/javascript">
			document
					.getElementById("news1")
					.addEventListener(
							"mouseover",
							function(e) {
								lastCon.style.background = "url('images/Main/back1.jpg')";
							});
			document
					.getElementById("news1")
					.addEventListener(
							"mouseout",
							function(e) {
								lastCon.style.background = "url('images/Main/back1.jpg')";

							});
			document
					.getElementById("news2")
					.addEventListener(
							"mouseover",
							function(e) {
								lastCon.style.background = "url('images/Main/back2.jpg')";
							});
			document
					.getElementById("news2")
					.addEventListener(
							"mouseout",
							function(e) {
								lastCon.style.background = "url('images/Main/back2.jpg')";

							});
			document
					.getElementById("news3")
					.addEventListener(
							"mouseover",
							function(e) {
								lastCon.style.background = "url('images/Main/back3.jpg')";
							});
			document
					.getElementById("news3")
					.addEventListener(
							"mouseout",
							function(e) {
								lastCon.style.background = "url('images/Main/back3.jpg')";

							});
		</script>
		<!-- ===========================^this week choice 사진위에 커서 올리면 사진이 변하는 부분입니다. 끗=================================== -->
		<!--==============================minimap 1 2 3 4지 도 4개 들어 가는 부분입니다.=================================-->
		<div class="content">
			<div class="ic"></div>
			<!-- <div class="container_12">
				<h3>Recommend</h3>
				<h2 style="font-size: 1.3em;">당신 만을 위한 추천여행 루트 입니다.</h2>
				<div class="grid_6">
					MINIMAP 1번 사용자 맞춤 추천 루트
					<div id="minimap1"></div>
				</div>
				<div class="grid_6">
					MINIMAP 2번 사용자 맞춤 추천 루트
					<div id="minimap2"></div>
				</div>
			</div>

			<div class="clear"></div>
			<div class="container_12">

				<h3>Tirpicker's Choice</h3>
				<h2 style="font-size: 1.3em;">저희 사이트가 추천하는 여행 루트 입니다.</h2>
				<div class="grid_6">
					MINIMAP 3번 우리사이트 자체 추천 루트
					<div id="minimap3"></div>
				</div>
				<div class="grid_6">
					MINIMAP 4번 우리사이트 자체 추천 루트
					<div id="minimap4"></div>
				</div>

			</div>

			<div class="clear"></div>
			==============================minimap 1 2 3 4지 도 4개 들어 가는 부분입니다. 끗================================= -->

			<div class="container_12">
				<h3 style="top: 0;">Welcome!</h3>
				<div class="grid_5 suffix_1">

					<div style="width: 320px; height: 460px; font-size: 1.3em;">
						<span><p style="margin-bottom: 3px;">저희 Tripicker는 사용자
								개인의 취향을 반</p>
							<p style="margin-bottom: 3px;">영한 맞춤형 여행루트 추천 사이트 입니다.</p>
							<p style="margin-bottom: 3px;">간편한 사진 설문조사에 참여하여 맞춤형 여</p>
							<p style="margin: 0; padding: 0;">행 루트 추천 받고 여행 다녀오세요!</p></span> <br>
						<br>
						<p>
							<span style="color: #3e454c;">★사이트 이용 방법★</span>
						</p>
						<p>1. 회원 가입을 한다.</p>
						<p>
							2. 로그인 후에 '여행지 추천받기'를 <span
								style="color: #C73430; font-size: 1.1em;">click!</span>
						</p>
						<p>3. 마음에 드는 사진 1개 > 1개 선택하기!</p>
						<p>4. 맞춤형 루트 추천받기 성공!</p>
						<p>+ 'MAP DIY'에서 나만의 루트를 만들어보세요!</p>
						<p style="margin-bottom: 3px;">
							<span style="color: #C73430; font-size: 1em;">WHAT IS NEXT
								BEST POST?</span>
						</p>
						<p>다음 BEST POST는 당신입니다!</p>
						<p>+ 여행 후기를 사진과 함께 'POST'에서 공유해보세요!</p>
					</div>
				</div>


				<div class="grid_6">

					<div id="slideBox">
				
						<img class="mySlides" src="images/Main/side1.jpg"
							style="display: none; width: 490px; height: 520px;"> <img
							class="mySlides" src="images/Main/side1.jpg"
							style="width: 490px; height: 520px;"> <img class="mySlides"
							src="images/Main/side2.jpg" style="width: 490px; height: 520px;">
						<img class="mySlides" src="images/Main/side2.jpg"
							style="width: 490px; height: 520px;"> <img class="mySlides"
							src="images/Main/side3.jpg" style="width: 490px; height: 520px;">
							<img class="mySlides"
							src="images/Main/side4.jpg" style="width: 490px; height: 520px;">
							<img class="mySlides"
							src="images/Main/side3.jpg" style="width: 490px; height: 520px;">
								<img class="mySlides"
							src="images/Main/side2.jpg" style="width: 490px; height: 520px;">
								<img class="mySlides"
							src="images/Main/side3.jpg" style="width: 490px; height: 520px;">
							<img class="mySlides"
							src="images/Main/side4.jpg" style="width: 490px; height: 520px;">
							<img class="mySlides"
							src="images/Main/side4.jpg" style="width: 490px; height: 520px;">
							<img class="mySlides"
							src="images/Main/side4.jpg" style="width: 490px; height: 520px;">
							<img class="mySlides"
							src="images/Main/side4.jpg" style="width: 490px; height: 520px;">
								

						<!--  <input id="left"
							type="button" value="◀" onclick="slide(-1)"> <input
							id="right" type="button" value="▶" onclick="slide(1)"> -->
					</div>
				</div>
			</div>
			<!--container 끗-->


			<!--===================================이미지 슬라이드 자바 스크립트=========================================-->
			<script type="text/javascript">
				var imgs = document.querySelectorAll("img.mySlides");
				var index = 0; //number(숫자형)

				slide(index);

				//이미지가 시간초마다 바뀌게 하는 것
				setInterval(function() {
					index += 1;
					slide(index);
				}, 1500);

				function slide(num) {
					for (var i = 0; i < imgs.length; i++) {
						imgs[i].style.display = "none";
					}
					index += num;
					if (index > imgs.length - 1) {
						index = 0;
					} else if (index < 0) {
						index = imgs.length - 1;
					}
					//선택 이미지 출력
					imgs[index].style.display = "block";
				}
			</script>
			<div class="clear"></div>
			<!--============================== welcome 사이트 소개 부분입니다. 끗=================================-->


		</div>

		<!-- ^allfor you -->


		<!--==============================footer 하단입니다.여기 밑은 볼필요없어요=================================-->
		<footer>
		<div class="container_12">
			<div class="grid_12">
				<div class="socials">
					<a href="https://ko-kr.facebook.com/" class="fa fa-facebook"></a> <a
						href="https://twitter.com/" class="fa fa-twitter"></a> <a
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
		<!-- ****************************** booking java script ************************************************* -->
		<script>
			$(function() {
				$('#bookingForm').bookingForm({
					ownerEmail : '#'
				});
			})
			$(function() {
				$('#bookingForm input, #bookingForm textarea').placeholder();
			});
		</script>
		<script type="text/javascript">
			//번호입력 하이픈 자동생성
			function OnCheckPhone(oTa) {
				var oForm = oTa.form;
				var sMsg = oTa.value;
				var onlynum = "";
				var imsi = 0;
				onlynum = RemoveDash2(sMsg); //하이픈 입력시 자동으로 삭제함 
				onlynum = checkDigit(onlynum); // 숫자만 입력받게 함 
				var retValue = "";

				if (event.keyCode != 12) {
					if (onlynum.substring(0, 2) == 02) { // 서울전화번호일 경우  10자리까지만 나타나교 그 이상의 자리수는 자동삭제 
						if (GetMsgLen(onlynum) <= 1)
							oTa.value = onlynum;
						if (GetMsgLen(onlynum) == 2)
							oTa.value = onlynum + "-";
						if (GetMsgLen(onlynum) == 4)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 3);
						if (GetMsgLen(onlynum) == 4)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 4);
						if (GetMsgLen(onlynum) == 5)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 5);
						if (GetMsgLen(onlynum) == 6)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 6);
						if (GetMsgLen(onlynum) == 7)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 5) + "-"
									+ onlynum.substring(5, 7);
						;
						if (GetMsgLen(onlynum) == 8)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 6) + "-"
									+ onlynum.substring(6, 8);
						if (GetMsgLen(onlynum) == 9)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 5) + "-"
									+ onlynum.substring(5, 9);
						if (GetMsgLen(onlynum) == 10)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 6) + "-"
									+ onlynum.substring(6, 10);
						if (GetMsgLen(onlynum) == 11)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 6) + "-"
									+ onlynum.substring(6, 10);
						if (GetMsgLen(onlynum) == 12)
							oTa.value = onlynum.substring(0, 2) + "-"
									+ onlynum.substring(2, 6) + "-"
									+ onlynum.substring(6, 10);
					}
					if (onlynum.substring(0, 2) == 05) { // 05로 시작되는 번호 체크 
						if (onlynum.substring(2, 3) == 0) { // 050으로 시작되는지 따지기 위한 조건문 
							if (GetMsgLen(onlynum) <= 3)
								oTa.value = onlynum;
							if (GetMsgLen(onlynum) == 4)
								oTa.value = onlynum + "-";
							if (GetMsgLen(onlynum) == 5)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 5);
							if (GetMsgLen(onlynum) == 6)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 6);
							if (GetMsgLen(onlynum) == 7)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 7);
							if (GetMsgLen(onlynum) == 8)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 8);
							if (GetMsgLen(onlynum) == 9)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 7) + "-"
										+ onlynum.substring(7, 9);
							;
							if (GetMsgLen(onlynum) == 10)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 8) + "-"
										+ onlynum.substring(8, 10);
							if (GetMsgLen(onlynum) == 11)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 7) + "-"
										+ onlynum.substring(7, 11);
							if (GetMsgLen(onlynum) == 12)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 8) + "-"
										+ onlynum.substring(8, 12);
							if (GetMsgLen(onlynum) == 13)
								oTa.value = onlynum.substring(0, 4) + "-"
										+ onlynum.substring(4, 8) + "-"
										+ onlynum.substring(8, 12);
						} else {
							if (GetMsgLen(onlynum) <= 2)
								oTa.value = onlynum;
							if (GetMsgLen(onlynum) == 3)
								oTa.value = onlynum + "-";
							if (GetMsgLen(onlynum) == 4)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 4);
							if (GetMsgLen(onlynum) == 5)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 5);
							if (GetMsgLen(onlynum) == 6)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 6);
							if (GetMsgLen(onlynum) == 7)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 7);
							if (GetMsgLen(onlynum) == 8)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 6) + "-"
										+ onlynum.substring(6, 8);
							;
							if (GetMsgLen(onlynum) == 9)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 7) + "-"
										+ onlynum.substring(7, 9);
							if (GetMsgLen(onlynum) == 10)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 6) + "-"
										+ onlynum.substring(6, 10);
							if (GetMsgLen(onlynum) == 11)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 7) + "-"
										+ onlynum.substring(7, 11);
							if (GetMsgLen(onlynum) == 12)
								oTa.value = onlynum.substring(0, 3) + "-"
										+ onlynum.substring(3, 7) + "-"
										+ onlynum.substring(7, 11);
						}
					}

					if (onlynum.substring(0, 2) == 03
							|| onlynum.substring(0, 2) == 04
							|| onlynum.substring(0, 2) == 06
							|| onlynum.substring(0, 2) == 07
							|| onlynum.substring(0, 2) == 08) { // 서울전화번호가 아닌 번호일 경우(070,080포함 // 050번호가 문제군요) 
						if (GetMsgLen(onlynum) <= 2)
							oTa.value = onlynum;
						if (GetMsgLen(onlynum) == 3)
							oTa.value = onlynum + "-";
						if (GetMsgLen(onlynum) == 4)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 4);
						if (GetMsgLen(onlynum) == 5)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 5);
						if (GetMsgLen(onlynum) == 6)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 6);
						if (GetMsgLen(onlynum) == 7)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7);
						if (GetMsgLen(onlynum) == 8)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 6) + "-"
									+ onlynum.substring(6, 8);
						;
						if (GetMsgLen(onlynum) == 9)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7) + "-"
									+ onlynum.substring(7, 9);
						if (GetMsgLen(onlynum) == 10)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 6) + "-"
									+ onlynum.substring(6, 10);
						if (GetMsgLen(onlynum) == 11)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7) + "-"
									+ onlynum.substring(7, 11);
						if (GetMsgLen(onlynum) == 12)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7) + "-"
									+ onlynum.substring(7, 11);

					}
					if (onlynum.substring(0, 2) == 01) { //휴대폰일 경우 
						if (GetMsgLen(onlynum) <= 2)
							oTa.value = onlynum;
						if (GetMsgLen(onlynum) == 3)
							oTa.value = onlynum + "-";
						if (GetMsgLen(onlynum) == 4)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 4);
						if (GetMsgLen(onlynum) == 5)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 5);
						if (GetMsgLen(onlynum) == 6)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 6);
						if (GetMsgLen(onlynum) == 7)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7);
						if (GetMsgLen(onlynum) == 8)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7) + "-"
									+ onlynum.substring(7, 8);
						if (GetMsgLen(onlynum) == 9)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7) + "-"
									+ onlynum.substring(7, 9);
						if (GetMsgLen(onlynum) == 10)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 6) + "-"
									+ onlynum.substring(6, 10);
						if (GetMsgLen(onlynum) == 11)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7) + "-"
									+ onlynum.substring(7, 11);
						if (GetMsgLen(onlynum) == 12)
							oTa.value = onlynum.substring(0, 3) + "-"
									+ onlynum.substring(3, 7) + "-"
									+ onlynum.substring(7, 11);
					}

					if (onlynum.substring(0, 1) == 1) { // 1588, 1688등의 번호일 경우 
						if (GetMsgLen(onlynum) <= 3)
							oTa.value = onlynum;
						if (GetMsgLen(onlynum) == 4)
							oTa.value = onlynum + "-";
						if (GetMsgLen(onlynum) == 5)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 5);
						if (GetMsgLen(onlynum) == 6)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 6);
						if (GetMsgLen(onlynum) == 7)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 7);
						if (GetMsgLen(onlynum) == 8)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 8);
						if (GetMsgLen(onlynum) == 9)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 8);
						if (GetMsgLen(onlynum) == 10)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 8);
						if (GetMsgLen(onlynum) == 11)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 8);
						if (GetMsgLen(onlynum) == 12)
							oTa.value = onlynum.substring(0, 4) + "-"
									+ onlynum.substring(4, 8);
					}
				}
			}

			function RemoveDash2(sNo) {
				var reNo = ""
				for (var i = 0; i < sNo.length; i++) {
					if (sNo.charAt(i) != "-") {
						reNo += sNo.charAt(i)
					}
				}
				return reNo
			}

			function GetMsgLen(sMsg) { // 0-127 1byte, 128~ 2byte 
				var count = 0
				for (var i = 0; i < sMsg.length; i++) {
					if (sMsg.charCodeAt(i) > 127) {
						count += 2
					} else {
						count++
					}
				}
				return count
			}

			function checkDigit(num) {
				var Digit = "1234567890";
				var string = num;
				var len = string.length
				var retVal = "";

				for (i = 0; i < len; i++) {
					if (Digit.indexOf(string.substring(i, i + 1)) >= 0) {
						retVal = retVal + string.substring(i, i + 1);
					}
				}
				return retVal;
			}

			function check_key() {//키값확인
				var char_ASCII = event.keyCode;

				//숫자
				if (char_ASCII >= 48 && char_ASCII <= 57)
					return 1;
				//영어
				else if ((char_ASCII >= 65 && char_ASCII <= 90)
						|| (char_ASCII >= 97 && char_ASCII <= 122
								|| char_ASCII == 8 || char_ASCII == 13
								|| char_ASCII == 21 || char_ASCII == 27
								|| char_ASCII == 17 || char_ASCII == 37
								|| char_ASCII == 38 || char_ASCII == 39
								|| char_ASCII == 40 || char_ASCII == 46))
					return 2;
				//특수기호
				else if ((char_ASCII >= 33 && char_ASCII <= 47)
						|| (char_ASCII >= 58 && char_ASCII <= 64)
						|| (char_ASCII >= 91 && char_ASCII <= 96)
						|| (char_ASCII >= 123 && char_ASCII <= 126))
					return 4;
				//한글
				else if ((char_ASCII >= 12592) || (char_ASCII <= 12687))
					return 3;
				else
					return 0;
			}

			function nonHangulSpecialKey() {//텍스트 박스에 숫자와 영문만 입력할수있도록

				if (check_key() != 1 && check_key() != 2) {
					event.returnValue = false;
					alert("숫자나 영문자만 입력하세요!");
					return;
				}
			}
		</script>



		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3"></script>
		<script>
/* 		var list = new Array();
		var obj = {
		 name:'홍길동',
		 address:'서울시...'
		};
		list.push(obj);
		for(var i=0;i<list.length;i++){
			var obj =list[i];
			for(var key in obj){
				var val=obj[key];
			}
		} */
		
 		var hmlist = new Array();
		<c:forEach items="${listmap}" var="item1">
		var mapobj = {
				name : '${item1.name}',
				lat : '${item1.lat}',
				lng : '${item1.lng}'
		};
		hmlist.push(mapobj);
		</c:forEach>
		
		
/* 		var temp;
		for (var i = 0; i < hmlist.length; i++) {
			temp = new daum.maps.LatLng(hmlist[i].lat, hmlist[i].lng);
			alert(temp);
		}
		 */
		
/* 		
		for (var i = 0; i < hmlist.length; i++) {
			var obj =hmlist[i];
			for(var key in obj){
				var val=obj[key];
				alert(val);
			}
		}
	 */
		
			var mapContainerhot = document.getElementById('minimap5'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
				level : 10
			// 지도의 확대 레벨
			};
			var hotmap = new daum.maps.Map(mapContainerhot, mapOption); // 지도를 생성합니다

			
			
			var mapContainer = document.getElementById('minimap1'), // 지도를 표시할 div  
			mapOption = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
				level : 10
			// 지도의 확대 레벨
			};
			var mapContainer2 = document.getElementById('minimap2'), // 지도를 표시할 div  
			mapOption2 = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
				level : 10
			// 지도의 확대 레벨
			};
			var mapContainer3 = document.getElementById('minimap3'), // 지도를 표시할 div  
			mapOption3 = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
				level : 9
			// 지도의 확대 레벨
			};
			var mapContainer4 = document.getElementById('minimap4'), // 지도를 표시할 div  
			mapOption4 = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
				level : 11
			// 지도의 확대 레벨
			};
			var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 생성합니다
			var map2 = new daum.maps.Map(mapContainer2, mapOption2); // 지도를 생성합니다
			var map3 = new daum.maps.Map(mapContainer3, mapOption3); // 지도를 생성합니다
			var map4 = new daum.maps.Map(mapContainer4, mapOption4); // 지도를 생성합니다
			// 지도 타입 변경 컨트롤을 생성한다
			var mapTypeControl = new daum.maps.MapTypeControl();
			var mapTypeControl2 = new daum.maps.MapTypeControl();
			var mapTypeControl3 = new daum.maps.MapTypeControl();
			var mapTypeControl4 = new daum.maps.MapTypeControl();
			var mapTypeControl5 = new daum.maps.MapTypeControl();
			// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
		    hotmap.addControl(mapTypeControl5, daum.maps.ControlPosition.TOPRIGHT);
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);
			map2
					.addControl(mapTypeControl2,
							daum.maps.ControlPosition.TOPRIGHT);
			map3
					.addControl(mapTypeControl3,
							daum.maps.ControlPosition.TOPRIGHT);
			map4
					.addControl(mapTypeControl4,
							daum.maps.ControlPosition.TOPRIGHT);

			//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
			hotmap.setMapTypeId(daum.maps.MapTypeId.HYBRID);
			map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
			map2.setMapTypeId(daum.maps.MapTypeId.HYBRID);
			map3.setMapTypeId(daum.maps.MapTypeId.HYBRID);
			map4.setMapTypeId(daum.maps.MapTypeId.HYBRID);
			var surfList = ["http://place.map.daum.net/9461977", "http://place.map.daum.net/23397740","http://place.map.daum.net/21135119","http://place.map.daum.net/25285071","http://place.map.daum.net/8413659",
				"http://place.map.daum.net/11332661","http://place.map.daum.net/8100102","http://place.map.daum.net/7863269","http://place.map.daum.net/10793668","http://place.map.daum.net/23150855","http://place.map.daum.net/21500227"];
	
			var hotpositions = [];
			for (var i = 0; i < hmlist.length; i++) {
				var getposition = new daum.maps.LatLng(hmlist[i].lat, hmlist[i].lng);
				
				hotpositions[i] = {
						content :'<div class="customoverlay">'
							+ '  <a href="'+surfList[i]+'" target="_blank">'
							+ '    <span class="title">'+hmlist[i].name+ '</span>'
							+ '  </a>' + '</div>',
						latlng : getposition
				};
				
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
			}
			
			new daum.maps.LatLng(33.37137, 126.56695)
			var n = 0;
			setInterval(function() {
				if (n <= 9) {
					hotmap.panTo(hotpositions[n].latlng);
					hotmap.setLevel(8, {anchor: hotpositions[n].latlng});
					setTimeout(function() {
						hotmap.setLevel(10);
						hotmap.panTo(new daum.maps.LatLng(33.37137, 126.56695));
						}, 2000);
					n++;
				} else {
					n = 0;
				}
				
				// 지도 레벨을 4로 설정하고 특정 좌표를 기준으로 확대 또는 축소되도록 한다
				hotmap.setLevel(8, {anchor: hotpositions[n].latlng});

			}, 3500);
			
			/* // 지도에 확대 축소 컨트롤을 생성한다
			 var zoomControl = new daum.maps.ZoomControl();
			 var zoomControl2 = new daum.maps.ZoomControl();
			 var zoomControl3 = new daum.maps.ZoomControl();
			 var zoomControl4 = new daum.maps.ZoomControl();
			 // 지도의 우측에 확대 축소 컨트롤을 추가한다
			 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT); 
			 map2.addControl(zoomControl2, daum.maps.ControlPosition.RIGHT); 
			 map3.addControl(zoomControl3, daum.maps.ControlPosition.RIGHT); 
			 map4.addControl(zoomControl4, daum.maps.ControlPosition.RIGHT);  */
			// 마커를 표시할 위치와 내용을 가지고 있는 객체 배열입니다 
			var positions = [
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">제주시청</span>'
								+ '  </a>' + '</div>',
						latlng : temp
					},
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">섭지코지</span>'
								+ '  </a>' + '</div>',
						latlng : new daum.maps.LatLng(33.42377208326678,
								126.93045722895785)
					},
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">성산 일출봉</span>'
								+ '  </a>' + '</div>',
						latlng : new daum.maps.LatLng(33.45943569514741,
								126.93968216363504)
					},
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">한라산</span>'
								+ '  </a>' + '</div>',
						latlng : new daum.maps.LatLng(33.36083380810028,
								126.53581319393376)
					} ];

			var latlng = new daum.maps.LatLng(37, 127);

			for (var i = 0; i < positions.length; i++) {
				// 마커를 생성합니다
				var marker = new daum.maps.Marker({
					map : map, // 마커를 표시할 지도
					clickable : true,
					position : positions[i].latlng
				// 마커의 위치
				});
				var marker2 = new daum.maps.Marker({
					map : map2, // 마커를 표시할 지도
					clickable : true,
					position : positions[i].latlng
				// 마커의 위치
				});
				var marker3 = new daum.maps.Marker({
					map : map3, // 마커를 표시할 지도
					clickable : true,
					position : positions[i].latlng
				// 마커의 위치
				});
				var marker4 = new daum.maps.Marker({
					map : map4, // 마커를 표시할 지도
					clickable : true,
					position : positions[i].latlng
				// 마커의 위치
				});

				// 커스텀 오버레이를 생성합니다
				var customOverlay = new daum.maps.CustomOverlay({
					map : map,
					clickable : true,
					position : positions[i].latlng,
					content : positions[i].content,
					yAnchor : 1
				});
				var customOverlay2 = new daum.maps.CustomOverlay({
					map : map2,
					clickable : true,
					position : positions[i].latlng,
					content : positions[i].content,
					yAnchor : 1
				});
				var customOverlay3 = new daum.maps.CustomOverlay({
					map : map3,
					clickable : true,
					position : positions[i].latlng,
					content : positions[i].content,
					yAnchor : 1
				});
				var customOverlay4 = new daum.maps.CustomOverlay({
					map : map4,
					clickable : true,
					position : positions[i].latlng,
					content : positions[i].content,
					yAnchor : 1
				});

				customOverlay.setMap(null);
				customOverlay2.setMap(null);
				customOverlay3.setMap(null);
				customOverlay4.setMap(null);

				daum.maps.event.addListener(marker, 'click', makeOverListener(
						map, marker, customOverlay));
				daum.maps.event.addListener(marker2, 'click', makeOverListener(
						map2, marker, customOverlay2));
				daum.maps.event.addListener(marker3, 'click', makeOverListener(
						map3, marker, customOverlay3));
				daum.maps.event.addListener(marker4, 'click', makeOverListener(
						map4, marker, customOverlay4));
			}

			//인포윈도우를 표시하는 클로저를 만드는 함수입니다 
			function makeOverListener(map, marker, customOverlay) {
				return function() {
					customOverlay.setMap(map);
				};
			}

			//인포윈도우를 닫는 클로저를 만드는 함수입니다 
			function makeOutListener(customOverlay) {
				return function() {
					customOverlay.setMap(null);
				};
			}
		</script>
</body>
</html>

