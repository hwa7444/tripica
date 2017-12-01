<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
   <head>
      <title>SPECIAL OFFER</title>
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
      <style>
      .title{
      text-shadow: 0.05em 0.05em 0.15em #193c46;
      }
      .price{
      text-shadow: 0.05em 0.05em 0.15em #193c46;
      }
      </style>
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
					<li><h1 style="color:white;">${nick}��</h1></li>
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
                        <li><a href="HotTour.jsp">HOT TOURS</a></li>
                        <li class="current"><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
                        <li><a href="SelectService?start=0&end=8">POST</a></li>
                        <li><a href="Map.jsp">Map DIY</a></li>
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
      <div class="content"><div class="ic"></div>
         <div class="container_12">      
            <h3><span style="color:#C73430;">HOT</span> RESTAURANT</h3>
            	<h2 style="font-size:1.3em;">���� �̿��ڵ��� ��ȣ�ϴ� �Ĵ��Դϴ�.</h2>
               <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(1)" src="images/sepecial/re1.jpg" alt="">
                     <div class="label">
                        <div class="title">���� ����</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(1)">������</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(2)" src="images/sepecial/re2.jpg" alt="">
                     <div class="label">
                        <div class="title">�������屹</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(2)">������</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(3)" src="images/sepecial/re3.jpg" alt="">
                     <div class="label">
                        <div class="title">�ҿ� Űģ</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(3)">������</a>
                     </div>
                  </div>
               </div>
                <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(4)" src="images/sepecial/re4.jpg" alt="">
                     <div class="label">
                        <div class="title">�ڸű���</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(4)">������</a>
                     </div>
                  </div>
               </div>

               
      </div>
      
     
      <div class="container_12">      
            <h3><span style="color:#C73430;">HOT</span> HOTEL</h3>
            <h2 style="font-size:1.3em;">���� �̿��ڵ��� ��ȣ�ϴ� �Ĵ��Դϴ�.</h2>
               <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(5)" src="images/sepecial/hotel1.jpg" alt="">
                     <div class="label">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">ȣ�� ����Ʈ<br> ���� �� ���</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(5)">�� ����</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(6)" src="images/sepecial/hotel2.jpg" alt="">
                     <div class="label">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">�󸶴� ���ڸ�<br> �̽�Ʈ ȣ��</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a  onclick="moving(6)">�� ����</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(7)" src="images/sepecial/hotel3.jpg" alt="">
                     <div class="label">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">������ ȣ�� <br>���� ������ ����</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a align="center" onclick="moving(7)">�� ����</a>
                     </div>
                     
                  </div>
               </div>
                <div class="grid_3">
                  <div class="banner special">
                     <img style="width:250px;height:280px;" onclick="moving(8)" src="images/sepecial/hotel4.jpg" alt="">
                     <div class="label">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">���� �Ӹ��� ȣ��</div>
                        <div class="price">from<span>�ڡڡڡ١�</span></div>
                        <a  onclick="moving(8)">�� ����</a>
                     </div>
                  </div>
               </div>

               
      </div>
      <div class="container_12">      
            <h3><span style="color:#C73430;">HOT</span> CAFE</h3>
            <h2 style="font-size:1.3em;">���� �̿��ڵ��� ��ȣ�ϴ� �Ĵ��Դϴ�.</h2>
               <div class="grid_3">
                  <div class="banner special">
                     <img onclick="moving(9)" style="width:250px;height:280px;" src="images/sepecial/ca1.jpg" alt="">
                     <div class="label">
                        <div class="title">���̺� ī��</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(9)">�� ����</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special">
                     <img onclick="moving(10)" style="width:250px;height:280px;" src="images/sepecial/ca2.jpg" alt="">
                     <div class="label">
                        <div class="title">�������丮ī��</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(10)">�� ����</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special">
                     <img onclick="moving(11)" style="width:250px;height:280px;" src="images/sepecial/ca3.jpg" alt="">
                     <div class="label">
                        <div class="title">����</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(11)">�� ����</a>
                     </div>
                  </div>
               </div>
                <div class="grid_3">
                  <div class="banner special">
                     <img onclick="moving(12)" style="width:250px;height:280px;" src="images/sepecial/ca4.jpg" alt="">
                     <div class="label">
                        <div class="title">������</div>
                        <div class="price">from<span>�ڡڡڡڡ�</span></div>
                        <a onclick="moving(12)">�� ����</a>
                     </div>
                  </div>
               </div>

               
      </div>
         <!-- ^allfor you -->
      </div>
       <script type="text/javascript">
      function moving(result){
    	  if(result==1){
    		  location.href="tourInformation.jsp#hotRe1"; 		
    	  }else if (result ==2){
    		 location.href="tourInformation.jsp#hotRe2";		  
    	  }else if (result ==3){
    		 location.href="tourInformation.jsp#hotRe3";  		  
    	  }else if (result ==4){
    		 location.href="tourInformation.jsp#hotRe4";
    		  
    	  }else if (result ==5){
    		 location.href="HotHotel.jsp#hotRe1";
    		  
    	  }else if (result ==6){
    		 location.href="HotHotel.jsp#hotRe2";
    		  
    	  }else if (result ==7){
    		 location.href="HotHotel.jsp#hotRe3";
    		  
    	  }else if (result ==8){
    		 location.href="HotHotel.jsp#hotRe4";
    		  
    	  }else if (result ==9){
    		 location.href="HotCafe.jsp#hotRe1";
    		  
    	  }else if (result ==10){
    		 location.href="HotCafe.jsp#hotRe2";
    		  
    	  }else if (result ==11){
    		 location.href="HotCafe.jsp#hotRe3";
    		  
    	  }else if (result ==12){
    		 location.href="HotCafe.jsp#hotRe4";
    		  
    	  }
    	  
      }
      </script>
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