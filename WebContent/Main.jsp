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

<!-- map�ε带���� ����ȣ�� -->
<c:if test="${empty listmap}">
<jsp:forward page="MainmaploadService"/>
</c:if>
<!-- ////////////////////// -->

	<!-- ==========================�������� �˾�  �Դϴ�.============================ -->
	<!-- 1�� ���� ���� form -->
	<a href="#x" class="overlay2" id="trip_form1"></a>
	<div class="popup2">

		<div class="container_12">
			<span>SELECT YOUR TRAVEL TYPE</span><br>
			<p style="font-size: 1.4em;">����� ������ ��� ������ �����ϼ���!</p>
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
	<!--=====================================�������� ���� �ڹٽ�ũ��ƮJAVA SCRIPT===========================================-->
	<!-- 2�� ���� ����� �̵�-->
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
					var first1 = document.getElementById("first1"); /*���� : Activity*/
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first1").src;
					
					first1.src = "images/Activity/amu/A_amu_1.jpg"; /*���� : Activity_amu_1*/
					first2.src = "images/Activity/amu/A_amu_2.jpg"; /*���� : Activity_amu_2*/
					first3.src = "images/Activity/spo/A_spo_1.jpg"; /*���� : Activity_spo_1*/
					first4.src = "images/Activity/spo/A_spo_2.jpg"; /*���� : Activity_spo_2*/

				} else if (result1 == 2) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2"); /* ���� : Learning */
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first2").src;
					
					first1.src = "images/Learning/art/L_art_1.jpg"; /* ���� : Learning_art_1 */
					first2.src = "images/Learning/art/L_art_2.jpg"; /* ���� : Learning_art_2 */
					first3.src = "images/Learning/mus/L_mus_1.jpg"; /* ���� : Learning_mus_1 */
					first4.src = "images/Learning/mus/L_mus_2.jpg"; /* ���� : Learning_mus_1 */

				} else if (result1 == 3) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3"); /* ���� : Relaxation */
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first3").src;
					
					first1.src = "images/Relaxation/res/R_res_1.jpg"; /* ���� : Relaxation_res_1 */
					first2.src = "images/Relaxation/res/R_res_2.jpg"; /* ���� : Relaxation_res_2 */
					first3.src = "images/Relaxation/res/R_res_3.jpg"; /* ���� : Relaxation_res_3 */
					first4.src = "images/Relaxation/res/R_res_4.jpg"; /* ���� : Relaxation_res_4 */

				} else if (result1 == 4) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4"); /* ���� : View */
					type1 = document.getElementById("first4").src;
					 /*���� : �̹��� �� �Ѿ� ���� �κ�*/
					first1.src = "images/View/his/V_his_1.jpg"; /* ���� : View_his_1 */
					first2.src = "images/View/his/V_his_2.JPG"; /* ���� : View_his_2 */
					first3.src = "images/View/nat/V_nat_1.jpg"; /* ���� : View_nat_1 */
					first4.src = "images/View/nat/V_nat_2.JPG"; /* ���� : View_nat_2 */

				}
			} else if (aa == 2) {
				if (result1 == 1) {
					type2 = document.getElementById("first1").src;
			
					location.href = "TypeUpdateCon?type1=" + type1 + "&type2="
							+ type2; /*���� : TypeUpdateCon���� �̵�*/
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

	<!-- ==========================^�������� �˾� �����============================ -->

	<!--==========================�α���/ȸ�����Ը��â�Դϴ�.==============================-->

	<!-- login form -->
	<a href="#x" class="overlay" id="login_form2"></a>
	<div class="popup">
		<span>Warning!</span>
		<p>�α��� �� �̿밡���� ���� �Դϴ�.</p>
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
		<p>���̵�� ��й�ȣ�� �Է��ϼ���.</p>
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
		<p>�Ʒ��� �׸��� ä���ּ���.</p>
		<form action="JoinCon" method="post">
			<table>
				<tr>
					<td>���̵�</td>
					<td><input type="text" id="aa" name="id" required
						maxlength="10" size="10" onkeydown="nonHangulSpecialKey()">
						<button onclick="idCheck()">�ߺ�Ȯ��</button></td>
				</tr>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pw" required maxlength="10"></td>
				</tr>
				<tr>
					<td>�г���</td>
					<td><input type="text" name="nick" required maxlength="10"></td>
				</tr>
				<tr>
					<td>����</td>
					<td>����<input type="radio" name="gender" value="0" required>����<input
						type="radio" name="gender" value="1" required></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="text" name="phone" required
						onfocus="OnCheckPhone(this)" onKeyup="OnCheckPhone(this)" size=14></td>
				</tr>
				<tr>
					<td>����</td>
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
		<p>������ ���������� �Է��ϼ���</p>
		<form action="UpdateCon" method="post">
			<table>
				<tr>
					<td>��й�ȣ</td>
					<td><input type="password" name="pw" required maxlength="10"></td>
				</tr>
				<tr>
					<td>�г���</td>
					<td><input type="text" name="nick" required maxlength="10"></td>
				</tr>
				<tr>
					<td>��ȭ��ȣ</td>
					<td><input type="text" name="phone" required
						onfocus="OnCheckPhone(this)" onKeyup="OnCheckPhone(this)" size=14></td>
				</tr>
				<tr>
					<td>����</td>
					<td><input type="date" name="birth" required></td>
				</tr>
				<tr>
					<td colspan="2"><input type="submit" value="�������� ����"
						class="submit" /></td>
				</tr>
			</table>
		</form>
		<a class="close" href="#close"></a>
	</div>
	<!-- /update form -->

	<!--==========================�α���/ȸ������ ��� ��==============================-->

	<!-- allfor you -->
	<div class="allFor">
		<!-- ======SIDE MENU ���� �޴� â===== -->
		<div class="grid_13">
			<img src="images/logo/tripickerLogo9.png">
			<c:choose>
				<c:when test="${empty vo1.id}">
					<ul>
						<li><a href="#login_form" id="login_pop">�α���</a></li>
						<li><a href="#join_form" id="join_pop">ȸ������</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
						<li><h1 style="color: white;">${vo1.nick}��</h1></li>
						<li><a href="Logout.jsp" id="login_pop">�α׾ƿ�</a></li>
						<li><a href="#update_form" id="join_pop">������������</a></li>
						<li><a href="#trip_form1" id="trip_pop" onclick="move()">��������õ
								�ޱ�</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
			<!-- �������� ��ġ �ű�� -->
			<script type="text/javascript">
				function move() {
					document.getElementById("move").scrollIntoView(true);
				}
			</script>
		</div>

		<!-- ======^SIDE MENU===== -->
		<!--==============================header ���� �޴�â=================================-->
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

		<!--==============================^header ùȭ�鿡 ū ���� �����̵� ������ �κ�=================================-->
		<div class="slider_wrapper">
			<div id="camera_wrap" class="">
				<div data-src="images/Main/slide5.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">��ȣ�׿� �غ�</h2>
						<div class="price">
							&nbsp<span>���� �ϸ��� ���� �ʹٸ�?</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">�� ����</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">�� ����</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
				<div data-src="images/Main/slide2.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">������� ����</h2>
						<div class="price">
							&nbsp<span>���ο� ��굿�꿡�� ���ִ� �߰���!</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">�� ����</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">�� ����</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
				<div data-src="images/Main/slide3.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">�Ѷ�걹������</h2>
						<div class="price">
							&nbsp<span>���� ������ ����ʹٸ�?</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">�� ����</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">�� ����</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
				<div data-src="images/Main/slide4.jpg">
					<div class="caption fadeIn">
						<h2 class="mainLogo">���ɼ����屺����</h2>
						<div class="price">
							&nbsp<span>�������� ������ �غ������� ��å��!</span>
						</div>
						<%-- <c:choose>
							<c:when test="${empty vo1.id}">
						<a href="#login_form2">�� ����</a>
							</c:when>
							<c:otherwise>
							<a href="HotTour.jsp">�� ����</a>
							</c:otherwise>
						</c:choose> --%>
					</div>
				</div>
			</div>
		</div>

		<!--==============================Content ��������=================================-->
		<div class="content">
			<div class="ic"></div>
			<!-- ================= minimap5�����̵� �� �����̴� ��ٶ� ���� ��ºκ��Դϴ�. ====================== -->
			<div class="container_12">
				<h3>
					<span style="color: #C73430;">Hot</span> Map
				</h3>
				<h2 style="font-size: 1.3em;">�ֱ� �����ڵ��� �α� ������ �Դϴ�.</h2>
				<div class="grid_12">
					<!-- MINIMAP 1�� ����� ���� ��õ ��Ʈ -->
					<div
						style="background-color: lightblue; width: 930px; height: 460px;"
						id="minimap5"></div>
				</div>
			</div>
		</div>

		<div class="color" id="lastCon">
			<!-- ===========================this week choice �������� Ŀ�� �ø��� ������ ���ϴ� �κ��Դϴ�.=================================== -->
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
									style="text-shadow: 0.08em 0.08em 0.16em #193c46;">ī�Ḯ����</a>
							</div>
							<span
								style="color: #FFFAF0; font-size: 1.4em; text-shadow: 0.07em 0.07em 0.17em #193c46;">�����
								�̻� �ɵ�� �Բ� �λ����� �����!</span>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1" id="news2">
						<time datetime="2014-01-01">2<span></span></time>
						<div class="extra_wrapper">
							<div class="text1 col1">
								<a href="#" style="text-shadow: 0.08em 0.08em 0.16em #193c46;">��ȭ�غ�</a>
							</div>
							<span
								style="color: #FFFAF0; font-size: 1.4em; text-shadow: 0.07em 0.07em 0.17em #193c46;">�λ�������
								����� �ʹٸ� �� ���ߺ��� ��! </span>
						</div>
					</div>
				</div>
				<div class="grid_4">
					<div class="block1" id="news3">
						<time datetime="2014-01-01">3<span></span></time>
						<div class="extra_wrapper">
							<div class="text1 col1">
								<a href="#" style="text-shadow: 0.08em 0.08em 0.16em #193c46;">�����б�</a>
							</div>
							<span
								style="color: #FFFAF0; font-size: 1.4em; text-shadow: 0.07em 0.07em 0.17em #193c46;">
								�˷ϴ޷� �̻� ������ ģ��, ���ΰ� �Բ� �� ��! </span>
						</div>
					</div>
				</div>


			</div>
		</div>
		<!-- ===========================^this week choice �������� Ŀ�� �ø��� ������ ���ϴ� �κ� �ڹٽ�ũ��Ʈ=================================== -->
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
		<!-- ===========================^this week choice �������� Ŀ�� �ø��� ������ ���ϴ� �κ��Դϴ�. ��=================================== -->
		<!--==============================minimap 1 2 3 4�� �� 4�� ��� ���� �κ��Դϴ�.=================================-->
		<div class="content">
			<div class="ic"></div>
			<!-- <div class="container_12">
				<h3>Recommend</h3>
				<h2 style="font-size: 1.3em;">��� ���� ���� ��õ���� ��Ʈ �Դϴ�.</h2>
				<div class="grid_6">
					MINIMAP 1�� ����� ���� ��õ ��Ʈ
					<div id="minimap1"></div>
				</div>
				<div class="grid_6">
					MINIMAP 2�� ����� ���� ��õ ��Ʈ
					<div id="minimap2"></div>
				</div>
			</div>

			<div class="clear"></div>
			<div class="container_12">

				<h3>Tirpicker's Choice</h3>
				<h2 style="font-size: 1.3em;">���� ����Ʈ�� ��õ�ϴ� ���� ��Ʈ �Դϴ�.</h2>
				<div class="grid_6">
					MINIMAP 3�� �츮����Ʈ ��ü ��õ ��Ʈ
					<div id="minimap3"></div>
				</div>
				<div class="grid_6">
					MINIMAP 4�� �츮����Ʈ ��ü ��õ ��Ʈ
					<div id="minimap4"></div>
				</div>

			</div>

			<div class="clear"></div>
			==============================minimap 1 2 3 4�� �� 4�� ��� ���� �κ��Դϴ�. ��================================= -->

			<div class="container_12">
				<h3 style="top: 0;">Welcome!</h3>
				<div class="grid_5 suffix_1">

					<div style="width: 320px; height: 460px; font-size: 1.3em;">
						<span><p style="margin-bottom: 3px;">���� Tripicker�� �����
								������ ������ ��</p>
							<p style="margin-bottom: 3px;">���� ������ �����Ʈ ��õ ����Ʈ �Դϴ�.</p>
							<p style="margin-bottom: 3px;">������ ���� �������翡 �����Ͽ� ������ ��</p>
							<p style="margin: 0; padding: 0;">�� ��Ʈ ��õ �ް� ���� �ٳ������!</p></span> <br>
						<br>
						<p>
							<span style="color: #3e454c;">�ڻ���Ʈ �̿� �����</span>
						</p>
						<p>1. ȸ�� ������ �Ѵ�.</p>
						<p>
							2. �α��� �Ŀ� '������ ��õ�ޱ�'�� <span
								style="color: #C73430; font-size: 1.1em;">click!</span>
						</p>
						<p>3. ������ ��� ���� 1�� > 1�� �����ϱ�!</p>
						<p>4. ������ ��Ʈ ��õ�ޱ� ����!</p>
						<p>+ 'MAP DIY'���� ������ ��Ʈ�� ��������!</p>
						<p style="margin-bottom: 3px;">
							<span style="color: #C73430; font-size: 1em;">WHAT IS NEXT
								BEST POST?</span>
						</p>
						<p>���� BEST POST�� ����Դϴ�!</p>
						<p>+ ���� �ı⸦ ������ �Բ� 'POST'���� �����غ�����!</p>
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
							type="button" value="��" onclick="slide(-1)"> <input
							id="right" type="button" value="��" onclick="slide(1)"> -->
					</div>
				</div>
			</div>
			<!--container ��-->


			<!--===================================�̹��� �����̵� �ڹ� ��ũ��Ʈ=========================================-->
			<script type="text/javascript">
				var imgs = document.querySelectorAll("img.mySlides");
				var index = 0; //number(������)

				slide(index);

				//�̹����� �ð��ʸ��� �ٲ�� �ϴ� ��
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
					//���� �̹��� ���
					imgs[index].style.display = "block";
				}
			</script>
			<div class="clear"></div>
			<!--============================== welcome ����Ʈ �Ұ� �κ��Դϴ�. ��=================================-->


		</div>

		<!-- ^allfor you -->


		<!--==============================footer �ϴ��Դϴ�.���� ���� ���ʿ�����=================================-->
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
			//��ȣ�Է� ������ �ڵ�����
			function OnCheckPhone(oTa) {
				var oForm = oTa.form;
				var sMsg = oTa.value;
				var onlynum = "";
				var imsi = 0;
				onlynum = RemoveDash2(sMsg); //������ �Է½� �ڵ����� ������ 
				onlynum = checkDigit(onlynum); // ���ڸ� �Է¹ް� �� 
				var retValue = "";

				if (event.keyCode != 12) {
					if (onlynum.substring(0, 2) == 02) { // ������ȭ��ȣ�� ���  10�ڸ������� ��Ÿ���� �� �̻��� �ڸ����� �ڵ����� 
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
					if (onlynum.substring(0, 2) == 05) { // 05�� ���۵Ǵ� ��ȣ üũ 
						if (onlynum.substring(2, 3) == 0) { // 050���� ���۵Ǵ��� ������ ���� ���ǹ� 
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
							|| onlynum.substring(0, 2) == 08) { // ������ȭ��ȣ�� �ƴ� ��ȣ�� ���(070,080���� // 050��ȣ�� ��������) 
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
					if (onlynum.substring(0, 2) == 01) { //�޴����� ��� 
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

					if (onlynum.substring(0, 1) == 1) { // 1588, 1688���� ��ȣ�� ��� 
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

			function check_key() {//Ű��Ȯ��
				var char_ASCII = event.keyCode;

				//����
				if (char_ASCII >= 48 && char_ASCII <= 57)
					return 1;
				//����
				else if ((char_ASCII >= 65 && char_ASCII <= 90)
						|| (char_ASCII >= 97 && char_ASCII <= 122
								|| char_ASCII == 8 || char_ASCII == 13
								|| char_ASCII == 21 || char_ASCII == 27
								|| char_ASCII == 17 || char_ASCII == 37
								|| char_ASCII == 38 || char_ASCII == 39
								|| char_ASCII == 40 || char_ASCII == 46))
					return 2;
				//Ư����ȣ
				else if ((char_ASCII >= 33 && char_ASCII <= 47)
						|| (char_ASCII >= 58 && char_ASCII <= 64)
						|| (char_ASCII >= 91 && char_ASCII <= 96)
						|| (char_ASCII >= 123 && char_ASCII <= 126))
					return 4;
				//�ѱ�
				else if ((char_ASCII >= 12592) || (char_ASCII <= 12687))
					return 3;
				else
					return 0;
			}

			function nonHangulSpecialKey() {//�ؽ�Ʈ �ڽ��� ���ڿ� ������ �Է��Ҽ��ֵ���

				if (check_key() != 1 && check_key() != 2) {
					event.returnValue = false;
					alert("���ڳ� �����ڸ� �Է��ϼ���!");
					return;
				}
			}
		</script>



		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3"></script>
		<script>
/* 		var list = new Array();
		var obj = {
		 name:'ȫ�浿',
		 address:'�����...'
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
		
			var mapContainerhot = document.getElementById('minimap5'), // ������ ǥ���� div  
			mapOption = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
				level : 10
			// ������ Ȯ�� ����
			};
			var hotmap = new daum.maps.Map(mapContainerhot, mapOption); // ������ �����մϴ�

			
			
			var mapContainer = document.getElementById('minimap1'), // ������ ǥ���� div  
			mapOption = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
				level : 10
			// ������ Ȯ�� ����
			};
			var mapContainer2 = document.getElementById('minimap2'), // ������ ǥ���� div  
			mapOption2 = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
				level : 10
			// ������ Ȯ�� ����
			};
			var mapContainer3 = document.getElementById('minimap3'), // ������ ǥ���� div  
			mapOption3 = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
				level : 9
			// ������ Ȯ�� ����
			};
			var mapContainer4 = document.getElementById('minimap4'), // ������ ǥ���� div  
			mapOption4 = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
				level : 11
			// ������ Ȯ�� ����
			};
			var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�
			var map2 = new daum.maps.Map(mapContainer2, mapOption2); // ������ �����մϴ�
			var map3 = new daum.maps.Map(mapContainer3, mapOption3); // ������ �����մϴ�
			var map4 = new daum.maps.Map(mapContainer4, mapOption4); // ������ �����մϴ�
			// ���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
			var mapTypeControl = new daum.maps.MapTypeControl();
			var mapTypeControl2 = new daum.maps.MapTypeControl();
			var mapTypeControl3 = new daum.maps.MapTypeControl();
			var mapTypeControl4 = new daum.maps.MapTypeControl();
			var mapTypeControl5 = new daum.maps.MapTypeControl();
			// ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
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

			//����Ÿ�� ��Ʈ���� ���� �Ǵ� ��ī�̺� ��ư�� Ŭ���ϸ� ȣ��Ǿ� ����Ÿ���� �ٲٴ� �Լ��Դϴ�
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
				        map: hotmap, // ��Ŀ�� ǥ���� ����
				        clickable : true,
				        position: hotpositions[i].latlng // ��Ŀ�� ��ġ
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
				
				// ���� ������ 4�� �����ϰ� Ư�� ��ǥ�� �������� Ȯ�� �Ǵ� ��ҵǵ��� �Ѵ�
				hotmap.setLevel(8, {anchor: hotpositions[n].latlng});

			}, 3500);
			
			/* // ������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
			 var zoomControl = new daum.maps.ZoomControl();
			 var zoomControl2 = new daum.maps.ZoomControl();
			 var zoomControl3 = new daum.maps.ZoomControl();
			 var zoomControl4 = new daum.maps.ZoomControl();
			 // ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
			 map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT); 
			 map2.addControl(zoomControl2, daum.maps.ControlPosition.RIGHT); 
			 map3.addControl(zoomControl3, daum.maps.ControlPosition.RIGHT); 
			 map4.addControl(zoomControl4, daum.maps.ControlPosition.RIGHT);  */
			// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
			var positions = [
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">���ֽ�û</span>'
								+ '  </a>' + '</div>',
						latlng : temp
					},
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">��������</span>'
								+ '  </a>' + '</div>',
						latlng : new daum.maps.LatLng(33.42377208326678,
								126.93045722895785)
					},
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">���� �����</span>'
								+ '  </a>' + '</div>',
						latlng : new daum.maps.LatLng(33.45943569514741,
								126.93968216363504)
					},
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">�Ѷ��</span>'
								+ '  </a>' + '</div>',
						latlng : new daum.maps.LatLng(33.36083380810028,
								126.53581319393376)
					} ];

			var latlng = new daum.maps.LatLng(37, 127);

			for (var i = 0; i < positions.length; i++) {
				// ��Ŀ�� �����մϴ�
				var marker = new daum.maps.Marker({
					map : map, // ��Ŀ�� ǥ���� ����
					clickable : true,
					position : positions[i].latlng
				// ��Ŀ�� ��ġ
				});
				var marker2 = new daum.maps.Marker({
					map : map2, // ��Ŀ�� ǥ���� ����
					clickable : true,
					position : positions[i].latlng
				// ��Ŀ�� ��ġ
				});
				var marker3 = new daum.maps.Marker({
					map : map3, // ��Ŀ�� ǥ���� ����
					clickable : true,
					position : positions[i].latlng
				// ��Ŀ�� ��ġ
				});
				var marker4 = new daum.maps.Marker({
					map : map4, // ��Ŀ�� ǥ���� ����
					clickable : true,
					position : positions[i].latlng
				// ��Ŀ�� ��ġ
				});

				// Ŀ���� �������̸� �����մϴ�
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

			//���������츦 ǥ���ϴ� Ŭ������ ����� �Լ��Դϴ� 
			function makeOverListener(map, marker, customOverlay) {
				return function() {
					customOverlay.setMap(map);
				};
			}

			//���������츦 �ݴ� Ŭ������ ����� �Լ��Դϴ� 
			function makeOutListener(customOverlay) {
				return function() {
					customOverlay.setMap(null);
				};
			}
		</script>
</body>
</html>

