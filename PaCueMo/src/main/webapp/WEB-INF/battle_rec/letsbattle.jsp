<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

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
			<c:forEach var="teamMemberVO" items="${requestScope.mineTeamVOs[0].teamMemberVOs}">
				<div id="div_left" class="col-md-12 animate fadeInLeft animated" style="padding-left: 0px;">
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
				</div>
			</c:forEach>
		</div>
		<div class="col-md-8">
			<div class="content" style="padding-top: 30px">

				<div class="page-header">
					<h1 style="font-size: 36px">隊伍約戰</h1>
				</div>

				<form name="form_battle" method="post" action="" id="form_battle" role="form" novalidate="novalidate">

					<div class="form-group">
						<div class="col-sm-12 col-md-12" style="padding-left: 0px; padding-bottom: 10px;padding-right: 0px">
							<h2 class="col-sm-3 col-md-2 control-label teamName" style="padding-left: 0px;">約戰方：</h2>
							<div class="col-sm-3 col-md-4">
								<select id="select_teamA" name="teamIdA" class="form-control">
									<c:forEach var="mineTeamVO" items="${requestScope.mineTeamVOs }" varStatus="status" >
										<c:choose>
											<c:when test="${status.first }">
												<option value="${mineTeamVO.teamId}" selected="selected">${mineTeamVO.teamName}</option>
											</c:when>
											<c:otherwise>
												<option value="${mineTeamVO.teamId}">${mineTeamVO.teamName}</option>											
											</c:otherwise>
										</c:choose>
									</c:forEach>
								</select>
							</div>

							<c:choose>
								<c:when test="">
									<label class="col-sm-3 col-md-2 control-label teamName">挑戰方：</label>
									<div class="col-md-3">
										<select id="select_teamB" class="form-control" style="margin: 7px;"></select>
									</div>
								</c:when>
								<c:when test="">
									<label class="col-sm-3 col-md-2 control-label teamName">地點：</label>
									<div class="col-sm-3 col-md-4">
										<h2>11</h2>
									</div>
								</c:when>
								<c:otherwise>
									<h2 class="col-sm-3 col-md-2 control-label teamName">挑戰方：</h2>
									<div class="col-sm-3 col-md-4" style="padding-right: 0px;">
										<input type="text" value="${requestScope.oppTeamVO.teamName}" readonly="readonly" name="oppTeamName" maxlength="10" class="form-control" style="color: black;">
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>

					<div class="form-group">
						<label class="control-label" for="battleMode">對戰模式</label> 
						<select id="battleMode" name="battleMode" required="" class="form-control">
							<option value="5" selected="selected">5 vs 5</option>
							<option value="3">3 vs 3</option>
						</select>
					</div>

					<div class="form-group">
						<label class="control-label" for="battleBet">賭注</label> 
						<input type="text" id="battleBet" name="battleBet" maxlength="8" class="form-control">
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
								<label class="control-label" style="font-size: 14px">-</label>
						</div>
						<div id="courtId_data" class="bootstrap-date row">
							<div class="col-xs-4">
								<select id="courtName" name="courtName" class="form-control valid">
									<option value="none">場地名稱</option>
									<option value="2014">用ajax抓資料</option>
								</select>
							</div>
							<div class="col-xs-4">
								<select id="courtCity" name="courtCity" = class="form-control valid">
									<option disabled="disabled" selected="selected" value="none">選擇縣市</option>
									<option value="2">台北市</option>
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
									<option value="23">連江縣</option></select>
							</div>
							<div class="col-xs-4">
								<select id="courtArea" name="courtArea" required="" class="form-control">
									<option value="0" disabled="disabled" selected="selected">請選擇縣市</option>
									
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
								<input type="text" id="battleDate" name="battleDate" readonly="readonly" value="2016-09-15" class="form-control" style="color: black;">
							</div>
							<div class="col-xs-4">
								<select id="battleHr" name="battleHr" required="" class="form-control valid">
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">要改成用script寫</option></select>
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
				</form>

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



	<script type="text/javascript">
		$(function()
		{
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

						$.each(data.teamMemberVOs, function(index,array) {
						var img_src;
						var h3_name;
						var small_position;
							console.log(index + " : " + array);
							
							$.each(this, function(key, value) {	
								console.log(key + " : " + value);
								if($.trim(key) == "memberVO"){
									console.log(key + " : " + value.memberImgUrl);
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
			

		});
	</script>
</body>
</html>
