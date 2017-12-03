<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>HOT RESTAURANT</title>
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
		<!--==============================�α���/ȸ�����Ը���Դϴ�.=================================-->
	
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
		<p>If you don't have account >><a href="#join_form" id="join_pop">Join</a></p>
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
		<p>If you don't have account >><a href="#join_form" id="join_pop">Join</a></p>
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
		<p>If you have account >><a href="#login_form" id="login_pop">Log In</a></p>
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

		<!--==============================�α���/ȸ�����Ը���Դϴ�.��=================================-->
   <div class="allFor">
      <!-- ======SIDE MENU ���� �޴� â�Դϴ�.===== -->
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
					<li><h1 style="color:white;">${vo1.nick}��</h1></li>
						<li><a href="Logout.jsp" id="login_pop">�α׾ƿ�</a></li>
						<li><a href="#update_form" id="join_pop">������������</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
      </div>

      <!-- ======^SIDE MENU ���� �޴�â ��===== -->
<!--==============================header ���� �޴�â�Դϴ�.=================================-->
      <header>
         <div class="container_12">
            <div class="grid_12">
               <div class="menu_block">
                  <nav class="horizontal-nav full-width horizontalNav-notprocessed">
                     <ul class="sf-menu">
                        <li><a href="Main.jsp">HOME</a></li>
                        <c:choose>
							<c:when test="${empty vo1.id}">
								<li><a href="#login_form2">HOT
										TOURS</a></li>
							</c:when>
							<c:otherwise>
								<li><a href="HotTour.jsp">HOT TOURS</a></li>
							</c:otherwise>
						</c:choose>
                        <li class="current"><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
                        <li><a href="SelectService?start=0&end=8">POST</a></li>
                        <li><a href="Map.jsp">MAP DIY</a></li>
                     </ul>
                  </nav>
                  <div class="clear"></div>
               </div>
            </div>
            <div class="grid_12">
               <h1>
                  <a href="tourInformation.jsp">
                     <img src="images/logo/tripickerLogo9.png" alt="Your Happy Family">
                  </a>
               </h1>
            </div>
         </div>
      </header>
<!--==============================Content ���������Դϴ�.=================================-->
      <div class="content"><div class="ic"></div>
         <div class="container_12">
            <div class="grid_12">
                <h3><span style="color:#C73430;">HOT</span> RESTAURANT</h3>
               <div class="block2">
                  <img style="width:180px; height:340px;" src="images/sepecial/re1_1.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1" id="hotRe1"><a href="#" id="hotRe1">���� ����</a></div>
                     <p>��Ǫ��, �ƽþ� �丮</p>
                     <p>��ġ : ���� ������ �ظ����ؾȷ� 1282</p> 
                     <p>��ȭ��ȣ : 064-782-9944</p>                   
                     <p>��ð�</p>
                     <p>���� 9:30 ���� 3:00</p>
                     <p>����4:00 ����7:00</p>

                  </div>
               </div>
               <div class="block2">
                  <img style="width:180px; height:301px;" src="images/sepecial/re2_1.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1" id="hotRe2"><a href="#">�������屹 </a></div>
                     <p>�ƽþ� �丮</p>
                     <p>��ġ : ���� ����� 11</p> 
                     <p>��ȭ��ȣ : 064-757-3393p>                   
                     <p>��ð�</p>
                     <p>���� 5:30 ���� 12:00</p>
                 

                  </div>
               </div>
               <div class="block2">
                  <img style="width:180px; height:255px;" src="images/sepecial/re3_1.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1" id="hotRe3"><a href="#">�ҿ� Űģ</a></div>
                     <p>�̱�, ��Ż���� �丮</p>
                     <p>��ġ : ������ õ������ 131-7</p> 
                     <p>��ȭ��ȣ : 064-739-8765</p>                   
                     <p>��ð�</p>
                     <p>���� 11:30 ���� 9:00</p>

                  </div>
               </div>
               <div class="block2">
                  <img style="width:180px; height:300px;" src="images/sepecial/re4_1.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1" id="hotRe4"><a href="#">�ڸű���</a></div>
                     <p>�ƽþ� �丮</p>
                     <p>��ġ : ���� �Ｚ�� 67</p> 
                     <p>��ȭ��ȣ : 064-727-1112</p>                   
                     <p>��ð�</p>
                     <p>���� 12:00 ���� 11:59</p>

                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- ^allfor you -->
      </div>
      
<!--==============================footer ������ �ϴ�=================================-->
      <footer>
         <div class="container_12">
            <div class="grid_12">
               <div class="socials">
                  <a href="https://ko-kr.facebook.com/" class="fa fa-facebook"></a> <a href="https://twitter.com/"
							class="fa fa-twitter"></a> <a href="https://plus.google.com/" class="fa fa-google-plus"></a>
               </div>
               <div class="copy">
                  Tripicker (c) 2017 | <a href="#">Privacy Policy</a> | Website Template Designed by <a href="http://www.templatemonster.com/" rel="nofollow">TemplateMonster.com</a>
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
