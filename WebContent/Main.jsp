<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
 <style>
/* css [line] */ 
.dot {overflow:hidden;float:left;width:12px;height:12px;background: url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/mini_circle.png');}    
.dotOverlay {position:relative;bottom:10px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;font-size:12px;padding:5px;background:#fff;}
.dotOverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}    
.number {font-weight:bold;color:#ee6152;}
.dotOverlay:after {content:'';position:absolute;margin-left:-6px;left:50%;bottom:-8px;width:11px;height:8px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white_small.png')}
.distanceInfo {position:relative;top:5px;left:5px;list-style:none;margin:0;}
.distanceInfo .label {display:inline-block;width:50px;}
.distanceInfo:after {content:none;}

/* css [customoverlay] */ 
.customoverlay {position:relative;bottom:85px;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;float:left;}
.customoverlay:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.customoverlay a {display:block;text-decoration:none;color:#000;text-align:center;border-radius:6px;font-size:14px;font-weight:bold;overflow:hidden;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.customoverlay .title {display:block;text-align:center;background:#fff;margin-right:35px;padding:10px 15px;font-size:14px;font-weight:bold;}
.customoverlay:after {content:'';position:absolute;margin-left:-12px;left:50%;bottom:-12px;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
</style>
<title>Home</title>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="booking/css/booking.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">


<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
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
</head>
<body class="page1" id="top">


	<!--==========================try me==============================-->
	<!-- login form -->
	<a href="#x" class="overlay" id="login_form"></a>
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



	<!-- join form -->
	<a href="#x" class="overlay" id="join_form"></a>
	<div class="popup">
		<span>회원가입</span>
		<p>Please enter your details here</p>
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
					<td colspan="2"><input type="submit" value="회원가입"
						class="submit" /></td>
				</tr>
			</table>
		</form>
		If you have account >><a href="#login_form" id="login_pop">Log In</a>
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
		<span>개인정보 수정</span>
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


	<!--==========================try me==============================-->

	<!-- allfor you -->
	<div class="allFor">
		<!-- ======SIDE MENU===== -->
		<div class="grid_13">
			<img src="images/logo/tripickerLogo9.png">
			<c:choose>
				<c:when test="${empty id}">

					<ul>
						<li><a href="#login_form" id="login_pop">로그인</a></li>
						<li><a href="#join_form" id="join_pop">회원가입</a></li>
					</ul>

				</c:when>

				<c:otherwise>
					<ul>
						<li><h1 style="color: white;">${nick}님</h1></li>
						<li><a href="Logout.jsp" id="login_pop">로그아웃</a></li>
						<li><a href="#update_form" id="join_pop">개인정보수정</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- ======^SIDE MENU===== -->
		<!--==============================header=================================-->
		<header>
		<div class="container_12">
			<div class="grid_12">
				<div class="menu_block">
					<nav class="horizontal-nav full-width horizontalNav-notprocessed">
					<ul class="sf-menu">
						<li class="current"><a href="Main.jsp">HOME</a></li>
						<li><a href="HotTour.jsp">HOT TOURS</a></li>
						<li><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
						<li><a href="SelectService?start=0&end=8">POST</a></li>
						<li><a href="Map.jsp">MAP INFO</a></li>
					</ul>
					</nav>
					<div class="clear"></div>
				</div>
			</div>
			<div class="grid_12">
				<h1>
					<a href="Main.jsp"> <img src="images/logo/tripickerLogo9.png"
						alt="Your Happy Family">
					</a>
				</h1>
			</div>
		</div>
		</header>

		<!--==============================^header=================================-->
		<div class="slider_wrapper">
			<div id="camera_wrap" class="">
				<div data-src="images/Main/slide1.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">성산일출봉 등반</h2>
						<div class="price">
							FROM <span>$1000</span>
						</div>
						<a href="tourInformation.jsp">여행더보기</a>
					</div>
				</div>
				<div data-src="images/Main/slide2.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">성산일출봉 겨울</h2>
						<div class="price">
							FROM <span>$2000</span>
						</div>
						<a href="tourInformation.jsp">여행더보기</a>
					</div>
				</div>
				<div data-src="images/slide2.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">산굼부리</h2>
						<div class="price">
							FROM <span>$1600</span>
						</div>
						<a href="tourInformation.jsp">LEARN MORE</a>
					</div>
				</div>
				<div data-src="images/slide1.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">실험용</h2>
						<div class="price">
							FROM <span>$2000</span>
						</div>
						<a href="tourInformation.jsp">LEARN MORE</a>
					</div>
				</div>
			</div>
		</div>

		<!--==============================Content=================================-->
		<div class="content">
			<div class="ic">More Website Templates @ TemplateMonster.com -
				February 10, 2014!</div>
			<!-- ================= banner ====================== -->
			<div class="container_12">
				<h3>Recommend</h3>

				<div class="grid_6"> <!-- MINIMAP 1번 사용자 맞춤 추천 루트 -->
					<div id="minimap1"></div>
				</div>
				<div class="grid_6"> <!-- MINIMAP 2번 사용자 맞춤 추천 루트 -->
					<div id="minimap2"></div>
				</div>
				</div>

<div class="clear"></div>
	<div class="container_12">
	
					<h3>Tirpicker's Choice</h3>
					<div class="grid_6"> <!-- MINIMAP 3번 우리사이트 자체 추천 루트 -->
						<div id="minimap3"></div>
					</div>
					<div class="grid_6"> <!-- MINIMAP 4번 우리사이트 자체 추천 루트 -->
						<div id="minimap4"></div>
					</div>

				
					<!-- ==================== ^banner ======================= -->
				</div>

				<div class="clear"></div>
			</div>
			<!-- allfor you -->
			<div class="allFor">

				<div class="color">
					<!-- =========================== Lastest News=================================== -->
					<div class="container_12" align="center">
						<div class="grid_12">
							<h3 class="head1">Latest News</h3>
						</div>
						<div class="grid_4">
							<div class="block1">
								<time datetime="2014-01-01">10<span>Jan</span></time>
								<div class="extra_wrapper">
									<div class="text1 col1">
										<a href="#">성산일출봉 투어</a>
									</div>
									하루동안 성산일출봉에서 시간을 보내세요
								</div>
							</div>
						</div>
						<div class="grid_4">
							<div class="block1">
								<time datetime="2014-01-01">21<span>Jan</span></time>
								<div class="extra_wrapper">
									<div class="text1 col1">
										<a href="#">효리네 일몰스팟</a>
									</div>
									효리네 민박집에서 나온 일몰이 멋있던 바닷가 방문하기
								</div>
							</div>
						</div>
						<div class="grid_4">
							<div class="block1">
								<time datetime="2014-01-01">15<span>Feb</span></time>
								<div class="extra_wrapper">
									<div class="text1 col1">
										<a href="#">uamnibh Edeto</a>
									</div>
									Ros convallisumsan. Maecenas vehicula egestas venenatis. Duis
									massa elit, auctor non
								</div>
							</div>
						</div>

						<!-- ===========================^Lastest News=================================== -->
					</div>
				</div>
				<!--==============================Content=================================-->
				<div class="content">
					<div class="ic">More Website Templates @ TemplateMonster.com
						- February 10, 2014!</div>
				<div class="container_12">
					<h3>statistical</h3>

					<div class="grid_4 suffix_1">
						<div
							style="background-color: lightgreen; width: 320px; height: 460px;"></div>
					</div>
					<div class="grid_7">
						<div
							style="background-color: lightblue; width: 560px; height: 460px;"></div>
					</div>
				</div>

				<div class="clear"></div>
	<div class="container_12">
	
					<h3>Tirpicker's Choice</h3>
					<div class="grid_6">
						<div style="background-color: lightblue; width: 460px; height: 460px;"></div>
					</div>
					<div class="grid_6">
						<div style="background-color: lightblue; width: 460px; height: 460px;"></div>
					</div>

				
					<!-- ==================== ^banner ======================= -->
				</div>
						<!-- ============== welcome ===================== -->
						<!-- <div class="grid_4">
							<h3>Welcome</h3>
							<img src="images/page2_img2.jpg" alt="" class="img_inner fleft">
							<div class="extra_wrapper">
								<p>Lorem ipsum dolor sit ere amet, consectetur ipiscin.</p>
								In mollis erat mattis neque facilisis, sit ametiol
							</div>
							<div class="clear cl1"></div>
							<p>
								Find the detailed description of this <span class="col1"><a
									href="http://blog.templatemonster.com/free-website-templates/"
									rel="dofollow">freebie</a></span> at TemplateMonster blog.
							</p>
							<p>
								<span class="col1"><a
									href="http://www.templatemonster.com/category/travel-website-templates/"
									rel="nofollow">Travel Website Templates</a></span> category offers you
								a variety of designs that are perfect for travel sphere of
								business.
							</p>
							랄랄ㄹ라라라라라라ㅏ -->
							
							<!--====================================video==================================-->
							
							
							<!--====================================^video==================================-->

							<!-- ============== ^welcome ===================== -->
							<!-- <h4>Clients’ Quotes</h4>
							<blockquote class="bq1">
								<img src="images/page1_img2.jpg" alt=""
									class="img_inner noresize fleft">
								<div class="extra_wrapper">
									<p>Duis massa elit, auctor non pellentesque vel, aliquet
										sit amet erat. Nullam eget dignissim nisi, aliquam feugiat
										nibh.</p>
									<div class="alright">
										<div class="col1">Miranda Brown</div>
										<a href="#" class="btn">More</a>
									</div>
								</div>
							</blockquote>
						</div> -->
					</div><!-- container_12 -->
					

					<!-- ^allfor you -->
				</div>

				<!--==============================footer=================================-->
				<footer>
				<div class="container_12">
					<div class="grid_12">
						<div class="socials">
							<a href="#" class="fa fa-facebook"></a> <a href="#"
								class="fa fa-twitter"></a> <a href="#" class="fa fa-google-plus"></a>
						</div>
						<div class="copy">
							Tripicker (c) 2017 | <a href="#">Privacy Policy</a> | Website
							Template Designed by <a href="http://www.templatemonster.com/"
								rel="nofollow">TemplateMonster.com</a>
						</div>
					</div>
				</div>
				</footer>
				<!-- ************* booking java script *********** -->
				<script>
					$(function() {
						$('#bookingForm').bookingForm({
							ownerEmail : '#'
						});
					})
					$(function() {
						$('#bookingForm input, #bookingForm textarea')
								.placeholder();
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
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 5);
									if (GetMsgLen(onlynum) == 6)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 6);
									if (GetMsgLen(onlynum) == 7)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 7);
									if (GetMsgLen(onlynum) == 8)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 8);
									if (GetMsgLen(onlynum) == 9)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 7)
												+ "-" + onlynum.substring(7, 9);
									;
									if (GetMsgLen(onlynum) == 10)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 8)
												+ "-"
												+ onlynum.substring(8, 10);
									if (GetMsgLen(onlynum) == 11)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 7)
												+ "-"
												+ onlynum.substring(7, 11);
									if (GetMsgLen(onlynum) == 12)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 8)
												+ "-"
												+ onlynum.substring(8, 12);
									if (GetMsgLen(onlynum) == 13)
										oTa.value = onlynum.substring(0, 4)
												+ "-" + onlynum.substring(4, 8)
												+ "-"
												+ onlynum.substring(8, 12);
								} else {
									if (GetMsgLen(onlynum) <= 2)
										oTa.value = onlynum;
									if (GetMsgLen(onlynum) == 3)
										oTa.value = onlynum + "-";
									if (GetMsgLen(onlynum) == 4)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 4);
									if (GetMsgLen(onlynum) == 5)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 5);
									if (GetMsgLen(onlynum) == 6)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 6);
									if (GetMsgLen(onlynum) == 7)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 7);
									if (GetMsgLen(onlynum) == 8)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 6)
												+ "-" + onlynum.substring(6, 8);
									;
									if (GetMsgLen(onlynum) == 9)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 7)
												+ "-" + onlynum.substring(7, 9);
									if (GetMsgLen(onlynum) == 10)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 6)
												+ "-"
												+ onlynum.substring(6, 10);
									if (GetMsgLen(onlynum) == 11)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 7)
												+ "-"
												+ onlynum.substring(7, 11);
									if (GetMsgLen(onlynum) == 12)
										oTa.value = onlynum.substring(0, 3)
												+ "-" + onlynum.substring(3, 7)
												+ "-"
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


