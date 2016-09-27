<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
 
   <title>PACUEMO League</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
    <style>
		#G {
    color: white;
}
	</style>
	<script>
		  <%--insert JScript here--%>
		  <%--<script src=""></script>--%>
	</script>
  </head>
  <body>
    <jsp:include page="/fragment/top.jsp"/>
   <jsp:include page="sidebar.jsp"/>
<style>
body{
background-image: url('${pageContext.request.contextPath}/image/background/LeagueChampions.jpg');
width:100%;
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
<div class="col-md-2"  style="margin-top: 25%">
<div onclick="location.href='${pageContext.request.contextPath}/spring/league/getLeagueInfos'" class="col-sm-6 col-xs-12">
				<div class="box" >
				<img class="index" src="${pageContext.request.contextPath}/img/PACUEMO.png"/>
				<h1>聯賽</h1>
				</div>
				</div>
						</div>
  </body>
</html>
