<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <title>Hot Tours</title>
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
      $(document).ready(function(){
         $().UItoTop({ easingType: 'easeOutQuart' });
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
					<li><h1 style="color:white;">${nick}님</h1></li>
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
                        <li><a href="HotTour.jsp">HOT TOURS</a></li>
                        <li class="current"><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
                        <li><a href="SelectService?start=0&end=8">POST</a></li>
                        <li><a href="Index04_Map.jsp">CONTACTS</a></li>
                     </ul>
                  </nav>
                  <div class="clear"></div>
               </div>
            </div>
            <div class="grid_12">
               <h1>
                  <a href="specialOffer.jsp">
                     <img src="images/logo/tripickerLogo9.png" alt="Your Happy Family">
                  </a>
               </h1>
            </div>
         </div>
      </header>
<!--==============================Content=================================-->
      <div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
         <div class="container_12">      
            <h3>CHOOSE YOUR PREFERENCE</h3>
               <div class="grid_5">
                  <div class="banner special">
                     <img src="images/page2_img1.jpg" alt="">
                     <div class="label">
                        <div class="title">NEW ZEALAND</div>
                        <div class="price">from<span>$ 1.200</span></div>
                        <a href="tourInformation.html">LEARN MORE</a>
                     </div>
                  </div>
               </div>
               <div class="grid_5">
                  <div class="banner special">
                     <img src="images/page2_img2.jpg" alt="">
                     <div class="label">
                        <div class="title">GOA</div>
                        <div class="price">from<span>$ 1.500</span></div>
                        <a href="tourInformation.html">LEARN MORE</a>
                     </div>
                  </div>
               </div>

               <div class="container_12">  
                <div class="clear"></div>
               <div class="grid_5">
                  <div class="banner special">
                     <img src="images/page2_img3.jpg" alt="">
                     <div class="label">
                        <div class="title">FRANCE</div>
                        <div class="price">from<span>$ 1.600</span></div>
                        <a href="#">LEARN MORE</a>
                     </div>
                  </div>
               </div>

               <div class="grid_5">
                  <div class="banner special">
                     <img src="images/page2_img4.jpg" alt="">
                     <div class="label">
                        <div class="title">CANADA</div>
                        <div class="price">from<span>$ 2000</span></div>
                        <a href="tourInformation.html">LEARN MORE</a>
                     </div>
                  </div>
               </div>
         </div>
      </div>
         <!-- ^allfor you -->
      </div>
<!--==============================footer=================================-->
      <footer>
         <div class="container_12">
            <div class="grid_12">
               <div class="socials">
                  <a href="#" class="fa fa-facebook"></a>
                  <a href="#" class="fa fa-twitter"></a>
                  <a href="#" class="fa fa-google-plus"></a>
               </div>
               <div class="copy">
                  Your Trip (c) 2014 | <a href="#">Privacy Policy</a> | Website Template Designed by <a href="http://www.templatemonster.com/" rel="nofollow">TemplateMonster.com</a>
               </div>
            </div>
         </div>
      </footer>
      <script>
      $(function (){
         $('#bookingForm').bookingForm({
            ownerEmail: '#'
         });
      })
      </script>
   </body>
</html>