<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<c:url var="home" value="/" scope="request" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.color_w {
	color: white;
}

.teamName {
	font-size: 36px;
	margin:0px;
	color: white;
}

.margin_form {
	margin: 15px;
}
</style>
<script>
	
</script>
</head>
<body>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />

	<div class="row">
		<div class="col-md-2">
			<form style="margin: 0px auto;" name="myData" action="Index.jsp" method="get">
				<div class="form-group">
					<input type="text" class="form-control" id="txtSearch" name="keyword" autocomplete="off">
					<!-- 				    <input type="submit" -->
					<!-- 						value="送出" class="btn btn-default btn-xs"> -->
				</div>
			</form>
			<div id="div1"></div>
		</div>
		<div class="col-md-8">
			<form class="form-horizontal margin_form">

				<div class="form-group">
					<h2 class="col-sm-3 col-md-2 control-label teamName color_w">約戰方：</h2>
					<div class="col-sm-3 col-md-4">
						<select id="select_teamB" class="form-control" style="margin: 7px;">
							<option>老師說的隊</option>
						</select>
					</div>



					<c:choose>
						<c:when test="">
							<label class="col-sm-3 col-md-2 control-label teamName color_w">挑戰方：</label>
							<div class="col-md-3">
								<select id="select_teamB" class="form-control" style="margin: 7px;"></select>
							</div>
						</c:when>
						<c:when test="">						
							<label class="col-sm-3 col-md-2 control-label teamName color_w">地點：</label>
							<div class="col-sm-3 col-md-4">
								<h2 >11</h2>
							</div>
							</c:when>
						<c:otherwise>
							<h2 class="col-sm-3 col-md-2 control-label teamName color_w">挑戰方：</h2>
							<div class="col-sm-3 col-md-4">
								<h2 class="teamName">11</h2>
							</div>
						</c:otherwise>
					</c:choose>


				</div>
				<div class="form-group">
					<div class="col-sm-2"><label class="col-sm-2" for="address">地址：</label></div>
				 
					<input class="form-control" id="address" placeholder="地址"> 
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input class="form-control" id="exampleInputPassword1" placeholder="Password">
				</div>
				<div class="form-group">
					<label for="exampleInputFile">File input</label> <input type="file" id="exampleInputFile">
					<p class="help-block">Example block-level help text here.</p>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Check me out
					</label>
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>

		</div>
		<div class="col-md-2">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<div id="cont_ca9ddef90f63f255a3e37230d88fb6e7">
					<script type="text/javascript" async src="https://www.theweather.com/wid_loader/ca9ddef90f63f255a3e37230d88fb6e7"></script>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
	$( function() {
	 	var datas;
	 	var availableTags = [
	 	                    "ActionScript",
	 	                    "AppleScript",
	 	                    "Asp",
	 	                    "BASIC",
	 	                    "C",
	 	                    "C++",
	 	                    "Clojure",
	 	                    "COBOL",
	 	                    "ColdFusion",
	 	                    "Erlang",
	 	                    "Fortran",
	 	                    "Groovy",
	 	                    "Haskell",
	 	                    "Java",
	 	                    "JavaScript",
	 	                    "Lisp",
	 	                    "Perl",
	 	                    "PHP",
	 	                    "Python",
	 	                    "Ruby",
	 	                    "Scala",
	 	                    "Scheme"
	 	                  ];
	 	 $( "#address" ).keyup( function ()
		{
	 	$.ajax({
	 		"type":"get",
	 		"url" : "${home}spring/battle_rec/getCourtVOs",
	 		"data" : {"address" : $(this).val() },
	 		"dataType":"json",
	 		"success":function(data){
	 			
	 			$("#address").autocomplete( "option", "source", availableTags  );
	 		}
	 	});
	 
		});
		
		
	    $( "#address" ).autocomplete({
	      source: availableTags
	    });
	    
	  });
	</script>
</body>
</html>
