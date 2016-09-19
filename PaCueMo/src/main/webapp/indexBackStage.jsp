<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
		  <%--insert css here--%>
		  <%--@import url('');--%>
	</style>
  	
  	<c:url var="home" value="/"></c:url>
  	
    <script language="javascript">
        window.location.href = "${home}_99_backstage/pages/index.jsp";
    </script>
  </head>
  <body>
	    Go to <a href="${home}/_99_backstage/pages/index.jsp">/pages/index.html</a>
  </body>
</html>
