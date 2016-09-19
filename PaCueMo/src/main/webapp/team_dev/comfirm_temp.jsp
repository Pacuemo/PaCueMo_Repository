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

<title>Demo of jquery.confirm with Bootstrap 3</title>

<link href="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/css/bootstrap.min.css" rel="stylesheet">
	<script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script>
	<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.confirm.min.js"></script>
</head>

<body>

	<div class="container">

		<div class="page-header">
			<h1>Demo</h1>
		</div>

		<table class="table">
			<thead>
				<tr>
					<th class="col-lg-3"></th>
					<th class="col-lg-1">Demo</th>
					<th class="col-lg-8">Code</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<td>Simple confirmation (link)</td>
					<td><a id="simpleConfirm" href="https://myclabs.github.io/jquery.confirm/" class="btn btn-primary">Click me</a></td>
					<td><pre>&lt;a id="simpleConfirm" href="" class="btn btn-primary"&gt;Click me&lt;/a&gt;</pre> <pre class="prettyprint">
							<code>$("#simpleConfirm").confirm();</code>
						</pre></td>
				</tr>
				<tr>
					<td>Confirmation dialog customized with JS:</td>
					<td><button class="btn btn-primary" id="complexConfirm">Click me</button></td>
					<td><pre>&lt;button class="btn btn-primary" id="complexConfirm"&gt;Click me&lt;/button&gt;</pre> <pre class="prettyprint">
							<code>$("#complexConfirm").confirm({
    title:"Delete confirmation",
    text:"This is very dangerous, you shouldn't do it! Are you really really sure?",
    confirm: function(button) {
        alert("You just confirmed.");
    },
    cancel: function(button) {
        alert("You aborted the operation.");
    },
    confirmButton: "Yes I am",
    cancelButton: "No"
});</code>
						</pre></td>
				</tr>
				<tr>
					<td>Confirmation dialog customized with "data-" attributes:</td>
					<td><button class="btn btn-primary" id="dataConfirm" data-title="Hello there!" data-confirm-button="Yes I am">Click me</button></td>
					<td><pre>&lt;button class="btn btn-primary" id="dataConfirm"
        data-title="Hello there!" data-confirm-button="Yes I am"&gt;
    Click me
&lt;/button&gt;</pre> <pre class="prettyprint">
							<code>$("#dataConfirm").confirm();</code>
						</pre></td>
				</tr>
				<tr>
					<td>Manual triggering</td>
					<td><button class="btn btn-primary" id="manualTrigger">Click me</button></td>
					<td><pre>&lt;button class="btn btn-primary" id="manualTrigger"&gt;Click me&lt;/button&gt;</pre> <pre class="prettyprint">
							<code>$("#manualTrigger").click(function() {
    $.confirm({
        text: "This is a confirmation dialog manually triggered! Please confirm:",
        confirm: function(button) {
            alert("You just confirmed.");
        },
        cancel: function(button) {
            alert("You cancelled.");
        }
    });
});</code>
						</pre></td>
				</tr>
			</tbody>
		</table>

		<script>
			$("#simpleConfirm").confirm();
			$("#complexConfirm").confirm({ title : "Delete confirmation", text : "This is very dangerous, you shouldn't do it! Are you really really sure?", confirm : function(button)
			{
				button.fadeOut(2000).fadeIn(2000);
				alert("You just confirmed.");
			}, cancel : function(button)
			{
				button.fadeOut(2000).fadeIn(2000);
				alert("You aborted the operation.");
			}, confirmButton : "Yes I am", cancelButton : "No" });
			$("#dataConfirm").confirm();
			$("#manualTrigger").click(function()
			{
				$.confirm({ text : "This is a confirmation dialog manually triggered! Please confirm:", confirm : function()
				{
					alert("You just confirmed.");
				}, cancel : function()
				{
					alert("You cancelled.");
				} });
			});
		</script>

	</div>

	<script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script>
	<script src="https://google-code-prettify.googlecode.com/svn/loader/run_prettify.js"></script>

</body>
</html>
