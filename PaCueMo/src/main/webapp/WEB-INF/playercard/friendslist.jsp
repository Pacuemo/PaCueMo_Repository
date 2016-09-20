<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>帳戶 - Pacuemo</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/member.css">
</head>
<body>
<jsp:include page="/fragment/top.jsp" />
<jsp:include page="sidebar.jsp" />
<div class="container container-content">
	<div class="row">
		<div class="col-sm-12">
			<div class="content">
				<div class="page-header">
    				<h1>朋友列表</h1>
  				</div>
				<div class="row">
   					<div class="col-sm-12 col-md-12">
	   					<div class="well card friendlist" id="">
		   					<h3 class="text-primary1">好友名單 </h3>
		   					<div class="row">
		   					<div class="col-md-6">
		   					<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
							<c:forEach var="i" begin="0" end="${fn:length(friends.ids)-1}">
							<c:if test="${i%2 == 0}">
								<c:choose>
							        <c:when test="${not empty friends.fbIds[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${friends.fbIds[i]}/picture?width=64&amp;height=64" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty friends.imgs[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${friends.imgs[i]}" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:otherwise>
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${friends.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
      						</c:if>	
							</c:forEach>
							</c:when>
							</c:choose>
							</div>
							<div class="col-md-6">
							<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
							<c:forEach var="i" begin="0" end="${fn:length(friends.ids)-1}">
							<c:if test="${i%2 == 1}">
								<c:choose>
							        <c:when test="${not empty friends.fbIds[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${friends.fbIds[i]}/picture?width=64&amp;height=64" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty friends.imgs[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${friends.imgs[i]}" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:otherwise>
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${friends.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
      						</c:if>	
							</c:forEach>
							</c:when>
							</c:choose>
							</div>
	   				    </div>
	   				    	<c:if test="${fn:length(friends.ids) == 0}">
								<div class="form-group">
								<div class="form-control-static test"><h5>您還尚未擁有好友喔!!!</h5></div>
								</div>
							</c:if>
	   				    </div>								
					 </div>
   				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		</div>
	</div>
</div>
</body>

<c:if test="${fn:length(friends.ids) > 0}">
<script>
	function addlink(){
		var id = $(this).val();
		location.href = "../Playercard?guid="+id;
	};
	
	$(function(){
		$(".form-control-static1.test1.f").bind("click",addlink);
	})
</script>
</c:if>
</html>