<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3"></script>
<script>

var mapContainer = document.getElementById('minimap1'), // 지도를 표시할 div  
    mapOption = { 
		center: new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
        level: 10 // 지도의 확대 레벨
    };
var mapContainer2 = document.getElementById('minimap2'), // 지도를 표시할 div  
mapOption2 = { 
	center: new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
    level: 10 // 지도의 확대 레벨
};
var mapContainer3 = document.getElementById('minimap3'), // 지도를 표시할 div  
mapOption3 = { 
	center: new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
    level: 9 // 지도의 확대 레벨
};
var mapContainer4 = document.getElementById('minimap4'), // 지도를 표시할 div  
mapOption4 = { 
	center: new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
    level: 11 // 지도의 확대 레벨
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
// 지도의 상단 우측에 지도 타입 변경 컨트롤을 추가한다
map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);	
map2.addControl(mapTypeControl2, daum.maps.ControlPosition.TOPRIGHT);	
map3.addControl(mapTypeControl3, daum.maps.ControlPosition.TOPRIGHT);	
map4.addControl(mapTypeControl4, daum.maps.ControlPosition.TOPRIGHT);	

//지도타입 컨트롤의 지도 또는 스카이뷰 버튼을 클릭하면 호출되어 지도타입을 바꾸는 함수입니다
map.setMapTypeId(daum.maps.MapTypeId.HYBRID);
map2.setMapTypeId(daum.maps.MapTypeId.HYBRID);   
map3.setMapTypeId(daum.maps.MapTypeId.HYBRID);   
map4.setMapTypeId(daum.maps.MapTypeId.HYBRID);   


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
        content: '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">제주시청</span>' +
        '  </a>' +
        '</div>', 
        latlng: new daum.maps.LatLng(33.499565 , 126.531241)
    },
    {
        content: '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">섭지코지</span>' +
        '  </a>' +
        '</div>', 
        latlng: new daum.maps.LatLng(33.42377208326678, 126.93045722895785)
    },
    {
        content:  '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">성산 일출봉</span>' +
        '  </a>' +
        '</div>', 
        latlng: new daum.maps.LatLng(33.45943569514741, 126.93968216363504)
    },
    {
        content:  '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">한라산</span>' +
        '  </a>' +
        '</div>',
        latlng: new daum.maps.LatLng(33.36083380810028, 126.53581319393376)
    }
];


