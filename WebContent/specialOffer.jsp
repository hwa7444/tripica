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
   <%
		String nick = null;
		if (session.getAttribute("nick") != null) {
			nick = (String) session.getAttribute("nick");
		}
	%>
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
            	<h2 style="font-size:1.3em;">맛있고 특색있는 음식을 파는 추천 식당 입니다.</h2>
               <div class="grid_3">
                  <div class="banner special" id="pic1">
                     <img style="width:250px;height:280px;" onclick="moving(1)" src="images/sepecial/re1.jpg" >
                     <div class="label" onclick="moving(1)">
                        <div class="title">명진 전복</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(1)">더보기</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special"  id="pic2">
                     <img style="width:250px;height:280px;" onclick="moving(2)" src="images/sepecial/re2.jpg" alt="">
                     <div class="label" onclick="moving(2)">
                        <div class="title">우진해장국</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(2)">더보기</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special" id="pic3">
                     <img style="width:250px;height:280px;" onclick="moving(3)" src="images/sepecial/re3.jpg" alt="">
                     <div class="label" onclick="moving(3)">
                        <div class="title">소울 키친</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(3)">더보기</a>
                     </div>
                  </div>
               </div>
                <div class="grid_3">
                  <div class="banner special" id="pic4">
                     <img style="width:250px;height:280px;" onclick="moving(4)" src="images/sepecial/re4.jpg" alt="">
                     <div class="label" onclick="moving(4)">
                        <div class="title">자매국수</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(4)">더보기</a>
                     </div>
                  </div>
               </div> 
      </div>
 
      <div class="container_12">      
            <h3><span style="color:#C73430;">HOT</span> HOTEL</h3>
            <h2 style="font-size:1.3em;">머무는 동안 편안히 지내다 갈 수 있는 추천 호텔 입니다.</h2>
               <div class="grid_3">
                  <div class="banner special"  id="pic5">
                     <img style="width:250px;height:280px;" onclick="moving(5)" src="images/sepecial/hotel1_1.jpg" alt="">
                     <div class="label" onclick="moving(5)">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">호텔 리젠트<br> 마린 더 블루</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(5)">더 보기</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special"  id="pic6">
                     <img style="width:250px;height:280px;" onclick="moving(6)" src="images/sepecial/hotel2_1.jpg" alt="">
                     <div class="label" onclick="moving(6)">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">라마다 앙코르<br> 이스트 호텔</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a  onclick="moving(6)">더 보기</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special"  id="pic7">
                     <img style="width:250px;height:280px;" onclick="moving(7)" src="images/sepecial/hotel3_1.jpg" alt="">
                     <div class="label" onclick="moving(7)">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">데이즈 호텔 <br>제주 서귀포 오션</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a align="center" onclick="moving(7)">더 보기</a>
                     </div>
                     
                  </div>
               </div>
                <div class="grid_3">
                  <div class="banner special"  id="pic8">
                     <img style="width:250px;height:280px;" onclick="moving(8)" src="images/sepecial/hotel4_1.jpg" alt="">
                     <div class="label" onclick="moving(8)">
                        <div style="font-size:1.5em; text-shadow: 0.05em 0.05em 0.15em #193c46;">오션 팰리스 호텔</div>
                        <div class="price">&nbsp<span>★★★☆☆</span></div>
                        <a  onclick="moving(8)">더 보기</a>
                     </div>
                  </div>
               </div>

      </div>
      <div class="container_12">      
            <h3><span style="color:#C73430;">HOT</span> CAFE</h3>
            <h2 style="font-size:1.3em;">멋진 풍경이 함께하는 추천 카페 입니다.</h2>
               <div class="grid_3">
                  <div class="banner special"  id="pic9">
                     <img onclick="moving(9)" style="width:250px;height:280px;" src="images/sepecial/ca1.jpg" alt="">
                     <div class="label" onclick="moving(9)">
                        <div class="title">메이비 카페</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(9)">더 보기</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special"  id="pic10">
                     <img onclick="moving(10)" style="width:250px;height:280px;" src="images/sepecial/ca2.jpg" alt="">
                     <div class="label" onclick="moving(10)">
                        <div class="title">에이팩토리카페</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(10)">더 보기</a>
                     </div>
                  </div>
               </div>
               <div class="grid_3">
                  <div class="banner special"  id="pic11">
                     <img onclick="moving(11)" style="width:250px;height:280px;" src="images/sepecial/ca3.jpg" alt="">
                     <div class="label" onclick="moving(11)">
                        <div class="title">몽상</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(11)">더 보기</a>
                     </div>
                  </div>
               </div>
                <div class="grid_3">
                  <div class="banner special"  id="pic12">
                     <img onclick="moving(12)" style="width:250px;height:280px;" src="images/sepecial/ca4_1.jpg" alt="">
                     <div class="label" onclick="moving(12)">
                        <div class="title">델문도</div>
                        <div class="price">&nbsp<span>★★★★☆</span></div>
                        <a onclick="moving(12)">더 보기</a>
                     </div>
                  </div>
               </div>              
      </div>
      <script type="text/javascript">
      document.getElementById("pic1").addEventListener("mouseover",
				function(e) {pic1.style.cursor ="pointer";});
      document.getElementById("pic2").addEventListener("mouseover",
				function(e) {pic2.style.cursor ="pointer";});
      document.getElementById("pic3").addEventListener("mouseover",
				function(e) {pic3.style.cursor ="pointer";});
      document.getElementById("pic4").addEventListener("mouseover",
				function(e) {pic4.style.cursor ="pointer";});
      document.getElementById("pic5").addEventListener("mouseover",
				function(e) {pic5.style.cursor ="pointer";});
      document.getElementById("pic6").addEventListener("mouseover",
				function(e) {pic6.style.cursor ="pointer";});
      document.getElementById("pic7").addEventListener("mouseover",
				function(e) {pic7.style.cursor ="pointer";});
      document.getElementById("pic8").addEventListener("mouseover",
				function(e) {pic8.style.cursor ="pointer";});
      document.getElementById("pic9").addEventListener("mouseover",
				function(e) {pic9.style.cursor ="pointer";});
      document.getElementById("pic10").addEventListener("mouseover",
				function(e) {pic10.style.cursor ="pointer";});
      document.getElementById("pic11").addEventListener("mouseover",
				function(e) {pic11.style.cursor ="pointer";});
      document.getElementById("pic12").addEventListener("mouseover",
				function(e) {pic12.style.cursor ="pointer";});
      </script>
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