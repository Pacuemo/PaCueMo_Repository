<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>

<!DOCTYPE html>
<html>
<head>
<c:url var="home" value="/" scope="request" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/animate.css">

<style>
.color_w {
	color: white;
}

.teamName {
	font-size: 32px;
	margin: 0px;
}

.margin_form {
	margin: 15px;
}

.battle_img{
width: 35%;
height: 35%;

}
</style>
<script>
	
</script>
</head>
<body>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />
<style>
body {
    background-image: url("${pageContext.request.contextPath }/image/team/nba_cup.jpg");
}
</style>
<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script> --%>
	
	<div class="row" style="margin: 0px">
		<div class="col-md-2">
				<div id="div_left" class="col-md-12 animate fadeInLeft animated" style="padding-left: 0px;">
			<c:forEach var="teamMemberVO" items="${requestScope.mineTeamVOs[0].teamMemberVOs}">
					<c:choose>
						<c:when test="${teamMemberVO.memberVO.memberImgUrl != null}">
							<img class="battle_img img-circle col-md-8" src="${pageContext.request.contextPath }/image/member/${teamMemberVO.memberVO.memberImgUrl }" style="margin-top: 10px;">
						</c:when>
						<c:otherwise>
							<img class="battle_img img-circle col-md-8" src="${pageContext.request.contextPath }/image/member/user.jpg" style="margin-top: 10px;">
						</c:otherwise>
					</c:choose>
					<div class="col-md-4 color_w" style="padding-left: 5px;padding-right: 0px">
						<h3 class="margin-top-10 margin-bottom-10">${teamMemberVO.memberVO.memberFirstName } </h3>
						<small style="font-size: 100%">&nbsp; - 
							<c:choose>
								<c:when test="${teamMemberVO.playerCardVO.playerPosition == 'PG'}">
										控球後衛
								</c:when>
								<c:when test="${teamMemberVO.playerCardVO.playerPosition == 'SG'}">
										得分後衛
								</c:when>
								<c:when test="${teamMemberVO.playerCardVO.playerPosition == 'SF'}">
										小前鋒
								</c:when>
								<c:when test="${teamMemberVO.playerCardVO.playerPosition == 'PF'}">
										大前鋒
								</c:when>
								<c:when test="${teamMemberVO.playerCardVO.playerPosition == 'C'}">
										中鋒
								</c:when>
							</c:choose>
						</small>
					</div>
			</c:forEach>
				</div>
		</div>
		<div class="col-md-8">
			<div class="content" style="padding-top: 30px">

				<div class="page-header">
					<h1 style="font-size: 36px">隊伍約戰</h1>
				</div>

				<sf:form name="form_battle" method="POST" commandName="battleRecordVO" action="${pageContext.request.contextPath}/spring/battle_rec/createBattleTable" id="form_battle" role="form">
					<div class="form-group">
						<div class="col-sm-12 col-md-12" style="padding-left: 0px; padding-bottom: 10px;padding-right: 0px">
							<h2 class="col-sm-3 col-md-2 control-label teamName" style="padding-left: 0px;">約戰方：</h2>
							<div class="col-sm-3 col-md-4">
								<sf:select path="teamIdA" id="select_teamA" class="form-control">
									<c:forEach var="mineTeamVO" items="${requestScope.mineTeamVOs}" varStatus="status" >
										<c:choose>
											<c:when test="${status.first }">
												<sf:option value="${mineTeamVO.teamId}" selected="selected">${mineTeamVO.teamName}</sf:option>
											</c:when>
											<c:otherwise>
												<sf:option value="${mineTeamVO.teamId}">${mineTeamVO.teamName}</sf:option>											
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</sf:select>
							</div>			
								<h2 class="col-sm-3 col-md-2 control-label teamName">挑戰方：</h2>
								<div class="col-sm-3 col-md-4" style="padding-right: 0px;">
									<sf:input type="hidden" value="${requestScope.oppTeamVO.teamId}" path="teamIdB"/>
									<input type="text" value="${requestScope.oppTeamVO.teamName}" readonly="readonly" name="oppTeamName" maxlength="10" class="form-control" style="color: black;">
								</div>
						</div>
					</div>

					<div class="form-group">
						<label class="control-label" for="battleMode">對戰模式</label> 
						<sf:select id="battleMode" path="battleMode" class="form-control">
							<sf:option value="5" selected="selected">5 vs 5</sf:option>
							<sf:option value="3">3 vs 3</sf:option>
						</sf:select>
					</div>

					<div class="form-group">
						<label class="control-label" for="battleBet">賭注</label> 
						<sf:input type="text" id="battleBet" path="battleBet" maxlength="8" class="form-control"/>
					</div>

					<div class="form-group">
						<div id="courtId_label" class="bootstrap-date row">
							<div class="col-xs-4">
								<label class="control-label">場地名稱</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">縣、市</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">鄉、鎮、區</label>
							</div>
						</div>
						<div class="col-xs-12">
								<label id="label_location" class="control-label" style="font-size: 14px">-</label>
						</div>
						<div id="courtId_data" class="bootstrap-date row">
							<div class="col-xs-4">
								<select id="courtName" path="courtId" name="courtName" class="form-control valid">
									<option value="none">場地名稱</option>
								</select>
							</div>
							<div class="col-xs-4">
								<input id="input_courtId" name="input_courtId" type="hidden" >
								<select id="courtCity" name="courtCity"  class="form-control valid"  onchange="renew(this.selectedIndex);">
									<option disabled="disabled" selected="selected" value="none">選擇縣市</option>
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
									<option value="連江縣">連江縣</option></select>
							</div>
							<div class="col-xs-4">
								<select id="courtArea" name="courtArea" class="form-control">
									<option value="x" disabled="disabled" selected="selected">請選擇縣市</option>
									
								</select>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div id="profile_birthdate" class="bootstrap-date row">
							<div class="col-xs-4">
								<label class="control-label">對戰日期</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">時</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">分</label>
							</div>
						</div>
						<div id="battleDateTime" class="bootstrap-date row">
							<div class="col-xs-4">
