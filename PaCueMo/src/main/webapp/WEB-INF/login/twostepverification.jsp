<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
<title>Pacuemo帳號</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">

</head>
<body>
<div>
  <div class="head "><a class="pacuemo-logo" title="Pacuemo" href=""></a></div>
  <input type="hidden" id="guid" value="${param.guid}"/>
</div>
<div class="container-fluid login">
  <div class="content4twostep">
    <div class="row">
    <div class="test07">
    <h1>兩步驟驗證</h1>
    </div>
      <div class="col-xs-12 hidden-sm hidden-xs">
        <div class="divider"><strong class="divider-title">為進一步確保您的帳號的安全，請完成下列驗證問題</strong></div>
      </div>
    </div>
    <div class="test row">
    <img class="test02" src="${pageContext.request.contextPath}/img/authenticator.png" alt="">
    <div class="test04 row">請輸入驗證碼</div>
    <div class="test03 row">從 <strong>Google Authenticator</strong> 應用程式取得驗證碼</div>
    <form id="loginForm" name="loginForm" novalidate>
      <div class="row">
        <div class="col-xs-12">
          <label for="login-code" class="control-label sr-only">驗證碼</label>
          <input type="text" class="form-control" name="memberCode" id="login-code" placeholder="請輸入6位數驗證碼" pattern="[0-9]*" required="" data-msg-required="請輸入6位數驗證碼" data-rule-minlength="6" data-rule-maxlength="6" data-msg-maxlength="請輸入6位數驗證碼" data-msg-minlength="您的驗證碼長度不正確" autocomplete="off"></div>
      </div>
      <div class="row row-submit">
        <div class="col-xs-12 col-sm-12">
          <button class="test05 test06">完成</button>
        </div>
      </div>
    </form>
    
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>

<script type="text/javascript">
	$(function(){
		$("#loginForm").validate({
			errorClass: "control-label-validation1",
			highlight: function(element, errorClass, validClass){
  				 			$(element).parent().parent().addClass("has-error")
					   },
			unhighlight: function(element, errorClass, validClass){
  				 			$(element).parent().parent().removeClass("has-error")
					   },	
			submitHandler:function(form){        
							var guid = $("#guid").val();
							var code = $("#login-code").val();
							$.ajax({
								"type":"post",
								"url": "Twostepverification",
								"dataType": "json",
								"data":{"guid":guid,"validCode":code},
								"success":function(data){
									if( data.status == "true"){
										location.href = data.url;
									}else{
										$('#login_error').remove();
										$("#loginForm").prepend('<div id="login_error" class="row"><div class="col-xs-12 text-center"><p class="alert alert-warning"><span>驗證碼不正確。</span></p></div></div>');
									}
											
								}
							});
							return false;
						},

			});

	})
</script>
</body>
</html>