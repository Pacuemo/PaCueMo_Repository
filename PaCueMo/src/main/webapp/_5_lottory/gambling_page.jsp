<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 
<!DOCTYPE html>
<html>
  <head>
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <title>NBA 運彩專區</title>
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"><!-- BOOTSTRAP -->
  </head>
  <body>
	<jsp:include page="myTop.jsp"/>
	
	<div id="carousel-example-generic"class="carousel slide" data-ride="carousel">
	  <!-- Wrapper for slides -->
	  <div class="carousel-inner" role="listbox">
<!-- 	   	<img src="image/NBA_logo.jpg"> -->
<!-- 	   	<img src="image/NBA_logo.jpg"> -->
<!-- 	   	<img src="image/NBA_logo.jpg"> -->
<!-- 	   	<img src="image/NBA_logo.jpg"> -->
	  </div>
	</div>
	
	//自動開始播放的輪播器
	<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
	  //輪播的內容...
	</div>
	
	
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script type="text/javascript">
		$('.carousel').carousel({
		  interval: 2000
		})
	
	</script>
  </body>
</html>



