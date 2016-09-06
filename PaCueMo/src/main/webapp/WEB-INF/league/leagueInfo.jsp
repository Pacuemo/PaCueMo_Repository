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
		  #w{color:white;}
	</style>
	<script>
		  <%--insert JScript here--%>
		  <%--<script src=""></script>--%>
	</script>
  </head>
  <body>
    <jsp:include page="/fragment/top.jsp"/>
   <jsp:include page="sidebar.jsp"/>
      <div id="info">
      <c:forEach items="${requestScope.leagues}" var="leagueVO">
      <s:url value="/spring/league/Info" var="query">
      <s:param name="leagueId" value="${leagueVO.leagueID}"/>
      </s:url>
      <h1 id="w"><a href="${query}">${leagueVO.leagueName }</a></h1>
      <h1 id="w">${leagueVO.courtVO.name }</h1>
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
    			  success:function(leagueVO){	 
    				  $("#info").text("");
    				  $.each(leagueVO.leagueClubVOs,function(index,value){
    				  $("<h1></h1>").text(value.clubName).appendTo($("#info"));
    				  }
    				  $.each(leagueVO.leagueRecordVOs,function(index,value){
        				  $("<p></p>").text(value.clubIdA).appendTo($("#info"));
        				  $("<p></p>").text(value.clubIdB).appendTo($("#info"));
        				  }
    				  );   				  
    			  }
    		  })
    	  }
    	  );
      }
	)   
	</script>
  </body>
</html>
