<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@	page import="java.util.List"%>
<%@ page import="_9_31_court_model.*"%>
<%@ page import="_31_court_service.*"%>
<%-- 此頁採用 JSTL 與 EL 取值 --%>
<%
	List<CourtVO> list;
	String court = (String) request.getParameter("court");
	if (court == null) {
		CourtService courtSvc = new CourtService();
		list = courtSvc.findAll();
		pageContext.setAttribute("list", list);
	} else {
		CourtService courtSvc = new CourtService();
		list = courtSvc.findByCourtName(court);
		pageContext.setAttribute("list", list);
	}
%>
<!DOCTYPE >
<html>
<head>
<style>
div.imgtest {
	width: 100%;
	height: 250px;
	background-size: cover;
	background-position: center center;
	background-repeat: no-repeat;
}
</style>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>queryCourt</title>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
	<!-- 選擇器&搜尋button -->
	<div style="margin-left: 100px; margin-right: 100px">
		<div class="row">
			<div class="col-sm-12" style="margin-bottom: 30px">
				<h2 style="color: #2ebd59; text-align: center; font-family: 微軟正黑體;">想去哪打球?</h2>
				<hr>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-3">
				<form name="county" method="post" action="">
					<!-- 縣市選擇器 -->
					<div class="form-group">
						<select class="form-control" onchange="renew(this.selectedIndex);">
							<option disabled="disabled" selected="selected">全部縣市</option>
							<option value="2">臺北市</option>
							<option value="3">新北市</option>
							<option value="4">桃園市</option>
							<option value="5">基隆市</option>
							<option value="6">新竹市</option>
							<option value="7">新竹縣</option>
							<option value="8">宜蘭縣</option>
							<option value="9">苗栗縣</option>
							<option value="10">臺中市</option>
							<option value="11">彰化縣</option>
							<option value="12">南投縣</option>
							<option value="13">雲林縣</option>
							<option value="14">嘉義縣</option>
							<option value="15">嘉義市</option>
							<option value="16">臺南市</option>
							<option value="17">屏東縣</option>
							<option value="18">高雄市</option>
							<option value="19">花蓮縣</option>
							<option value="20">臺東縣</option>
							<option value="21">澎湖縣</option>
							<option value="22">金門縣</option>
							<option value="23">連江縣</option>
						</select>
					</div>
					<!-- 行政區選擇器 -->
					<div class="form-group">
						<select class="form-control" name="bolcks">
							<option disabled="disabled" selected="selected">全部行政區</option>
						</select>
					</div>
				</form>
				<form action="CourtServlet.do" name="findByONE" method="post">
					<!-- 關鍵字搜尋 -->
					<div class="form-group">
						<input type="text" class="form-control" placeholder="請輸入名稱" name="court"> <input type="hidden" name="action" value="queryByName">
					</div>
					<div class="form-group">
						<button class="btn btn-danger form-control" type="submit">
							<img src="image/search.png" style="width: 20px; height: 20px">
							<div class="fa fa-search" style="font-family: 微軟正黑體;">搜尋</div>
						</button>
					</div>
				</form>
			</div>
			<!-- 	場地資料 -->
			<div class="col-sm-9">
				<%@ include file="page1.file"%>
				<c:forEach var="courtVO" items="${list}" begin="<%=pageIndex %>" end="<%=pageIndex+rowsPerPage-1 %>">
					<div class="row">
						<div class="col-sm-4">
							<div class="imgtest" style="width: 100%; height: 250px; background-image: url('${courtVO.imgUrl}'); margin-bottom: 20px"></div>
						</div>
						<div class="col-sm-8">
							<div style="padding: 10px; width: 400px">
								<div style="margin-top: 30px">
									<img src="image/architecture-interior.png" width="20px" height="20px">
									<h4 style="color: white;">${courtVO.name}</h4>
									<img src="image/location-alt.png" width="20px" height="20px">
									<span style="color: white;">${courtVO.courtaddress}</span>
								</div>
							</div>
						</div>
					</div>
				</c:forEach>
				<%@ include file="page2.file"%>
			</div>
		</div>
	</div>
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
				document.county.bolcks.options[i] = new Option(manyBlocks[index][i], manyBlocks[index][i]); // 設定新選項
			document.county.bolcks.length = manyBlocks[index].length; // 刪除多餘的選項
		}
	</script>
</body>
</html>