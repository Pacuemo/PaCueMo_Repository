<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>PaCueMo</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_3_view/css/report.css">
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
	<div id="dialog" title="問題回報">	
		<form method="get">
			<table class="tablesize">
				<tr class="trsize">
					<td class="title">
						<label for="reportType">問題類型</label>
					</td>
					<td class="title">
						<select required="required" id="reportType" name="reportType">
							<option disabled="disabled" selected="selected" class="form-control">請選擇</option>
							<option>場地資訊不符</option>
							<option>其他</option>							
						</select>
					</td>
				</tr>
				<tr class="trsize">
					<td class="title">
						<label for="context">內容描述</label>
					</td>
					<td>
						<textarea required="required" maxlength="500" id="context" class="textsize" name="reportContent"></textarea>
					</td>
				</tr>
			</table>
			<div> 
				<button type="submit" class="button">送出</button>
				<button type="reset" class="button">清除</button>
			</div>
		</form>
	</div>
	<script>
		$(function()
		{
			$("#dialog").dialog({ autoOpen : true, height : 450, width : 600, show : { effect : "blind", duration : 1000 }, position: { my: "center", at: "left+600px top+500px ", of: window  } });
		});
	</script>
</body>
</html>