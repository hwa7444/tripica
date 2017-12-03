<%@page import="com.DAO.mymapVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.DAO.mymapDAO"%>
<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=EUC-KR">
<title>SHOW MAP</title>
<style type="text/css">
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
	left: 70px;
	top: 50px;
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

#minimap7 { /*�Խ��� Ŭ�� �� ��Ÿ���� ��*/
	background-color: lightblue;
	width: 100%;
	height: 490px;
}
#songha{
background-color: #FBFBFB;
color:#C73430;
border-top-left-radius: 10%;
}
#soul{
color: #002141;
}
</style>
</head>

<body>
	<%
		int index = Integer.parseInt(request.getParameter("num"));
		ArrayList<mymapVO> hmlist = null;
		mymapDAO mdao = new mymapDAO();
		hmlist = mdao.getMymap(index);
		request.setAttribute("hlist", hmlist);
	%>

	<div id="minimap7"></div>

	<script type="text/javascript"
		src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7b2110a6aaef5104b2ce89c704a24ed3"></script>

	<script>
		var hmlist = new Array();
		<c:forEach items="${hlist}" var="item1">
		var mapobj = {
			name : '${item1.pname}',
			pcontent : '${item1.pcontent}',
			lat : '${item1.plat}',
			lng : '${item1.plng}',
			pgroup : '${item1.pgroup}'
		};
		hmlist.push(mapobj);
		</c:forEach>

		/* hotmap ���� */
		var mapContainerhot = document.getElementById('minimap7'), // ������ ǥ���� div  
		mapOption = {
			center : new daum.maps.LatLng(33.37137, 126.56695), // ������ �߽���ǥ
			level : 10
		// ������ Ȯ�� ����
		};
		
		var hotmap = new daum.maps.Map(mapContainerhot, mapOption); // ������ �����մϴ�
		// ���� Ÿ�� ���� ��Ʈ���� �����Ѵ�
		var mapTypeControl5 = new daum.maps.MapTypeControl();
		// ������ ��� ������ ���� Ÿ�� ���� ��Ʈ���� �߰��Ѵ�
	    hotmap.addControl(mapTypeControl5, daum.maps.ControlPosition.TOPRIGHT);
		//����Ÿ�� ��Ʈ���� ���� �Ǵ� ��ī�̺� ��ư�� Ŭ���ϸ� ȣ��Ǿ� ����Ÿ���� �ٲٴ� �Լ��Դϴ�
		hotmap.setMapTypeId(daum.maps.MapTypeId.HYBRID);
		
		var linePath2 = [];
		var hotpositions = [];

		/* ������ ����� ���� */
		var cnt = 1; //���������� ī��Ʈ���� ex : 1. ī�亣�� , 2. �츮��
		for (var i = 0; i < hmlist.length; i++) {
			var getposition = new daum.maps.LatLng(hmlist[i].lat, hmlist[i].lng);
			hotpositions[i] = {
					content :'<div class="customoverlay" id="songha">'
						+ '    <span class="title" id="soul">'+cnt+'. '+hmlist[i].name+ '</span>'
						+     hmlist[i].pcontent
						+ '</div>',
				latlng : getposition
			};
			cnt += 1;
		}

		for (var i = 0; i < hotpositions.length; i++) {
			if(i==0){
				hotmap.setCenter(hotpositions[0].latlng);
			}
			var marker = new daum.maps.Marker({
				map : hotmap, // ��Ŀ�� ǥ���� ����
				clickable : true,
				position : hotpositions[i].latlng
			// ��Ŀ�� ��ġ
			});
			marker.setMap(hotmap);

			var customOverlay = new daum.maps.CustomOverlay({
				map : hotmap,
				position : hotpositions[i].latlng,
				content : hotpositions[i].content,
				yAnchor : 1
			});
			customOverlay.setMap(hotmap);
			linePath2.push(hotpositions[i].latlng);
			if (i >= 1) {
				hotline();
			}
		}

		function hotline() {
			// ������ ǥ���� ���� �����մϴ�
			var polyline2 = new daum.maps.Polyline({
				path : linePath2, // ���� �����ϴ� ��ǥ�迭 �Դϴ�
				strokeWeight : 5, // ���� �β� �Դϴ�
				strokeColor : '#F44336', // ���� �����Դϴ�
				strokeOpacity : 0.7, // ���� ������ �Դϴ� 1���� 0 ������ ���̸� 0�� �������� �����մϴ�
				strokeStyle : 'solid' // ���� ��Ÿ���Դϴ�
			});
			// ������ ���� ǥ���մϴ� 
			polyline2.setMap(hotmap);

		}
	</script>

</body>
</html>