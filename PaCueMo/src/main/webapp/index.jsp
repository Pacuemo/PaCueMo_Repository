<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>Pacuemo</title>

<jsp:include page="/fragment/top.jsp" />
<jsp:include page="/fragment/sidebar.jsp" />
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
    height: 350px;
    background-color: dimgrey;
    border-radius: 20px;
    color:white;
    text-align:center;
	}
	.box:hover {
    background-color: slategrey;
    color:blue;
	}
	img.index {
    display: block;
    max-width: 90%;
    height: auto;
    margin: auto;
    padding: 10px;
	}
</style>
<body>
<div style="background-image:url('img/388829-basketball-wallpaper.jpg');width:100%;height:100%;position:absolute"></div>
<div class="container-fluid">
	<div class="row">
		<div class="col-sm-6">
			<h1 class="slogan">WE WANT YOU!</h1>
			<h1 class="slogan1">JOIN US NOW!</h1>
			<br>
			<br>
			<br>
			<br>
			<br>
			<div class="row">
				<div onclick="location.href='${pageContext.request.contextPath}/spring/battle_rec/introduce';" class="col-sm-4">
				<div class="box">
				<img class="index" src="img/EverythingBasketball_Mark_Large_v01.PNG"/>
				<h1>約戰</h1>
				</div>
				</div>
				<div onclick="location.href='${pageContext.request.contextPath}/spring/league/introduce';" class="col-sm-4">
				<div class="box">
				<img class="index" src="img/PACUEMO.png"/>
				<h1>PACUEMO聯賽</h1>
				</div>
				</div>
				<div class="col-sm-4">
				<div onclick="location.href='${pageContext.request.contextPath}/_5_gambling/BattleSet_Servlet.do?action=queryByDate';" class="box">
				<img class="index" src="img/nba-logo-transparent-png-logo-download.png"/>
				<h1>NBA運彩</h1>
				</div>
				</div>
			</div>
		</div>
		<div class="col-sm-6">
		
		</div>
	</div>
</div>
</body>
</html>