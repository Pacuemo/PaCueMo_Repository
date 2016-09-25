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
	<div class="container">
	<div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingOne">
      <h4 class="panel-title">
        <a data-toggle="collapse" data-parent="#accordion" href="#collapseOne" aria-expanded="true" aria-controls="collapseOne">
          Collapsible Group Item #1
        </a>
      </h4>
    </div>
    <div id="collapseOne" class="panel-collapse collapse in" role="tabpanel" aria-labelledby="headingOne">
      <div class="panel-body">
        
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingTwo">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseTwo" aria-expanded="false" aria-controls="collapseTwo">
          Collapsible Group Item #2
        </a>
      </h4>
    </div>
    <div id="collapseTwo" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingTwo">
      <div class="panel-body">
        
      </div>
    </div>
  </div>
  <div class="panel panel-default">
    <div class="panel-heading" role="tab" id="headingThree">
      <h4 class="panel-title">
        <a class="collapsed" data-toggle="collapse" data-parent="#accordion" href="#collapseThree" aria-expanded="false" aria-controls="collapseThree">
          Collapsible Group Item #3
        </a>
      </h4>
    </div>
    <div id="collapseThree" class="panel-collapse collapse" role="tabpanel" aria-labelledby="headingThree">
      <div class="panel-body">        
      
      </div>
    </div>
  </div>
</div>
</div>
	<script>
// 		$(function()
// 		{
// 			$("#dialog").dialog({ autoOpen : true, height : 450, width : 600, show : { effect : "blind", duration : 100 }, position : { my : "center", at : "left+600px top+500px ", of : window } });
// 		});
	</script>
</body>
</html>