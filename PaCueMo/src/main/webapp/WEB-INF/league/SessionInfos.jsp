<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
 <title>PACUEMO League</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
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
	<jsp:include page="navBar.jsp" />
	<style>
body{
background-image: url('${pageContext.request.contextPath}/image/background/KyrieIrving.jpg');
width:100%;
}
</style>
	<!-- --------------------社團分組------------------------ -->
	<div id="team" class="col-lg-8 col-lg-offset-2" style="display: block">
		<div style="margin-top: 100px">
			<h1 class="page-header" style="color: white; font-weight: bold">TEAMS</h1>
			<div id="groups" style="margin-top: 100px; margin-bottom: 200px">
				<c:forEach var="i" begin="1" end="4">
					<div class="col-md-5" style="border: 1px solid grey; margin-right: 70px; margin-bottom: 100px;background-color: rgba(13, 13, 13,0.6)">
						<h3 style="color: white">
							Group
							<c:out value="${i}" />
						</h3>
						<table>
							<tr>
								<c:forEach items="${leagueVO.leagueClubVOs}" var="leagueClubVO">
									<s:url value="/spring/club/getClubById" var="searchClub">
										<s:param name="clubId" value="${leagueClubVO.clubId}" />
									</s:url>
									<c:if test="${i == leagueClubVO.groups}">
										<td style="width: 198px; height: 198px;"><a href="${searchClub}"> <img class="img-circle" style="width: 100px; height: 100px; margin: 0px auto" src="../../image/club/${leagueClubVO.clubVO.clubImageName}"></img></a>
											<div style="width: 160px; height: 31px; text-align: center;">
												<h4>
													<a href="${searchClub}" style="color: white">${leagueClubVO.clubVO.clubName}</a>
												</h4>
											</div></td>
									</c:if>
								</c:forEach>
							</tr>
						</table>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<!-- --------------------社團分組------------------------	 -->

	<div class="col-md-12" style="margin-top: 80px">
		<div class="col-sm-8 col-lg-8 col-md-8  col-lg-offset-2" style="margin-bottom: 100px">
			<div id="round1" style="display: none">
				<h1 class="page-header" style="color: white; font-weight: bold">Round1</h1>
			</div>
			<div id="round2" style="display: none">
				<h1 class="page-header" style="color: white; font-weight: bold">Round2</h1>
			</div>
			<div id="round3" style="display: none">
				<h1 class="page-header" style="color: white; font-weight: bold">Round3</h1>
			</div>
			<div id="round4" style="display: none">
				<h1 class="page-header" style="color: white; font-weight: bold">Final</h1>
			</div>
		</div>
		<div class="row">
			<c:forEach items="${leagueVO.leagueRecordVOs}" var="leagueRecordVO">
				<s:url value="/spring/league/Info/one" var="query">
					<s:param name="fightId" value="${leagueRecordVO.fightId}">
					</s:param>
				</s:url>
				<s:url value="/spring/club/getClubById" var="searchClubA">
					<s:param name="clubId" value="${leagueRecordVO.clubIdA}" />
				</s:url>
				<s:url value="/spring/club/getClubById" var="searchClubB">
					<s:param name="clubId" value="${leagueRecordVO.clubIdA}" />
				</s:url>
				<div class="col-sm-8 col-lg-8 col-md-8  col-lg-offset-2 Round${leagueRecordVO.rounds}" style="display: none;">
					<table style="width: 100%; border: 1px solid grey; margin-bottom: 30px;background-color: rgba(13, 13, 13,0.6)">
						<tr>
							<td style="width: 15%; background-color: black; color: white; text-align: center;padding:0px 3px">
							    <jsp:useBean id="fightDate" class="java.util.Date"/>
								<jsp:setProperty property="time" name="fightDate" value="${leagueRecordVO.fightDateTime.time}"/>
								<fmt:formatDate type="both"  dateStyle="short" timeStyle="short"  value="${fightDate}" />
							</td>
							<c:choose>
								<c:when test="${leagueRecordVO.scoreB>leagueRecordVO.scoreA}">
								<td style="width: 70%;">
										<table style="width: 100%">
											<tr>
												<td style="width: 20%; color: white; opacity: 0.4"><h4 style="text-align: center">${leagueRecordVO.clubA.clubName}</h4></td>
												<td style="width: 25%; opacity: 0.4"><a href="${searchClubA}"><img src="../../image/club/${leagueRecordVO.clubA.clubImageName}" alt="" class="img-circle" style="width: 130px; height: 130px; margin-top: 30px; margin-bottom: 30px; margin-right: 50px; margin-left: 50px;border:4px solid white" /></a></td>
												<td style="width: 10%;"><img src="${pageContext.request.contextPath}/image/vs/VS4.gif  " class="img-circle" style="width: 80px; height: 80px;"></td>
												<td style="width: 25%; text-align: right"><a href="${searchClubB}"><img src="../../image/club/${leagueRecordVO.clubB.clubImageName}" alt="" class="img-circle" style="width: 130px; height: 130px; margin-top: 30px; margin-bottom: 30px; margin-left: 50px;border:4px solid white" /></a></td>
												<td style="width: 20%; text-align: right; color: white;"><h4 style="text-align: center">${leagueRecordVO.clubB.clubName}</h4></td>
											</tr>
											<tr>
												<td colspan="2" style="text-align: center; color: white; opacity: 0.4"><h4>${leagueRecordVO.scoreA}</h4></td>
												<td></td>
												<td colspan="2" style="text-align: center; color: white"><h4>${leagueRecordVO.scoreB}</h4></td>
											</tr>
										</table>
										</td>
								         <td style="width: 15%;border-left:1px solid white"><p style="text-align: center">
										 <a href="${query}" class="btn btn-primary" style="background-color: black">查詢</a>
									</p></td>
									</c:when> 
									<c:when test="${leagueRecordVO.scoreA>leagueRecordVO.scoreB}">
										<td style="width: 70%;">
										<table style="width: 100%">
											<tr>
												<td style="width: 20%; color: white;"><h4 style="text-align: center">${leagueRecordVO.clubA.clubName}</h4></td>
												<td style="width: 25%;"><a href="${searchClubA}"><img src="../../image/club/${leagueRecordVO.clubA.clubImageName}" alt="" class="img-circle" style="width: 130px; height: 130px; margin-top: 30px; margin-bottom: 30px; margin-right: 50px; margin-left: 50px;border:4px solid white" /></a></td>
												<td style="width: 10%;"><img src="${pageContext.request.contextPath}/image/vs/VS4.gif  " class="img-circle" style="width: 80px; height: 80px;"></td>
												<td style="width: 25%; text-align: right; opacity: 0.4"><a href="${searchClubB}"><img src="../../image/club/${leagueRecordVO.clubB.clubImageName}" alt="" class="img-circle" style="width: 130px; height: 130px; margin-top: 30px; margin-bottom: 30px; margin-left: 50px;border:4px solid white" /></a></td>
												<td style="width: 20%; text-align: right; color: white;opacity: 0.4"><h4 style="text-align: center">${leagueRecordVO.clubB.clubName}</h4></td>
											</tr>
											<tr>
												<td colspan="2" style="text-align: center; color: white"><h4>${leagueRecordVO.scoreA}</h4></td>
												<td></td>
												<td colspan="2" style="text-align: center; color: white; opacity: 0.4"><h4>${leagueRecordVO.scoreB}</h4></td>
											</tr>
										</table>
										</td>
								           <td style="width: 15%;border-left:1px solid white"><p style="text-align: center">
										<a href="${query}" class="btn btn-primary" style="background-color: black">查詢</a>
									        </p></td>
									</c:when> 
	                                <c:otherwise>
										<td style="width: 70%;">
										<table style="width: 100%">
											<tr>
												<td style="width: 20%; color: white;"><h4 style="text-align: center">${leagueRecordVO.clubA.clubName}</h4></td>
												<td style="width: 25%;"><a href="${searchClubA}"><img src="../../image/club/${leagueRecordVO.clubA.clubImageName}" alt="" class="img-circle" style="width: 130px; height: 130px; margin-top: 30px; margin-bottom: 30px; margin-right: 50px; margin-left: 50px;border:4px solid white" /></a></td>
												<td style="width: 10%;"><img src="${pageContext.request.contextPath}/image/vs/VS4.gif  " class="img-circle" style="width: 80px; height: 80px;"></td>
												<td style="width: 25%; text-align: right; "><a href="${searchClubB}"><img src="../../image/club/${leagueRecordVO.clubB.clubImageName}" alt="" class="img-circle" style="width: 130px; height: 130px; margin-top: 30px; margin-bottom: 30px; margin-left: 50px;border:4px solid white" /></a></td>
												<td style="width: 20%; text-align: right; color: white;"><h4 style="text-align: center">${leagueRecordVO.clubB.clubName}</h4></td>
											</tr>
											<tr>
												<td colspan="2" style="text-align: center; color: white"><h4></h4></td>
												<td></td>
												<td colspan="2" style="text-align: center; color: white;"><h4></h4></td>
											</tr>
										</table>
										</td>
								           <td style="width: 15%;border-left:1px solid white"><p style="text-align: center">
										<a href="#" class="btn btn-primary" style="background-color: black">備戰</a>
									        </p></td>
									</c:otherwise> 
								</c:choose>
						</tr>
					</table>
				</div>
			</c:forEach>
		</div>
	</div>
