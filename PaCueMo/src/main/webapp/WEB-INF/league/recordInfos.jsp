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

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style>
.Mytable {
	background-color: white;
	width: 98%
}

.Myth {
	color: white;
	text-align: center;
	background-color: #4CAF50;
}

tr {
	height: 40px;
}

tr:hover {
	background-color: #00BBFF
}

td {
	vertical-align: middle;
	color: black;
	text-align: center;
}

td img {
	margin-left: auto;
	margin-right: auto;
}

h1 {
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


	<div class="row">
		<div class="col-lg-6 col-lg-offset-2" style="width: 1200px;">
			<h1 style="color: white"><img class="img-thumbnail" style="width:80px;height:80px"src="${pageContext.request.contextPath}/image/club/${requestScope.leagueRecordVO.clubA.clubImageName}"></img>   ${requestScope.leagueRecordVO.clubA.clubName}</h1>
			<div class="table-responsive">
				<table>
					<thead>
						<tr>
							<th></th>
							<th>球員名稱</th>
							<th>背號</th>
							<th>位置</th>
							<th>先發</th>
							<th>上場時間</th>
							<th>3PA</th>
							<th>3PM</th>
							<th>3PP</th>
							<th>2PA</th>
							<th>2PM</th>
							<th>2PP</th>
							<th>FTA</th>
							<th>FTM</th>
							<th>FTP</th>
							<th>OR</th>
							<th>DR</th>
							<th>TR</th>
							<th>ASS</th>
							<th>ST</th>
							<th>BS</th>
							<th>TO</th>
							<th>PF</th>
							<th>PT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.fightRecordVOs}" var="fightRecordVO">
							<c:if test="${fightRecordVO.clubId == requestScope.leagueRecordVO.clubIdA}">
								<tr>
									<td><img class="img-rounded" style="width: 28px; height: 28px" src="${pageContext.request.contextPath}/image/member/${fightRecordVO.memberVO.memberImgUrl}"><img></td>
									<td>${fightRecordVO.memberVO.memberLastName}${fightRecordVO.memberVO.memberFirstName}</td>
									<td>${fightRecordVO.gamePlayer}</td>
									<td>${fightRecordVO.position}</td>
									<td><c:if test="${fightRecordVO.gameStart}">V</c:if></td>
									<td>${fightRecordVO.minPlay}</td>
									<td>${fightRecordVO.trePA}</td>
									<td>${fightRecordVO.trePM}</td>
									<td>${fightRecordVO.trePP}%</td>
									<td>${fightRecordVO.twoPA}</td>
									<td>${fightRecordVO.twoPM}</td>
									<td>${fightRecordVO.twoPP}%</td>
									<td>${fightRecordVO.fta}</td>
									<td>${fightRecordVO.fta}</td>
									<td>${fightRecordVO.ftp}%</td>
									<td>${fightRecordVO.ofRep}</td>
									<td>${fightRecordVO.deRep}</td>
									<td>${fightRecordVO.totalRep}</td>
									<td>${fightRecordVO.ass}</td>
									<td>${fightRecordVO.steal}</td>
									<td>${fightRecordVO.block}</td>
									<td>${fightRecordVO.turnOver}</td>
									<td>${fightRecordVO.fouls}</td>
									<td>${fightRecordVO.score}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>



	<div class="row">
		<div class="col-lg-6 col-lg-offset-2" style="width: 1200px;">
			<h1 style="color: white"><img class="img-thumbnail" style="width:80px;height:80px"src="${pageContext.request.contextPath}/image/club/${requestScope.leagueRecordVO.clubB.clubImageName}"></img>   ${requestScope.leagueRecordVO.clubB.clubName}</h1>
			<div class="table-responsive">
				<table>
					<thead>
						<tr>
							<th></th>
							<th>球員名稱</th>
							<th>背號</th>
							<th>位置</th>
							<th>先發</th>
							<th>上場時間</th>
							<th>3PA</th>
							<th>3PM</th>
							<th>3PP</th>
							<th>2PA</th>
							<th>2PM</th>
							<th>2PP</th>
							<th>FTA</th>
							<th>FTM</th>
							<th>FTP</th>
							<th>OR</th>
							<th>DR</th>
							<th>TR</th>
							<th>ASS</th>
							<th>ST</th>
							<th>BS</th>
							<th>TO</th>
							<th>PF</th>
							<th>PT</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${requestScope.fightRecordVOs}" var="fightRecordVO">
							<c:if test="${fightRecordVO.clubId== leagueRecordVO.clubIdB}">
								<tr>
									<td><img class="img-rounded" style="width: 28px; height: 28px" src="${pageContext.request.contextPath}/image/member/${fightRecordVO.memberVO.memberImgUrl}"><img></td>
									<td>${fightRecordVO.memberVO.memberLastName}${fightRecordVO.memberVO.memberFirstName}</td>
									<td>${fightRecordVO.gamePlayer}</td>
									<td>${fightRecordVO.position}</td>
									<td><c:if test="${fightRecordVO.gameStart}">V</c:if></td>
									<td>${fightRecordVO.minPlay}</td>
									<td>${fightRecordVO.trePA}</td>
									<td>${fightRecordVO.trePM}</td>
									<td>${fightRecordVO.trePP}%</td>
									<td>${fightRecordVO.twoPA}</td>
									<td>${fightRecordVO.twoPM}</td>
									<td>${fightRecordVO.twoPP}%</td>
									<td>${fightRecordVO.fta}</td>
									<td>${fightRecordVO.fta}</td>
									<td>${fightRecordVO.ftp}%</td>
									<td>${fightRecordVO.ofRep}</td>
									<td>${fightRecordVO.deRep}</td>
									<td>${fightRecordVO.totalRep}</td>
									<td>${fightRecordVO.ass}</td>
									<td>${fightRecordVO.steal}</td>
									<td>${fightRecordVO.block}</td>
									<td>${fightRecordVO.turnOver}</td>
									<td>${fightRecordVO.fouls}</td>
									<td>${fightRecordVO.score}</td>
								</tr>
							</c:if>
						</c:forEach>
					</tbody>
				</table>
			</div>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("table").addClass("Mytable");
		$("th").addClass("Myth");
	})
</script>
</html>
