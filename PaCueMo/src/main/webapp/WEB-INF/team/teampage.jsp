<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="spring"%>

<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<%@ page import="java.util.Date" %>
<c:url var="home" value="/" scope="request" />
<%--設定home，之後在script可以用--%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PaCueMo</title>
<meta charset="utf-8" />
<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">
<%-- <link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css"> --%>
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/nexus.css">
<!--     add icon  		-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/icon_style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--     add icon  		-->
<!-- dialog -->
<link href="${pageContext.request.contextPath }/css/team/addteam.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/team/jquery-ui_team.min.css" rel="stylesheet">

<!-- dialog -->


<style type="text/css">
tempstyle {
	color: white;
}

p.tempstyle {
	color: white;
	font-size: 18;
	font-family: "微軟正黑體";
}
.green_contact button[type="submit"]:hover {
    background: #43A047;
    -webkit-transition: background 0.3s ease-in-out;
    -moz-transition: background 0.3s ease-in-out;
    transition: background-color 0.3s ease-in-out;
}
.green_contact button[type="submit"] {
    cursor: pointer;
    width: 100%;
    border: none;
    background: #4CAF50;
    color: #FFF;
    margin: 0 0 5px;
    padding: 10px;
    font-size: 15px;
}

.left_40 {
	padding-left: 40px;
}

.paginationA{
	
}
.paginationB{
	
}
.insideA{
}
.insideB{
}

