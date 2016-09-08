<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>
<%@ taglib prefix="sf" uri="http://www.springframework.org/tags/form"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
</style>
</head>
<body>
   <jsp:include page="/fragment/top.jsp"/>
   <jsp:include page="sidebar.jsp"/>
	<sf:form method="post" commandName="clubVO">
            社團名稱:<sf:input path="clubName" /><sf:errors path="clubName"/><br/>         
            社團性質:<sf:select path="clubProp" ><br/>
			   <sf:option value="1">激烈碰撞</sf:option>
			   <sf:option value="2">休閒娛樂</sf:option>
			   <sf:option value="3">額外交流</sf:option>
		    </sf:select>
		<input type="submit" value="Register">
	</sf:form>
</body>
</html>
