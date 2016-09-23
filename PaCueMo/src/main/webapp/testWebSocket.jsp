<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
	<script>
		var url = 'ws://' + window.location.host + '/PaCueMo/websocket/test';
		var sock = new WebSocket(url);
		
		sock.onopen = function(){
			console.log("Opening");
			sayMarco();
		}
		
		sock.onmessage = function(e){
			console.log("Received message: ", e.data);
			setTimeout(function(){sayMarco()},2000);
		}
		
		sock.onclose = function(){
			console.log("Closing");
		}
		
		function sayMarco(){
			console.log("Sending Marco!");
			sock.send("Marco")
		}
	</script>
  </head>
  <body>
      
  </body>
</html>
