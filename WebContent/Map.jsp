<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
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
	left:70px;
	top:50px;
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
<title>Blog</title>
<meta charset="utf-8">
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
	<%
		String nick = null;
		if (session.getAttribute("nick") != null) {
			nick = (String) session.getAttribute("nick");
		}
	%>
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
	<!-- /login form -->



	<!-- join form -->
	<a href="#x" class="overlay" id="join_form"></a>
	<div class="popup">
		<span>ȸ������</span>
		<p>Please enter your details here</p>
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
					<td colspan="2"><input type="submit" value="ȸ������"
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
		<span>�������� ����</span>
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


	<!--==========================try me==============================-->
	<div class="allFor">
		<!-- ======SIDE MENU===== -->
		<div class="grid_13">
			<img src="images/logo/tripickerLogo9.png">
			<c:choose>
				<c:when test="${empty id}">

					<ul>
						<li><a href="#login_form" id="login_pop">�α���</a></li>
						<li><a href="#join_form" id="join_pop">ȸ������</a></li>
					</ul>



				</c:when>

				<c:otherwise>
					<ul>
						<li><h1 style="color: white;">${nick}��</h1></li>
						<li><a href="Logout.jsp" id="login_pop">�α׾ƿ�</a></li>
						<li><a href="#update_form" id="join_pop">������������</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
		</div>

		<!-- ======^SIDE MENU===== -->
		<div class="allFor">

			<!--==============================header=================================-->
			<header>
				<div class="container_12">
					<div class="grid_12">
						<div class="menu_block">
							<nav class="horizontal-nav full-width horizontalNav-notprocessed">
								<ul class="sf-menu">
									<li><a href="Main.jsp">HOME</a></li>
									<li><a href="HotTour.jsp">HOT TOURS</a></li>
									<li><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
									<li><a href="SelectService?start=0&end=8">Post</a></li>
									<li class="current"><a href="Map.jsp">Map Info</a></li>
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
			<!-- ^allfor you -->
		</div>
		<!--==============================Content=================================-->
		<div class="content">
			<div class="ic"></div>
			<h3 style="margin-left: 100px;!important">MAEK YOUR ROUT</h3>
		</div>
		<div class="content">
			<div class="ic"></div>	
				<div class="grid_12" style="margin-left: 100px;">
					<div clas="special_banner"
						style="background-color: red; position: absolute; width: 800px; height: 10px;"> <!--///���� ���� �Դϴ�///-->
						���� ���� �Դϴ�.
						<br>�ְ� ������ �� �������� ���� ���� �����Ҳ���!</div>
				</div>
		</div>
		<div class="content">
			<div class="ic"></div>
			<div class="map_wrap choice">
				<ul id="category">
					<li id="BK9" data-order="0"><span class="category_bg bank"></span>
						����</li>
					<li id="MT1" data-order="1"><span class="category_bg mart"></span>
						��Ʈ</li>
					<li id="PM9" data-order="2"><span class="category_bg pharmacy"></span>
						�౹</li>
					<li id="OL7" data-order="3"><span class="category_bg oil"></span>
						������</li>
					<li id="CE7" data-order="4"><span class="category_bg cafe"></span>
						ī��</li>
					<li id="CS2" data-order="5"><span class="category_bg store"></span>
						������</li>
					<li id="AD5" data-order="5"><span class="category_bg store"></span>
						����</li>
					<li id="AT4" data-order="5"><span class="category_bg store"></span>
						������</li>
					<li id="CT1" data-order="5"><span class="category_bg store"></span>
						��ȭ�ü�</li>
				</ul>
				<div id="map" style="width: 100%; height: 100%;"></div>
			</div>
			<button onclick="drawing()" style="margin-top:80px; margin-left:100px; position:relative;">�ҿ�ð������ϱ�</button>

		</div>
		
		<!--====================================���� �Խ��� �����=======================================-->
			<div class="content">
			<div class="ic"></div>
			<h3 style="margin-left: 100px;!important top:0;">SHOW YOUR ROUT</h3>
			</div>
		<!--===================================^���� �Խ��� �����=======================================-->

		<!--================================����� ���� ��ũ��Ʈ ��!!======================================-->
		<script type="text/javascript"
			src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3&libraries=services"></script>
		<script>
			var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
			mapOption = {
				center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
				level : 8
			// ������ Ȯ�� ����
			};

			var map = new daum.maps.Map(mapContainer, mapOption); // ������ �����մϴ�

			// ���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
			var mapTypeControl = new daum.maps.MapTypeControl();

			// ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
			map.addControl(mapTypeControl, daum.maps.ControlPosition.TOPRIGHT);

			// ������ Ȯ�� ��� ��Ʈ���� �����Ѵ�
			var zoomControl = new daum.maps.ZoomControl();

			// ������ ������ Ȯ�� ��� ��Ʈ���� �߰��Ѵ�
			map.addControl(zoomControl, daum.maps.ControlPosition.RIGHT);

			// ��Ŀ�� ǥ���� ��ġ�� ������ ������ �ִ� ��ü �迭�Դϴ� 
			var positions = [
					{
						content : '<div class="customoverlay">'
								+ '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">'
								+ '    <span class="title">���ֽ�û</span>'
								+ '  </a>' + '</div>',
						latlng : new daum.maps.LatLng(33.499565, 126.531241)
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

				// Ŀ���� �������̸� �����մϴ�
				var customOverlay = new daum.maps.CustomOverlay({
					map : map,
					clickable : true,
					position : positions[i].latlng,
					content : positions[i].content,
					yAnchor : 1
				});

				customOverlay.setMap(null);

				daum.maps.event.addListener(marker, 'click', makeOverListener(
						map, marker, customOverlay));
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

			/* ##############################LINE SCRIPT############################### */
			var drawingOK = false;
			function drawing() {
				if (!drawingOK) {
					drawingOK = true;
				} else {
					drawingOK = false;
					deleteClickLine();
					deleteDistnce();
					deleteCircleDot();
				}
			}

			var drawingFlag = false; // ���� �׷����� �ִ� ���¸� ������ ���� �����Դϴ�
			var moveLine; // ���� �׷����� ������ ���콺 �����ӿ� ���� �׷��� �� ��ü �Դϴ�
			var clickLine // ���콺�� Ŭ���� ��ǥ�� �׷��� �� ��ü�Դϴ�
			var distanceOverlay; // ���� �Ÿ������� ǥ���� Ŀ���ҿ������� �Դϴ�
			var dots = {}; // ���� �׷����� ������ Ŭ���� ������ Ŭ�� ������ �Ÿ��� ǥ���ϴ� Ŀ���� �������� �迭�Դϴ�.

			// ������ Ŭ�� �̺�Ʈ�� ����մϴ�
			// ������ Ŭ���ϸ� �� �׸��Ⱑ ���۵˴ϴ� �׷��� ���� ������ ����� �ٽ� �׸��ϴ�
			daum.maps.event.addListener(map, 'click', function(mouseEvent) {

				// ���콺�� Ŭ���� ��ġ�Դϴ� 
				var clickPosition = mouseEvent.latLng;

				if (drawingOK) {
					// ���� Ŭ���̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� ���°� �ƴϸ�
					if (!drawingFlag) {

						// ���¸� true��, ���� �׸����ִ� ���·� �����մϴ�
						drawingFlag = true;

						// ���� ���� ���� ǥ�õǰ� �ִٸ� �������� �����մϴ�
						deleteClickLine();

						// ���� ���� Ŀ���ҿ������̰� ǥ�õǰ� �ִٸ� �������� �����մϴ�
						deleteDistnce();

						// ���� ���� ���� �׸��� ���� Ŭ���� ������ �ش� ������ �Ÿ������� ǥ�õǰ� �ִٸ� �������� �����մϴ�
						deleteCircleDot();

						// Ŭ���� ��ġ�� �������� ���� �����ϰ� �������� ǥ���մϴ�
						clickLine = new daum.maps.Polyline({
							map : map, // ���� ǥ���� �����Դϴ� 
							path : [ clickPosition ], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
							strokeWeight : 3, // ���� �β��Դϴ� 
							strokeColor : '#db4040', // ���� �����Դϴ�
							strokeOpacity : 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
							strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
						});

						// ���� �׷����� ���� �� ���콺 �����ӿ� ���� ���� �׷��� ��ġ�� ǥ���� ���� �����մϴ�
						moveLine = new daum.maps.Polyline({
							strokeWeight : 3, // ���� �β��Դϴ� 
							strokeColor : '#db4040', // ���� �����Դϴ�
							strokeOpacity : 0.5, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
							strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�    
						});

						// Ŭ���� ������ ���� ������ ������ ǥ���մϴ�
						displayCircleDot(clickPosition, 0);

					} else { // ���� �׷����� �ִ� �����̸�

						// �׷����� �ִ� ���� ��ǥ �迭�� ���ɴϴ�
						var path = clickLine.getPath();

						// ��ǥ �迭�� Ŭ���� ��ġ�� �߰��մϴ�
						path.push(clickPosition);

						// �ٽ� ���� ��ǥ �迭�� �����Ͽ� Ŭ�� ��ġ���� ���� �׸����� �����մϴ�
						clickLine.setPath(path);

						var distance = Math.round(clickLine.getLength());
						displayCircleDot(clickPosition, distance);
					}
				}

			});

			// ������ ���콺���� �̺�Ʈ�� ����մϴ�
			// ���� �׸����ִ� ���¿��� ���콺���� �̺�Ʈ�� �߻��ϸ� �׷��� ���� ��ġ�� �������� �����ֵ��� �մϴ�
			daum.maps.event
					.addListener(
							map,
							'mousemove',
							function(mouseEvent) {

								// ���� ���콺���� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
								if (drawingFlag) {

									// ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
									var mousePosition = mouseEvent.latLng;

									// ���콺 Ŭ������ �׷��� ���� ��ǥ �迭�� ���ɴϴ�
									var path = clickLine.getPath();

									// ���콺 Ŭ������ �׷��� ������ ��ǥ�� ���콺 Ŀ�� ��ġ�� ��ǥ�� ���� ǥ���մϴ�
									var movepath = [ path[path.length - 1],
											mousePosition ];
									moveLine.setPath(movepath);
									moveLine.setMap(map);

									var distance = Math.round(clickLine
											.getLength()
											+ moveLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
									content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">'
											+ distance + '</span>m</div>'; // Ŀ���ҿ������̿� �߰��� �����Դϴ�

									// �Ÿ������� ������ ǥ���մϴ�
									showDistance(content, mousePosition);
								}
							});

			// ������ ���콺 ������ Ŭ�� �̺�Ʈ�� ����մϴ�
			// ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ� �� �׸��⸦ �����մϴ�
			daum.maps.event
					.addListener(
							map,
							'rightclick',
							function(mouseEvent) {

								// ���� ������ Ŭ�� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
								if (drawingFlag) {

									// ���콺����� �׷��� ���� �������� �����մϴ�
									moveLine.setMap(null);
									moveLine = null;

									// ���콺 Ŭ������ �׸� ���� ��ǥ �迭�� ���ɴϴ�
									var path = clickLine.getPath();

									// ���� �����ϴ� ��ǥ�� ������ 2�� �̻��̸�
									if (path.length > 1) {

										// ������ Ŭ�� ������ ���� �Ÿ� ���� Ŀ���� �������̸� ����ϴ�
										if (dots[dots.length - 1].distance) {
											dots[dots.length - 1].distance
													.setMap(null);
											dots[dots.length - 1].distance = null;
										}

										var distance = Math.round(clickLine
												.getLength()), // ���� �� �Ÿ��� ����մϴ�
										content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�

										// �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
										showDistance(content,
												path[path.length - 1]);

									} else {

										// ���� �����ϴ� ��ǥ�� ������ 1�� �����̸� 
										// ������ ǥ�õǰ� �ִ� ���� �������� �������� �����մϴ�.
										deleteClickLine();
										deleteCircleDot();
										deleteDistnce();

									}

									// ���¸� false��, �׸��� �ʰ� �ִ� ���·� �����մϴ�
									drawingFlag = false;
								}
							});

			// Ŭ������ �׷��� ���� �������� �����ϴ� �Լ��Դϴ�
			function deleteClickLine() {
				if (clickLine) {
					clickLine.setMap(null);
					clickLine = null;
				}
			}

			// ���콺 �巡�׷� �׷����� �ִ� ���� �ѰŸ� ������ ǥ���ϰ�
			// ���콺 ������ Ŭ������ �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϰ� ������ ǥ���ϴ� �Լ��Դϴ�
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

			// �׷����� �ִ� ���� �ѰŸ� ������ 
			// �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϴ� �Լ��Դϴ�
			function deleteDistnce() {
				if (distanceOverlay) {
					distanceOverlay.setMap(null);
					distanceOverlay = null;
				}
			}

			// ���� �׷����� �ִ� ������ �� ������ Ŭ���ϸ� ȣ���Ͽ� 
			// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� ǥ���ϴ� �Լ��Դϴ�
			function displayCircleDot(position, distance) {

				// Ŭ�� ������ ǥ���� ���� ���׶�� Ŀ���ҿ������̸� �����մϴ�
				var circleOverlay = new daum.maps.CustomOverlay({
					content : '<span class="dot"></span>',
					position : position,
					zIndex : 1
				});

				// ������ ǥ���մϴ�
				circleOverlay.setMap(map);

				if (distance > 0) {
					// Ŭ���� ���������� �׷��� ���� �� �Ÿ��� ǥ���� Ŀ���� �������̸� �����մϴ�
					var distanceOverlay = new daum.maps.CustomOverlay(
							{
								content : '<div class="dotOverlay">�Ÿ� <span class="number">'
										+ distance + '</span>m</div>',
								position : position,
								yAnchor : 1,
								zIndex : 2
							});

					// ������ ǥ���մϴ�
					distanceOverlay.setMap(map);
				}

				// �迭�� �߰��մϴ�
				dots.push({
					circle : circleOverlay,
					distance : distanceOverlay
				});
			}

			// Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� �������� ��� �����ϴ� �Լ��Դϴ�
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

			// ���콺 ��Ŭ�� �Ͽ� �� �׸��Ⱑ ������� �� ȣ���Ͽ� 
			// �׷��� ���� �ѰŸ� ������ �Ÿ��� ���� ����, ������ �ð��� ����Ͽ�
			// HTML Content�� ����� �����ϴ� �Լ��Դϴ�
			function getTimeHTML(distance) {

				// ������ �ü��� ��� 4km/h �̰� ������ �м��� 67m/min�Դϴ�
				var walkkTime = distance / 67 | 0;
				var walkHour = '', walkMin = '';

				// ����� ���� �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
				if (walkkTime > 60) {
					walkHour = '<span class="number">'
							+ Math.floor(walkkTime / 60) + '</span>�ð� '
				}
				walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

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
				content += '        <span class="label">����</span>' + walkHour
						+ walkMin;
				content += '    </li>';
				content += '    <li>';
				content += '        <span class="label">������</span>'
						+ bycicleHour + bycicleMin;
				content += '    </li>';
				content += '</ul>'

				return content;

			}

			////////////////////////////// PLACE SCRIPT ///////////////////////////////////////////////

			//��Ŀ�� Ŭ������ �� �ش� ����� �������� ������ Ŀ���ҿ��������Դϴ�
			var placeOverlay = new daum.maps.CustomOverlay({
				zIndex : 1
			}), contentNode = document.createElement('div'), // Ŀ���� ���������� ������ ������Ʈ �Դϴ� 
			markers = [], // ��Ŀ�� ���� �迭�Դϴ�
			currCategory = ''; // ���� ���õ� ī�װ��� ������ ���� �����Դϴ�

			// ��� �˻� ��ü�� �����մϴ�
			var ps = new daum.maps.services.Places(map);

			// ������ idle �̺�Ʈ�� ����մϴ�
			daum.maps.event.addListener(map, 'idle', searchPlaces);

			// Ŀ���� ���������� ������ ��忡 css class�� �߰��մϴ� 
			contentNode.className = 'placeinfo_wrap';

			// Ŀ���� ���������� ������ ��忡 mousedown, touchstart �̺�Ʈ�� �߻�������
			// ���� ��ü�� �̺�Ʈ�� ���޵��� �ʵ��� �̺�Ʈ �ڵ鷯�� daum.maps.event.preventMap �޼ҵ带 ����մϴ� 
			addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
			addEventHandle(contentNode, 'touchstart',
					daum.maps.event.preventMap);

			// Ŀ���� �������� �������� �����մϴ�
			placeOverlay.setContent(contentNode);

			// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
			addCategoryClickEvent();

			// ������Ʈ�� �̺�Ʈ �ڵ鷯�� ����ϴ� �Լ��Դϴ�
			function addEventHandle(target, type, callback) {
				if (target.addEventListener) {
					target.addEventListener(type, callback);
				} else {
					target.attachEvent('on' + type, callback);
				}
			}

			// ī�װ� �˻��� ��û�ϴ� �Լ��Դϴ�
			function searchPlaces() {
				if (!currCategory) {
					return;
				}

				// Ŀ���� �������̸� ����ϴ� 
				placeOverlay.setMap(null);

				// ������ ǥ�õǰ� �ִ� ��Ŀ�� �����մϴ�
				removeMarker();

				ps.categorySearch(currCategory, placesSearchCB, {
					useMapBounds : true
				});
			}

			// ��Ұ˻��� �Ϸ���� �� ȣ��Ǵ� �ݹ��Լ� �Դϴ�
			function placesSearchCB(data, status, pagination) {
				if (status === daum.maps.services.Status.OK) {

					// ���������� �˻��� �Ϸ������ ������ ��Ŀ�� ǥ���մϴ�
					displayPlaces(data);
				} else if (status === daum.maps.services.Status.ZERO_RESULT) {
					// �˻������ ���°�� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
					alert("���� ������ �˻� ����� �����ϴ�.")
				} else if (status === daum.maps.services.Status.ERROR) {
					// ������ ���� �˻������ ������ ���� ��� �ؾ��� ó���� �ִٸ� �̰��� �ۼ��� �ּ���
					alert("error")
				}
			}

			// ������ ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
			function displayPlaces(places) {

				// ���° ī�װ��� ���õǾ� �ִ��� ���ɴϴ�
				// �� ������ ��������Ʈ �̹��������� ��ġ�� ����ϴµ� ���˴ϴ�
				var order = document.getElementById(currCategory).getAttribute(
						'data-order');

				for (var i = 0; i < places.length; i++) {
					console.log(places[i].place_name);
					// ��Ŀ�� �����ϰ� ������ ǥ���մϴ�
					var marker = addMarker(new daum.maps.LatLng(places[i].y,
							places[i].x), order);

					// ��Ŀ�� �˻���� �׸��� Ŭ�� ���� ��
					// ��������� ǥ���ϵ��� Ŭ�� �̺�Ʈ�� ����մϴ�
					(function(marker, place) {
						daum.maps.event.addListener(marker, 'click',
								function() {
									displayPlaceInfo(place);
								});
					})(marker, places[i]);
				}
			}

			// ��Ŀ�� �����ϰ� ���� ���� ��Ŀ�� ǥ���ϴ� �Լ��Դϴ�
			function addMarker(position, order) {
				var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // ��Ŀ �̹��� url, ��������Ʈ �̹����� ���ϴ�
				imageSize = new daum.maps.Size(27, 28), // ��Ŀ �̹����� ũ��
				imgOptions = {
					spriteSize : new daum.maps.Size(72, 208), // ��������Ʈ �̹����� ũ��
					spriteOrigin : new daum.maps.Point(46, (order * 36)), // ��������Ʈ �̹��� �� ����� ������ �»�� ��ǥ
					offset : new daum.maps.Point(11, 28)
				// ��Ŀ ��ǥ�� ��ġ��ų �̹��� �������� ��ǥ
				}, markerImage = new daum.maps.MarkerImage(imageSrc, imageSize,
						imgOptions), marker = new daum.maps.Marker({
					position : position, // ��Ŀ�� ��ġ
					image : markerImage
				});

				marker.setMap(map); // ���� ���� ��Ŀ�� ǥ���մϴ�
				markers.push(marker); // �迭�� ������ ��Ŀ�� �߰��մϴ�

				return marker;
			}

			// ���� ���� ǥ�õǰ� �ִ� ��Ŀ�� ��� �����մϴ�
			function removeMarker() {
				for (var i = 0; i < markers.length; i++) {
					markers[i].setMap(null);
				}
				markers = [];
			}

			// Ŭ���� ��Ŀ�� ���� ��� �������� Ŀ���� �������̷� ǥ���ϴ� �Լ��Դϴ�
			function displayPlaceInfo(place) {
				var content = '<div class="placeinfo">'
						+ '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">'
						+ place.place_name + '</a>';

				if (place.road_address_name) {
					content += '    <span title="' + place.road_address_name + '">'
							+ place.road_address_name
							+ '</span>'
							+ '  <span class="jibun" title="' + place.address_name + '">(���� : '
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

			// �� ī�װ��� Ŭ�� �̺�Ʈ�� ����մϴ�
			function addCategoryClickEvent() {
				var category = document.getElementById('category'), children = category.children;

				for (var i = 0; i < children.length; i++) {
					children[i].onclick = onClickCategory;
				}
			}

			// ī�װ��� Ŭ������ �� ȣ��Ǵ� �Լ��Դϴ�
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

			// Ŭ���� ī�װ����� Ŭ���� ��Ÿ���� �����ϴ� �Լ��Դϴ�
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
						<a href="#" class="fa fa-facebook"></a> <a href="#"
							class="fa fa-twitter"></a> <a href="#" class="fa fa-google-plus"></a>
					</div>
					<div class="copy">
						Your Trip (c) 2014 | <a href="#">Privacy Policy</a> | Website
						Template Designed by <a href="http://www.templatemonster.com/"
							rel="nofollow">TemplateMonster.com</a>
					</div>
				</div>
			</div>
		</footer>
</body>
</html>