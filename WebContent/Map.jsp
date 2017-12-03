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
	font-family: 'Malgun Gothic', dotum, '����', sans-serif;
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
		memberVO vo1 = null; // �г���
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
		
		int num;			�Խñ۹�ȣ
		String pgroup;		�����̸�
		String nick;		�ۼ��ڴг���
		int recom;			��õ��
		String day;			�ۼ���
		
		*/
	%>
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
	<!--==========================�α���/ȸ������ ����Դϴ�.==============================-->

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
					<td><input type="text" id="id" name="id" required
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

	<div class="allFor">
		<!-- ======SIDE MENU ���� �޴� �Դϴ�.===== -->
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
						<li><a href="#trip_form1" id="trip_pop" onclick="move()">��������õ �ޱ�</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- ======^SIDE MENU ���� �޴� ��===== -->
		<div class="allFor">

			<!--==============================header ���� �޴�=================================-->
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
			<!--==============================header ���� �޴� ��=================================-->

			<!--==============================Content=================================-->
			<div class="content">
				<div class="ic"></div>
				<h3 style="margin-left: 100px;!important">MAEK YOUR ROUT</h3>
				<span id="ya" style="margin-left: 100px; font-size:1.3em;">��Ÿ��� Ư���ִ� ���� ��Ʈ�� ����� ������!</span>
			<!-- </div>
			<div class="content">
				<div class="ic"></div>
				<div class="grid_12" style="margin-left: 100px;">
					<div clas="special_banner"
						style="background-color: red; position: absolute; width: 800px; height: 10px;">
						///���� ���� �Դϴ�///
						���� ���� �Դϴ�. <br>������ ����� ����?
					</div>
				</div>
			</div>
			<div class="content">
				<div class="ic"></div> -->
				<div class="map_wrap choice">
					<div id="map" style="width: 100%; height: 100%;"></div>
				</div>
				<button onclick="ist()"
					style="margin-top: 80px; margin-left: 88%;font-family: SeoulNamsanEB; font-size:1.5em; 100px; position: relative; padding:10px; background-color: #C73430; border-color: #C73430; color:#FFFAF0; border-radius: 10%; ">����ϱ�</button>

				<!--====================================���� �Խ��� �����=======================================-->

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
		/* ������ �̱� */
		
				%>
				<span id="ya2" style="margin-left: 100px; font-size:1.6em; padding-bottom:30px;">���� : <span style="color:#002141;"><%= mlist.get(max).getPgroup()%></span>
				 &nbsp�ۼ��� : <span style="color:#002141;"><%= mlist.get(max).getNick()%></span>&nbsp ��õ�� : <span style="color:#002141;"><%= mlist.get(max).getRecom()%></span></span>
				<p></p>
				<div id="minimap6"></div>

				<div class="grid_12" style="margin-left: 150px; top: 50px;">
					<!-- ���� �Խ��� -->
					<h3 style="margin-left: 100px; ! important top: 0;">POST YOUR
						ROUT</h3>
					<table class="mapPost"
						style="margin: 20px; border: 1px solid #dddddd; text-align: center; width: 1300px; font-size: 1.2em;">
						<tr style="background-color: #002141; color: #F6F6F6;">
							<th>��ȣ</th>
							<th>���� �̸�</th>
							<th>�ۼ���</th>
							<th>�ۼ�����</th>
							<th>��õ ��</th>
							<th>��õ�ϱ�</th>
						</tr>

						<!-- 	/*  
	����Ʈ �̸��� mlist
	
	int num;			�Խñ۹�ȣ
	String pgroup;		�����̸�
	String nick;		�ۼ��ڴг���
	int recom;			��õ��
	String day;			�ۼ���
	
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
							<td><a href="MapBest?num=<%=mlist.get(i).getNum()%>&recom=<%=mlist.get(i).getRecom()%>"><span style="background-color: #;">��õ</span></a></td>
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

			<!--===================================^���� �Խ��� �����=======================================-->

			<!--================================����� ���� ��ũ��Ʈ ��!!======================================-->
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
			
			
			/* hotmap ���� */
			var mapContainerhot = document.getElementById('minimap6'), // ������ ǥ���� div  
			mapOption = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
				level : 10
			// ������ Ȯ�� ����
			};
			var hotmap = new daum.maps.Map(mapContainerhot, mapOption); // ������ �����մϴ�
			hotmap.setCenter(new daum.maps.LatLng(hmlist[0].lat, hmlist[0].lng));
			
			var linePath2 = [];
			var hotpositions = [];
			
			/* ������ ����� ���� */
			var cnt = 1;	//���������� ī��Ʈ���� ex : 1. ī�亣�� , 2. �츮��
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
				 linePath2.push(hotpositions[i].latlng);
				 if (i >= 1) {
						hotline();
					}
			}
			
			function hotline() {
				// ������ ǥ���� ���� �����մϴ�
				var polyline2 = new daum.maps.Polyline({
					path : linePath2, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
					strokeWeight : 5, // ���� �β� �Դϴ�
					strokeColor : '#F44336', // ���� �����Դϴ�
					strokeOpacity : 0.7, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
					strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
				});
				// ������ ���� ǥ���մϴ� 
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
			
			/*################## ��Ʈ�����script + �ʻ��� ################################*/
			
	
				var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
				mapOption = {
					center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
					level : 9
				// ������ Ȯ�� ����
				};

				var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

				// ������ Ŭ�������� Ŭ���� ��ġ�� ��Ŀ�� �߰��ϵ��� ������ Ŭ���̺�Ʈ�� ����մϴ�
				daum.maps.event.addListener(map, 'click', function(mouseEvent) {
					// Ŭ���� ��ġ�� ��Ŀ�� ǥ���մϴ� 
					addMarker(mouseEvent.latLng);
				});

				// ������ ǥ�õ� ��Ŀ ��ü�� ������ ���� �迭�Դϴ�
				var markers = [];
				var getposition;
				var infowindow;
				var titleok = false;
				// ��Ŀ�� �����ϰ� �������� ǥ���ϴ� �Լ��Դϴ�
				function addMarker(position) {

					if (markers.length == 0) {
						getposition = position;
						// ��Ŀ�� �����մϴ�
						var marker = new daum.maps.Marker({
							position : position
						});
						console.log(markers.length);
						// ��Ŀ�� ���� ���� ǥ�õǵ��� �����մϴ�
						markers.push(marker);
						markers[0].setMap(map);

						if (!titleok) {
							titleok = true;
							// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
							infowindow = new daum.maps.InfoWindow(
									{
										content : '�������� ������ �Է��ϼ���.<br><input type="text" id = "tname"><button id="button1" onclick="o();">��!</button><button id="button1" onclick="no();">�ٽ��ҷ�!</button>' // ���������쿡 ǥ���� ����
									});
							infowindow.open(map, marker);
						} else {
							// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
							infowindow = new daum.maps.InfoWindow(
									{
										content : '�� ����� �̸���?<br><input type="text" id = "title"><button id="button1" onclick="ok();">��!</button><button id="button1" onclick="no();">�ٽ��ҷ�!</button>' // ���������쿡 ǥ���� ����
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
				//���� �����ϴ� ��ǥ �迭�Դϴ�. �� ��ǥ���� �̾ ���� ǥ���մϴ�
				var linePath = [];
				var pok = "f";
				function ist() {
					pok = "t";
					send();
				}
				function o() {
					pgroup = document.getElementById("tname").value;
					alert("�̹� �����ǿ��� ������ " + pgroup + " �Դϴ�. ���� �����غ�����!");
					markers[0].setMap(null);
					infowindow.close();
					markers = [];
				}

				function ok() {
					pname = document.getElementById("title").value;
					infowindow
							.setContent('�� ��Ҵ� � �� �ΰ���?<br><input type="text" id = "pcon"><button id="button1" onclick="ok2();">��!</button><button id="button1" onclick="no();">�ٽ��ҷ�!</button>');
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
								alert("�ۼ��Ϸ�!!");
								location.reload();
							} else if (data == "nologin") {
								alert("�α����� �ʿ��� �۾��Դϴ�.");
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

					// ��Ŀ�� �����մϴ�
					var marker2 = new daum.maps.Marker({
						position : position
					});
					markers2.push(marker2);
					for (var i = 0; i < markers2.length; i++) {
						markers2[i].setMap(map);
					}

					// ��Ŀ�� ǥ���� ���������츦 �����մϴ� 
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
					// ������ ǥ���� ���� �����մϴ�
					var polyline = new daum.maps.Polyline({
						path : linePath, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
						strokeWeight : 5, // ���� �β� �Դϴ�
						strokeColor : '#F44336', // ���� �����Դϴ�
						strokeOpacity : 0.7, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
						strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
					});
					daum.maps.event.addListener(polyline, 'mouseover',
							function(mouseEvent) {
								//alert("d");
							});
					// ������ ���� ǥ���մϴ� 
					polyline.setMap(map);

					// ���콺 Ŭ������ �׸� ���� ��ǥ �迭�� ���ɴϴ�
					var path = polyline.getPath();

					// ���� �����ϴ� ��ǥ�� ������ 2�� �̻��̸�
					if (path.length > 1) {

						var distance = Math.round(polyline.getLength()), // ���� �� �Ÿ��� ����մϴ�
						content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�

						// �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
						showDistance(content, path[path.length - 1]);

					}

				}
				var distanceOverlay; // ���� �Ÿ������� ǥ���� Ŀ���ҿ������� �Դϴ�
				//���콺 �巡�׷� �׷����� �ִ� ���� �ѰŸ� ������ ǥ���ϰ�
				//���콺 ������ Ŭ������ �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϰ� ������ ǥ���ϴ� �Լ��Դϴ�
				function showDistance(content, position) {

					if (distanceOverlay) { // Ŀ���ҿ������̰� ������ �����̸�

						// Ŀ���� ���������� ��ġ�� ǥ���� ������ �����մϴ�
						distanceOverlay.setPosition(position);
						distanceOverlay.setContent(content);

					} else { // Ŀ���� �������̰� �������� ���� �����̸�

						// Ŀ���� �������̸� �����ϰ� ������ ǥ���մϴ�
						distanceOverlay = new daum.maps.CustomOverlay({
							map : map, // Ŀ���ҿ������̸� ǥ���� �����Դϴ�
							content : content, // Ŀ���ҿ������̿� ǥ���� �����Դϴ�
							position : position, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
							xAnchor : 0,
							yAnchor : 0,
							zIndex : 3
						});
					}
				}

				//���콺 ��Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
				//�׷��� ���� �ѰŸ� ������ �Ÿ��� ���� ����, ������ �ð��� ����Ͽ�
				//HTML Content�� ����� �����ϴ� �Լ��Դϴ�
				function getTimeHTML(distance) {

					// ������ �ü��� ��� 4km/h �̰� ������ �м��� 67m/min�Դϴ�
					var walkkTime = distance / 67 | 0;
					var walkHour = '', walkMin = '';

					// ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
					if (walkkTime > 60) {
						walkHour = '<span class="number">'
								+ Math.floor(walkkTime / 60) + '</span>�ð� '
					}
					walkMin = '<span class="number">' + walkkTime % 60
							+ '</span>��'

					// �������� ��� �ü��� 16km/h �̰� �̰��� �������� �������� �м��� 267m/min�Դϴ�
					var bycicleTime = distance / 227 | 0;
					var bycicleHour = '', bycicleMin = '';

					// ����� ������ �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
					if (bycicleTime > 60) {
						bycicleHour = '<span class="number">'
								+ Math.floor(bycicleTime / 60) + '</span>�ð� '
					}
					bycicleMin = '<span class="number">' + bycicleTime % 60
							+ '</span>��'

					// �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
					var content = '<ul class="dotOverlay distanceInfo">';
					content += '    <li>';
					content += '        <span class="label">�ѰŸ�</span><span class="number">'
							+ distance + '</span>m';
					content += '    </li>';
					content += '    <li>';
					content += '        <span class="label">����</span>'
							+ walkHour + walkMin;
					content += '    </li>';
					content += '    <li>';
					content += '        <span class="label">������</span>'
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