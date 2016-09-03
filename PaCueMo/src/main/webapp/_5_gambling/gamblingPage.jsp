<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>NBA 運彩專區</title>
	
	 <link rel="stylesheet" type="text/css" href="advertisment/css/demo.css" />
     <link rel="stylesheet" type="text/css" href="advertisment/css/slicebox.css" />
     <link rel="stylesheet" type="text/css" href="advertisment/css/custom.css" />
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"><!-- BOOTSTRAP -->

  </head>
  <body>
  		<jsp:include page="myTop.jsp"/>
<%--        <h1>${battleSetList}</h1> --%>
       <div class="container">
       		<div class="row">
       			<div class="col-md-2"></div>
       			<div class="col-md-8">
<!--        				<div id="myJumbo" class="jumbotron"> -->
	       				<div class="page-header">
								<h2><strong style="font-family:微軟正黑體;font-weight:bolder;color:orange;">GGGGGG${queryDate}</strong></h2>
						</div>
       					<div>
       						<table class="table">
       							<c:forEach var="battleSetVO" items="${battleSetList}" begin="1" end="5">
       								<tr align='center' valign='middle'>
										<td ><img width="150" class="img-rounded" alt="home"   src="<%=request.getContextPath()%>${battleSetVO['home'].teamLogoURL}"></td>
										<td ><img width="70"  					  alt="vs.png" src="<%=request.getContextPath()%>/_5_gambling/image/VS4.gif"></td>
										<td ><img width="150" class="img-rounded" alt="away"   src="<%=request.getContextPath()%>${battleSetVO['away'].teamLogoURL}"></td>
									</tr>
       								<tr align='center' valign='middle'>
										<td><h4 style="font-family:微軟正黑體;font-weight:bolder;color:white;">${battleSetVO['home'].teamName}</h4></td>
										<td><Strong class='glyphicon glyphicon-time' style="padding-right:5px;color:white;">&nbsp;${battleSetVO['battleTime']}</Strong></td>
										<td><h4 style="font-family:微軟正黑體;font-weight:bolder;color:white;">${battleSetVO['away'].teamName}</h4></td>
									</tr>    				
       							</c:forEach>
       						</table>
       					</div>
<!--        				</div> -->
       			</div>
       			<div class="col-md-2"></div>
       		</div>
       </div>
       	
      
       
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
       <script type="text/javascript">
       		$(function(){
       			
     
       		})
       </script>
  </body>
</html>
