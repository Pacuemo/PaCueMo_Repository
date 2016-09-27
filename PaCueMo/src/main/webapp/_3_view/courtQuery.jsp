<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	page import="java.util.List"%>
<%@ page import="_9_31_court_model.*"%>
<%@ page import="_31_court_service.*"%>
<%@	page import="org.springframework.context.ApplicationContext"%>
<%@	page import="org.springframework.web.context.support.WebApplicationContextUtils"%>
<%
	List<CourtVO> list;
	String court;
	String city;
	ApplicationContext context = WebApplicationContextUtils.getWebApplicationContext(request.getServletContext());
	CourtService courtSvc = context.getBean(CourtService.class);
	
	if ((city = (String) request.getAttribute("test")) == null) {
		city = request.getParameter("test");
		if (city != null)
			if (city.length() == 0) {
				city = null;
			}
	}

	if ((court = (String) request.getAttribute("court")) == null) {
		court = request.getParameter("court");
		if (court != null)
			if (court.length() == 0) {
				court = null;
			}
	}

	if (court == null && city == null) {
		list = courtSvc.findAll();
		pageContext.setAttribute("list", list);
	} else if (court != null && city != null) {

		list = courtSvc.findByAddress(city, court);
		pageContext.setAttribute("list", list);
	} else if (court != null && city == null) {

		list = courtSvc.findByCourtName(court);
		pageContext.setAttribute("list", list);
	} else if (court == null && city != null) {

		list = courtSvc.findByCourtName(city);
		pageContext.setAttribute("list", list);
	} else {

		list = courtSvc.findByCourtName(court);
		pageContext.setAttribute("list", list);
	}
%>
<!DOCTYPE >
<html>
<head>
<style>
div.imgtest:HOVER {
	width: 100%;
	height: 250px;
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
	-webkit-transition: all 0.5s ease;
	-webkit-transform: scale(1.0);
}

button[type=submit]:hover {
	background-color: #007500 !important;
}

div.row.google {
	height: 500px;
	width: 100%;
	margin-bottom: 10px;
	margin-left: 0px;
}

div.map {
	height: 500px;
	width: 100%;
}

map-btn {
	cursor: pointer;
}

