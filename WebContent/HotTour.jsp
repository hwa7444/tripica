<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
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
<title>Hot Tours</title>
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
		<!--==============================header=================================-->
		<header>
			<div class="container_12">
				<div class="grid_12">
					<div class="menu_block">
						<nav class="horizontal-nav full-width horizontalNav-notprocessed">
							<ul class="sf-menu">
								<li><a href="Main.jsp">HOME</a></li>
								<li class="current"><a href="HotTour.jsp">HOT TOURS</a></li>
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
						<a href="HotTour.jsp"> <img
							src="images/logo/tripickerLogo9.png" alt="Your Happy Family">
						</a>
					</h1>
				</div>
			</div>
		</header>
		<!--==============================Content=================================-->
		 <div class="content"><div class="ic"></div>
         <div class="container_12">
         <!--================ blogPost ================-->
            <div class="grid_7">
               <h3>Recent Posts</h3>
               <div class="blog">
                  <time datetime="2014-10-01">15<span>Feb</span></time>
                  <div class="extra_wrapper">
                     <div class="text1 col1"><a href="#">uamnibh Edet Mertolo numi</a></div>Posted by
                     <a href="#">Admin</a>
                  </div>
                  <div class="clear"></div>
                  <img src="images/page4_img1.jpg" alt="" class="img_inner">
                  <p>Cras facilisis, nulla vel viverra auctor, leo gna sodales felis, quis malesuada nibh odio ut velit. Proin pharetra luctus diam, a celerisque eros convallis accumsan. </p>Maecenas vehicula egestas venenatis. Duis massa elit, auctor non pellentesque vel aliquet sit amet erat. Nullam eget dignissim nisi, aliquam feugiat nibh.
                  <br>
                  <a href="#" class="link1">LEARN MORE</a>
               </div>
               <div class="blog">
                  <time datetime="2014-10-01">17<span>Feb</span></time>
                  <div class="extra_wrapper">
                     <div class="text1 col1"><a href="#">ERh EMertlo numolo</a></div>Posted by
                     <a href="#">Admin</a>
                  </div>
                  <div class="clear"></div>
                  <img src="images/page4_img2.jpg" alt="" class="img_inner">
                  <p>Cras facilisis, nulla vel viverra auctor, leo gna sodales felis, quis malesuada nibh odio ut velit. Proin pharetra luctus diam, a celerisque eros convallis accumsan. </p>Maecenas vehicula egestas venenatis. Duis massa elit, auctor non pellentesque vel aliquet sit amet erat. Nullam eget dignissim nisi, aliquam feugiat nibh.
                  <br>
                  <a href="#" class="link1">LEARN MORE</a>
               </div>
            </div>
            <!--================= ^blogPost ==================-->
            <!--================================= Category =================================-->
            <div class="grid_3 prefix_1" style="position:;">
               <h3 class="head1">CATEGORIES</h3>
               <ul class="list">
                  <li><a href="#">Suspendisse massa mi </a></li>
                  <li><a href="#">Porttitor at velit id </a></li>
                  <li><a href="#">Congue adipiscing </a></li>
                  <li><a href="#">Vestibulum vitae porta </a></li>
                  <li><a href="#">Vivamus ac sodales </a></li>
                  <li><a href="#">Massa quis adipiscing </a></li>
                  <li><a href="#">Phasellus hendrerit </a></li>
                  <li><a href="#">Libero in sapien </a></li>
                  <li><a href="#">Dignissim vel imperdiet </a></li>
               </ul>
               <h3 class="head1">ARchives</h3>
               <ul class="list">
                  <li><a href="#">November 2013</a></li>
                  <li><a href="#">October 2013</a></li>
                  <li><a href="#">September 2013</a></li>
                  <li><a href="#">August 2013</a></li>
                  <li><a href="#">July 2013</a></li>
               </ul>
            </div>
            
        <div id="map" style="width:100%;height:400px;"></div>
        <button onclick="drawing()" >�ҿ�ð������ϱ�</button>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3"></script>
