<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>PaCueMo</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/bootstrap.min.css">
<style type="text/css">
.ui-widget {
	z-index: 1000000 !important;
}

.title {
	text-align: center;
	border: 2px solid;
}

.textsize {
	resize: none;
	height: 200px;
	width: 400px;
	font-size: 14px;
	border-radius: 5px;
	margin: 20px;
}

.tablesize {
	height: 300px;
	width: 500px;
	border: 2px solid;
	margin-left: 30px;
}

.button {
	position: relative;
	width: 100px;
	left: 35%;
	margin-top: 10px;
}
</style>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
<!-- 	<div id="dialog" title="問題回報"> -->
<!-- 		<form method="post" action="ReportServlet.do"> -->
<!-- 			<table class="tablesize"> -->
<!-- 				<tr class="trsize"> -->
<!-- 					<td class="title"><label for="reportType">問題類型</label></td> -->
<!-- 					<td class="title"><select required="required" id="reportType" name="reportType"> -->
<!-- 							<option disabled="disabled" selected="selected" class="form-control">請選擇</option> -->
<!-- 							<option>場地資訊不符</option> -->
<!-- 							<option>其他</option> -->
<!-- 					</select></td> -->
<!-- 				</tr> -->
<!-- 				<tr class="trsize"> -->
<!-- 					<td class="title"><label for="context">內容描述</label></td> -->
<!-- 					<td><textarea required="required" maxlength="500" id="context" class="textsize" name="reportContent"></textarea></td> -->
<!-- 				</tr> -->
<!-- 			</table> -->
<!-- 			<div> -->
<!-- 				<input type="submit" class="button" value="送出"> -->
<!-- 				<input type="hidden" name="action" value=""> -->
<!-- 				<input type="reset" class="button" value="清除"> -->
<!-- 			</div> -->
<!-- 		</form> -->
<!-- 	</div> -->
<!-- 	<div id="dialog" title="test"> -->
<!-- 		<div> -->
<!-- 		<ul style="list-style-type: none;"> -->
<!-- 			<li><img alt="" src="image/City.png" id="test1"></li> -->
<!-- 			<li><img alt="" src="image/map.png" id="test2"></li> -->
<!-- 		</ul> -->
<!-- 		</div> -->
<!-- 	</div> -->
<!-- 	<script> -->
// 		$(function()
// 		{
// 			$("#dialog").dialog({ autoOpen : true, height : 550, width : 800, show : { effect : "blind", duration : 100 }, position : { my : "center", at : "left+600px top+500px ", of : window } });
// 		});
		
// 		function addform()
// 		{
// 			$(this).parent().parent().parent().parent().after("<div class='row google'><div class='map'></div></div>");
			
// 		}
<!-- 	</script> -->
</body>
</html>