</style>

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(http://fonts.googleapis.com/css?family=Nunito:300);

/* body { font-family: "Nunito", sans-serif; font-size: 24px; } */
/* a    { text-decoration: none; } */
/* p    { text-align: center; } */
/* sup  { font-size: 36px; font-weight: 100; line-height: 55px; } */
.join_button {
	text-transform: uppercase;
	letter-spacing: 2px;
	text-align: center;
	color: white;
	font-size: 24px;
	font-family: "Nunito", sans-serif;
	font-weight: 300;
	margin: 5em auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	padding: 0px 0;
	width: 220px;
	background: #0D6;
	border: 1px solid #0D6;
	color: #FFF;
	overflow: hidden;
	transition: all 0.5s;
}

.join_button:hover, .join_button:active {
	text-decoration: none;
	color: #0C5;
	border-color: #0C5;
	background: white;
}

.join_button span {
	display: inline-block;
	position: relative;
	padding: 0;
	padding-right: 0;
	transition: padding-right 0.5s;
	padding-right: 0
}

.join_button span:after {
	content: ' ';
	position: absolute;
	top: 0;
	right: -18px;
	opacity: 0;
	width: 10px;
	height: 10px;
	margin-top: -10px;
	background: rgba(0, 0, 0, 0);
	border: 3px solid #FFF;
	border-top: none;
	border-right: none;
	transition: opacity 0.5s, top 0.5s, right 0.5s;
	transform: rotate(-45deg);
}

.join_button:hover span, .join_button:active span {
	padding-right: 30px;
}

.join_button:hover span:after, .join_button:active span:after {
	transition: opacity 0.5s, top 0.5s, right 0.5s;
	opacity: 1;
	border-color: #0C5;
	right: 0;
	top: 50%;
}

.tmimg {
	width: auto;
	height: auto;
}

.left_20 {
	padding-left: 20px;
}

.mar_0 {
	margin: 0px;
}

</style>

</head>
<body>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="fragment/teamSidebar.jsp" />
<%-- 	<%@include file="fragment/teamSidebar.jsp"%> --%>
	
<style>
body {
    background-image: url("${pageContext.request.contextPath }/image/team/nba_cup.jpg");
}
</style>

	<div class="row" style="margin: 0px">
		<div class="col-md-12">
			<div class="col-md-10">
				<h2 style="color: white;">
					<c:choose>
						<c:when test="${not empty requestScope.teamVO}"> ${requestScope.teamVO.teamName}</c:when>
						<c:otherwise>TeamName !</c:otherwise>
					</c:choose>
					<small> - 
						<c:choose>
							<c:when test="${requestScope.teamVO.teamProp == 0}"> 公開  </c:when>
							<c:when test="${requestScope.teamVO.teamProp == 1}"> 需申請 </c:when>
							<c:when test="${requestScope.teamVO.teamProp == 2}"> 私密 </c:when>							
						</c:choose>
					</small>
				</h2>
			</div>
			<div class="col-md-2" style="padding-left: 15px">
				<c:choose>
					<c:when test="${requestScope.teamExsist == 'Not_Exsist'}">
						<form class="left_20" action="${pageContext.request.contextPath}/spring/battle_rec/letsbattle" method="get">
							<button type="submit" class="btn btn-danger btn-xs left_20" name="btn_battle" value="${requestScope.teamVO.teamId }">約戰</button>
							<input type="hidden" name="page" value="main">
						</form>
					</c:when>
				</c:choose>
			</div>
		</div>
	</div>

	<div class="row margin-bottom-10" id="show_team_member">
		<div class="col-sm-2 col-md-2 animate fadeInLeft animated" style="padding-left: 50px">
			<p class="margin-bottom-30 tempstyle">${requestScope.teamVO.content}</p>
			<c:choose>
				<c:when test="${requestScope.teamExsist == 'Not_Exsist_public'}">
					<form class="left_20" action="${pageContext.request.contextPath}/spring/team/joinTeam" method="get">
						<button type="submit" class="btn btn-success btn-xs left_20" name="btn_join" value="${requestScope.teamVO.teamId }">加入隊伍</button>
						<input type="hidden" name="page" value="main">
					</form>
				</c:when>
				<c:when test="${requestScope.teamExsist == 'Not_Exsist_protect'}">
					<form class="left_20" action="${pageContext.request.contextPath}/spring/tm_apply/applyTeam" method="get">
						<button type="submit" class="btn btn-success btn-xs left_20" name="btn_apply" value="${requestScope.teamVO.teamId }">申請加入</button>
						<input type="hidden" name="page" value="main">
					</form>
				</c:when>
				<c:when test="${requestScope.teamExsist == 'Not_Exsist_applying'}">
					<form class="left_20" action="${pageContext.request.contextPath}/spring/tm_apply/cancel" method="get">
						<button type="submit" class="btn btn-warning btn-xs left_20" name="btn_cancel" value="${requestScope.teamVO.teamId }" id="btn_cancle" style="background-color: #F2A359">申請中...</button>
						<input type="hidden" name="page" value="main">
					</form>
				</c:when>
				<c:when test="${requestScope.teamExsist == 'Mine'}">
<%-- 					<form class="left_20" action="${pageContext.request.contextPath}/spring/team/disbandTeam" method="get"> --%>
						<button id="btn_disband" class="btn btn-success btn-xs" name="btn_disband" value="${requestScope.teamVO.teamId }">解散隊伍</button>
<!-- 						<input type="hidden" name="page" value="main"> -->
<!-- 					</form> -->
				</c:when>
				<c:when test="${requestScope.teamExsist == 'Exsist'}">
					<form class="left_20" action="${pageContext.request.contextPath}/spring/team/abortTeam" method="get">
						<button type="submit" class="btn btn-success btn-xs" name="btn_abort" value="${requestScope.teamVO.teamId }">退出隊伍</button>
						<input type="hidden" name="page" value="main">
					</form>
				</c:when>
			</c:choose>
		</div>

		<!-- Person Details -->
		<div class="col-sm-10 col-md-10 animate fadeInLeft animated">
			<c:forEach var="teamMemberVO" items="${requestScope.teamVO.teamMemberVOs}" begin="0">
				<div class="col-xs-12 col-sm-4 col-md-2 person-details margin-bottom-30 fadeIn animated">
					<figure style="background-color:  rgba(255,255,255,0.95);">
						
						<c:choose>
							<c:when test="${teamMemberVO.memberVO.memberImgUrl != null}">
								<img class="tmimg img-circle" src="${pageContext.request.contextPath }/image/member/${teamMemberVO.memberVO.memberImgUrl }" alt="image1">
							</c:when>
							<c:otherwise>
								<img class="tmimg img-circle" src="${pageContext.request.contextPath }/image/member/user.jpg" alt="image1">
							</c:otherwise>
						</c:choose>
						
						<figcaption>
<!-- 							<div class="person-details"> -->
<!-- 							<figure> -->
							<hr style="padding: 0px;margin-top: 5px;">
							<h3 class="margin-top-10 margin-bottom-10">
								${teamMemberVO.memberVO.memberFirstName } 
								<small>- 
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
							</h3>
							<span>${teamMemberVO.playerCardVO.playerNote}</span>
						</figcaption>
<!-- 						<ul class="list-inline person-details-icons"> -->
<!-- 							<li><a href="#"> <i class="fa-lg fa-twitter"></i> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#"> <i class="fa-lg fa-linkedin"></i> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#"> <i class="fa-lg fa-facebook"></i> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#"> <i class="fa-lg fa-dribbble"></i> -->
<!-- 							</a></li> -->
<!-- 							<li><a href="#"> <i class="fa-lg fa-google-plus"></i> -->
<!-- 							</a></li> -->
<!-- 						</ul> -->
					</figure>
				</div>

			</c:forEach>
		</div>
	</div>


	<div class="row">
		<div class="col-md-12">
			<hr class="margin-bottom-30" style="margin-top: 0px">
		</div>

		<div class="col-md-5">
			<div class="row">
			<div class="content" style="margin-left: 30px;padding: 20px;background-color:  rgba(255,255,255,0.95);">
				<table class="table table-hover">
					  <thead>
					  <tr>
				      	<th colspan="2">對戰紀錄</th>
				      	<th><a id="a_recordA" href="">約戰方</a></th>
				      	<th><a id="a_recordB" href="">挑戰方</a></th>				      	
				      </tr>
					    <tr>
					      <th style="padding-top: 8px;padding-bottom: 8px;"></th>
					      <th style="padding-top: 8px;padding-bottom: 8px;">對戰隊伍</th>
					      <th style="padding-top: 8px;padding-bottom: 8px;">模式</th>
					      <th style="padding-top: 8px;padding-bottom: 8px;">賭注</th>
					      <th style="padding-top: 8px;padding-bottom: 8px;">日期</th>
					      <th style="padding-top: 8px;padding-bottom: 8px;">狀態</th>
					    </tr>
					  </thead>
					  
<!-- 				  這裡開始是 約戰表  -->
					  <tbody id="tbody_A">
					  	<c:forEach var="battleRecordVO" items="${requestScope.battleRecordVOs_A}" varStatus="status">
						  <c:if test="${status.index % 3 == 0}">
						  	<c:set var="flag" value="on"></c:set>
					  	  	<fmt:parseNumber var="a" type="number" integerOnly="true" value="${status.index / 3}" />
						  	<tbody id="insideA_${a}" class="insideA" hidden="hidden">
						  </c:if>
						    <tr>
						      <th hidden="none" scope="row">${battleRecordVO.battleId}</th>
						      <th scope="row"></th>
						      <td>${battleRecordVO.teamBVO.teamName}</td>
						      <td>${battleRecordVO.battleMode} V ${battleRecordVO.battleMode}</td>
						      <td>  <c:choose>
									<c:when test="${battleRecordVO.battleBet == 0}">
										 &nbsp;&nbsp;&nbsp;&nbsp;-
									</c:when>
									<c:otherwise>								
										${battleRecordVO.battleBet}
									</c:otherwise>
									</c:choose>
							  </td>	
							  		<jsp:useBean id="dateValue" class="java.util.Date" />
									<jsp:setProperty name="dateValue" property="time" value="${battleRecordVO.battleDateTime.time}" />
						      <td>
								<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${dateValue}" />
						      </td>	
						      <td>
								<c:choose>
									<c:when test="${battleRecordVO.result == 0}">
										<jsp:useBean id="now" class="java.util.Date"  />
										<c:choose>
											<c:when test="${now.time > battleRecordVO.battleDateTime.time}">
												<spring:url value="/spring/team/settingTeamPage" var="s_settingTeam" scope="request">
													<spring:param name="teamId" value="${requestScope.teamVO.teamId }"></spring:param>
												</spring:url>
													<a id="a_report" href="${s_settingTeam}">回報</a>
											</c:when>
											<c:otherwise>
												&nbsp;&nbsp;&nbsp;&nbsp;-
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${battleRecordVO.result == 1}">win</c:when>
											<c:when test="${battleRecordVO.result == 2}">lose</c:when>
											<c:when test="${battleRecordVO.result == 3}">平手</c:when>
											<c:when test="${battleRecordVO.result == 4}">缺席 </c:when>
											<c:when test="${battleRecordVO.result == 5}">對方缺席</c:when>
											<c:when test="${battleRecordVO.result == 6}">
												<spring:url value="/spring/team/settingTeamPage" var="s_settingTeam" scope="request">
													<spring:param name="teamId" value="${battleRecordVO.teamIdA }"></spring:param>
												</spring:url>
												<a href="${s_settingTeam}">結果不符</a>
											</c:when>
										</c:choose>
									</c:otherwise>
								</c:choose>
							  </td>	
						    </tr>
						  <c:if test="${((status.index -2) > 0) && (status.index - 2) % 3 == 0}">
						 	 <c:set var="flag" value="off"></c:set>
						  	</tbody>
						  </c:if>
						    <c:if test="${status.last}">
						    	<c:if test="${flag == 'on'}">
						    		</tbody>
						    	</c:if>
						    	<tbody id="selectpage_A">
								    <tr>	
								      <th scope="row"></th>
								      <th scope="row"></th>
								      <td colspan="4">
									  	<c:forEach begin="1" end="${status.count}" varStatus="status2">
									    	<c:if test="${status2.count % 3 == 0}">
												<fmt:parseNumber var="i" type="number" integerOnly="true" value="${status2.count / 3}" />
									      		<a class="paginationA" href="#" style="letter-spacing:0px;margin:0px 5px 0px 0px;">${i}</a>
									      	</c:if>
									  	</c:forEach>
								      </td>	
									</tr>
								</tbody>
							</c:if>
					    </c:forEach>
					  </tbody>
<!-- 				  這裡開始是 被約戰表  -->
					  <tbody id="tbody_B">
					  	<c:forEach var="battleRecordVO" items="${requestScope.battleRecordVOs_B}" varStatus="status">
						  <c:if test="${status.index % 3 == 0}">
						  	<c:set var="flag2" value="on"></c:set>
					  	  	<fmt:parseNumber var="a" type="number" integerOnly="true" value="${status.index / 3}" />
						  	<tbody id="insideB_${a}" class="insideB" hidden="hidden">
						  </c:if>
						    <tr>
						      <th hidden="none" scope="row">${battleRecordVO.battleId}</th>
						      <th scope="row"></th>
						      <td>${battleRecordVO.teamBVO.teamName}</td>
						      <td>${battleRecordVO.battleMode} V ${battleRecordVO.battleMode}</td>
						      <td>  <c:choose>
									<c:when test="${battleRecordVO.battleBet == 0}">
										 &nbsp;&nbsp;&nbsp;&nbsp;-
									</c:when>
									<c:otherwise>								
										${battleRecordVO.battleBet}
									</c:otherwise>
									</c:choose>
							  </td>	
							  		<jsp:useBean id="dateValue2" class="java.util.Date" />
									<jsp:setProperty name="dateValue2" property="time" value="${battleRecordVO.battleDateTime.time}" />
						      <td>
								<fmt:formatDate type="both" dateStyle="short" timeStyle="short" value="${dateValue2}" />
						      </td>	
						      <td>
								<c:choose>
									<c:when test="${battleRecordVO.result == 0}">
										<c:choose>
											<c:when test="${now.time > battleRecordVO.battleDateTime.time}">
												<spring:url value="/spring/team/settingTeamPage" var="s_settingTeam" scope="request">
													<spring:param name="teamId" value="${requestScope.teamVO.teamId }"></spring:param>
												</spring:url>
													<a id="a_report" href="${s_settingTeam}">回報</a>
											</c:when>
											<c:otherwise>
												&nbsp;&nbsp;&nbsp;&nbsp;-
											</c:otherwise>
										</c:choose>
									</c:when>
									<c:otherwise>
										<c:choose>
											<c:when test="${battleRecordVO.result == 1}">lose</c:when>
											<c:when test="${battleRecordVO.result == 2}">win</c:when>
											<c:when test="${battleRecordVO.result == 3}">平手</c:when>
											<c:when test="${battleRecordVO.result == 4}">對方缺席 </c:when>
											<c:when test="${battleRecordVO.result == 5}">缺席</c:when>
											<c:when test="${battleRecordVO.result == 6}">
												<spring:url value="/spring/team/settingTeamPage" var="s_settingTeam" scope="request">
													<spring:param name="teamId" value="${battleRecordVO.teamIdB }"></spring:param>
												</spring:url>
												<a href="${s_settingTeam}">結果不符</a>
											</c:when>
										</c:choose>
									</c:otherwise>
								</c:choose>
							  </td>	
						    </tr>
						  <c:if test="${((status.index -2) > 0) && (status.index - 2) % 3 == 0}">
						 	 <c:set var="flag2" value="off"></c:set>
						  	</tbody>
						  </c:if>
						    <c:if test="${status.last}">
						    	<c:if test="${flag2 == 'on'}">
						    		</tbody>
						    	</c:if>
						    	<tbody id="selectpage_B" hidden="hidden">
								    <tr>	
								      <th scope="row"></th>
								      <th scope="row"></th>
								      <td colspan="4">
									  	<c:forEach begin="1" end="${status.count}" varStatus="status2">
									    	<c:if test="${status2.count % 3 == 0}">
												<fmt:parseNumber var="j" type="number" integerOnly="true" value="${status2.count / 3}" />
									      		<a class="paginationB" href="#" style="letter-spacing:0px;margin:0px 5px 0px 0px;">${j}</a>
									      	</c:if>
									  	</c:forEach>
								      </td>	
									</tr>
								</tbody>
							</c:if>
					    </c:forEach>
					  </tbody>
				</table>
			</div>
			</div>
		</div>
		
		
		<div class="col-md-2" style="color: white">
		</div>
		<div class="col-md-5" style="color: white;padding-right: 50px">
			<!-- Progress Bars -->
			<h3 class="progress-label">
				出席 <span class="pull-right">${requestScope.attendancePercent}%</span>
			</h3>
			<div class="progress progress-sm">
				<div class="progress-bar progress-bar-primary" role="progressbar" style="width: ${requestScope.attendancePercent}%"></div>
			</div>
			<h3 class="progress-label">
				評價 <span class="pull-right">82%</span>
			</h3>
			<div class="progress progress-sm">
				<div class="progress-bar progress-bar-primary" role="progressbar" style="width: 82%"></div>
			</div>
			<h3 class="progress-label">
				勝率 <span class="pull-right">${requestScope.teamWPCT}%</span>
			</h3>
			<div class="progress progress-sm">
				<div class="progress-bar progress-bar-primary" role="progressbar" style="width: ${requestScope.teamWPCT}%"></div>
			</div>
			<!-- End Progress Bars -->
		</div>
	</div>
	<hr class="margin-vert-20">
	
<!-- hidden form 1-->
<form id="contact" title="建立新隊伍" action="${pageContext.request.contextPath}/TeamServlet" method="post" style="display:none" >
		<fieldset>
			<input placeholder="隊伍名稱" id="teamName" name="teamName" type="text" tabindex="1" required maxlength="10" autofocus pattern=".{1,}">
		</fieldset>
		<fieldset>
			<input placeholder="隊伍簡介" name="content" type="text" tabindex="2">
		</fieldset>
		<fieldset>
			<div class="div_pri_tm">
				<label class="" for="privacy_1"> <span class=""> <input type="radio" id="privacy_1" name="teamProp" value="0" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="${pageContext.request.contextPath }/assets/images/public.png" alt="" width="16" height="16"> <span>公開</span>
				</span>
					<div class="descrip" id="">所有人都可以自由加入這個隊伍。</div>
				</label>
			</div>
			<div class="div_pri_tm">
				<label class="" for="privacy_2"> <span class=""> <input type="radio" id="privacy_2" name="teamProp" value="1" checked="checked" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="${pageContext.request.contextPath }/assets/images/protect.png" alt="" width="16" height="16"> <span>需申請</span>
				</span>
					<div class="descrip" id="">所有人都可以申請加入這個隊伍。</div>
				</label>
			</div>
			<div class="div_pri_tm">
				<label class="" for="privacy_3"> <span class=""> <input type="radio" id="privacy_3" name="teamProp" value="2" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="${pageContext.request.contextPath }/assets/images/private.png" alt="" width="16" height="16"> <span>私密</span>
				</span>
					<div class="descrip" id="">只有被邀請的成員才可以加入這個隊伍。</div>
				</label>
			</div>
		</fieldset>
		<fieldset>
			<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
		</fieldset>
	</form> 
	


	<script type="text/javascript">
		$(function()
		{
// 			$("#join_team").click(function()
// 			{

// 				$.ajax({ "type" : "post", "url" : "${home}spring/team/joinTeam", // home 在 head
// 				"data" : { "memberId" : "${sessionScope.LoginOK.memberId}", "teamId" : "${requestScope.teamVO.teamId}" }, "dataType" : "text", "success" : function(data)
// 				{
// 					alert(data);
// 				}, "error" : function(Error)
// 				{
// 					alert("fuck");
// 					console.log(Error);
// 				} })
// 			}) // join team End

// 			$("#abort_team").click(function()
// 			{

// 				$.ajax({ "type" : "get", "url" : "${home}spring/team/abortTeam", // home 在 head
// 				"data" : { "memberId" : "${sessionScope.LoginOK.memberId}", "teamId" : "${requestScope.teamVO.teamId}" }, "dataType" : "text", "success" : function(data)
// 				{
// 					alert(data);
// 				}, "error" : function(Error)
// 				{
// 					alert("fuck");
// 					console.log(Error);
// 				} })
// 			}) // abort team End

// 			$("#disband_team").click(function()
// 			{

// 				$.ajax({ 
// 					"type" : "get", 
// 					"url" : "${home}spring/team/disbandTeam", // home 在 head
// 				"data" : { 
// 					"memberId" : "${sessionScope.LoginOK.memberId}", 
// 					"teamId" : "${requestScope.teamVO.teamId}" 
// 						}, 
// 				"dataType" : "text",
// 				"success" : function(data)
// 				{
// 					alert(data);
// 				}, 
// 				"error" : function(Error)
// 				{
// 					alert("fuck");
// 					console.log(Error);
// 				} 
// 				})
// 			}) // disband team End

			//set btn_cancle hover
			$("#btn_cancle").hover(function(){
// 				$( this ).fadeOut( 100 );
// 				 $( this ).fadeIn( 500 );
				 $( this ).html('取消申請');
				 
			},function(){
				$( this ).html('申請中...');
			})
				
			// set button icon
			$( "btn_public" ).button({
			  	icon: { icon: "ui-icon-gear" }
			});

		// 新增 dialog 事件
			//新增sidebar team_Create 事件 
			var dialog;
			dialog = $("#contact").dialog({ autoOpen : false, height : 400, width : 350, modal : true, draggable : false, resizable : false, });
			$("#a_createTeam").on("click", function()	             		
			{
				dialog.dialog("open"); 			
			}); // sidebar dialog end  
			
			
			//setting confirm 
			$("#btn_disband").confirm({
			    title:"解散隊伍",
			    text:"一旦解散隊伍，就無法再回復!   確定要解散嗎?",
			    confirm: function(button) {
			    	$.ajax({ 
						"type" : "get", 
						"url" : "${home}spring/team/disbandTeam", // home 在 head
						"data" : { 
								"memberId" : "${sessionScope.LoginOK.memberId}", 
								"btn_disband" : "${requestScope.teamVO.teamId}" 
							}, 
						"dataType" : "text",
						"success" : function(data)
						{
							window.location.href= "${home}spring/team/createTeamPage";
						}, 
						"error" : function(Error)
						{
							alert("fuck");
							console.log(Error);
						} 
					})
			    },
			    cancel: function(button) {
			    },
			    confirmButton: "Yes",
			    cancelButton: "No"
			});
			
			// set a_recordA click事件
			$("#a_recordA").click(function(event){
				event.preventDefault();
				$("#tbody_A").show(200);
				$("#insideA_0").show(200);
				$("#selectpage_A").show(200);
				$("#tbody_B").hide()
				$(".insideB").hide();
				$("#selectpage_B").hide();
			})
			// set a_recordB click事件
			$("#a_recordB").click(function(event){
				event.preventDefault();
				$("#tbody_B").show(200);
				$("#insideB_0").show(200);
				$("#selectpage_B").show(200);
				$("#tbody_A").hide();
				$(".insideA").hide();
				$("#selectpage_A").hide();
			})
			// set 顯示分頁
			$(".paginationA").click(function(event){
				event.preventDefault();
				$(".insideA").hide();
				$("#insideA_"+($(this).text()-1)+"").show(200);
			})
			$(".paginationB").click(function(event){
				event.preventDefault();
				$(".insideB").hide();
				$("#insideB_"+($(this).text()-1)+"").show(200);
			})
			
			{
				$("#insideA_0").show(200);
			}
			// End of init
		});
	</script>
</body>
</html>
