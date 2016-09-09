<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<%-- <link href="${pageContext.request.contextPath}/css/bootstrap.min.css" rel="stylesheet"> --%>
<%-- <link href="${pageContext.request.contextPath}/css/shop-homepage.css" rel="stylesheet"> --%>
<style>
</style>
<script>
	
</script>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="sidebar.jsp" />
	<div class="col-md-2" style="margin-top: 30px">
		<p class="lead" style="color: white; text-align: center">參與社團</p>
		<div class="list-group">
			<c:forEach items="${leagueVO.leagueClubVOs}" var="leagueClubVO">
				<s:url value="/spring/club/getById" var="queryClub">
				<s:param name="clubId" value="${leagueClubVO.clubId}" >
				</s:param></s:url>
				<a href="${queryClub}" class="list-group-item" style="text-align: center">${leagueClubVO.clubVO.clubName}</a>
			</c:forEach>
		</div>
	</div>
	<div class="col-md-10" style="margin-top: 80px">
		
		<div class="row">			
			<c:forEach items="${leagueVO.leagueRecordVOs}" var="leagueRecordVO">
				<s:url value="/spring/league/Info/one" var="query">
				<s:param name="fightId" value="${leagueRecordVO.fightId}" >
				</s:param></s:url>				
				<div class="col-sm-6 col-lg-4 col-md-6" >
					<div class="thumbnail">
						<table style="width:100%"><tr style="vertical-align: center">
						<td style="padding:0 20px"><img src="../../image/club/${leagueRecordVO.clubA.clubImageName}" alt="" class="img-circle" style="width:130px;height:130px"></td>
						<td style="padding:0 10px"><img src="${pageContext.request.contextPath}/image/vs/VS.png" class="img-circle" style="width:80px;height:80px"></td>
						<td style="padding:0 20px"><img src="../../image/club/${leagueRecordVO.clubB.clubImageName}" alt="" class="img-circle" style="width:130px;height:130px"></td>
						</tr></table>					
						<div class="caption">
							<h4 style="text-align: left">${leagueRecordVO.clubA.clubName}   得${leagueRecordVO.scoreA}分</h4>
							<h6 style="text-align: center">VS</h6>
							<h4 style="text-align: right">${leagueRecordVO.clubB.clubName}    得${leagueRecordVO.scoreB}分</h4>
							<p>時間:${leagueRecordVO.fightDateTime}</p>
							<p>第${leagueRecordVO.rounds}輪</p>
							<p>總時數:${leagueRecordVO.totalTime}</p>
						</div>
						<p style="text-align:center">
							<a href="${query}" class="btn btn-primary">查詢</a>	
						</p>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
</html>
