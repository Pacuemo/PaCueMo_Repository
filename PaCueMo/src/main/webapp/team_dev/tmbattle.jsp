<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
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
body{
background-color: yellow;
}
table{
color:white;
}
td{
border: 1px solid white;
color:white;
}
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />

	<div class="row">
		<div class="col-md-6">
			<h2 class="h2_tm">您的隊伍：</h2>
			<c:forEach var="my_list" items="${requestScope.myList }">
				<div class="row left_div">
					<div class="col-md-6">
						<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${my_list.teamId}" class="left_20">${my_list.teamName}</a>
						<br>
					</div>
					<div class="col-md-6">
						
						<c:forEach var="mineTeamId" items="${requestScope.mineTeamIdList }">
							<c:choose>
								<c:when test="${my_list.teamId == mineTeamId}">
									<form action="${pageContext.request.contextPath}/spring/team/disbandTeam" method="get">
										<button type="submit" class="btn btn-success btn-xs left_20" name="btn_disband" value="${my_list.teamId }">解散</button>
										<input type="hidden" name="page" value="first">
										<c:set var="flag" value="Y"></c:set>
									</form>
								</c:when>
							</c:choose>
						</c:forEach>
					</div>
				</div>
			</c:forEach>
			
		</div>
	</div>


</body>
</html>