</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>PACUEMO Court</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
<style>
body {
	background-image:
		url("${pageContext.request.contextPath }/_3_view/image/los_angeles_california_evening_playground_V2.png");
}
.info{
background-color: rgba(0, 0, 0,0.4);
margin-top: 20px
}
.info:hover{
background-color: rgba(0, 0, 0,0.2)
}
</style>
	<!-- 選擇器&搜尋button -->
	<div class="container">
		<div class="row">
			<div class="col-sm-12">
				<h1 style="color: #2ebd59; text-align: center; font-family: 微軟正黑體;">
					<strong>想去哪打球?</strong>
				</h1>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-4">
				<form name="county" action="CourtServlet.do" method="post">
					<!-- 縣市選擇器 -->
					<div class="form-group">
						<select class="form-control" id="city" name="city1" onchange="renew(this.selectedIndex);">
							<option disabled="disabled" selected="selected">全部縣市</option>
							<option value="臺北市">臺北市</option>
							<option value="新北市">新北市</option>
							<option value="桃園市">桃園市</option>
							<option value="基隆市">基隆市</option>
							<option value="新竹市">新竹市</option>
							<option value="新竹縣">新竹縣</option>
							<option value="宜蘭縣">宜蘭縣</option>
							<option value="苗栗縣">苗栗縣</option>
							<option value="臺中市">臺中市</option>
							<option value="彰化縣">彰化縣</option>
							<option value="南投縣">南投縣</option>
							<option value="雲林縣">雲林縣</option>
							<option value="嘉義縣">嘉義縣</option>
							<option value="嘉義市">嘉義市</option>
							<option value="臺南市">臺南市</option>
							<option value="屏東縣">屏東縣</option>
							<option value="高雄市">高雄市</option>
							<option value="花蓮縣">花蓮縣</option>
							<option value="臺東縣">臺東縣</option>
							<option value="澎湖縣">澎湖縣</option>
							<option value="金門縣">金門縣</option>
							<option value="連江縣">連江縣</option>
						</select>
					</div>
					<!-- 行政區選擇器 -->
					<div class="form-group">
						<select class="form-control" id="dist" name="bolcks">
							<option value="x" disabled="disabled" selected="selected">全部行政區</option>
						</select>
					</div>
					<!-- 關鍵字搜尋 -->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="請輸入名稱" name="court" style="border-radius: 5px;">
					</div>
					<div class="form-group">
						<button class="form-control" type="submit" style="color: white; border-radius: 5px; background-color: #2ebd59; text-align: center;">
							<img src="image/search.png" style="display: inline; width: 20px; height: 20px;"><strong>搜尋</strong>
						</button>
					</div>
				</form>
			</div>
			<!-- 場地資料 -->
			<div class="col-sm-8">
				<%@ include file="page1.file"%>
				<c:forEach var="courtVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
					<div class="row info" >
						<div class="col-sm-6" >
							<div class="box" style="margin-top:20px">
								<div class="imgtest" style="width: 100%; height: 250px; background-image: url('${courtVO.imgUrl}'); margin-bottom: 20px"></div>
							</div>
						</div>
						<div class="col-sm-6">
							<div style="padding: 10px; width: 100%; min-height: 250px;">
								<div style="margin-top: 40px">
									<img src="image/City.png" width="20px" height="20px" style="float: left;">
									<h4><strong style="color: black; font-family: 微軟正黑體; margin-left: 10px">${courtVO.name}</strong></h4>
									<img src="image/Location.png" width="20px" height="20px" style="float: left;"> <strong style="color: black; font-family: 微軟正黑體; margin-left: 10px;">${courtVO.courtaddress}</strong>
									<br>
									<img src="image/Phone.png" width="20px" height="20px" style="float: left;"> <strong style="color: black; font-family: 微軟正黑體; margin-left: 10px;">${courtVO.phone}</strong>
									<br>
									<img src="image/map.png" width="20px" height="20px" style="float: left;">
									<button class="map-btn" style="margin-left: 10px; border-radius: 5px; background-color: #C0C0C0; font-family: 微軟正黑體;">
										<strong>開啟地圖</strong>
									</button>
									<input id="long" type="hidden" value="${courtVO.longitue}"> <input id="lat" type="hidden" value="${courtVO.latitue}">
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<!-- 分頁按鈕 -->
				<%@ include file="page2.file"%>
			</div>
		</div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery.tinyMap.min.js"></script>
	<script type="text/javascript">
		// 		--------------------二階動態段選擇器
		manyBlocks = new Array();
		manyBlocks[1] = [ "中正區", "大同區", "中山區", "松山區", "大安區", "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區" ];
		manyBlocks[2] = [ "八里區", "三芝區", "三重區", "三峽區", "土城區", "中和區", "五股區", "平溪區", "永和區", "石門區", "石碇區", "汐止區", "坪林區", "林口區", "板橋區", "金山區", "泰山區", "烏來區", "貢寮區", "淡水區", "深坑區", "新店區", "新莊區", "瑞芳區", "萬里區", "樹林區", "雙溪區", "蘆洲區", "鶯歌區" ];
		manyBlocks[3] = [ "桃園區", "龜山區", "八德區", "大溪區", "蘆竹區", "大園區", "中壢區", "龍潭區", "平鎮區", "楊梅區", "新屋區", "觀音區", "復興區", ];
		manyBlocks[4] = [ "仁愛區", "中正區", "中山區", "信義區", "安樂區", "暖暖區", "七堵區" ];
		manyBlocks[5] = [ "東區", "北區", "香山區" ];
		manyBlocks[6] = [ "竹北市", "竹東鎮", "新埔鎮", "關西鎮", "湖口鄉", "新豐鄉", "峨眉鄉", "寶山鄉", "北埔鄉", "芎林鄉", "橫山鄉", "尖石鄉", "五峰鄉" ];

		function renew(index)
		{
			for (var i = 0; i < manyBlocks[index].length; i++)
				document.county.bolcks.options[i + 1] = new Option(manyBlocks[index][i], manyBlocks[index][i]); // 設定新選項
			document.county.bolcks.length = manyBlocks[index].length + 1; // 刪除多餘的選項
			$("#dist").val("x");
		}

		// 		------------------Google Map
		$(function()
		{
			$.fn.tinyMapConfigure({
			// Google Maps API URL
			'api' : '//maps.googleapis.com/maps/api/js',
			// Google Maps API Version
			'v' : '3.21',
			// Google Maps API Key，預設 null
			'key' : 'AIzaSyC4JivBSibr0L3cVIfLlgdq6bVZuOMxUuk',
			// 使用的地圖語言
			'language' : 'zh‐TW',
			// 載入的函式庫名稱，預設 null
			'libraries' : 'adsense,drawing,geometry...',
			// 使用個人化的地圖，預設 false
			'signed_in' : true | false,
			// MarkerClustererPlus.js 路徑
			// 預設 'https://cdn.essoduke.org/js/tinyMap/markerclusterer.js'
			// 建議下載至自有主機，避免讀取延遲造成無法使用。
			// 			    'clusterer': 'path/to/markerclusterer.js'
			// MarkerWithLabel.js 路徑
			// 預設 'https://cdn.essoduke.org/js/tinyMap/markerwithlabel.js'
			// 建議下載至自有主機，避免讀取延遲造成無法使用。
			// 			    'withLabel': '/path/to/markerwithlabel.js'
			});

			function addMap()
			{
				$(this).parent().parent().parent().parent().after("<div class='row google'><div class='map'></div></div>");
				var longx = $(this).next().val();
				var lat = $(this).next().next().val();
				$("div.map").tinyMap({
				// Map center
				'center' : { 'lat' : lat, 'lng' : longx }, 'zoom' : 17, 'marker' : [ { 'addr' : [ lat, longx ],
				// 動畫效果
				'animation' : 'DROP' }, ] });

				$(this).text("關閉地圖");
				$(this).unbind("click")
				$(this).bind("click", removeMap)
			}

			function removeMap()
			{
				$(this).parent().parent().parent().parent().next().remove();
				$(this).text("開啟地圖");
				$(this).unbind("click")
				$(this).bind("click", addMap)
			}

			$("button.map-btn").bind("click", addMap);
		})
	</script>
</body>
</html>