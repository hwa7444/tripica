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
   <style type="text/css">
.content {
background-color: #FBFBFB;
background-image:url("images/large.jpg");
background-repeat:repeat; 
padding-bottom: 120px;
}
</style>   
   </head>
   <body>
   <!-- ==========================설문조사 팝업  입니다.============================ -->
	<!-- 1차 여행 설문 form -->
	<a href="#x" class="overlay2" id="trip_form1"></a>
	<div class="popup2">

		<div class="container_12">
			<span>SELECT YOUR TRAVEL TYPE</span><br>
			<p style="font-size: 1.4em;">당신이 마음에 드는 사진을 선택하세요!</p>
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
	<!--=====================================설문조사 도달 자바스크립트JAVA SCRIPT===========================================-->
	<!-- 2차 설문 조사로 이동-->
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
					var first1 = document.getElementById("first1"); /*형선 : Activity*/
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first1").src;
					
					first1.src = "images/Activity/amu/A_amu_1.jpg"; /*형선 : Activity_amu_1*/
					first2.src = "images/Activity/amu/A_amu_2.jpg"; /*형선 : Activity_amu_2*/
					first3.src = "images/Activity/spo/A_spo_1.jpg"; /*형선 : Activity_spo_1*/
					first4.src = "images/Activity/spo/A_spo_2.jpg"; /*형선 : Activity_spo_2*/

				} else if (result1 == 2) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2"); /* 형선 : Learning */
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first2").src;
					
					first1.src = "images/Learning/art/L_art_1.jpg"; /* 형선 : Learning_art_1 */
					first2.src = "images/Learning/art/L_art_2.jpg"; /* 형선 : Learning_art_2 */
					first3.src = "images/Learning/mus/L_mus_1.jpg"; /* 형선 : Learning_mus_1 */
					first4.src = "images/Learning/mus/L_mus_2.jpg"; /* 형선 : Learning_mus_1 */

				} else if (result1 == 3) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3"); /* 형선 : Relaxation */
					var first4 = document.getElementById("first4");
					type1 = document.getElementById("first3").src;
					
					first1.src = "images/Relaxation/res/R_res_1.jpg"; /* 형선 : Relaxation_res_1 */
					first2.src = "images/Relaxation/res/R_res_2.jpg"; /* 형선 : Relaxation_res_2 */
					first3.src = "images/Relaxation/res/R_res_3.jpg"; /* 형선 : Relaxation_res_3 */
					first4.src = "images/Relaxation/res/R_res_4.jpg"; /* 형선 : Relaxation_res_4 */

				} else if (result1 == 4) {
					var first1 = document.getElementById("first1");
					var first2 = document.getElementById("first2");
					var first3 = document.getElementById("first3");
					var first4 = document.getElementById("first4"); /* 형선 : View */
					type1 = document.getElementById("first4").src;
					 /*형선 : 이미지 값 넘어 가는 부분*/
					first1.src = "images/View/his/V_his_1.jpg"; /* 형선 : View_his_1 */
					first2.src = "images/View/his/V_his_2.JPG"; /* 형선 : View_his_2 */
					first3.src = "images/View/nat/V_nat_1.jpg"; /* 형선 : View_nat_1 */
					first4.src = "images/View/nat/V_nat_2.JPG"; /* 형선 : View_nat_2 */

				}
			} else if (aa == 2) {
				if (result1 == 1) {
					type2 = document.getElementById("first1").src;
			
					location.href = "TypeUpdateCon?type1=" + type1 + "&type2="
							+ type2; /*형선 : TypeUpdateCon으로 이동*/
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

	<!-- ==========================^설문조사 팝업 만들기============================ -->
  <!--==========================try me==============================-->
	
	<!-- login form -->
	<a href="#x" class="overlay" id="login_form2"></a>
	<div class="popup">
		<span>Warning!</span>
		<p>로그인 후 이용가능한 서비스 입니다.</p>
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
	
	<!-- login form -->
	<a href="#x" class="overlay" id="login_form"></a>
	<div class="popup">
		<span>Welcome Guest!</span>
		<p>아이디와 비밀번호를 입력하세요.</p>
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
		<p>아래의 항목을 채워주세요.</p>
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
				<c:when test="${empty vo1.id}">
					<ul>
						<li><a href="#login_form" id="login_pop">로그인</a></li>
						<li><a href="#join_form" id="join_pop">회원가입</a></li>
					</ul>
				</c:when>
				<c:otherwise>
					<ul>
					<li><h1 style="color:white;">${vo1.nick}님</h1></li>
						<li><a href="Logout.jsp" id="login_pop">로그아웃</a></li>
						<li><a href="#update_form" id="join_pop">개인정보수정</a></li>
						<li><a href="#trip_form1" id="trip_pop" onclick="move()">여행지추천 받기</a></li>
					</ul>
				</c:otherwise>
			</c:choose>
      </div>
      
<script type="text/javascript">
function move() {
document.getElementById("move").scrollIntoView(true);
		}
</script>

      <!-- ======^SIDE MENU===== -->
<!--==============================header=================================-->
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
								<li><a href="#trip_form1" onclick="move()">HOT TOURS</a></li>
							</c:otherwise>
						</c:choose>
                        <li class="current"><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
                        <li><a href="SelectService?start=0&end=8">POST</a></li>
                        <li><a href="Map.jsp">MAP INFO</a></li>
                     </ul>
                  </nav>
                  <div class="clear"></div>
               </div>
            </div>
            <div class="grid_12">
               <h1>
                  <a href="tourInformation.jsp">
                     <img id="hotRe1" src="images/logo/tripickerLogo9.png" alt="Your Happy Family">
                  </a>
               </h1>
            </div>
         </div>
      </header>
<!--==============================Content=================================-->
      <div class="content"><div class="ic">More Website Templates @ TemplateMonster.com - February 10, 2014!</div>
         <div class="container_12">
            <div class="grid_12">
                <h3><span style="color:#C73430;">HOT</span> RESTAURANT</h3>
               <div class="block2">
                  <img style="width:250px; height:266px;" src="images/sepecial/ca1_1.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1"><a href="#">메이비 카페</a></div>
                     <p>위치 : 서귀포 이중섭로 34</p> 
                     <p>전화번호 : 010-6666-0639</p>                   
                     <p>운영시간</p>
                     <p>오전 10:00 ~ 오전 1:00</p>

                  </div>
               </div>
               <div class="block2">
                  <img style="width:250px; height:300px;" src="images/sepecial/ca2_1.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1" id="hotRe2"><a href="#">에이팩토리카페</a></div>
                     <p>위치 : 제주 탑동로 11</p> 
                     <p>전화번호 : 064-720-8222</p>                   
                     <p>운영시간</p>
                     <p id="hotRe2">오전 8:00 ~ 오후 8:00</p>

                  </div>
               </div>
               <div class="block2">
                  <img style="width:250px; height:319px;" src="images/sepecial/ca3_1.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1" id="hotRe3"><a href="#">몽상</a></div>
                     <p>위치 : 제주 애월읍 애월북서길 56-1</p> 
                     <p>전화번호 : 064-799-8900</p>                   
                     <p>운영시간</p>
                     <p id="hotRe3">오전 9:00 ~ 오후 8:00</p>
                  </div>
               </div>
               <div class="block2">
                  <img style="width:250px; height:267px;" src="images/sepecial/ca4.jpg" alt="" class="img_inner fleft">
                  <div class="extra_wrapper">
                     <div class="text1 col1" id="hotRe4"><a href="#">델문도</a></div>
                     <p>위치 : 제주 조천읍 조함해안로 519-10</p> 
                     <p>전화번호 : 064-702-0007</p>                   
                     <p>운영시간</p>
                     <p>오전 8:00 ~ 오전 12:00</p>

                  </div>
               </div>
            </div>
         </div>
      </div>
      <!-- ^allfor you -->
      </div>
      
       <script type="text/javascript">
      function moving(result){
    	 if (result == 4){
    		
    		  document.getElementById("hotRe4").scrollIntoView(true);
    		/*   window.location.href="tourInformation.jsp"; */
    	  }
    	  
      }
      </script>
<!--==============================footer=================================-->
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
