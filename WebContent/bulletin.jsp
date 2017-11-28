<%@page import="org.apache.jasper.tagplugins.jstl.core.ForEach"%>
<%@page import="com.DAO.bulletinDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.bulletinVO"%>
<%-- <%@page import="com.sun.xml.internal.txw2.Document"%> --%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>

<!DOCTYPE html>
<html lang="en">
<head>
<title>Blog</title>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<!-- 부트스트랩 -->
<meta name="viewport" content="width=device-width" , initial-scale="1">
<link rel="stylesheet" href="css/bootstrap.css">
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
								<li><a href="HotTour.jsp">HOT TOURS</a></li>
								<li><a href="specialOffer.jsp">SPECIAL OFFERS</a></li>
								<li class="current"><a href="SelectService?start=0&end=9">POST</a></li>
								<li><a href="Index04_Map.jsp">CONTACTS</a></li>
							</ul>
						</nav>
						<div class="clear"></div>
					</div>
				</div>
				<div class="grid_12">
					<h1>
						<a href="index.html"> <img src="images/logo.png"
							alt="Your Happy Family">
						</a>
					</h1>
				</div>
			</div>
		</header>
		<!--==============================Content=================================-->
		<div class="content">
			<div class="ic"></div>
			<div class="container_12">
				<!--================ blogPost ================-->
				<div class="grid_12">
					<h3>Recent Posts</h3>
					<div class="row">
						<table class="table table-striped"
							style="text-align: center; border: 1pxx solid #dddddd;">
							<thead>
								<tr>
									<th style="background-color: #eeeeee; text-align: center;">번호</th>
									<th style="background-color: #eeeeee; text-align: center;">제목</th>
									<th style="background-color: #eeeeee; text-align: center;">작성자</th>
									<th style="background-color: #eeeeee; text-align: center;">작성일</th>
								</tr>
							</thead>
							<tbody>

								<%
									/*	int start = 1;
										int end = 10;
										
										if(request.getParameter("start") != null || request.getParameter("end") != null){
											bulletinDAO dao = bulletinDAO.getInstance();
											ArrayList<bulletinVO> arr = dao.selectAll(Integer.parseInt(request.getParameter("start")), Integer.parseInt(request.getParameter("end")));
											request.setAttribute("list", arr);
										}else{
										 */

									/* 		}
											 */
								%>
								<c:set var="size" value="${fn:length(list)}"></c:set>
								<c:set var="in" value="1"></c:set>
								<c:choose>

									<c:when test="${not empty list}">
										<c:forEach items="${list}" var="vo" begin="0" end="9" step="1"
											varStatus="idx">
											<tr>
												<td>${vo.num}</td>
												<td><a href="SelectOne?num=${vo.num}">${vo.title}</a></td>
												<%-- <td><img style="max-width:200px !important; height:200px;" src="upload/${vo.fileName}"></td> --%>
												<td>${vo.nick}</td>
												<td>${vo.writeDay}</td>
											</tr>
											<c:if test="${size > idx.index}">
												<c:if test="${idx.index % 9 == 0}">
													<a href="" onclick="izn(${in })">${in }</a>
													<c:set var="in" value="${in+1 }"></c:set>
												</c:if>
											</c:if>
										</c:forEach>
									</c:when>
									<c:otherwise>
										<tr>
											<td colspan="4">현재 데이터가 존재하지 않습니다.</td>
										</tr>
									</c:otherwise>
								</c:choose>

							</tbody>
						</table>
						<%-- <c:if test="<%= start >1 %>">
							<a href="SelectService?start=<%= start - 10%>&end=<%= end - 10%>"
								class="btn btn-success btn-arraw-left">이전</a>
						</c:if>
						<!-- 페이징 다시 하기!! -->
						<c:when test="${ 페이지 체크!!!}">
						<a href="SelectService?start=<%= start + 10%>&end=<%=end + 10%>"
							class="btn btn-success btn-arraw-left">다음</a>
							<% start = Integer.parseInt(request.getParameter("start")); %>
						</c:when> --%>
						<c:choose>
							<c:when test="${not empty id}">
								<!-- 로그인 했을 때 -->
								<a href="write.jsp" class="btn btn-primary pull-right">글쓰기</a>
							</c:when>
							<c:otherwise>

							</c:otherwise>
						</c:choose>
					</div>
				</div>

			</div>
			<!-- container_12 -->
			<!--================= ^blogPost ==================-->

			<!-- ^allfor you -->
		</div>
		<!--==============================footer=================================-->
		<footer>
			<div class="container_12">
				<div class="grid_12">
					<div class="socials">
						<a href="#" class="fa fa-facebook"></a> <a href="#"
							class="fa fa-twitter"></a> <a href="#" class="fa fa-google-plus"></a>
					</div>
					<div class="copy">
						Tripicker (c) 2017 | <a href="#">Privacy Policy</a> | Website
						Template Designed by <a href="http://www.templatemonster.com/"
							rel="nofollow">TemplateMonster.com</a>
					</div>
				</div>
			</div>
		</footer>
		<script>
		function izn(num){
			alert(num);
		}
		
		
		
			$(function() {
				$('#bookingForm').bookingForm({
					ownerEmail : '#'
				});
			})
		</script>
</body>
</html>