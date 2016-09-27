<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>PACUEMO</title>
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />

<jsp:include page="/fragment/top.jsp" />
<style>
	h1.slogan {
    font-size: 70px;
    text-align: left;
    font-style: italic;
    font-weight: 700;
    color: whitesmoke;
    font-family: cursive;
	}
	h1.slogan1 {
    font-size: 70px;
    text-align: right;
    font-style: italic;
    font-weight: 700;
    color: red;
    font-family: cursive;
	}
	.box {
    background-color: rgba(255, 255, 255,0.2);
    border-radius: 20px;
    color:white;
    text-align:center;
    min-width:200px;
    margin-top:10px;
    padding:20px 0px;
  
	}
	.box:hover {
   background-color: rgba(255, 255, 255,0.6);
	}
	img.index {
    display: block;
    max-width: 70%;
    height: auto;
    margin: auto;
    padding: 10px;
	}
</style>
<body>
<div style="background-image:url('image/background/indexBackGround2.jpg');width:100%;height:100%;position:absolute"></div>
<div class="container-fluid" style="background-color:black; min-width:300px">
	<div class="row">
		<div class="col-lg-7" style="margin-top:12%">
			<h1 class="slogan hidden-xs"></h1>
			<h1 class="slogan1 hidden-xs"></h1>
			<br class ="hidden-xs">
			<br class ="hidden-xs">
			<br class ="hidden-xs">
			<br class ="hidden-xs">
			<br class ="hidden-xs">
			<div class="row">
				<div onclick="location.href='${pageContext.request.contextPath}/spring/battle_rec/introduce';" class="col-sm-4 col-xs-12">
				<div class="box" ">
				<img class="index" src="img/EverythingBasketball_Mark_Large_v01.PNG"/>
				<h1>約戰</h1>
				</div>
				</div>
				<div onclick="location.href='${pageContext.request.contextPath}/spring/league/introduce';" class="col-sm-4 col-xs-12">
				<div class="box" >
				<img class="index" src="img/PACUEMO.png"/>
				<h1>聯賽</h1>
				</div>
				</div>
				<div class="col-sm-4 col-xs-12">
				<div onclick="location.href='${pageContext.request.contextPath}/_5_gambling/BattleSet_Servlet.do?action=queryByDate';" class="box" >
				<img class="index" src="img/nba-logo-transparent-png-logo-download.png"/>
				<h1>NBA運彩</h1>
				</div>
				</div>
			</div>
		</div>
		<div class="col-lg-5">
		
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	$('#text').attr('disabled',true);
})

</script>
</body>
</html>