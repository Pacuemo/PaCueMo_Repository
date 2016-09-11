<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<c:url var="home" value="/" scope="request" /> <%--設定home，之後在script可以用--%>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PaCueMo</title>
<meta charset="utf-8" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/nexus.css">
<!--     add icon  		-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/assets/css/icon_style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--     add icon  		-->


<style type="text/css">
tempstyle {
	color: white;
}

p.tempstyle {
	color: white;
	font-size: 18;
	font-family: "微軟正黑體";
}
</style>

<style>
/* NOTE: The styles were added inline because Prefixfree needs access to your styles and they must be inlined if they are on local disk! */
@import url(http://fonts.googleapis.com/css?family=Nunito:300);

/* body { font-family: "Nunito", sans-serif; font-size: 24px; } */
/* a    { text-decoration: none; } */
/* p    { text-align: center; } */
/* sup  { font-size: 36px; font-weight: 100; line-height: 55px; } */
.join_button {
	text-transform: uppercase;
	letter-spacing: 2px;
	text-align: center;
	color: white;
	font-size: 24px;
	font-family: "Nunito", sans-serif;
	font-weight: 300;
	margin: 5em auto;
	position: absolute;
	top: 0;
	right: 0;
	bottom: 0;
	left: 0;
	padding: 0px 0;
	width: 220px;
	height: 40px;
	background: #0D6;
	border: 1px solid #0D6;
	color: #FFF;
	overflow: hidden;
	transition: all 0.5s;
}

.join_button:hover, .join_button:active {
	text-decoration: none;
	color: #0C5;
	border-color: #0C5;
	background: white;
}



.join_button span {
	display: inline-block;
	position: relative;
	padding: 0; padding-right : 0;
	transition: padding-right 0.5s;
	padding-right: 0
}

.join_button span:after {
	content: ' ';
	position: absolute;
	top: 0;
	right: -18px;
	opacity: 0;
	width: 10px;
	height: 10px;
	margin-top: -10px;
	background: rgba(0, 0, 0, 0);
	border: 3px solid #FFF;
	border-top: none;
	border-right: none;
	transition: opacity 0.5s, top 0.5s, right 0.5s;
	transform: rotate(-45deg);

}

.join_button:hover span, .join_button:active span {
	padding-right: 30px;
}

.join_button:hover span:after, .join_button:active span:after {
	transition: opacity 0.5s, top 0.5s, right 0.5s;
	opacity: 1;
	border-color: #0C5;
	right: 0;
	top: 50%;
	

}
.tmimg{
width: 233px;
height: 233px;
}
</style>

</head>
<body>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="fragment/teamSidebar.jsp" />
	
	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script>
	
	<div class="col-md-12">
		<h2 class="margin-vert-20" style="color: white;">
			<c:choose>
				<c:when test="${not empty requestScope.teamVO}"> ${requestScope.teamVO.teamName}</c:when>
				<c:otherwise>TeamName !</c:otherwise>
			</c:choose>

		</h2>
		<div class="row margin-bottom-10" id="show_team_member">
			<div class="col-sm-2 animate fadeInLeft animated">
				<p class="margin-bottom-30 tempstyle">${requestScope.teamVO.content}</p>
				<c:if test="${requestScope.teamExsist != 'Exsist' }">
					<a href="#" class="join_button" id="join_team"> 
					<span>
					
						<c:choose>
							<c:when test="${requestScope.teamVO.teamProp == 0}">加入隊伍</c:when>
							<c:when test="${requestScope.teamVO.teamProp == 1}">申請加入</c:when>
							<c:otherwise>Join</c:otherwise>
						</c:choose>
					</span>
					</a>
				</c:if>
			</div>

			<!-- Person Details -->
			<div class="col-sm-10 animate fadeInLeft animated">
				<c:forEach var="list" items="${requestScope.teamVO.teamMemberVOs}" begin="0" >
				<div class="col-xs-12 col-sm-4 col-md-2 person-details margin-bottom-30 fadeIn animated">
					<figure>
					<c:choose>
						<c:when test="${list.memberVO.memberImgUrl != null}">
							<img class="tmimg" src="${pageContext.request.contextPath }/image/member/${list.memberVO.memberImgUrl }" alt="image1">
						</c:when>
						<c:otherwise>
							<img class="tmimg" src="${pageContext.request.contextPath }/image/member/user.jpg" alt="image1">
						</c:otherwise>
					</c:choose>
						<figcaption>
							<h3 class="margin-top-10 margin-bottom-10">
								${list.memberVO.memberFirstName } <small>- Programmer</small>
							</h3>
							<span>Nullam id dolor id nibh ultricies vehicula ut id elit.</span>
						</figcaption>
						<ul class="list-inline person-details-icons">
							<li><a href="#"> <i class="fa-lg fa-twitter"></i>
							</a></li>
							<li><a href="#"> <i class="fa-lg fa-linkedin"></i>
							</a></li>
							<li><a href="#"> <i class="fa-lg fa-facebook"></i>
							</a></li>
							<li><a href="#"> <i class="fa-lg fa-dribbble"></i>
							</a></li>
							<li><a href="#"> <i class="fa-lg fa-google-plus"></i>
							</a></li>
						</ul>
					</figure>
				</div>
				</c:forEach>
			</div>


		</div>

		<hr class="margin-bottom-30">

		<div class="row">
			<div class="col-md-6" style="color: white">
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Illo, laboriosam, quod odit quo quos itaque repellat quaerat a ad alias. Vel, nostrum id ab velit veritatis consequatur fugit sequi esse. Maecenas congue dui id posuere fermentum.</p>
				<div class="row">
					<div class="col-sm-3">
						<span class="fa-stack fa-2x margin-vert-30 margin-horiz-40 hidden-xs animate fadeInLeft"> <i class="fa fa-circle fa-stack-2x color-gray-light"></i> <i class="fa fa-cogs fa-stack-1x fa-inverse"></i>
						</span>
					</div>
					<div class="col-sm-9">
						<h3 class="margin-vert-10">Pellentesque iaculis</h3>
						<p>Lorem Ipsum is simply dummy text of Lorem the printing and typesettings. Aliquam dictum nulla eu varius porta. Maecenas congue dui id posuere fermentum.</p>
					</div>
				</div>
			</div>
			<div class="col-md-6" style="color: white">
				<!-- Progress Bars -->
				<h3 class="progress-label">
					出席 <span class="pull-right">${requestScope.attendancePercent}%</span>
				</h3>
				<div class="progress progress-sm">
					<div class="progress-bar progress-bar-primary" role="progressbar" style="width: ${requestScope.attendancePercent}%"></div>
				</div>
				<h3 class="progress-label">
					評價 <span class="pull-right">82%</span>
				</h3>
				<div class="progress progress-sm">
					<div class="progress-bar progress-bar-primary" role="progressbar" style="width: 82%"></div>
				</div>
				<h3 class="progress-label">
					勝率 <span class="pull-right">${requestScope.teamWPCT}%</span>
				</h3>
				<div class="progress progress-sm">
					<div class="progress-bar progress-bar-primary" role="progressbar" style="width: ${requestScope.teamWPCT}%"></div>
				</div>
				<!-- End Progress Bars -->
			</div>
		</div>
		<hr class="margin-vert-20">
	</div>
<script type="text/javascript">
$(function (){
	$("#join_team").click(function(){
		
		$.ajax({
			"type":"get",
			"url":"${home}spring/team/joinTeam", // home 在 設定
			"data":{"memberId":"${sessionScope.LoginOK.memberId}",
					"teamId":"${requestScope.teamVO.teamId}"},
			"dataType":"text",
			"success":function(data){
				alert(data);
			},
			"error":function(Error){
				alert("fuck");
				console.log(Error);
			}
		})
	}) // joinTeam End
	
	
	
// End of init
});

</script>
</body>
</html>
