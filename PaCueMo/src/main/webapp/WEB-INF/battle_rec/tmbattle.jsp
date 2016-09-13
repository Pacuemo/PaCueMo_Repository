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

.weather{
margin: 0px;
margin-right: 0px;
}

</style>



</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
<script src="//ajax.googleapis.com/ajax/libs/jqueryui/1.10.4/jquery-ui.min.js"></script>
	<div class="row">
		<div class="col-md-6">
			<h2 class="h2_tm">您的隊伍：</h2>
			<c:forEach var="my_list" items="${requestScope.mineTeamVOList }">
				<div class="row left_div">
					<div class="col-md-6">
						<a href="${pageContext.request.contextPath }/TeamServlet?teamId=${my_list.teamId}" class="left_20">${my_list.teamName}</a>
					</div>
					<div class="col-md-6">
						<form action="${pageContext.request.contextPath}/spring/battle_rec/letsbattle" method="get">
							<button type="submit" class="btn btn-success btn-xs" name="btn_disband" value="${my_list.teamId }">發出約戰</button>
							<input type="hidden" name="page" value="first">
						</form>
					</div>
				</div>
			</c:forEach>

		</div>
		<div class="col-md-6">
			<div class="col-md-8">
			</div>
			<div class="col-md-4">
				<div id="cont_ca9ddef90f63f255a3e37230d88fb6e7"><script type="text/javascript" async src="https://www.theweather.com/wid_loader/ca9ddef90f63f255a3e37230d88fb6e7"></script></div>
			
			
			</div>
			



		</div>
	</div>

<script type="text/javascript">
$("#cont_ca9ddef90f63f255a3e37230d88fb6e7").css("margin-right" , "0px");
</script>


</body>
</html>
