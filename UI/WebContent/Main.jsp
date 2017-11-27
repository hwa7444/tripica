<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>Home</title>
<meta charset="utf-8">
<meta name="format-detection" content="telephone=no" />
<link rel="icon" href="images/favicon.ico">
<link rel="shortcut icon" href="images/favicon.ico" />
<link rel="stylesheet" href="booking/css/booking.css">
<link rel="stylesheet" href="css/camera.css">
<link rel="stylesheet" href="css/owl.carousel.css">
<link rel="stylesheet" href="css/style.css">
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
		<form action="LoginCon">
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
		<span>Join Us</span>
		<p>Please enter your details here</p>
		<form action="JoinCon">
			<table>
				<tr>
					<td>Login ID</td>
					<td><input type="text" name="id" required></td>
				</tr>
				<tr>
					<td>PassWord</td>
					<td><input type="password" name="pw" required></td>
				</tr>
				<tr>
					<td>Gender</td>
					<td>Male<input type="radio" name="gender" value="male"
						required>Female<input type="radio" name="gender"
						value="female" required></td>
				</tr>
				<tr>
					<td>Address</td>
					<td><input type="text" name="address" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="Join Us"
						class="submit" /></td>
				</tr>
			</table>
		</form>
		If you have account >><a href="#login_form" id="login_pop">Log In</a>
		<a class="close" href="#close"></a>
	</div>
	<!-- /join form -->

	<!--==========================try me==============================-->

	<!-- allfor you -->
	<div class="allFor">
		<!-- ======SIDE MENU===== -->
		<div class="grid_13">
			<img src="images/logo/tripickerLogo9.png">
			<ul>
				<li><a href="#login_form" id="login_pop">LOGIN</a></li>
				<li><a href="#join_form" id="join_pop">JOIN</a></li>
			</ul>
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
						<li><a href="Index01_HotTour.html">HOT TOURS</a></li>
						<li><a href="index-2.html">SPECIAL OFFERS</a></li>
						<li><a href="index-3.html">BLOG</a></li>
						<li><a href="Index04_Map.jsp">CONTACTS</a></li>
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
						<a href="#">여행더보기</a>
					</div>
				</div>
				<div data-src="images/Main/slide2.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">성산일출봉 겨울</h2>
						<div class="price">
							FROM <span>$2000</span>
						</div>
						<a href="#">LEARN MORE</a>
					</div>
				</div>
				<div data-src="images/slide2.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">산굼부리</h2>
						<div class="price">
							FROM <span>$1600</span>
						</div>
						<a href="#">LEARN MORE</a>
					</div>
				</div>
				<div data-src="images/slide1.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">실험용</h2>
						<div class="price">
							FROM <span>$2000</span>
						</div>
						<a href="#">LEARN MORE</a>
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
				<div class="grid_4">
					<div class="banner">
						<img src="images/ban_img1.jpg" alt="">
						<div class="label">
							<div class="title">236px</div>
							<div class="price">
								FROM<span>grid_4</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>

					</div>
				</div>

				<div class="grid_4">
					<div class="banner">
						<img src="images/ban_img2.jpg" alt="">
						<div class="label">
							<div class="title">GOA</div>
							<div class="price">
								FROM<span>$ 1.500</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="banner">
						<img src="images/ban_img3.jpg" alt="">
						<div class="label">
							<div class="title">PARIS</div>
							<div class="price">
								FROM<span>$ 1.600</span>
							</div>
							<a href="#">LEARN MORE</a>
						</div>
					</div>
				</div>
				<div class="clear"></div>
				<div class="container_12">
					<br> <br>
				</div>
				</div>


				<div class="container_12">
					<div class="grid_4">
						<div class="banner">
							<img src="images/ban_img1.jpg" alt="">
							<div class="label">
								<div class="title">236px</div>
								<div class="price">
									FROM<span>$ 1000</span>
								</div>
								<a href="#">LEARN MORE</a>
							</div>
						</div>
					</div>

					<div class="grid_4">
						<div class="banner">
							<img src="images/ban_img2.jpg" alt="">
							<div class="label">
								<div class="title">GOA</div>
								<div class="price">
									FROM<span>$ 1.500</span>
								</div>
								<a href="#">LEARN MORE</a>
							</div>
						</div>
					</div>
					<div class="grid_4">
						<div class="banner">
							<img src="images/ban_img3.jpg" alt="">
							<div class="label">
								<div class="title">PARIS</div>
								<div class="price">
									FROM<span>$ 1.600</span>
								</div>
								<a href="#">LEARN MORE</a>
							</div>
						</div>
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
			<div class="ic">More Website Templates @ TemplateMonster.com -
				February 10, 2014!</div>
				<div class="container_12">
					<!-- ============== welcome ===================== -->
					<div class="grid_4">
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
						Proin pharetra luctus diam, a scelerisque eros convallis

						<!-- ============== ^welcome ===================== -->
						<div class="grid_4">

							<img src="images/page2_img2.jpg" alt="" class="img_inner fleft">
							<div class="extra_wrapper">
								<div class="text1 col1">
									<a href="#">Barcelona</a>
								</div>
								<p>Cras facilisis, nulla vel viverra auctor, leo gna sodales
									felis, quis malesuada nibh odio ut velit. Proin pharetra luctus
									diam, a celerisque eros convallis accumsan.</p>
								Maecenas vehicula egestas venenatis. Duis massa elit, auctor non
								pellentesque vel <br> <a href="#" class="link1">LEARN
									MORE</a>
							</div>

						</div>
					</div>
					<h4>Clients’ Quotes</h4>
					<blockquote class="bq1">
						<img src="images/page1_img2.jpg" alt=""
							class="img_inner noresize fleft">
						<div class="extra_wrapper">
							<p>Duis massa elit, auctor non pellentesque vel, aliquet sit
								amet erat. Nullam eget dignissim nisi, aliquam feugiat nibh.</p>
							<div class="alright">
								<div class="col1">Miranda Brown</div>
								<a href="#" class="btn">More</a>
							</div>
						</div>
					</blockquote>
				</div>
			</div>
			
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
				$('#bookingForm input, #bookingForm textarea').placeholder();
			});
		</script>
</body>
</html>