var latlng = new daum.maps.LatLng(37, 127);

for (var i = 0; i < positions.length; i ++) {
    // 마커를 생성합니다
    var marker = new daum.maps.Marker({
        map: map, // 마커를 표시할 지도
        clickable: true,
        position: positions[i].latlng // 마커의 위치
    });
    var marker2 = new daum.maps.Marker({
        map: map2, // 마커를 표시할 지도
        clickable: true,
        position: positions[i].latlng // 마커의 위치
    });
    var marker3 = new daum.maps.Marker({
        map: map3, // 마커를 표시할 지도
        clickable: true,
        position: positions[i].latlng // 마커의 위치
    });
    var marker4 = new daum.maps.Marker({
        map: map4, // 마커를 표시할 지도
        clickable: true,
        position: positions[i].latlng // 마커의 위치
    });


    // 커스텀 오버레이를 생성합니다
    var customOverlay = new daum.maps.CustomOverlay({
        map: map,
        clickable: true,
        position: positions[i].latlng,
        content: positions[i].content,
        yAnchor: 1 
    });
    var customOverlay2 = new daum.maps.CustomOverlay({
        map: map2,
        clickable: true,
        position: positions[i].latlng,
        content: positions[i].content,
        yAnchor: 1 
    });
    var customOverlay3 = new daum.maps.CustomOverlay({
        map: map3,
        clickable: true,
        position: positions[i].latlng,
        content: positions[i].content,
        yAnchor: 1 
    });
    var customOverlay4 = new daum.maps.CustomOverlay({
        map: map4,
        clickable: true,
        position: positions[i].latlng,
        content: positions[i].content,
        yAnchor: 1 
    });

    customOverlay.setMap(null);
    customOverlay2.setMap(null);
    customOverlay3.setMap(null);
    customOverlay4.setMap(null);
   

    daum.maps.event.addListener(marker, 'click', makeOverListener(map, marker, customOverlay));
    daum.maps.event.addListener(marker2, 'click', makeOverListener(map2, marker, customOverlay2));
    daum.maps.event.addListener(marker3, 'click', makeOverListener(map3, marker, customOverlay3));
    daum.maps.event.addListener(marker4, 'click', makeOverListener(map4, marker, customOverlay4));
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

