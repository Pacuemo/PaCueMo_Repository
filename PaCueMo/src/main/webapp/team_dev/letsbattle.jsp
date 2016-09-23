<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
<script>
	
<%--insert JScript here--%>
	
<%--<script src=""></script>--%>
	
</script>
</head>
<body>


	<div class="row">
		<div class="col-md-6">
			<table id="table" style="border: 1px solid black;" class="">
				<thead>
					<tr>
						<th>ID</th>
						<th>Name</th>
						<th>Link</th>
						<th>Status</th>
					</tr>
				</thead>
				<tbody style="border: 1px solid black;">
					<tr>
						<td data-title="ID">1</td>
						<td data-title="Name">Material Design Color Palette</td>
						<td data-title="Link"><a href="https://github.com/zavoloklom/material-design-color-palette" target="_blank">GitHub</a></td>
						<td data-title="Status">Completed</td>
					</tr>
				</tbody>
			</table>

		</div>
		<div class="col-md-6">
			<div class="col-md-12">
				<div class="col-md-9"></div>
				<div class="col-md-3">
					<div id="cont_ca9ddef90f63f255a3e37230d88fb6e7">
						<script type="text/javascript" async src="https://www.theweather.com/wid_loader/ca9ddef90f63f255a3e37230d88fb6e7"></script>
					</div>
				</div>
			</div>


		<button id="gg" ></button>
		</div>
	</div>
<script type="text/javascript">
$(function(){

 function myrefresh()
 {
      window.location.reload();
 }
	
 $("#gg").click(function(){
	 
	 setTimeout('myrefresh()',1000); //指定1秒刷新一次
	
 })
	
	
})
</script>
</body>
</html>
