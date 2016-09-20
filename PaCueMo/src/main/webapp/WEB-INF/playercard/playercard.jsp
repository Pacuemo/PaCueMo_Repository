<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>${Info.memberLastName}${Info.memberFirstName}的個人小檔案</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/member.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/playercardfriend.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
    <style>
    .ui-widget {
   		z-index:1000000 !important; /* The default is 100. !important overrides the default. */
	}	
    </style>
  </head>
  <body>
  <jsp:include page="/fragment/top.jsp" />
  <jsp:include page="sidebar.jsp" />
  <c:if test="${Info.memberHaveCard == true }">
  <div class="container container-content1">
		<div class="row">
			<div class="col-sm-12">
			<div class="content">
				<div class="page-header">
	    			<h1 class="title">${Info.memberLastName}${Info.memberFirstName}的個人小檔案</h1>
<!-- 	    			<button class="btn btn-secondary btn-sm btn-block center-block update" id="btn-update-playercard">修改球員卡</button> -->
	  			</div>
				<div class="row">
				    <div class="col-sm-12 col-md-12">
	   					<div class="row">
	   					<div class="col-sm-12 col-sm-6">
	   					<div class="well card profile" id="">
	   						<div class="playercard">
	   						<font class="name">${Info.memberLastName}${Info.memberFirstName}</font>
	   						<br>
	   						<font class="dob">生日： ${Info.memberBirthday}</font>
	   						<br>
	   						<font class="location">活動地區： ${Playercard.playerLocation}</font>
	   						<br>
	   						</div>
	   						<c:choose>
						        <c:when test="${not empty Info.memberFBId }">
						        <div class="user-link"> <img class="user-img img-circle" src="https://graph.facebook.com/${LoginOK.memberFBId }/picture?width=80&amp;height=80" alt="${Info.memberFirstName}"> </div>
						        </c:when>
						        <c:when test="${not empty Info.memberImgUrl }">
						        <div class="user-link"> <img class="user-img img-circle" style="height:80px;width:80px" src="${pageContext.request.contextPath}/image/member/${Info.memberImgUrl}" alt="${Info.memberFirstName}"></div>
						        </c:when>
						        <c:otherwise>
						        <div class="user-link"> <div class="user-icon-container img-circle navbar-user-img" style="height:80px;width:80px;color:green;margin: 0"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use> </svg></div></div>
						        </c:otherwise>
						    </c:choose>
						    <div class="info">
							<span class="position"> ${Playercard.playerPosition}</span>
							<span class="height">${Playercard.playerHeight}</span>
							<span class="weight">${Playercard.playerWeight}</span>
							<c:if test="${Playercard.playerHand == true}">
							<span class="hand">Left</span>
							</c:if>
							<c:if test="${Playercard.playerHand == false}">
							<span class="hand">Right</span>
							</c:if>
							<span class="note">${Playercard.playerNote}</span>
							</div>
						    <div id="container"></div>
	   					</div>
	   					</div>
	   					<div class="col-sm-12 col-sm-6">
	   						<div class="well card profile" id="">
							<h3 class="text-primary1">好友狀態</h3>
							<c:choose>
								<c:when test="${Status == '1'}">
								<h5 style="color:#1ed760">您們已經是好友了喔!!!</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-delete-friend" value="${Info.memberId }">解除好友關係</button>
								</c:when>
								<c:when test="${Status == '2'}">
								<h5 style="color:#1ed760">等待請求同意</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-invited" value="${Info.memberId }">同意請求</button>
								</c:when>
								<c:when test="${Status == '3'}">
								<h5 style="color:#eb1e32">邀請中</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-inviting" value="${Info.memberId }">取消邀請</button>
								</c:when>
								<c:otherwise>
								<h5 style="color:#eb1e32">你們還不是好友喔!!!</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-invite" value="${Info.memberId }">邀請成為好友</button>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="well card friendlist" id="">
							<h3 class="text-primary1">好友</h3>
							<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
							<c:forEach var="i" begin="0" end="5">
								<c:choose>
							        <c:when test="${not empty friends.fbIds[i]}">
							        <div class="form-group">
							        <button class="form-control-static1 test" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${friends.fbIds[i]}/picture?width=64&amp;height=64" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty friends.imgs[i]}">
							        <div class="form-group">
							        <button class="form-control-static1 test" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${friends.imgs[i]}" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${i >= fn:length(friends.ids)}">
							        </c:when>
							        <c:otherwise>
							        <div class="form-group">
							        <button class="form-control-static1 test" value="${friends.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${friends.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
							</c:forEach>
								<c:if test="${fn:length(friends.ids) > 5 }">
								<div class="form-group">
								<a class="btn btn-secondary btn-sm btn-block center-block" id="btn-friendslist" href="${pageContext.request.contextPath}/spring/playercard/Playercard/friends?guid=${Info.memberId}">進入好友列表</a>
								</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<div class="form-group">
								<div class="form-control-static test"><h5>尚未擁有好友喔!!!</h5></div>
								</div>
							</c:otherwise>
							</c:choose>
						</div>
	   					</div>
	   					</div>
					</div>
	   			</div>
	   		</div>
		</div>
		</div>
	</div>
	</c:if>
	<c:if test="${Info.memberHaveCard == false }">
	<div class="container container-content1">
		<div class="row">
			<div class="col-sm-12">
			<div class="content">
				<div class="page-header">
	    			<h1 class="title">${Info.memberLastName}${Info.memberFirstName}的個人小檔案</h1>
	  			</div>
				<div class="row">
				    <div class="col-sm-12 col-md-12">
	   					<div class="row">
	   					<div class="col-sm-12 col-sm-6">
	   					<div class="well card profile" style="height:200px" id="">
	   						<div class="playercard">
	   						<font class="name">${Info.memberLastName}${Info.memberFirstName}</font>
	   						<br>
	   						<font class="dob">生日： ${Info.memberBirthday}</font>
	   						<br>
	   						<font class="location" style="opacity: 0;">活動地區：</font>
	   						<br>
	   						</div>
	   						<c:choose>
						        <c:when test="${not empty Info.memberFBId }">
						        <div class="user-link"> <img class="user-img img-circle" src="https://graph.facebook.com/${LoginOK.memberFBId }/picture?width=80&amp;height=80" alt="${Info.memberFirstName}"> </div>
						        </c:when>
						        <c:when test="${not empty Info.memberImgUrl }">
						        <div class="user-link"> <img class="user-img img-circle" style="height:80px;width:80px" src="${pageContext.request.contextPath}/image/member/${Info.memberImgUrl}" alt="${Info.memberFirstName}"></div>
						        </c:when>
						        <c:otherwise>
						        <div class="user-link"> <div class="user-icon-container img-circle navbar-user-img" style="height:80px;width:80px;color:green;margin: 0"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use> </svg></div></div>
						        </c:otherwise>
						    </c:choose>
	   					</div>
	   					<div class="well card profile" style="height:200px" id="">
	   						<h1 style="text-align: center;color: red;">他還沒有球員卡喔!!!</h1>
	   					</div>
	   					</div>
	   					<div class="col-sm-12 col-sm-6">
	   						<div class="well card profile" id="">
							<h3 class="text-primary1">好友狀態</h3>
							<c:choose>
								<c:when test="${Status == '1'}">
								<h5 style="color:#1ed760">您們已經是好友了喔!!!</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-delete-friend" value="${Info.memberId }">解除好友關係</button>
								</c:when>
								<c:when test="${Status == '2'}">
								<h5 style="color:#1ed760">等待請求同意</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-invited" value="${Info.memberId }">同意請求</button>
								</c:when>
								<c:when test="${Status == '3'}">
								<h5 style="color:#eb1e32">邀請中</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-inviting" value="${Info.memberId }">取消邀請</button>
								</c:when>
								<c:otherwise>
								<h5 style="color:#eb1e32">你們還不是好友喔!!!</h5>
								<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-invite" value="${Info.memberId }">邀請成為好友</button>
								</c:otherwise>
							</c:choose>
							</div>
							<div class="well card friendlist" id="">
							<h3 class="text-primary1">好友</h3>
							<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
							<c:forEach var="i" begin="0" end="5">
								<c:choose>
							        <c:when test="${not empty friends.fbIds[i]}">
							        <div class="form-group">
							        <button class="form-control-static1 test" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${friends.fbIds[i]}/picture?width=64&amp;height=64" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty friends.imgs[i]}">
							        <div class="form-group">
							        <button class="form-control-static1 test" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${friends.imgs[i]}" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${i >= fn:length(friends.ids)}">
							        </c:when>
							        <c:otherwise>
							        <div class="form-group">
							        <button class="form-control-static1 test" value="${friends.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${friends.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
							</c:forEach>
								<c:if test="${fn:length(friends.ids) > 5 }">
								<div class="form-group">
								<a class="btn btn-secondary btn-sm btn-block center-block" id="btn-friendslist" href="${pageContext.request.contextPath}/spring/playercard/Playercard/friends?guid=${Info.memberId}">進入好友列表</a>
								</div>
								</c:if>
							</c:when>
							<c:otherwise>
								<div class="form-group">
								<div class="form-control-static test"><h5>尚未擁有好友喔!!!</h5></div>
								</div>
							</c:otherwise>
							</c:choose>
						</div>
	   					</div>
	   					</div>
					</div>
	   			</div>
	   		</div>
		</div>
		</div>
	</div>
	</c:if>
	<c:if test="${Info.memberHaveCard == true }">
	<script src="${pageContext.request.contextPath}/js/highcharts.js"></script> 
	<script src="${pageContext.request.contextPath}/js/highcharts-more.js"></script> 
	<script>
	$(function () {
	    $('#container').highcharts({

	        chart: {
	            polar: true,
	            type: 'area',
	            backgroundColor:null
	        },

	        title: {
	            text: null,
	            x: -80
	        },

	        pane: {
	            size: '80%'
	        },

	        xAxis: {
	            categories: ['力量', '體力', '敏捷', '智力','感知', '魅力'],
	            tickmarkPlacement: 'off',
	            lineColor: '#d0d0d0',
	            lineWidth: 0
	        },

	        yAxis: {
	            gridLineInterpolation: 'polygon',
	            lineWidth: 0,
	            min: 0,
	            lineColor: '#d0d0d0',
	            labels: {
	                enabled: false
	            },
	        },

	        tooltip: {
	        		enabled: false,
	        },

			exporting:{
					enabled: false,
			},
	        
	        legend: {
	            enabled: false
	        },

	        series: [{
	            data: [${Playercard.playerSTR}, ${Playercard.playerCON}, ${Playercard.playerDEX}, ${Playercard.playerINT}, ${Playercard.playerWIS}, ${Playercard.playerCHA}],
	            enableMouseTracking: false,
	            color: '#FF2D2D',
	        }],
	        
	        plotOptions: {
	   			area: {
	       			marker: {
	            		enabled: false
	        		}
	   			 }
			}		

	    });
	});
	</script>
	</c:if>
	<script type="text/javascript">
	$(function(){
		$(".form-control-static1.test").bind("click",function(){
			var guid = $(this).val();
			location.href = "Playercard?guid="+guid;
		})	
		$("#btn-invite").bind("click",function(){
			var guid = $(this).val();
			location.href = "Playercard/friends/invite?guid="+guid;
		})	
		
		$("#btn-inviting").bind("click",function(){
			var guid = $(this).val();
			location.href = "Playercard/friends/cancel?guid="+guid;
		})	
		
		$("#btn-invited").bind("click",function(){
			var guid = $(this).val();
			location.href = "Playercard/friends/agree?guid="+guid;
		})	
		
		$("#btn-delete-friend").bind("click",function(){
			var guid = $(this).val();
			location.href = "Playercard/friends/delete?guid="+guid;
		})	
	})
	</script>
  </body>
</html>
