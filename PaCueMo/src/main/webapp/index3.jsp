<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>PaCueMo</title>

<jsp:include page="/fragment/top.jsp" />
<jsp:include page="/fragment/sidebar.jsp" />

<div class="container-fluid">
<div id="carousel1" class="carousel slide" data-ride="carousel">
  <ol class="carousel-indicators">
    <li data-target="#carousel1" data-slide-to="0" class="active"></li>
    <li data-target="#carousel1" data-slide-to="1"></li>
    <li data-target="#carousel1" data-slide-to="2"></li>
  </ol>
  <div class="carousel-inner" role="listbox">
    <div class="item active"><img src="img/Carousel_Placeholder.png" alt="First slide image" class="center-block">
      <div class="carousel-caption">
        <h3>First slide Heading</h3>
        <p>First slide Caption</p>
      </div>
    </div>
    <div class="item"><img src="img/Carousel_Placeholder.png" alt="Second slide image" class="center-block">
      <div class="carousel-caption">
        <h3>Second slide Heading</h3>
        <p>Second slide Caption</p>
      </div>
    </div>
    <div class="item"><img src="img/Carousel_Placeholder.png" alt="Third slide image" class="center-block">
      <div class="carousel-caption">
        <h3>Third slide Heading</h3>
        <p>Third slide Caption</p>
      </div>
    </div>
  </div>
  <a class="left carousel-control" href="#carousel1" role="button" data-slide="prev"><span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span><span class="sr-only">Previous</span></a><a class="right carousel-control" href="#carousel1" role="button" data-slide="next"><span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span><span class="sr-only">Next</span></a></div>
</div>

</body>
</html>