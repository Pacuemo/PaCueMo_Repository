<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />
<title>精華收錄</title>
<meta charset="utf-8" />

<link rel="stylesheet" href="assets/css/bootstrap.css">
<link rel="stylesheet" href="assets/css/animate.css">
<link rel="stylesheet" href="assets/css/font-awesome.css">
<link rel="stylesheet" href="assets/css/nexus.css">
<!--     add icon  		-->
<link rel="stylesheet" href="css/style.css">
<link href="https://fonts.googleapis.com/icon?family=Material+Icons" rel="stylesheet">
<!--     add icon  		-->

<script type="text/javascript">
$( function() {
	// team dialog
	    var dialog;
	 
	    dialog = $( "#contact" ).dialog({
	      autoOpen: false,
	      height: 400,
	      width: 350,
	      modal: true,
	      draggable: false,
	      resizable: false,
	    });
	 
	    $( "#add_teammember" ).button().on( "click", function() {
	      dialog.dialog( "open" );
	    });
	    

	// team dialog end    
	    
	// initial end
	  } );
</script>

</head>
<body>

	<div class="col-md-12">
		<h2 class="margin-vert-20"><c:choose><c:when test="requestScope.teamId != null"> ${requestScope.teamId }</c:when><c:otherwise>TeamName !</c:otherwise></c:choose></h2>
		<div class="row margin-bottom-10">
			<div class="col-sm-2 animate fadeInLeft animated">
				<p class="margin-bottom-30"><c:choose>
				<c:when test=""></c:when>
				
				
				</c:choose></p>
				<div class="col-sm-2 col-sm-offset-4 animate fadeIn animated">
					<i class="material-icons" id="add_teammember">add</i>
				</div>
			</div>

			<!-- Person Details -->
			<div class="col-sm-2 person-details margin-bottom-30 fadeIn animated">
				<figure>
					<img src="assets/img/theteam/image1.jpg" alt="image1">
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
					<img src="assets/img/theteam/image2.jpg" alt="image2">
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
					<img src="assets/img/theteam/image3.jpg" alt="image3">
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
					<img src="assets/img/theteam/image3.jpg" alt="image3">
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
					<img src="assets/img/theteam/image3.jpg" alt="image3">
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
			<div class="col-md-6">
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
			<div class="col-md-6">
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
		<hr class="margin-vert-40">
	</div>

</body>
</html>
