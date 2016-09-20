<%@page import="java.sql.Date"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<%-- for spring --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<link href="/css/heroic-features.css" rel="stylesheet">
<style>
</style>
<script>
	
<%--insert JScript here--%>
	
<%--<script src=""></script>--%>
	
</script>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="sidebar.jsp" />
	<div id="info">
		<div class="row text-center">
			<c:forEach items="${requestScope.leagues}" var="leagueVO">

				<div class="col-md-3 col-sm-6 hero-feature" style="margin: 50px 30px">
					<div class="thumbnail">
						<img src="../../img/PACUEMO.png" style="width: 150px; height: 150px" alt="">
						<div class="caption">
							<h3>${leagueVO.leagueName}</h3>
							<p>社團上限: ${leagueVO.clubAmount}</p>
							<p>${leagueVO.startDate}~${leagueVO.endDate}</p>
							<p>${leagueVO.courtVO.name}</p>
							<p>獎金 $100,000,000</p>
							<p>
								<jsp:useBean id="now" class="java.util.Date" />
								<c:if test="${leagueVO.startDate lt now}">
									<s:url value="/spring/league/Infos" var="query">
										<s:param name="leagueId" value="${leagueVO.leagueID}" />
									</s:url>
									<a href="${query}" class="btn btn-primary" style="background-color: black">查詢</a>
								</c:if>
								<c:if test="${leagueVO.startDate gt now}">
								<s:url value="/spring/league/signUp" var="signUp">
										<s:param name="leagueId" value="${leagueVO.leagueID}" />
									</s:url>
									<a href="${signUp}" class="btn btn-primary" style="background-color: #800000">報名</a>
								</c:if>
								<!-- 							<a href="#" class="btn btn-default">More Info</a> -->
							</p>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<%-- 	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script> --%>
	<%-- 	<script type="text/javascript"> --%>
	<!-- // 		$(function() -->
	<!-- // 		{ -->
	<%-- // 			var contextPath = "${pageContext.request.contextPath}"; --%>
	<!-- // 			$("#info a").click(function(e) -->
	<!-- // 			{ -->
	<!-- // 				e.preventDefault(); -->
	<!-- // 				$.ajax({ url : $(this).attr("href"), type : 'get', success : function(leagueVO) -->
	<!-- // 				{ -->
	<!-- // 					//     				  console.log(leagueVO); -->
	<!-- // 					$("#info").text(""); -->
	<!-- // 					$.each(leagueVO.leagueClubVOs, function(index, value) -->
	<!-- // 					{ -->
	<!-- // 						$("<h1></h1>").text(value.clubVO.clubName).appendTo($("#info")); -->
	<!-- // 					}); -->
	<!-- // 					$.each(leagueVO.leagueRecordVOs, function(index, value) -->
	<!-- // 					{ -->
	<%-- // 						$("<a></a>").attr("href", (contextPath + "/spring/league/Info/one?fightId=" + value.fightId)).append($("<span></span>").text(value.clubIdA + "VS")).append($("<span></span>").text(value.clubIdB)).append($("<br/>")).appendTo($("#info")); --%>
	<!-- // 					}); -->
	<!-- // 				} }); -->
	<!-- // 			}); -->
	<!-- // 		}); -->
	<%-- 	</script> --%>



	</script>
</body>
</html>
