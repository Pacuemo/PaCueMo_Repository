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
<title>PACUEMO Club</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
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
	<jsp:include page="MyClubNavBar.jsp" />
<style>
body{
background-image: url('${pageContext.request.contextPath}/image/background/Lin.jpg');
background-size:100%; 
}
</style>
<!-- ----------------社團簡介------------------ -->
	<div class="col-lg-6 col-lg-offset-3" style="margin-top: 100px">
		<table style="width: 100%; background-color: rgba(26, 26, 26,0.8)">
			<tr style="height: 10%">
				<td rowspan="6" style="width: 40%;"><img class="img-rounded" src="../../image/club/${MyClub.clubImageName}" style="with: 200px; height: 200px; margin: 30px auto;" /></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
			<tr style="height: 30%">
				<td colspan="2" style="color: white; font-size: 40px; text-align: center; border-left: 1px solid white">${MyClub.clubName}</td>
				<td></td>
				<td colspan="2" style="color: white; font-size: 15px; text-align: right">成立日期: ${MyClub.clubDate} 
				<s:url value="/spring/club/deleteClubmember" var="deleteClubMember">
						<s:param name="memberId" value="${sessionScope.LoginOK.memberId}" />
						<s:param name="clubHeadId" value="${MyClub.clubHead}" />
						<s:param name="clubId" value="${MyClub.clubID}" />
					</s:url> <a id="deleteClubMember" class="btn btn-default" href="${deleteClubMember}" role="button" style="background-color: #0059b3; font-size: 10px; width: 100px; padding: 10px; min-width: 100px;">退出社團</a></td>
			</tr>
			<tr style="height: 10%">
				<td style="width: 12%; border-left: 1px solid white"></td>
				<td style="width: 12%;"></td>
				<td style="width: 12%;"></td>
				<td style="width: 12%;"></td>
				<td style="width: 12%;"></td>
			</tr>
			<tr style="height: 20%">
				<td style="border-left: 1px solid white"></td>
				<td style="color: white; border-bottom: 1px solid white; font-size: 20px; text-align: center">勝</td>
				<td></td>
				<td style="color: white; border-bottom: 1px solid white; font-size: 20px; text-align: center">負</td>
				<td></td>
			</tr>
			<tr style="height: 20%">
				<td style="border-left: 1px solid white"></td>
				<td style="color: white; font-size: 20px; text-align: center">${MywinCount.win}</td>
				<td></td>
				<td style="color: white; font-size: 20px; text-align: center">${MywinCount.lose}</td>
				<td></td>
			</tr>
			<tr style="height: 10%">
				<td></td>
				<td></td>
				<td></td>
				<td></td>
				<td></td>
			</tr>
		</table>
	</div>
	<!-- ----------------社團簡介------------------ -->
	<!-- 	---------------對戰紀錄-----------		 -->
		<div class="col-md-8  col-lg-offset-2" id="battle" style="display: block">
			<div style="margin-bottom: 100px;margin-top: 100px">
				<h1 class="page-header" style="color: white; font-weight: bold">近期對戰</h1>
			</div>

			<div class="row">
				<c:forEach items="${MyClub.leagueRecordVOs}" var="leagueRecordVO">
					<s:url value="/spring/league/Info/one" var="query">
						<s:param name="fightId" value="${leagueRecordVO.fightId}">
						</s:param>
					</s:url>
					<s:url value="/spring/club/getClubById" var="searchClubA">
						<s:param name="clubId" value="${leagueRecordVO.clubIdA}" />
					</s:url>
					<s:url value="/spring/club/getClubById" var="searchClubB">
						<s:param name="clubId" value="${leagueRecordVO.clubIdB}" />
					</s:url>
					<div class="col-md-12" style="display: block;">
						<table style="width: 100%; border: 1px solid grey; margin-bottom: 30px;background-color: rgba(13, 13, 13,0.6)">
							<tr>
								<td style="width: 15%; background-color: black; color: white; text-align: center; font-size: 20px;padding:0px 3px'">
								<c:choose>
										<c:when test="${leagueRecordVO.winner==ClubVO.clubID}">WIN</c:when>
										<c:when test="${leagueRecordVO.winner==0}">
										<jsp:useBean id="fightDate" class="java.util.Date"/>
										<jsp:setProperty property="time" name="fightDate" value="${leagueRecordVO.fightDateTime.time}"/>
										<fmt:formatDate type="both"  dateStyle="short" timeStyle="short"  value="${fightDate}" />
										</c:when>
										<c:otherwise>LOSE</c:otherwise>
									</c:choose></td>
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
		<!-- 	---------------對戰紀錄-----------		 -->
	<!-- 	------------------profile div--------------------------- -->
	<div id="profile" style="display: none;">
		<div class="col-lg-6 col-lg-offset-3" style="margin-top: 100px">
			<h1 class="page-header" style="color:white">
				社團成員
			</h1>
			<table class="col-lg-12">
			<c:set var="memberNumber"  value="${0}"/>
			<c:forEach items="${sessionScope.MyClub.clubmembers}"  var="clubmemberVO">
				<tr style="border-bottom: 1px solid grey; color:white;background-color: rgba(13, 13, 13,0.6)">
                            <td style="width:25%" ><img class="img-circle" style="width:100px;height:100px;margin-bottom: 30px;margin-top: 30px;margin-left:60px" src="../../image/member/${clubmemberVO.member.memberImgUrl}" alt=""></td>
                            <td style="width:15%" ><span style="color:#0099cc">姓名</span><br/><br/>${clubmemberVO.member.memberLastName}${clubmemberVO.member.memberFirstName}</td>
                            <td style="width:35%" ><span style="color:#0099cc">E-Mail</span><br/><br/>${clubmemberVO.member.memberMail}</td>
                            <td style="width:25%" ><span style="color:#0099cc">加入日期</span><br/><br/>${clubmemberVO.joinDate}</td>
             <c:set var="memberNumber"  value="${memberNumber+1}"/>
                    <tr>
			</c:forEach>
			</table>
		</div>
	</div>
	<!-- 	------------------profile div--------------------------- -->
	<script type="text/javascript">
		$(function()
		{
			$("#btn-profile").click(function(event)
			{
				event.preventDefault();
				$("#profile").attr("style", "display: block;margin-top:5%");
				$("#battle").attr("style", "display: none");
			});
			$("#btn-home").click(function(event)
			            			{
			            				event.preventDefault();
			            				$("#battle").attr("style", "display: block");
			            				$("#profile").attr("style", "display: none");
			            			});

			$("#deleteClubMember").click(function(event)
			         			{
			         				event.preventDefault();
			         				if('${MyClub.clubHead}'!='${LoginOK.memberId}'){
						         				$.ajax({ url : $(this).attr("href"), type : 'get', success : 
							         				      function(message){
			
									         					switch (message.status) {
									         						case 1:
									         							window.location.replace("introduce");		         							
									         							break;
									         						
									         						default:
									         							BootstrapAlert.alert({ title : "Sorry!", message : "退出社團失敗" });
									         					     	break;
									         					}
						         				           }   
						         				})
			         				}
			         				else{
                                               if(${memberNumber}<2){
			                                            	   $.ajax({ url : $(this).attr("href"), type : 'get', success : 
										         				      function(message){
						
												         					switch (message.status) {
												         						case 1:
												         							window.location.replace("introduce");		         							
												         							break;
												         						
												         						default:
												         							BootstrapAlert.alert({ title : "Sorry!", message : "退出社團失敗" });
												         					     	break;
												         					}
									         				           }   
									         				})
                                                  }else{

                                                	  BootstrapAlert.alert({ title : "Sorry!", message : "社團內還有人  解散社團失敗" });

                                                      }
				         				}
			         			});
		});
	</script>
</body>
</html>