<!-- 								點擊後彈出日期選擇器 -->
								<input type="date" value="${requestScope.current_date.date }" id="battleDate" name="battleDate" class="form-control" style="color: black;">
							</div>
							<div class="col-xs-4">
								<select id="battleHr" name="battleHr" class="form-control valid"style="font-family: Consolas">
									<option value="1">上午  &nbsp;1&nbsp;點</option>
									<option value="2">上午  &nbsp;2&nbsp;點</option>
									<option value="3">上午  &nbsp;3&nbsp;點</option>
									<option value="4">上午  &nbsp;4&nbsp;點</option>
									<option value="5">上午  &nbsp;5&nbsp;點</option>
									<option value="6">上午  &nbsp;6&nbsp;點</option>
									<option value="7">上午  &nbsp;7&nbsp;點</option>
									<option value="8">上午  &nbsp;8&nbsp;點</option>
									<option value="9">上午  &nbsp;9&nbsp;點</option>
									<option value="10">上午  10&nbsp;點</option>
									<option value="11">上午  11&nbsp;點</option>
									<option value="12">上午  12&nbsp;點</option>
									<option disabled="disabled">---------------------------</option>
									<option value="13">下午  &nbsp;1&nbsp;點</option>
									<option value="14">下午  &nbsp;2&nbsp;點</option>
									<option value="15">下午  &nbsp;3&nbsp;點</option>
									<option value="16">下午  &nbsp;4&nbsp;點</option>
									<option value="17">下午  &nbsp;5&nbsp;點</option>
									<option value="18">下午  &nbsp;6&nbsp;點</option>
									<option value="19">下午  &nbsp;7&nbsp;點</option>
									<option value="20">下午  &nbsp;8&nbsp;點</option>
									<option value="21">下午  &nbsp;9&nbsp;點</option>
									<option value="22">下午  10&nbsp;點</option>
									<option value="23">下午  11&nbsp;點</option>
									<option value="24">下午  12&nbsp;點</option>			
								</select>
							</div>
							<div class="col-xs-4">
								<select id="battleMin" name="battleMin" required="" class="form-control">
										<option value="00" selected="selected">00</option>
										<option value="05">05</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
										<option value="55">55</option>
								</select>
							</div>
						</div>
					</div>



					<!-- 					<div class="form-group"> -->
					<!-- 						<label class="control-label" for="profile_country">所在國家</label>  -->
					<!-- 						<select id="profile_country" name="profile[country]" disabled="disabled" required="" class="form-control"> -->
					<!-- 							<option value="tw">台灣</option> -->
					<!-- 						</select> <span class="help-block">瀏覽更多<a href="https://support.spotify.com/learn-more/faq/#!/article/How-can-I-change-my-country-setting">更改國家。</a></span> -->
					<!-- 					</div> -->

					<div class="form-group" style="margin-bottom: 5px;">
						<span class="help-block" style="text-align: right;margin-bottom: 5px">一旦點擊約戰，即表示你同意 <a href="#">Pacuemo 的會員條款 </a> 與 <a href="#" target="_blank"> 隱私政策</a></span>
					</div>

					<div class="row-buttons-bordered" style="margin-top: 20px;">
						<button type="submit" id="submit" name="submit" class="btn-sm js-gtm-event btn btn-primary">約戰</button>
						<a id="profile_cancel" name="profile[cancel]" class="btn btn-tertiary btn-sm btn-cancel" onclick="history.back()">取消</a>
					</div>
					<input type="hidden" id="profile__token" name="profile[_token]" class="form-control" value="7ToZqqdkScbZNNOmX_N7FmDr8k4gwgD584FfdSjC-0A">
				</sf:form>

			</div>



		</div>
		
		<div class="col-md-2">		
			<div class="row">
				<c:forEach var="oppteamMemberVO" items="${requestScope.oppTeamVO.teamMemberVOs}">
				<div id="div_left" class="col-md-12 animate fadeInLeft animated" style="padding-left: 0px;">
					<c:choose>
						<c:when test="${oppteamMemberVO.memberVO.memberImgUrl != null}">
							<img class="battle_img img-circle col-md-8" src="${pageContext.request.contextPath }/image/member/${oppteamMemberVO.memberVO.memberImgUrl }" style="margin-top: 10px;">
						</c:when>
						<c:otherwise>
							<img class="battle_img img-circle col-md-8" src="${pageContext.request.contextPath }/image/member/user.jpg" style="margin-top: 10px;">
						</c:otherwise>
					</c:choose>
					<div class="col-md-4 color_w" style="padding-left: 5px;padding-right: 0px">
						<h3 class="margin-top-10 margin-bottom-10">${oppteamMemberVO.memberVO.memberFirstName } </h3>
						<small style="font-size: 100%">&nbsp; - 
							<c:choose>
								<c:when test="${oppteamMemberVO.playerCardVO.playerPosition == 'PG'}">
										控球後衛
								</c:when>
								<c:when test="${oppteamMemberVO.playerCardVO.playerPosition == 'SG'}">
										得分後衛
								</c:when>
								<c:when test="${oppteamMemberVO.playerCardVO.playerPosition == 'SF'}">
										小前鋒
								</c:when>
								<c:when test="${oppteamMemberVO.playerCardVO.playerPosition == 'PF'}">
										大前鋒
								</c:when>
								<c:when test="${oppteamMemberVO.playerCardVO.playerPosition == 'C'}">
										中鋒
								</c:when>
							</c:choose>
						</small>
					</div>
				</div>
			</c:forEach>
			</div>
		</div>
	</div>