</body>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function()
	{
		$("#btn-Round1").click(function(event)
		{
			event.preventDefault();
			$(".Round1").attr("style", "display: block;");
			$(".Round2").attr("style", "display: none;");
			$(".Round3").attr("style", "display: none;");
			$(".Round4").attr("style", "display: none;");
			$("#team").attr("style", "display: none;");
			$("#round1").attr("style", "display: block;");
			$("#round2").attr("style", "display: none;");
			$("#round3").attr("style", "display: none;");
			$("#round4").attr("style", "display: none;");
		});
		$("#btn-Round2").click(function(event)
		{
			event.preventDefault();
			$(".Round2").attr("style", "display: block;");
			$(".Round1").attr("style", "display: none;");
			$(".Round3").attr("style", "display: none;");
			$(".Round4").attr("style", "display: none;");
			$("#team").attr("style", "display: none;");
			$("#round2").attr("style", "display: block;");
			$("#round1").attr("style", "display: none;");
			$("#round3").attr("style", "display: none;");
			$("#round4").attr("style", "display: none;");
		});
		$("#btn-Round3").click(function(event)
		{
			event.preventDefault();
			$(".Round3").attr("style", "display: block;");
			$(".Round2").attr("style", "display: none;");
			$(".Round1").attr("style", "display: none;");
			$(".Round4").attr("style", "display: none;");
			$("#team").attr("style", "display: none;");
			$("#round3").attr("style", "display: block;");
			$("#round2").attr("style", "display: none;");
			$("#round1").attr("style", "display: none;");
			$("#round4").attr("style", "display: none;");
		});
		$("#btn-Round4").click(function(event)
		{
			event.preventDefault();
			$(".Round4").attr("style", "display: block;");
			$(".Round2").attr("style", "display: none;");
			$(".Round3").attr("style", "display: none;");
			$(".Round1").attr("style", "display: none;");
			$("#team").attr("style", "display: none;");
			$("#round4").attr("style", "display: block;");
			$("#round2").attr("style", "display: none;");
			$("#round3").attr("style", "display: none;");
			$("#round1").attr("style", "display: none;");
		});
		$("#btn-team").click(function(event)
		{
			event.preventDefault();
			$(".Round4").attr("style", "display: none;");
			$(".Round2").attr("style", "display: none;");
			$(".Round3").attr("style", "display: none;");
			$(".Round1").attr("style", "display: none;");
			$("#team").attr("style", "display: block;");
			$("#round1").attr("style", "display: none;");
			$("#round2").attr("style", "display: none;");
			$("#round3").attr("style", "display: none;");
			$("#round4").attr("style", "display: none;");
		});

	})
</script>
</html>
