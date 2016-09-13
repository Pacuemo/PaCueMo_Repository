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


	<!-- 	------------------profile div--------------------------- -->
	<div id="profile" style="display: none;">
		<c:if test="${sessionScope.memberId == sessionScope.MyClub.clubHead}">
			<h1>你是團長</h1>
		</c:if>
		<div class="col-lg-6 col-lg-offset-3">
			<h1 class="page-header" style="color:white">
				${sessionScope.MyClub.clubName}
			</h1>
			<table class="col-lg-12">
			<c:forEach items="${sessionScope.MyClub.clubmembers}"  var="clubmemberVO">
				<tr style="border-bottom: 1px solid grey; color:white">
                            <td style="width:25%" ><img class="img-circle" style="width:100px;height:100px;margin-bottom: 30px;margin-top: 30px" src="../../image/member/${clubmemberVO.member.memberImgUrl}" alt=""></td>
                            <td style="width:15%" ><span style="color:#0099cc">姓名</span><br/><br/>${clubmemberVO.member.memberLastName}${clubmemberVO.member.memberFirstName}</td>
                            <td style="width:35%" ><span style="color:#0099cc">E-Mail</span><br/><br/>${clubmemberVO.member.memberMail}</td>
                            <td style="width:25%" ><span style="color:#0099cc">加入日期</span><br/><br/>${clubmemberVO.joinDate}</td>
       
                    <tr>
			</c:forEach>
			</table>
		</div>
	</div>
	<!-- 	------------------profile div--------------------------- -->
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script type="text/javascript">
		$(function()
		{
			$("#btn-profile").click(function(event)
			{
				event.preventDefault();
				$("#profile").attr("style", "display: block;margin-top:5%");
			});
			$("#btn-home").click(function(event)
			            			{
			            				event.preventDefault();
			            				$("#profile").attr("style", "display: none");
			            			});
		})
	</script>
</body>
</html>
