<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html lang="en">
<head>
<title>Blog</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
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
</head>
<body>
	<div class="allFor">
		<!-- ======SIDE MENU===== -->
		<div class="grid_13">
			<img src="images/logo.png">
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
								<li><a href="Main.jsp">HOME</a></li>
								<li><a href="Index01_HotTour.html">HOT TOURS</a></li>
								<li><a href="index-2.html">SPECIAL OFFERS</a></li>
								<li class="current"><a href="index-3.html">BLOG</a></li>
								<li><a href="Index04_Map.jsp">CONTACTS</a></li>
							</ul>
						</nav>
						<div class="clear"></div>
					</div>
				</div>
				<div class="grid_12">
					<h1>
						<a href="index.html"> <img src="images/logo.png"
							alt="Your Happy Family">
						</a>
					</h1>
				</div>
			</div>
		</header>
		<!--==============================Content=================================-->
		<div class="content">
			<div class="ic"></div>
			<div class="container_12">
				<!--================ blogPost ================-->
				<div class="grid_12">
					<h3>Recent Posts</h3>				
						<div class="row">
							<table class="table table-striped"
								style="text-align: center; border: 1pxx solid #dddddd;">
								<thead>
									<tr>
										<th style="background-color: #eeeeee; text-align: center;">번호</th>
										<th style="background-color: #eeeeee; text-align: center;">제목</th>
										<th style="background-color: #eeeeee; text-align: center;">작성자</th>
										<th style="background-color: #eeeeee; text-align: center;">작성일</th>
									</tr>
								</thead>
								<tbody>
									<tr>
										<td>1</td>
										<td>안녕하세요</td>
										<td>홍길동</td>
										<td>2017-11-26</td>
									</tr>
								</tbody>
							</table>
							<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
						</div>		
				</div>

			</div>
			<!-- container_12 -->
			<!--================= ^blogPost ==================-->

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
		<script>
			$(function() {
				$('#bookingForm').bookingForm({
					ownerEmail : '#'
				});
			})
		</script>
</body>
</html>