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

	
<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>
<%-- 	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script> --%>

	<div class="row">
		<div class="col-md-6" >
		<c:choose >
			<c:when test="${requestScope.myList[0].teamId == null }">
				<h2 class="h2_tm">您尚未加入任何隊伍</h2>
			</c:when>
			<c:otherwise>
				<h2 class="h2_tm">您的隊伍：</h2>
				<c:forEach var="my_list" items="${requestScope.myList }">
				<div class="row left_div">
					<div class="col-md-6" >
						<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${my_list.teamId}" class="left_20">${my_list.teamName}</a><br>
					</div>
					<div class="col-md-6" >
					<c:set var="flag" value="N"></c:set>
					<c:forEach var="mineTeamId" items="${requestScope.mineTeamIdList }">
					<c:choose>
						<c:when test="${my_list.teamId == mineTeamId}">
							<form action="${pageContext.request.contextPath}/spring/team/disbandTeam" method="get">
								<button type="submit" class="btn btn-success btn-xs left_20" name="btn_disband" value="${my_list.teamId }" >解散</button>
								<input type="hidden" name="page" value="first">
								<c:set var="flag" value="Y"></c:set>
							</form>
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
				</c:forEach>
			</c:otherwise>
		</c:choose>
			<div class="left_20">
				<button id="create-team" >Create new Team</button>
			</div>
		</div>
		
<!-- 		right side 			-->
		<div class="col-md-6">
			<h2 class="h2_tm">推薦隊伍</h2>
			<table class="table table-hover " >
				<tbody>
				<c:forEach var="ot_list" items="${requestScope.otherList }" end="6" >
					<tr><td class="text-success "><div class="row">
						<div class="col-md-6" >
							<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${ot_list.teamId}">${ot_list.teamName }</a>
						</div>
<!-- 						<div class="col-md-6" > -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${ot_list.teamId == 0}"> --%>
<%-- 							<form action="${pageContext.request.contextPath}/spring/team/joinTeam" method="get"> --%>
<%-- 								<button type="submit" class="btn btn-success btn-xs left_20" name="btn_join" value="${ot_list.teamId }" >加入</button> --%>
<!-- 								<input type="hidden" name="page" value="first"> -->
<!-- 							</form> -->
<%-- 							</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 						</div> -->
					</div></td></tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<form id="contact" title="建立新隊伍" action="${pageContext.request.contextPath}/TeamServlet" method="post">
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

// 			// join team start
// 			$("button[name='btn_join']").click(function(){
//  				//alert(this.value + " = " + $(this).val());
				
// 				$.ajax({
// 					"type":"post",
// 					"url":"${home}spring/team/joinTeam", // home 在 head 設定
// 					"data":{"memberId":"${sessionScope.LoginOK.memberId}",
// 							"teamId":$(this).val()},
// 					"dataType":"text",
// 					"success":function(data){
// 						alert(data);
// 					},
// 					"error":function(Error){
// 						alert("fuck2");
// 						console.log(Error);
// 					}
// 				})
// 			}); // join team End

			
			
			// initial end
		});
	</script>

</body>
</html>
