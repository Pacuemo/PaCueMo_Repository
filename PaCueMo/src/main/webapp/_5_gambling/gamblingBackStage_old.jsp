<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 
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
	<script>
		  <%--insert JScript here--%>
		  <%--<script src=""></script>--%>
	</script>
  </head>
  <body>
      	<form  action= "<%=request.getContextPath()%>/RESTservices/TimerManager/setAllocateTime" method="POST">
			<input type="text" value="18" name="hour"/>
			<input type="text" value="230" name="min"/>
			<input type="text" value="174" name="sec"/>
			<input type="submit">
		</form>
  </body>
</html>
