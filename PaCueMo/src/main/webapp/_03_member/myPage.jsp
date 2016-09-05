<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>帳戶 - Pacuemo</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/member.css">
</head>
<body>
<jsp:include page="/fragment/top.jsp" />
<jsp:include page="/_03_member/fragment/sidebar.jsp" />
<div class="container-test container-content">
	<div class="row">
		<div class="col-xs-12 col-sm-12">
			<div class="content">
				<div class="page-header">
    				<h1>帳戶概覽</h1>
  				</div>
  				<div class="row">
   					 <div class="col-md-5">
   					 <div class="well card profile" id="">
   					 <h3 class="text-primary">個人檔案</h3>
   					 <div class="row">
   					 <div class="col-md-7">
   					 <form role="form">
   					 <div class="form-group">
   					 <label class="control-label">Email</label>
   					 <p class="form-control-static" id="card-profile-email">tw11509@gmail.com</p>
   					 </div><div class="form-group">
   					 <label class="control-label">出生日期</label>
   					 <p class="form-control-static" id="card-profile-dob">1992/8/6</p>
   					 </div>
   					 <div class="form-group">
   					 <label class="control-label">所在國家</label>
   					 <p class="form-control-static" id="card-profile-country">TW</p>
   					 </div><div class="form-group">
   					 <label class="control-label">郵遞區號</label>
   					 <p class="form-control-static" id="card-profile-postalcode"></p>
   					 </div>
   					 </form>
   					 </div>
   					 <div class="col-md-5">
   					 <c:choose>
				        <c:when test="${not empty LoginOK.memberFBId }">
				        <a href="" class="user-link"> <img class="user-img img-circle navbar-user-img" src="https://graph.facebook.com/${LoginOK.memberFBId }/picture?width=64&amp;height=64" alt="${LoginOK.memberFirstName}"> </a>
				        </c:when>
				        <c:when test="${not empty LoginOK.memberFileName }">
				        <a href="" class="user-link"> <img class="user-img img-circle navbar-user-img" src="${pageContext.request.contextPath}/image/member/${LoginOK.memberFileName}" alt="${LoginOK.memberFirstName}"></a>
				        </c:when>
				        <c:otherwise>
				        <a href="" class="user-link"> <div class="user-icon-container img-circle navbar-user-img"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use> </svg></div></a>
				        </c:otherwise>
      				</c:choose>
   					 </div>
   					 </div>
   					 <a href="/tw/account/profile/" class="btn btn-secondary btn-sm btn-block center-block" id="btn-edit-profile">編輯個人檔案</a>
   					 </div>

    				 </div>	 
    				 <div class="col-md-7"> 
    				 </div>
  				</div>
			</div>
		</div>	
	</div>
</div>
</body>
</html>