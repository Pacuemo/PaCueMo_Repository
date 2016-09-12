<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
  </head>
  <body>
  <jsp:include page="/fragment/top.jsp" />
  <jsp:include page="/_03_member/fragment/sidebar.jsp" />
	<div class="container-fluid container-content">
		<div class="row">
			<div class="col-sm-12">
				<div class="content">
					<div class="page-header">
	    				<h1>我的球員卡</h1>
	  				</div>
					<div class="row">
	   					<div class="col-sm-12 col-md-4">
		   					<div class="well card profile" id="">
			   					<h3 class="text-primary1">個人檔案</h3>
			   					<form role="form">
			   						<div class="form-group">
			   					 		<label class="control-label">Email</label>
			   					 		<p class="form-control-static" id="card-profile-email">${LoginOK.memberMail}</p>
			   					 	</div>
			   					 	<div class="form-group">
			   					 		<label class="control-label">出生日期</label>
			   							<p class="form-control-static" id="card-profile-dob">${LoginOK.memberBirthday}</p>
			   					 	</div>
			   						<div class="form-group">
			   					 		<label class="control-label">行動電話</label>
			   					 		<p class="form-control-static" id="card-profile-country">${LoginOK.memberPhone}</p>
			   					 	</div>
			   					 	<div class="form-group">
			   					 		<label class="control-label">點數餘額</label>
			   					 		<p class="form-control-static" id="card-profile-postalcode">${LoginOK.memberPoint}點</p>
			   					 	</div>
			   					 </form>
								 <a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-edit-profile">編輯個人檔案</a>
		   				    </div>
		   				    <div class="well card receipt" id="">
								<h3 class="text-primary1">帳戶明細</h3>
							</div>	
						 </div>
						 <div class="col-sm-12 col-md-4">
								<div class="well card profile" id="">
									<h3 class="text-primary1">更改密碼</h3>
									<br>	
									<a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-edit-profile">更改密碼</a>
								</div>
								<div class="well card profile" id="">
									<h3 class="text-primary1">兩階段驗證狀態</h3>	
									<c:choose>
										<c:when test="${LoginOK.member2StepVerify == false}">
										<h5 style="color:#eb1e32">關閉中</h5>
										<a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-act-2step">開啟兩階段驗證</a>
										</c:when>
										<c:otherwise>
										<h5 style="color:##1ed760">開啟中</h5>
										<a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-deact-2step">關閉兩階段驗證</a>
										<div style="display: none">
										<div id="dialog-confirm" title="是否關閉兩階段驗證?">
	  									<p><span class="ui-icon ui-icon-alert" style="float:left; margin:12px 12px 20px 0;"></span>兩階段驗證將被關閉，將使您的帳號安全性降低，您確定要關閉?</p>
										</div>
										</div>
										</c:otherwise>
									</c:choose>
								</div>
								<div class="well card profile" id="">
								<h3 class="text-primary1">臉書帳號連結狀態</h3>
								<c:choose>
									<c:when test="${not empty LoginOK.memberFBId }">
									<h5 style="color:#1ed760">連結中</h5>
									</c:when>
									<c:otherwise>
									<h5 style="color:#eb1e32">尚未連結</h5>
									<button class="btn btn-secondary btn-sm btn-block center-block" id="btn-fb-connect">連結臉書帳號</button>
									</c:otherwise>
								</c:choose>
								</div>							
						 </div>
						 <div class="col-sm-12 col-md-4">
						 	<div class="well card friendlist" id="">
								<h3 class="text-primary1">好友名單</h3>
								${friends.ids[0]}
							</div>	
						 </div>
	   				</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-sm-12">
			</div>
		</div>
	</div>
  </body>
</html>
