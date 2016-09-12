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

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />

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
			<tr>
				<td data-title="ID">2</td>
				<td data-title="Name">Material Design Iconic Font</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/uqCsB" target="_blank">Codepen</a> <a href="https://github.com/zavoloklom/material-design-iconic-font" target="_blank">GitHub</a></td>
				<td data-title="Status">Completed</td>
			</tr>
			<tr>
				<td data-title="ID">3</td>
				<td data-title="Name">Material Design Hierarchical Display</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/eNaEBM" target="_blank">Codepen</a> <a href="https://github.com/zavoloklom/material-design-hierarchical-display" target="_blank">GitHub</a></td>
				<td data-title="Status">Completed</td>
			</tr>
			<tr>
				<td data-title="ID">4</td>
				<td data-title="Name">Material Design Sidebar</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/dIgco" target="_blank">Codepen</a></td>
				<td data-title="Status">Completed</td>
			</tr>
			<tr>
				<td data-title="ID">5</td>
				<td data-title="Name">Material Design Tiles</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/wtApI" target="_blank">Codepen</a></td>
				<td data-title="Status">Completed</td>
			</tr>
			<tr>
				<td data-title="ID">6</td>
				<td data-title="Name">Material Design Typography</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/IkaFL" target="_blank">Codepen</a> <a href="https://github.com/zavoloklom/material-design-typography" target="_blank">GitHub</a></td>
				<td data-title="Status">Completed</td>
			</tr>
			<tr>
				<td data-title="ID">7</td>
				<td data-title="Name">Material Design Buttons</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/Gubja" target="_blank">Codepen</a></td>
				<td data-title="Status">In progress</td>
			</tr>
			<tr>
				<td data-title="ID">8</td>
				<td data-title="Name">Material Design Form Elements</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/yaozl" target="_blank">Codepen</a></td>
				<td data-title="Status">In progress</td>
			</tr>
			<tr>
				<td data-title="ID">9</td>
				<td data-title="Name">Material Design Email Template</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/qEVqzx" target="_blank">Codepen</a></td>
				<td data-title="Status">Completed</td>
			</tr>
			<tr>
				<td data-title="ID">10</td>
				<td data-title="Name">Material Design Animation Timing (old one)</td>
				<td data-title="Link"><a href="http://codepen.io/zavoloklom/pen/Jbrho" target="_blank">Codepen</a></td>
				<td data-title="Status">Completed</td>
			</tr>
		</tbody>
	</table>

</body>
</html>
