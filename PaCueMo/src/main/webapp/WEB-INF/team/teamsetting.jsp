<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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

	<div class="row" style="padding-left: 30px">
		<div class="col-md-12">
			<h2 style="color: white;">
				<c:choose>
					<c:when test="${not empty requestScope.teamVO_update}"> ${requestScope.teamVO_update.teamName}</c:when>
					<c:otherwise>TeamName !</c:otherwise>
				</c:choose>
				<small> - <c:choose>
						<c:when test="${requestScope.teamVO_update.teamProp == 0}"> 公開  </c:when>
						<c:when test="${requestScope.teamVO_update.teamProp == 1}"> 需申請 </c:when>
						<c:when test="${requestScope.teamVO_update.teamProp == 2}"> 私密 </c:when>
					</c:choose>
				</small>
			</h2>
		</div>
		<div class="col-md-3"></div>
		<div class="col-md-5">


			<div class="content">
				<form method="get" action="${pageContext.request.contextPath }/spring/team/updateTeam" >
					<input type="hidden" autocomplete="off" name="teamId" value="${requestScope.teamVO_update.teamId }">
					<div id="groupsEditSaveNotification"></div>
					<table role="presentation">
						<tbody>
							<tr>
								<th>隊伍名稱</th>
								<td class="left_40"><div>
										<input id="teamName" name="teamName" type="text" tabindex="1" maxlength="10" pattern=".{1,}" value="${requestScope.teamVO_update.teamName }">
									</div></td>
							</tr>
							<tr>
								<td colspan="2"><hr></td>
							</tr>
						</tbody>
						<tbody>
							<tr>
								<th id="groupspurpose">隊伍性質</th>
								<td class="left_40"><div class="_1mvx _5iq6" id="u_0_24">
										<div class="div_pri_tm">
											<label class="" for="privacy_1"> <span class=""> <input type="radio" id="privacy_1" name="teamProp" value="0" aria-describedby="groupsCreatePrivacy" class=""> 
											<img class="img_tm" src="${pageContext.request.contextPath }/assets/images/public.png" alt="" width="16" height="16"> <span>公開</span>
											</span>
												<div class="descrip" id="">所有人都可以自由加入這個隊伍。</div>
											</label>
										</div>
										<div class="div_pri_tm">
											<label class="" for="privacy_2"> <span class=""> <input type="radio" id="privacy_2" name="teamProp" value="1" aria-describedby="groupsCreatePrivacy" class="">
											 <img class="img_tm" src="${pageContext.request.contextPath }/assets/images/protect.png" alt="" width="16" height="16"> <span>需申請</span>
											</span>
												<div class="descrip" id="">所有人都可以申請加入這個隊伍。</div>
											</label>
										</div>
										<div class="div_pri_tm">
											<label class="" for="privacy_3"> <span class=""> <input type="radio" id="privacy_3" name="teamProp" value="2" aria-describedby="groupsCreatePrivacy" class=""> 
											<img class="img_tm" src="${pageContext.request.contextPath }/assets/images/private.png" alt="" width="16" height="16"> <span>私密</span>
											</span>
												<div class="descrip" id="">只有被邀請的成員才可以加入這個隊伍。</div>
											</label>
										</div>
									</div></td>
							</tr>
							<tr>
								<td colspan="2"><hr></td>
							</tr>
						</tbody>
						<tbody>
							<tr class="_3stt">
								<th class="_3sts">隊伍簡介</th>
								<td class="left_40"><textarea class="uiTextareaAutogrow fbGroupDescriptionEditor" name="content">${requestScope.teamVO_update.content }</textarea>
									<div class="mts fsm fwn fcg">若隊伍性質為公開或不公開，及所有成員都看得見隊伍簡介。</div></td>
							</tr>
							<tr class="_3sto">
								<td colspan="2"><hr></td>
							</tr>
						</tbody>

						<tfoot>
							<tr>
								<th></th>
								<td style="text-align: right;"><button type="submit">修改</button></td>
							</tr>
						</tfoot>
					</table>
				</form>
			</div>
		</div>

		<div class="col-md-4"></div>
	</div>




	<script>
		// initial start
		$(function()
		{
			var prop = "${requestScope.teamVO_update.teamProp}";
			switch ($.trim(prop)) {
				case "0":
					$("#privacy_1").prop('checked', true);
					break;
				case "1":
					$("#privacy_2").prop('checked', true);
					break;
				case "2":
					$("#privacy_3").prop('checked', true);
					break;
			}

			// initial end
		});
	</script>

</body>
</html>
