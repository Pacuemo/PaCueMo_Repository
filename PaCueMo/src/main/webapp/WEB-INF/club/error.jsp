﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
<%--<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>--%> <%-- for Spring --%> 
<%--<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form" %>--%> <%-- for Spring Form --%> 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>PACUEMO Club</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
    <style>
		  <%--insert css here--%>
		  <%--@import url('');--%>
	</style>
	<script>
		  <%--insert JScript here--%>
		  <%--<script src=""></script>--%>
	</script>
  </head>
  <body>
    <jsp:include page="/fragment/top.jsp"/>
    <jsp:include page="sidebar.jsp"/>
      <h1>註冊失敗</h1>
  </body>
</html>
