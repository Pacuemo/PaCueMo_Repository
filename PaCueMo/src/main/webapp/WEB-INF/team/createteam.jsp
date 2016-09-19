<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<c:url var="home" value="/" scope="request" /> <%--設定home，之後在script可以用--%>
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

.left_20{
padding-left: 20px;
}

.left_div{
height: 50px;
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
    background-image: url("${pageContext.request.contextPath }/image/team/nike_basketball__europe.jpg");
}
</style>	
<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script> --%>

	<div class="row" style="margin: 0px">
		<div class="col-md-6" >

				<div class="dropdown col-md-12">
		<c:choose >
			<c:when test="${requestScope.myList[0].teamId == null }">
				<h2 class="h2_tm">您尚未加入任何隊伍</h2>
			</c:when>
			<c:otherwise>
				<h2 class="h2_tm dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">您的隊伍：<span class="caret"></span></h2>
			        <ul class="dropdown-menu animate fadeInDown animated" role="menu" style="width: 400px;margin-left: 40px;padding-top: 10px">
			          <c:forEach var="my_list" items="${requestScope.myList }">
			        <li class="row left_div">
			        <div class="col-md-12">
						<div class="col-md-6" >
							<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${my_list.teamId}" class="left_20" style="font-size: 23px;color: #2C514C;font-family: '微軟正黑體';font-weight: bolder;">${my_list.teamName}</a>
						</div>
						<div class="col-md-6" >
						<c:set var="flag" value="N"></c:set>
						<c:forEach var="mineTeamId" items="${requestScope.mineTeamIdList }">
						<c:choose>
							<c:when test="${my_list.teamId == mineTeamId}">
<%-- 								<form action="${pageContext.request.contextPath}/spring/team/disbandTeam" method="get"> --%>
									<button id="btn_disband" class="btn btn-success btn-xs left_20" name="btn_disband" value="${my_list.teamId }" >解散</button>
<!-- 									<input type="hidden" name="page" value="first"> -->
									<c:set var="flag" value="Y"></c:set>
<!-- 								</form> -->
							</c:when>
						</c:choose>
						</c:forEach>
							<c:if test="${flag == 'N'}">
								<form action="${pageContext.request.contextPath}/spring/team/abortTeam" method="get">
									<button type="submit" class="btn btn-success btn-xs left_20" name="btn_abort" value="${my_list.teamId }" >退出</button>
									<input type="hidden" name="page" value="first">
								</form>
							</c:if>
						</div>
					</div>
					</li>
			        <li class="divider"></li>
				</c:forEach>
			        <li><div class="left_20" style="text-align: right;">
						<button id="create-team" style="margin:10px;margin-right: 45px">Create new Team</button>
					</div></li>
			        </ul>
				
			</c:otherwise>
		</c:choose>
		      </div>
		</div>
		
<!-- 		right side 			-->
		<div class="col-md-2"></div>
		<div class="col-md-4">
		<div class="dropdown col-md-12"> <h2 class="h2_tm dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">推薦隊伍：<span class="caret"></span></h2>
			<ul class="dropdown-menu animate fadeInDown animated" style="width: 340px;margin-left: 40px;padding-top: 10px">
			<table class="table table-hover " >
				<tbody>
				<c:forEach var="ot_list" items="${requestScope.otherList }" end="6" >
					<c:choose>
						<c:when test="${ot_list.teamProp == 0}">
							<tr><td class="text-success" style="border-bottom:1pt solid #F5F3BB;"><div class="row">	
									<div class="col-md-6" >
										<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${ot_list.teamId}">${ot_list.teamName }</a>
									</div>
									<div class="col-md-6" >
									<form action="${pageContext.request.contextPath}/spring/team/joinTeam" method="get">
										<button type="submit" class="btn btn-success btn-xs left_20" name="btn_join" value="${ot_list.teamId }" >加入</button>
										<input type="hidden" name="page" value="first">
									</form>
									</div>
							</div></td></tr>
						</c:when>
						<c:when test="${ot_list.teamProp == 1}">
						<c:set var="flag" value="false"/>
							<c:forEach var="myTeamApplyVO" items="${requestScope.myTeamApplyVOs }">
							<c:choose>
								<c:when test="${ot_list.teamId == myTeamApplyVO.teamId && myTeamApplyVO.applystatus == 0}">
								<c:set var="flag" value="true"/>
									<tr><td class="text-success" style="border-bottom:1pt solid #F5F3BB;"><div class="row">		
											<div class="col-md-6" >
												<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${ot_list.teamId}">${ot_list.teamName }</a>
											</div>
											<div class="col-md-6" >
												<form action="${pageContext.request.contextPath}/spring/tm_apply/cancel" method="get">
													<button type="submit" class="btn btn-warning btn-xs left_20" name="btn_cancel" value="${ot_list.teamId }" id="btn_cancle" style="background-color: #F2A359">申請中...</button>
													<input type="hidden" name="page" value="first">
												</form>
											</div>
									</div></td></tr>
								</c:when>
								<c:otherwise>
								<c:set var="flag" value="true"/>
									<tr><td class="text-success" style="border-bottom:1pt solid #F5F3BB;"><div class="row">		
											<div class="col-md-6" >
												<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${ot_list.teamId}">${ot_list.teamName }</a>
											</div>
											<div class="col-md-6" >
												<form action="${pageContext.request.contextPath}/spring/tm_apply/applyTeam" method="get">
													<button type="submit" class="btn btn-success btn-xs left_20" name="btn_apply" value="${ot_list.teamId }" >申請加入</button>
													<input type="hidden" name="page" value="first">
												</form>
											</div>
									</div></td></tr>
								</c:otherwise>
							</c:choose>
							</c:forEach>
							<c:if test="${flag eq false}">
							<tr><td class="text-success" style="border-bottom:1pt solid #F5F3BB;"><div class="row">		
								<div class="col-md-6" >
									<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${ot_list.teamId}">${ot_list.teamName }</a>
								</div>
								<div class="col-md-6" >
									<form action="${pageContext.request.contextPath}/spring/tm_apply/applyTeam" method="get">
										<button type="submit" class="btn btn-success btn-xs left_20" name="btn_apply" value="${ot_list.teamId }" >申請加入</button>
										<input type="hidden" name="page" value="first">
									</form>
								</div>
							</div></td></tr>
							</c:if>
						</c:when>
					</c:choose>
				</c:forEach>
				</tbody>
			</table>
			</ul>
		</div>
		</div>
	</div>

	<form id="contact" title="建立新隊伍" action="${pageContext.request.contextPath}/TeamServlet" method="post" style="display:none" >
		<fieldset>
			<input placeholder="隊伍名稱" id="teamName" name="teamName" type="text" tabindex="1" required maxlength="10" autofocus pattern=".{2,}">
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


	


	<script>
		// initial start
		$(function()
		{
			// team dialog
			var dialog;

			dialog = $("#contact").dialog({ autoOpen : false, height : 400, width : 350, modal : true, draggable : false, resizable : false, });

			//新增事件
			$("#create-team").on("click", function()
			{
				dialog.dialog("open");
			}); // team dialog end  



			//set btn_cancle hover
			$("#btn_cancle").hover(function(){
// 				$("#tdId").fadeOut( 200 );
// 				 $( this ).fadeIn( 500 );
				 $( this ).html('取消申請');
				 
			},function(){
				$( this ).html('申請中...');
			})
				
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
			
			
			// initial end
		});
	</script>

</body>
</html>