<script>
var mapContainer = document.getElementById('map'), // ������ ǥ���� div  
    mapOption = { 
		center: new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
        level: 8 // ������ Ȯ�� ����
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
        content: '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">���ֽ�û</span>' +
        '  </a>' +
        '</div>', 
        latlng: new daum.maps.LatLng(33.499565 , 126.531241)
    },
    {
        content: '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">��������</span>' +
        '  </a>' +
        '</div>', 
        latlng: new daum.maps.LatLng(33.42377208326678, 126.93045722895785)
    },
    {
        content:  '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">���� �����</span>' +
        '  </a>' +
        '</div>', 
        latlng: new daum.maps.LatLng(33.45943569514741, 126.93968216363504)
    },
    {
        content:  '<div class="customoverlay">' +
        '  <a href="http://map.daum.net/?itemId=11394059" target="_blank">' +
        '    <span class="title">�Ѷ��</span>' +
        '  </a>' +
        '</div>',
        latlng: new daum.maps.LatLng(33.36083380810028, 126.53581319393376)
    }
];


var latlng = new daum.maps.LatLng(37, 127);

for (var i = 0; i < positions.length; i ++) {
    // ��Ŀ�� �����մϴ�
    var marker = new daum.maps.Marker({
        map: map, // ��Ŀ�� ǥ���� ����
        clickable: true,
        position: positions[i].latlng // ��Ŀ�� ��ġ
    });


    // Ŀ���� �������̸� �����մϴ�
    var customOverlay = new daum.maps.CustomOverlay({
        map: map,
        clickable: true,
        position: positions[i].latlng,
        content: positions[i].content,
        yAnchor: 1 
    });

    customOverlay.setMap(null);
   

    
    daum.maps.event.addListener(marker, 'click', makeOverListener(map, marker, customOverlay));
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
 function drawing(){
	 if(!drawingOK){
		drawingOK = true;		 
	 }else{
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

     if(drawingOK){
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
             map: map, // ���� ǥ���� �����Դϴ� 
             path: [clickPosition], // ���� �����ϴ� ��ǥ �迭�Դϴ� Ŭ���� ��ġ�� �־��ݴϴ�
             strokeWeight: 3, // ���� �β��Դϴ� 
             strokeColor: '#db4040', // ���� �����Դϴ�
             strokeOpacity: 1, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
             strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�
         });
         
         // ���� �׷����� ���� �� ���콺 �����ӿ� ���� ���� �׷��� ��ġ�� ǥ���� ���� �����մϴ�
         moveLine = new daum.maps.Polyline({
             strokeWeight: 3, // ���� �β��Դϴ� 
             strokeColor: '#db4040', // ���� �����Դϴ�
             strokeOpacity: 0.5, // ���� �������Դϴ� 0���� 1 ���̰��̸� 0�� �������� �����մϴ�
             strokeStyle: 'solid' // ���� ��Ÿ���Դϴ�    
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
 daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

     // ���� ���콺���� �̺�Ʈ�� �߻��ߴµ� ���� �׸����ִ� �����̸�
     if (drawingFlag){
         
         // ���콺 Ŀ���� ���� ��ġ�� ���ɴϴ� 
         var mousePosition = mouseEvent.latLng; 

         // ���콺 Ŭ������ �׷��� ���� ��ǥ �迭�� ���ɴϴ�
         var path = clickLine.getPath();
         
         // ���콺 Ŭ������ �׷��� ������ ��ǥ�� ���콺 Ŀ�� ��ġ�� ��ǥ�� ���� ǥ���մϴ�
         var movepath = [path[path.length-1], mousePosition];
         moveLine.setPath(movepath);    
         moveLine.setMap(map);
         
         var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
             content = '<div class="dotOverlay distanceInfo">�ѰŸ� <span class="number">' + distance + '</span>m</div>'; // Ŀ���ҿ������̿� �߰��� �����Դϴ�
         
         // �Ÿ������� ������ ǥ���մϴ�
         showDistance(content, mousePosition);   
     }             
 });                 

 // ������ ���콺 ������ Ŭ�� �̺�Ʈ�� ����մϴ�
 // ���� �׸����ִ� ���¿��� ���콺 ������ Ŭ�� �̺�Ʈ�� �߻��ϸ� �� �׸��⸦ �����մϴ�
 daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

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
             if (dots[dots.length-1].distance) {
                 dots[dots.length-1].distance.setMap(null);
                 dots[dots.length-1].distance = null;    
             }

             var distance = Math.round(clickLine.getLength()), // ���� �� �Ÿ��� ����մϴ�
                 content = getTimeHTML(distance); // Ŀ���ҿ������̿� �߰��� �����Դϴ�
                 
             // �׷��� ���� �Ÿ������� ������ ǥ���մϴ�
             showDistance(content, path[path.length-1]);  
              
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
             map: map, // Ŀ���ҿ������̸� ǥ���� �����Դϴ�
             content: content,  // Ŀ���ҿ������̿� ǥ���� �����Դϴ�
             position: position, // Ŀ���ҿ������̸� ǥ���� ��ġ�Դϴ�.
             xAnchor: 0,
             yAnchor: 0,
             zIndex: 3  
         });      
     }
 }

 // �׷����� �ִ� ���� �ѰŸ� ������ 
 // �� �׸��� ������� �� ���� ������ ǥ���ϴ� Ŀ���� �������̸� �����ϴ� �Լ��Դϴ�
 function deleteDistnce () {
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
         content: '<span class="dot"></span>',
         position: position,
         zIndex: 1
     });

     // ������ ǥ���մϴ�
     circleOverlay.setMap(map);

     if (distance > 0) {
         // Ŭ���� ���������� �׷��� ���� �� �Ÿ��� ǥ���� Ŀ���� �������̸� �����մϴ�
         var distanceOverlay = new daum.maps.CustomOverlay({
             content: '<div class="dotOverlay">�Ÿ� <span class="number">' + distance + '</span>m</div>',
             position: position,
             yAnchor: 1,
             zIndex: 2
         });

         // ������ ǥ���մϴ�
         distanceOverlay.setMap(map);
     }

     // �迭�� �߰��մϴ�
     dots.push({circle:circleOverlay, distance: distanceOverlay});
 }

 // Ŭ�� ������ ���� ���� (���׶�̿� Ŭ�� ���������� �ѰŸ�)�� �������� ��� �����ϴ� �Լ��Դϴ�
 function deleteCircleDot() {
     var i;

     for ( i = 0; i < dots.length; i++ ){
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
         walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>�ð� '
     }
     walkMin = '<span class="number">' + walkkTime % 60 + '</span>��'

     // �������� ��� �ü��� 16km/h �̰� �̰��� �������� �������� �м��� 267m/min�Դϴ�
     var bycicleTime = distance / 227 | 0;
     var bycicleHour = '', bycicleMin = '';

     // ����� ������ �ð��� 60�� ���� ũ�� �ð����� ǥ���մϴ�
     if (bycicleTime > 60) {
         bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>�ð� '
     }
     bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>��'

     // �Ÿ��� ���� �ð�, ������ �ð��� ������ HTML Content�� ����� �����մϴ�
     var content = '<ul class="dotOverlay distanceInfo">';
     content += '    <li>';
     content += '        <span class="label">�ѰŸ�</span><span class="number">' + distance + '</span>m';
     content += '    </li>';
     content += '    <li>';
     content += '        <span class="label">����</span>' + walkHour + walkMin;
     content += '    </li>';
     content += '    <li>';
     content += '        <span class="label">������</span>' + bycicleHour + bycicleMin;
     content += '    </li>';
     content += '</ul>'

     return content;
 
 }


</script>		
		