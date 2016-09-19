<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
form {
	margin: 0px auto;
	margin-left: 50px;
	text-align: left
}

.title {
	margin-left: 50px;
	color: white
}

input {
	width: 50%;
	padding: 12px 20px;
	margin: 8px 0;
	box-sizing: border-box;
	color: black;
}

select, option {
	color: #000000
}

input:focus {
	background-color: lightblue;
}

label {
	color: white
}
</style>
<script>
	
<%--insert JScript here--%>
	
<%--<script src=""></script>--%>
	
</script>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="sidebar.jsp" />
	<div class="col-lg-8 col-lg-offset-2" style="margin-top: 100px">
		<div class="col-md-6">
			<h1 class="title">新增社團</h1>
			<sf:form method="post" commandName="clubVO" action="register">
				<label>社團名稱:</label>
				<br />
				<sf:input path="clubName" />
				<sf:errors path="clubName" />
				<br />
				<br />
				<label>社團性質:</label>
				<br />
				<sf:select path="clubProp">
					<sf:option value="1">激烈碰撞</sf:option>
					<sf:option value="2">休閒娛樂</sf:option>
					<sf:option value="3">額外交流</sf:option>
				</sf:select>
				<br />
				<br />
				<input type="submit" value="Register">
			</sf:form>
			<br />
		</div>
		<div class="col-md-6"  style="border-left: 1px solid gray">
			<h1 class="title">加入社團</h1>
			<ul class="list-group"  style="overflow: scroll;height:500px">
				<c:forEach items="${ClubVOss}" var="club">
					<s:url value="/spring/club/apply" var="joinClub">
						<s:param name="club" value="${club.clubID}" />
						<s:param name="memberId" value="${sessionScope.LoginOK.memberId}" />
					</s:url>
					<li class="list-group-item" style="height: 60px"><a href="getClubById?clubId=${club.clubID}" style="color: black">${club.clubName}</a>
						<div style="float: right">
							<a class="btn btn-default joinClub" href="${joinClub}" role="button" style="background-color: #0059b3; font-size: 10px; width: 100px; padding: 10px; min-width: 100px;">加入社團</a>
						</div></li>
				</c:forEach>
			</ul>

		</div>
	</div>


	<script>
		// -----新增社團----
		$(function()
		{

			$(".joinClub").click(function(event)
			{
				var btn = $(this);
				event.preventDefault();
				$.ajax({ url : $(this).attr("href"), type : 'get', success : function(message)
				{

					switch ($.trim(message.status)) {
						case "success":
							BootstrapAlert.success({ title : "Congrat!", message : message.statusMsg });
							btn.text("已申請");
							break;
						case "already":
							BootstrapAlert.info({ title : "Don't worry!", message : message.statusMsg });
							btn.text("已申請");
							break;
						default:
							BootstrapAlert.alert({ title : "Sorry!", message : message.statusMsg });
							btn.text("已有社團");
							break;
					}

				} })
			});

		})
	</script>
</body>
</html>
