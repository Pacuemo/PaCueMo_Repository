<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
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
	<!-- --------------------社團分組------------------------ -->
	<div id="team" class="col-lg-8 col-lg-offset-2" style="display: block">
		<div style="margin-top: 100px">
			<div><div class="test999">
			<div class="page-header" style="color: white; font-weight: bold ;"><div class="test888"><h2>參 加 社 團</h2><input type="button" value="123"></div></div>
			
			</div>
			</div>
			<div id="groups" class="row" style="margin-top: 100px; margin-bottom: 200px;">

				<div class="col-md-8 col-md-offset-2"  style="border: 1px solid grey;">
					<h3 style="color: white">Group</h3>
					<table>

						<c:forEach items="${leagueClubs}" var="leagueClubVO" varStatus="status">
							<c:if test="${status.index%5==0}">
								<tr>
							</c:if>
							<s:url value="/spring/club/getClubById" var="searchClub">
								<s:param name="clubId" value="${leagueClubVO.clubId}" />
							</s:url>
							<td style="width: 198px; height: 198px;"><a href="${searchClub}"> <img class="img-circle" style="width: 100px; height: 100px; margin: 0px auto" src="../../image/club/${leagueClubVO.clubVO.clubImageName}"></img></a>
								<div style="width: 160px; height: 31px; text-align: center;">
									<h4>
										<a href="${searchClub}" style="color: white">${leagueClubVO.clubVO.clubName}</a>
									</h4>
									<h6>${status.index%5}</h6>
								</div></td>
							<c:if test="${status.index%5==4}">
								</tr>
							</c:if>
						</c:forEach>

					</table>
				</div>
			</div>
		</div>
	</div>
	<!-- --------------------社團分組------------------------	 -->
</body>
</html>
