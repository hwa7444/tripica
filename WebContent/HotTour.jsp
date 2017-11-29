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
        <button onclick="drawing()" >소요시간측정하기</button>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div  
    mapOption = { 
		center: new daum.maps.LatLng(33.37137, 126.56695), // 지도의 중심좌표
        level: 8 // 지도의 확대 레벨
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


    // 커스텀 오버레이를 생성합니다
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

     if(drawingOK){
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
             map: map, // 선을 표시할 지도입니다 
             path: [clickPosition], // 선을 구성하는 좌표 배열입니다 클릭한 위치를 넣어줍니다
             strokeWeight: 3, // 선의 두께입니다 
             strokeColor: '#db4040', // 선의 색깔입니다
             strokeOpacity: 1, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
             strokeStyle: 'solid' // 선의 스타일입니다
         });
         
         // 선이 그려지고 있을 때 마우스 움직임에 따라 선이 그려질 위치를 표시할 선을 생성합니다
         moveLine = new daum.maps.Polyline({
             strokeWeight: 3, // 선의 두께입니다 
             strokeColor: '#db4040', // 선의 색깔입니다
             strokeOpacity: 0.5, // 선의 불투명도입니다 0에서 1 사이값이며 0에 가까울수록 투명합니다
             strokeStyle: 'solid' // 선의 스타일입니다    
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
 daum.maps.event.addListener(map, 'mousemove', function (mouseEvent) {

     // 지도 마우스무브 이벤트가 발생했는데 선을 그리고있는 상태이면
     if (drawingFlag){
         
         // 마우스 커서의 현재 위치를 얻어옵니다 
         var mousePosition = mouseEvent.latLng; 

         // 마우스 클릭으로 그려진 선의 좌표 배열을 얻어옵니다
         var path = clickLine.getPath();
         
         // 마우스 클릭으로 그려진 마지막 좌표와 마우스 커서 위치의 좌표로 선을 표시합니다
         var movepath = [path[path.length-1], mousePosition];
         moveLine.setPath(movepath);    
         moveLine.setMap(map);
         
         var distance = Math.round(clickLine.getLength() + moveLine.getLength()), // 선의 총 거리를 계산합니다
             content = '<div class="dotOverlay distanceInfo">총거리 <span class="number">' + distance + '</span>m</div>'; // 커스텀오버레이에 추가될 내용입니다
         
         // 거리정보를 지도에 표시합니다
         showDistance(content, mousePosition);   
     }             
 });                 

 // 지도에 마우스 오른쪽 클릭 이벤트를 등록합니다
 // 선을 그리고있는 상태에서 마우스 오른쪽 클릭 이벤트가 발생하면 선 그리기를 종료합니다
 daum.maps.event.addListener(map, 'rightclick', function (mouseEvent) {

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
             if (dots[dots.length-1].distance) {
                 dots[dots.length-1].distance.setMap(null);
                 dots[dots.length-1].distance = null;    
             }

             var distance = Math.round(clickLine.getLength()), // 선의 총 거리를 계산합니다
                 content = getTimeHTML(distance); // 커스텀오버레이에 추가될 내용입니다
                 
             // 그려진 선의 거리정보를 지도에 표시합니다
             showDistance(content, path[path.length-1]);  
              
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
             map: map, // 커스텀오버레이를 표시할 지도입니다
             content: content,  // 커스텀오버레이에 표시할 내용입니다
             position: position, // 커스텀오버레이를 표시할 위치입니다.
             xAnchor: 0,
             yAnchor: 0,
             zIndex: 3  
         });      
     }
 }

 // 그려지고 있는 선의 총거리 정보와 
 // 선 그리가 종료됐을 때 선의 정보를 표시하는 커스텀 오버레이를 삭제하는 함수입니다
 function deleteDistnce () {
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
         content: '<span class="dot"></span>',
         position: position,
         zIndex: 1
     });

     // 지도에 표시합니다
     circleOverlay.setMap(map);

     if (distance > 0) {
         // 클릭한 지점까지의 그려진 선의 총 거리를 표시할 커스텀 오버레이를 생성합니다
         var distanceOverlay = new daum.maps.CustomOverlay({
             content: '<div class="dotOverlay">거리 <span class="number">' + distance + '</span>m</div>',
             position: position,
             yAnchor: 1,
             zIndex: 2
         });

         // 지도에 표시합니다
         distanceOverlay.setMap(map);
     }

     // 배열에 추가합니다
     dots.push({circle:circleOverlay, distance: distanceOverlay});
 }

 // 클릭 지점에 대한 정보 (동그라미와 클릭 지점까지의 총거리)를 지도에서 모두 제거하는 함수입니다
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

 // 마우스 우클릭 하여 선 그리기가 종료됐을 때 호출하여 
 // 그려진 선의 총거리 정보와 거리에 대한 도보, 자전거 시간을 계산하여
 // HTML Content를 만들어 리턴하는 함수입니다
 function getTimeHTML(distance) {

     // 도보의 시속은 평균 4km/h 이고 도보의 분속은 67m/min입니다
     var walkkTime = distance / 67 | 0;
     var walkHour = '', walkMin = '';

     // 계산한 도보 시간이 60분 보다 크면 시간으로 표시합니다
     if (walkkTime > 60) {
         walkHour = '<span class="number">' + Math.floor(walkkTime / 60) + '</span>시간 '
     }
     walkMin = '<span class="number">' + walkkTime % 60 + '</span>분'

     // 자전거의 평균 시속은 16km/h 이고 이것을 기준으로 자전거의 분속은 267m/min입니다
     var bycicleTime = distance / 227 | 0;
     var bycicleHour = '', bycicleMin = '';

     // 계산한 자전거 시간이 60분 보다 크면 시간으로 표출합니다
     if (bycicleTime > 60) {
         bycicleHour = '<span class="number">' + Math.floor(bycicleTime / 60) + '</span>시간 '
     }
     bycicleMin = '<span class="number">' + bycicleTime % 60 + '</span>분'

     // 거리와 도보 시간, 자전거 시간을 가지고 HTML Content를 만들어 리턴합니다
     var content = '<ul class="dotOverlay distanceInfo">';
     content += '    <li>';
     content += '        <span class="label">총거리</span><span class="number">' + distance + '</span>m';
     content += '    </li>';
     content += '    <li>';
     content += '        <span class="label">도보</span>' + walkHour + walkMin;
     content += '    </li>';
     content += '    <li>';
     content += '        <span class="label">자전거</span>' + bycicleHour + bycicleMin;
     content += '    </li>';
     content += '</ul>'

     return content;
 
 }


</script>		
		