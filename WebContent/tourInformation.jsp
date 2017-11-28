<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">
   <head>
      <title>Special Offers</title>
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
                        <li class="current"><a href="HotTour.jsp">HOT TOURS</a></li>
                        <li><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
                        <li><a href="index-3.html">BLOG</a></li>
                        <li><a href="Index04_Map.jsp">CONTACTS</a></li>
                     </ul>
                  </nav>
                  <div class="clear"></div>
               </div>
            </div>
            <div class="grid_12">
               <h1>
                  <a href="index.html">
                     <img src="images/logo.png" alt="Your Happy Family">
                  </a>
               </h1>
            </div>
         </div>
      </header>
<!--==============================Content=================================-->
      <div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
         <div class="container_12">
            <div class="grid_8">
               <h3>Special offers</h3>
               <div class="block2">
                  <img src="images/logo/tripickerLogo9.png" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1"><a href="#">Barcelona</a></div>
                     <p>Cras facilisis, nulla vel viverra auctor, leo gna sodales felis, quis malesuada nibh odio ut velit. Proin pharetra luctus diam, a celerisque eros convallis accumsan. </p>Maecenas vehicula egestas venenatis. Duis massa elit, auctor non pellentesque vel
                     <br>
                     <a href="#" class="link1">LEARN MORE</a>
                  </div>
               </div>
               <div class="block2">
                  <img src="images/page3_img2.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1"><a href="#">Moscow</a></div>
                     <p>Cras facilisis, nulla vel viverra auctor, leo gna sodales felis, quis malesuada nibh odio ut velit. Proin pharetra luctus diam, a celerisque eros convallis accumsan. </p>Maecenas vehicula egestas venenatis. Duis massa elit, auctor non pellentesque vel
                     <br>
                     <a href="#" class="link1">LEARN MORE</a>
                  </div>
               </div>
               <div class="block2">
                  <img src="images/page3_img3.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1"><a href="#">Thailand</a></div>
                     <p>Cras facilisis, nulla vel viverra auctor, leo gna sodales felis, quis malesuada nibh odio ut velit. Proin pharetra luctus diam, a celerisque eros convallis accumsan. </p>Maecenas vehicula egestas venenatis. Duis massa elit, auctor non pellentesque vel
                     <br>
                     <a href="#" class="link1">LEARN MORE</a>
                  </div>
               </div>
            </div>
            <div class="grid_3 prefix_1">
               <h5>CHOOse the country</h5>
               <ul class="list">
                  <li><a href="#">Albania</a></li>
                  <li><a href="#">American Samoa</a></li>
                  <li><a href="#">Antarctica</a></li>
                  <li><a href="#">Argentina</a></li>
                  <li><a href="#">Armenia</a></li>
                  <li><a href="#">Australia</a></li>
                  <li><a href="#">Austria</a></li>
                  <li><a href="#">Bahrain</a></li>
                  <li><a href="#">Barbados</a></li>
                  <li><a href="#">Belgium</a></li>
                  <li><a href="#">Belize</a></li>
                  <li><a href="#">Bermudas</a></li>
               </ul>
               <a href="#" class="link1">VIEW A<span class="low">ll</span></a>
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
