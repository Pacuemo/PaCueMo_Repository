<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script> 
    <script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script> 
    <script src="${pageContext.request.contextPath}/js/stomp.min.js"></script> 
	<script>
		var url = 'http://' + window.location.host + '/PaCueMo/spring/marcopolo/';
		var sock = new SockJS(url);
		var stomp = Stomp.over(sock);
		var payload = JSON.stringify({"message":"Marco!"});
		
		stomp.connect("123","123",function(){
// 			stomp.subscribe("/app/marco",function(incoming){
// 				var test = JSON.parse(incoming.body);
// 				console.log(test);
// 			});

// 			stomp.send("/app/marco",{},payload);
			stomp.send("/app/marco",{},"fuck");
			stomp.subscribe("/topic/shout",function(incoming){
				var test = JSON.parse(incoming.body);
				console.log(test);
			});
			stomp.subscribe("/queue/test",function(incoming){
				
				console.log(incoming);
			});
		})
		
	</script>
  </head>
  <body>
      
  </body>
</html>
