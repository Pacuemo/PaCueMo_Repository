<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
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
	<script>
		  <%--insert JScript here--%>
		  <%--<script src=""></script>--%>
	</script>
  </head>
  <body>
      
      <form>
      <input type="text" id="query" name="name"/>
      <input type="button" id="buttonLoad" value="送出"/>
      </form>
      
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
      <script type="text/javascript">
     
      $(function(){
    	  var ctx = "${pageContext.request.contextPath}";
    	  var query=$('#query').val();
    	  $('#buttonLoad').click(function(){	
    		  $.ajax({
    			  url:ctx+'/club/search?name='+$('#query').val(),
    			  type:'get',
    			  success:function(response){
    				  console.log(response);   				  
    			  }
    		  })
    	  }
    	  );
      }
	)     
      </script>
      
  </body>
</html>
