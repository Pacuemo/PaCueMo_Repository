<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>PaCueMo</title>
<meta charset="utf-8" />

<link rel="stylesheet" href="${pageContext.request.contextPath }/_10_team_page/assets/css/bootstrap.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/_10_team_page/assets/css/animate.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/_10_team_page/assets/css/font-awesome.css">
<link rel="stylesheet" href="${pageContext.request.contextPath }/_10_team_page/assets/css/nexus.css">
<link href="${pageContext.request.contextPath }/_10_team_page/css/jquery-ui.min.css" rel="stylesheet">
<!--     add icon  		-->
<link rel="stylesheet" href="${pageContext.request.contextPath }/_10_team_page/css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--     add icon  		-->
<script src="${pageContext.request.contextPath}/_10_team_page/js/jquery-3.1.0.min.js"></script>
<script src="${pageContext.request.contextPath}/_10_team_page/js/jquery-ui.min.js"></script>
<style type="text/css">
.tempstyle {
	color: white;
}
</style>
</head>
<body>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
	<link rel="stylesheet" href="${pageContext.request.contextPath }/_10_team_page/css/style.css">
	<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">

	<script src="${pageContext.request.contextPath}/_10_team_page/js/jquery-ui.min.js"></script>
	<div class="col-md-12">
		<h2 class="margin-vert-20" style="color: white;">
			<c:choose>
				<c:when test="${not empty requestScope.teamVO}"> ${requestScope.teamVO.teamName}</c:when>
				<c:otherwise>TeamName !</c:otherwise>
			</c:choose>

		</h2>
		<div class="row margin-bottom-10">
			<div class="col-sm-2 animate fadeInLeft animated">
				<p class="margin-bottom-30 tempstyle">${requestScope.teamVO.content}</p>
				<div class="col-sm-2 col-sm-offset-4 animate fadeIn animated">
					<i class="material-icons" id="add_teammember">add</i>
				</div>
			</div>

			<!-- Person Details -->
			<div class="col-sm-2 person-details margin-bottom-30 fadeIn animated">
				<figure>
					<img src="${pageContext.request.contextPath }/_10_team_page/assets/img/theteam/image1.jpg" alt="image1">
					<figcaption>
						<h3 class="margin-bottom-10">
							April <small>- Programmer</small>
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
			<!-- //Portfolio Item// -->
			<!-- Person Details -->
			<div class="col-sm-2 person-details margin-bottom-30 fadeIn animated">
				<figure>
					<img src="${pageContext.request.contextPath }/_10_team_page/assets/img/theteam/image2.jpg" alt="image2">
					<figcaption>
						<h3 class="margin-bottom-10">
							Simon <small>- Sales Assistant</small>
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
			<!-- //Portfolio Item// -->
			<!-- Person Details -->
			<div class="col-sm-2 person-details margin-bottom-30 fadeIn animated">
				<figure>
					<img src="${pageContext.request.contextPath }/_10_team_page/assets/img/theteam/image3.jpg" alt="image3">
					<figcaption>
						<h3 class="margin-bottom-10">
							Jeff <small>- Support</small>
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
			<div class="col-sm-2 person-details margin-bottom-30 fadeIn animated">
				<figure>
					<img src="${pageContext.request.contextPath }/_10_team_page/assets/img/theteam/image3.jpg" alt="image3">
					<figcaption>
						<h3 class="margin-bottom-10">
							Jeff <small>- Support</small>
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
			<div class="col-sm-2 person-details margin-bottom-30 fadeIn animated">
				<figure>
					<img src="${pageContext.request.contextPath }/_10_team_page/assets/img/theteam/image3.jpg" alt="image3">
					<figcaption>
						<h3 class="margin-bottom-10">
							Jeff <small>- Support</small>
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
			<!-- //Portfolio Item// -->


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
					出席 <span class="pull-right">92%</span>
				</h3>
				<div class="progress progress-sm">
					<div class="progress-bar progress-bar-primary" role="progressbar" style="width: 90%"></div>
				</div>
				<h3 class="progress-label">
					評價 <span class="pull-right">82%</span>
				</h3>
				<div class="progress progress-sm">
					<div class="progress-bar progress-bar-primary" role="progressbar" style="width: 82%"></div>
				</div>
				<h3 class="progress-label">
					勝率 <span class="pull-right">74%</span>
				</h3>
				<div class="progress progress-sm">
					<div class="progress-bar progress-bar-primary" role="progressbar" style="width: 74%"></div>
				</div>
				<!-- End Progress Bars -->
			</div>
		</div>
		<hr class="margin-vert-20">
	</div>


	<!-- dialog -->
	<form id="contact" title="建立新隊伍" action="${pageContext.request.contextPath}/TeamServlet" method="post">
		<!--             <div class="tm_title"> -->
		<!--                 <h3>建立新隊伍</h3> -->
		<!--             </div>  oninvalid="setCustomValidity('不能为空')" oninput="setCustomValidity('')"-->
		<fieldset>
			<input placeholder="隊伍名稱" id="teamName" name="teamName" type="text" tabindex="1" required maxlength="10" autofocus pattern=".{2,}">
		</fieldset>
		<fieldset>
			<input placeholder="輸入隊員姓名或電子郵件" name="" type="text" tabindex="2">
		</fieldset>
		<fieldset>
			<div class="div_pri_tm">
				<label class="" for="privacy_1"> <span class=""> <input type="radio" id="privacy_1" name="teamProp" value="0" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="${pageContext.request.contextPath}/_10_team_page/assets/images/public.png" alt="" width="16" height="16"> <span>公開</span>
				</span>
					<div class="descrip" id="">所有人都可以自由加入這個隊伍。</div>
				</label>
			</div>
			<div class="div_pri_tm">
				<label class="" for="privacy_2"> <span class=""> <input type="radio" id="privacy_2" name="teamProp" value="1" checked="checked" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="${pageContext.request.contextPath}/_10_team_page/assets/images/protect.png" alt="" width="16" height="16"> <span>需申請</span>
				</span>
					<div class="descrip" id="">所有人都可以申請加入這個隊伍。</div>
				</label>
			</div>
			<div class="div_pri_tm">
				<label class="" for="privacy_3"> <span class=""> <input type="radio" id="privacy_3" name="teamProp" value="2" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="${pageContext.request.contextPath}/_10_team_page/assets/images/private.png" alt="" width="16" height="16"> <span>私密</span>
				</span>
					<div class="descrip" id="">只有被邀請的成員才可以加入這個隊伍。</div>
				</label>
			</div>
		</fieldset>
		<fieldset>
			<button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
		</fieldset>
	</form>
	<!-- dialog -->

	<script>
		// initial start
		$(function()
		{
			// team dialog
			var dialog;

			dialog = $("#contact").dialog({ autoOpen : false, height : 400, width : 350, modal : true, draggable : false, resizable : false, });

			//新增事件
			$("#add_teammember").button().on("click", function()
			{
				dialog.dialog("open");
			});

			// team dialog end    

			// initial end
		});
	</script>

</body>
</html>