<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>

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
			document.form_battle.courtArea.options[i+1] = new Option(manyBlocks[index][i], manyBlocks[index][i]); // 設定新選項
		document.form_battle.courtArea.length = manyBlocks[index].length+1; // 刪除多餘的選項
		$("#courtArea").val("x");
	}
	
		// init start
// 		var d = new Date();
// 		var s = d.toISOString();
// 		var n = s.substr(0, 10);
// 		$('#battleDate').val(n);
		
		$("#battleHr option[value='${requestScope.current_date.hr}']").attr('selected','selected');
		
		$(function() 
		{
		var number_myTeamMember ="${fn:length(requestScope.mineTeamVOs[0].teamMemberVOs)}";
			// 
			var TmVOs = "${requestScope.mineTeamVOs[0].teamMemberVOs[0]}";
// 			alert(TmVOs);
			$("#select_teamA").change(function(){
				$.ajax({
					"type":"get",
					"url":"${home}spring/team/getTeamVO", // home 在 head 設定
					"data":{"teamId":$(this).val()},
					"dataType":"json",
					"success":function(data){
						$("#div_left").empty();
						number_myTeamMember = 0;
						$.each(data.teamMemberVOs, function(index,array) {
						var img_src;
						var h3_name;
						var small_position;
							number_myTeamMember++; 
							$.each(this, function(key, value) {	
								if($.trim(key) == "memberVO"){
									if(value.memberImgUrl != null){
										img_src = value.memberImgUrl;
									}else{
										img_src = "user.jpg";
									}							
										h3_name = value.memberFirstName;
								}
								if($.trim(key) == "playerCardVO"){
										small_position = value.playerPosition;
									if(small_position == "PG"){
										small_position =  "控球後衛";
									}else if(small_position == "SG"){
										small_position =  "得分後衛";
									}else if(small_position == "SF"){
										small_position =  "小前鋒";
									}else if(small_position == "PF"){
										small_position =  "大前鋒";
									}else if(small_position == "C"){
										small_position =  "中鋒";
									}
								}
							});
								$( "#div_left" ).append( '<div class="animate fadeInLeft animated" strly="padding:0px;margin:0px;">'+
														 '<img class="battle_img img-circle col-md-8" src="${home}image/member/'+img_src+'" style="margin-top: 10px;">'+ 
													     '<div class="col-md-4 color_w" style="padding-left: 5px;padding-right: 0px">'+
														 '<h3 class="margin-top-10 margin-bottom-10">'+h3_name+' </h3>'+
														 '<small style="font-size: 100%">&nbsp; - '+ small_position +'</small>'+
														 '</div>');
						});
					},
					"error":function(Error){
						alert("fuck2");
						console.log(Error);
					}
				})
			});
			
			// chk location		
			$("#courtCity").change(function(){
				chk_location_update();			
			})
			
			$("#courtArea").change(function(){
				chk_location_update();		
			})

			function chk_location_update(){
				var city_val;
				var area_val;
				var address = "";
				if($("#courtCity").val()=='none' || $("#courtCity").val() == null){
					city_val = "";
				}else{
					address += $("#courtCity option:selected").text();
				}
				if($("#courtArea").val() == 'x' || $("#courtArea").val() == null){
					area_val = "";
				}else{
					address += $("#courtArea option:selected").text();
				}
				
				// now update courtName
				$.ajax({ 
						"type" : "get", 
						"url" : "${home}spring/battle_rec/getCourtVOs", // home 在 head
						"data" : { 
								"address" : address, 
							}, 
						"dataType" : "json",
						"success" : function(data)
						{
// 							window.location.href= "${home}spring/team/createTeamPage";
// 								alert(obj.name);	
							$("#courtName option").remove();
							$.each(data,function(i,obj){
								$("#courtName").append($("<option></option>").attr("value", obj.courtId).attr("data-courtaddress",obj.courtaddress).text(obj.name));
							});
							$("#label_location").text("地址 : " + $("#courtName option:selected").attr("data-courtaddress"));
							$("#input_courtId").val($("#courtName").val());
						}, 
						"error" : function(Error)
						{
							console.log(Error);
						} 
					})
			} // chk_location_update() End
			$("#courtName").change(function(){
				$("#label_location").text("地址 : " + $("#courtName option:selected").attr("data-courtaddress"));
				$("#input_courtId").val($("#courtName").val());
			})
			
			$("#submit").click(function(event){
				var error_msg = "";
				if(number_myTeamMember < $("#battleMode").val()){
					error_msg += "隊伍人數不足\n";
					event.preventDefault();
				}
				if("${fn:length(requestScope.oppTeamVO.teamMemberVOs)}" < $("#battleMode").val()){
					error_msg += "對方隊伍人數不足\n"
					event.preventDefault();
				}
				if("${fn:length(requestScope.oppTeamVO.teamMemberVOs)}" < $("#battleMode").val()){
					error_msg += "對方隊伍人數不足\n"
					event.preventDefault();
				}
				if(error_msg != ""){
					alert(error_msg);
				}
			})
			
		// init End	
		});
	</script>
</body>
</html>
