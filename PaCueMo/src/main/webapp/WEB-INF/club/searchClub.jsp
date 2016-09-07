<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> <%--use JSTL Standard Syntax--%>
<%@ taglib prefix="s" uri="http://www.springframework.org/tags"%>  <%-- for spring --%> 

<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <style>
	</style>
	<script>
	</script>
  </head>
  <body>
  
   <jsp:include page="/fragment/top.jsp"/>
   <jsp:include page="sidebar.jsp"/>
    <div id="info">
     <c:forEach items="${requestScope.club}" var="club">
     <s:url value="/spring/club/getById" var="searchClub">
     <s:param name="clubId" value="${club.clubID}"/>
     </s:url>
     <h1><a href="${searchClub}"><c:out value="${club.clubName}"/></a></h1>
     <input type="button" value="加入" onclick=""/>
     </c:forEach>
   </div>  
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript">
   $(function(){
    	  $("h1>a").click(function(e){
     		  e.preventDefault();
    		  $.ajax({
    			  url:$(this).attr("href"),
    			  type:'get',
    			  success:function(clubVO){	 
    				  $("#info").text("");
    				  $.each(clubVO.clubmembers,function(index,value){
    				  $("<h1></h1>").text(value.member.memberFirstName).appendTo($("#info"));
    				  });   				  
    			  }
    		  })
    	  }
    	  );
      }
	)   
	</script>
  </body>
  
  
  
</html>
