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
    .button {
    display: block;
    width: 115px;
    height: 25px;
    background: #4E9CAF;
    padding: 10px;
    text-align: center;
    border-radius: 5px;
    color: white;
    font-weight: bold;
}
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
     <s:url value="/spring/club/apply" var="joinClub">
     <s:param name="club" value="${club.clubID}"/>
     <s:param name="memberId" value="${sessionScope.LoginOK.memberId}"/> 
     </s:url>
     <h1>
     <a href="${searchClub}"><c:out value="${club.clubName}"/></a>
     <a href="${joinClub}" class="button">加入社團</a>
     </h1>
     
     </c:forEach>
   </div>  
   
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
    <script type="text/javascript">
   $(function(){
    	  
// 	------查詢社團---------
	   $("h1 a:first-child").click(function(e){
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
//     	  ------加入社團申請-------
    	  $("h1 a:last-child").click(function(e){
    		  e.preventDefault();
    		  $.ajax({
    			  url:$(this).attr("href"),
    			  type:'get',
    			  success:function(message){
//     	
    				  alert(message.status);
//     				  $("#info").text("");
//     				  $.each(clubVO.clubmembers,function(index,value){
//     				  $("<h1></h1>").text(value.member.memberFirstName).appendTo($("#info"));
//     				  });   				  
    			  }
    		  })
    	  }
    	  );
      }
	)   
	</script>
  </body>
  
  
  
</html>
