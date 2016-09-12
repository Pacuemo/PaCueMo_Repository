<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>

<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>

<link href="${pageContext.request.contextPath }/css/team/addteam.css" rel="stylesheet">
<link href="${pageContext.request.contextPath }/css/team/jquery-ui_team.min.css" rel="stylesheet">

<%-- <script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>
<%-- <script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script> --%>

<style>
.h2_tm {
	margin-left: 20px;
	color: white;
}
</style>


<script>
	
<%--insert JScript here--%>
	
<%--<script src=""></script>--%>
	
</script>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />

	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script>

	<div class="row">
		<div class="col-md-6">
		<c:choose >
			<c:when test="${requestScope.myList[0].teamId == null }">
				<h2 class="h2_tm">您尚未加入任何隊伍</h2>
			</c:when>
			<c:otherwise>
				<h2 class="h2_tm">${requestScope.myList[0].teamId} <- </h2>
				<c:forEach var="my_list" items="${requestScope.myList }">
					<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${mylist.teamId}" class="">${my_list.teamName}</a>
				</c:forEach>
			</c:otherwise>
		</c:choose>
			<button id="create-team" class="" style="margin-left:20px ">Create new Team</button>
		</div>
		<div class="col-md-6">
			<h2 class="h2_tm">推薦隊伍</h2>
			<table class="table table-hover " >
				<tbody>
				<c:forEach var="ot_list" items="${requestScope.otherList }" >
					<tr><td class="text-success "><div class="row">
						<span>${ot_list.teamName }</span>
						<button type="button" class="btn btn-success btn-xs" name="btn_teamId" value="${ot_list.teamId }" >加入</button>
					</div></td></tr>
				</c:forEach>
				</tbody>
			</table>
		</div>
	</div>

	<form id="contact" title="建立新隊伍" action="${pageContext.request.contextPath}/TeamServlet" method="post">
		<!--             <div class="tm_title"> -->
		<!--                 <h3>建立新隊伍</h3> -->
		<!--             </div>  oninvalid="setCustomValidity('不能为空')" oninput="setCustomValidity('')"-->
		<fieldset>
			<input placeholder="隊伍名稱" id="teamName" name="teamName" type="text" tabindex="1" required oninvalid="setCustomValidity('GG')" maxlength="10" autofocus pattern=".{2,}">
		</fieldset>
		<fieldset>
			<input placeholder="輸入隊員姓名或電子郵件" name="" type="text" tabindex="2">
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

			// join team start
			$("button[name='btn_teamId']").click(function(){
				alert(this.value);
				alert("2");
				$.ajax({
					"type":"get",
					"url":"${home}spring/team/joinTeam", // home 在 設定
					"data":{"memberId":"${sessionScope.LoginOK.memberId}",
							"teamId":"$(this).value"},
					"dataType":"text",
					"success":function(data){
						alert(data);
					},
					"error":function(Error){
						alert("fuck");
						console.log(Error);
					}
				})
			}) // joinTeam End
			
			
			// initial end
		});
	</script>

</body>
</html>
