<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<c:url var="home" value="/" scope="request" />
<%--設定home，之後在script可以用--%>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath }/css/team/addteam.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/team/jquery-ui_team.min.css" rel="stylesheet">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/animate.css">

<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/icon_style.css">

<%-- <script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script> --%>

<style>
.h2_tm {
	padding-left: 20px;
	color: white;
}

.left_20 {
	padding-left: 20px;
}

.left_40 {
	padding-left: 40px;
}

.left_div {
	height: 50px;
}
.a_info{}
</style>


<script>
	
</script>
</head>
<body>
	<c:set target="${requestScope.teamVO}" property="teamId" value="${requestScope.teamId}"/>
	<c:set target="${requestScope.teamVO}" property="teamName" value="${requestScope.teamName}"/>
	<c:set target="${requestScope.teamVO}" property="teamProp" value="${requestScope.teamProp}"/>
	<c:set target="${requestScope.teamVO}" property="teamHead" value="${requestScope.teamHead}"/>
	<c:set target="${requestScope.teamVO}" property="content" value="${requestScope.content}"/>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />
	<style>
body {
	background-image: url("${pageContext.request.contextPath }/image/team/nike_basketball__europe.jpg");
	overflow-x: hidden;
}
</style>
	<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>
	<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script> --%>







	<div class="row" style="padding-left: 30px">
		<div class="col-md-12">
			<h2 style="color: white;">
				<c:choose>
					<c:when test="${not empty requestScope.teamVO}"> ${requestScope.teamVO.teamName}</c:when>
					<c:otherwise>TeamName !</c:otherwise>
				</c:choose>
				<small> - <c:choose>
						<c:when test="${requestScope.teamVO.teamProp == 0}"> 公開  </c:when>
						<c:when test="${requestScope.teamVO.teamProp == 1}"> 需申請 </c:when>
						<c:when test="${requestScope.teamVO.teamProp == 2}"> 私密 </c:when>
					</c:choose>
				</small>
			</h2>
		</div>
		<div class="col-md-2"></div>
		
		
		<div class="col-md-7">
			<div class="content" style="padding: 20px; background-color: rgba(255, 255, 255, 0.95);">
				<table class="table table-hover">
					<thead>
						<tr>
							<th colspan="2"><h2 style="margin-top: 5px; margin-bottom: 0px">約戰訊息</h2></th>
						</tr>
						<tr>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px"></th>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px">對戰隊伍</th>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px">場地</th>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px">模式</th>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px">賭注</th>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px">日期</th>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px"></th>
							<th style="padding-top: 8px; padding-bottom: 8px; font-size: 18px"></th>
						</tr>
					</thead>
					<c:forEach var="battleRecordVO" items="${requestScope.battleRecordVOs}">
						<tbody class="" style="display: table-row-group;">
							<tr>
								<th scope="row"></th>
								<td><a href="${pageContext.request.contextPath }/TeamServlet?teamId=${battleRecordVO.teamAVO.teamId}">${battleRecordVO.teamAVO.teamName}</a></td>
								<td>${battleRecordVO.courtVO.name}</td>
								<td>${battleRecordVO.battleMode} V ${battleRecordVO.battleMode}</td>
								<td>
									<c:choose>
									<c:when test="${battleRecordVO.battleBet == 0}">
										 &nbsp;&nbsp;&nbsp;&nbsp;-
									</c:when>
									<c:otherwise>								
										${battleRecordVO.battleBet}
									</c:otherwise>
									</c:choose>
								</td>
								<td>
									<jsp:useBean id="dateValue" class="java.util.Date" />
									<jsp:setProperty name="dateValue" property="time" value="${battleRecordVO.battleDateTime.time}" />
									<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${dateValue}" />
								</td>
								<td><a data-battleId="${battleRecordVO.battleId}" data-battleStatus="1" class="a_info" href="#">接受</a></td>
								<td><a data-battleId="${battleRecordVO.battleId}" data-battleStatus="-1" class="a_info" href="#">拒絕</a></td>
							</tr>
						</tbody>
					</c:forEach>
				</table>
			</div>

			
		</div>

		<div class="col-md-4"></div>
	</div>




	<script>
		// initial start
		$(function()
		{
			// 是否接受對戰
			var battleId;
			var battleStatus;
			$(".a_info").click(function(){
				event.preventDefault();
				battleId = $(this).attr('data-battleId');
				battleStatus = $(this).attr('data-battleStatus');
				$.ajax({ 
					"type" : "get", 
					"url" : "${home}spring/battle_rec/replyStatus", // home 在 head
					"data" : { 
								"battleId" : battleId ,
								"battleStatus" : battleStatus 
							}, 
					"dataType" : "text",
					"success" : function(data)
					{
						clearTimeout(refresh);
						setTimeout(refresh,3000); //指定5秒跳轉
// 						window.location.href= "${home}TeamServlet?teamId=${teamVO.teamId}";
					}, 
					"error" : function(Error)
					{
						window.location.href= "${home}";
						console.log(Error);
					} 
				})
				$(this).parents("tbody").hide(200);
			});
		

			
			 var refresh = function ()
			 {
				 window.location.href= "${home}TeamServlet?teamId=${teamVO.teamId}";
			 }
				

		// initial end
		});
	</script>

</body>
</html>
