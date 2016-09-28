<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>

<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<c:url var="home" value="/" scope="request" />
<%--設定home，之後在script可以用--%>
<title>PACUEMO Battle</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
<style>
.h2_tm {
	padding-left: 20px;
	color: white;
}

.left_20 {
	padding-left: 20px;
}

.left_div {
	height: 50px;
}

body {
	background-color: yellow;
}

table {
	color: white;
}

td {
	border: 1px solid white;
	color: white;
}

.weather {
	margin: 0px;
	margin-right: 0px;
}

.prevent_select{
   -ms-user-select: none; /* IE 10+ */
   -moz-user-select: -moz-none;
   -khtml-user-select: none;
   -webkit-user-select: none;
   user-select: none;

}
.div_team{
}
</style>

</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />

	<style>
body {
	background-image: url("${pageContext.request.contextPath }/image/team/nike_basketball__europe.jpg");
	overflow-x: hidden;
	
}
</style>
	<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<div class="row">
		<div class="col-md-4">

			<div class="col-md-12">
				<div class="col-md-1"></div>
				<div class="col-md-11">
					<h2 style="margin-left: 5px">搜尋隊伍</h2>
				</div>
			</div>

			<div class="col-md-1"></div>
			<div class="col-md-11">

				<div class="row">
					<form accept-charset="utf-8" action="${pageContext.request.contextPath}/spring/team/searchTeamByL_N" class="" method="GET" name="site-search" role="search">
						<input type="text" id="textbox" value="" name="teamName" autocomplete="off" class="" tabindex="10"><input type="submit" class="" value="Go" tabindex="20">
						<div id=""></div>
					</form>
				</div>
				<c:choose>
					<c:when test="${requestScope.teamOppVOs != null }">
						<div class="row content" style="padding: 10px;padding-bottom:0px; margin-top: 20px;margin-bottom: 0px;">
							<span style="text-align: center;">活動地區： </span> 
							<select id="select_locaation" name="location" class="" contextmenu="123" style="font-size: 14px; padding: 0px; height: 27.53px; margin-bottom: 5px; text-align: center;">
								<option selected="selected" value="none">不限制</option>
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
<!-- 						<div class="row content" style="padding: 10px;padding-bottom:20px;padding-top:0px; margin-top: 0px;overflow-y:scroll; height: 400px;overflow-x:hidden;"> -->
							<c:set var="flag" value="5"></c:set>
							<c:forEach items="${requestScope.teamOppVOs}" var="teamOppVO" varStatus="status">
								<div data-location="${teamOppVO.location}" class="row content div_team" style="padding: 10px;padding-bottom:20px;padding-top:0px; margin-top: 0px;">
									<hr style="margin-top: 0px">
									<div class="row left_div">
										<div class="col-md-7">
											<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${teamOppVO.teamId}" class="left_20">${teamOppVO.teamName}</a>
										</div>
										<div class="col-md-5">
											<form action="${pageContext.request.contextPath}/spring/battle_rec/letsbattle" method="get">
												<button type="submit" class="btn btn-warning btn-xs" style="background-color: #F2A359;" name="btn_OppTeamId" value="${teamOppVO.teamId }">發出約戰</button>
												<input type="hidden" name="page" value="first">
											</form>
										</div>
									</div>
								</div>
							</c:forEach>
<!-- 						</div> -->
					</c:when>
				</c:choose>
			</div>

		</div>
		<div class="col-md-6">
			<div class="col-md-12">
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<div id="div_weather_top" role="button" class="content prevent_select" style="margin: 0px; padding: 0px;height:23px;width:504px;text-align: center;">顯示天氣</div>
				</div>
				<div class="col-md-6"></div>
				<div class="col-md-6">
					<div id="cont_72b8d6f1eb00701f936d70bccb580886" role="" hidden="hidden">
					<script type="text/javascript" async src="https://www.theweather.com/wid_loader/72b8d6f1eb00701f936d70bccb580886"></script>
					</div>
				</div>
			</div>
		</div>
	</div>

	<script type="text/javascript">
		$(function()
		{
			var contextPath = "${pageContext.request.contextPath}";
			var data_team;

// 			$("#tm_search").change(function(){
// 				$.ajax({ 
// 					"type" : "get", 
// 					"url" : "${home}spring/team/searchTeamByL_N", // home 在 head
// 					"data" : { 
// 							"location" : "", 
// 							"teamName" :$(this).val()
// 						}, 
// 					"dataType" : "json",
// 					"success" : function(data)
// 					{
// 						data_team = data;
// 						alert(data);
// 					}, 
// 					"error" : function(Error)
// 					{
// 						alert("fuck");
// 						console.log(Error);
// 					} 
// 				})
// 				$('#tm_search').suggestionBox().loadSuggestions(data_team);
// 			})

			var div_weather_body = $('#cont_72b8d6f1eb00701f936d70bccb580886');
			$("#div_weather_top").hover(function(){
				$(this).css("background-color","rgba(255,255,255,0.87)");
			},function(){
				$(this).css("background-color","rgba(255,255,255,1)");
			}).click(function(){
				if( div_weather_body.is(':visible') ) {
					div_weather_body.hide();
				}else{
					div_weather_body.show(200);
				}
			})
			
			div_weather_body.click(function(event){
				event.preventDefault();
			})
			
			
			$("#select_locaation").change(function(){
				var data_location = $(this).val();
				if($(this).val() == null || $(this).val() == "none"){
					$(".div_team").show(200);
				}else{
					$(".div_team").hide();
					$('.div_team[data-location="'+data_location+'"]').show(200);				
				}
			
				
				
			})

		// init End
		});
		

	</script>
</body>
</html>
