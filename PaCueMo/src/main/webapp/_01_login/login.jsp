<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="zh">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta charset="UTF-8">
<title>登入 - Pacuemo</title>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/login.css">

</head>
<body>
<div>
  <div class="head "><a class="pacuemo-logo" title="Pacuemo" href=""></a></div>
</div>
<div class="container-fluid login">
  <div class="content">
    <div class="row">
      <div class="col-xs-12"><input type="button" class="btn btn-sm btn-block btn-facebook" value="以 Facebook 帳戶登入"/></div>
    </div>
    <div class="row">
      <div class="col-xs-12">
        <div class="divider"><strong class="divider-title">或</strong></div>
      </div>
    </div>
    <form id="loginForm" name="loginForm" novalidate>
      <div class="row">
        <div class="col-xs-12">
          <label for="login-username" class="control-label sr-only">電子信箱</label>
          <input type="text" class="form-control" name="memberMail" id="login-username" placeholder="電子信箱" required="" data-msg-required="請輸入電子信箱。" autocapitalize="off" autocomplete="off" autocorrect="off" autofocus ng-trim="false"></div>
      </div>
      <div class="row">
        <div class="col-xs-12">
          <label for="login-password" class="control-label sr-only">密碼</label>
          <input type="password" class="form-control" name="memberPassword" id="login-password" placeholder="密碼" required="" data-msg-required="請輸入密碼" autocomplete="off"></div>
      </div>
      <div class="row row-submit">
        <div class="col-xs-12 col-sm-6">
          <div class="checkbox">
            <label>
              <input type="checkbox" name="rememberMe" id="login-remember" checked="checked" value="rm">
              記住我 <span class="control-indicator"></span></label>
          </div>
        </div>
        <div class="col-xs-12 col-sm-6">
          <button class="btn btn-sm btn-block btn-red">登入</button>
        </div>
      </div>
    </form>
    <div class="row row-hint">
      <div class="col-xs-12 text-center">
        <p><a href="">忘記密碼？</a></p>
        <p>未註冊帳戶？ <a href="${pageContext.request.contextPath}/_02_register/register.jsp">註冊</a></p></div>
      <div class="col-xs-12">
        <div class="divider"></div>
        <p class="text-muted disclaimer">如果你按一下「以 Facebook 帳戶登入」但並不是 Pacuemo 的使用者，我們會為你註冊，並認定你同意 Pacuemo 的 <a href="" target="_blank">條款與條件</a>以及<a href="" target="_blank">隱私權政策</a>。</p>
      </div>
    </div>
  </div>
</div>

<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>

<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>

<script type="text/javascript">


  window.fbAsyncInit = function() {
  FB.init({
    appId      : '268809393472621',
    cookie     : true,  // enable cookies to allow the server to access 
                        // the session
    xfbml      : true,  // parse social plugins on this page
    version    : 'v2.2' // use version 2.2
  });
  
  };
  

  // Load the SDK asynchronously
  (function(d, s, id) {
    var js, fjs = d.getElementsByTagName(s)[0];
    if (d.getElementById(id)) return;
    js = d.createElement(s); js.id = id;
    js.src = "//connect.facebook.net/en_US/sdk.js";
    fjs.parentNode.insertBefore(js, fjs);
  }(document, 'script', 'facebook-jssdk'));

  // Here we run a very simple test of the Graph API after login is
  // successful.  See statusChangeCallback() for when this call is made.
  function testAPI() {
	  FB.api(
			  '/me',
			  'GET',
			  {"fields":"id,first_name,last_name,email"},
			  function(response) {
				  $.ajax({
						"type":"post",
						"url": "login.do",
						"dataType": "text",
						"data":{"facebookId":response.id,"mode":"fb_Login"},
						"success":function(data){
							if( data == "true"){
								location.href = "../index.jsp";
							}else if( data.substr(0,13) == "twoStepVerify"){
								var url = '2stepverify.jsp';
								var form = $('<form style="display:none"action="' + url + '" method="post">' +
								  '<input type="text" name="guid" value="' + data.substr(13) + '" />' +
								  '</form>');
								$('body').append(form);
								form.submit();
							}else{
								location.href = "../_02_register/fbRegister.jsp?facebookId="+response.id+"&lastName="+response.last_name+"&firstName="+response.first_name+"&email="+response.email;
							}		
						}
					});
			  }
			);
    };
    
    function fbLogin() {  
        FB.login(function(response) {
        	if (response.status === 'connected') {
        	      // Logged into your app and Facebook.
        	      testAPI();
        	    } else if (response.status === 'not_authorized') {
        	      // The person is logged into Facebook, but not your app.
        	      document.getElementById('status').innerHTML = 'Please log ' +
        	        'into this app.';
        	    } else {
        	      // The person is not logged into Facebook, so we're not sure if
        	      // they are logged into this app or not.
        	      document.getElementById('status').innerHTML = 'Please log ' +
        	        'into Facebook.';
        	    }
       }, {scope: 'public_profile,email'}); //設定需要授權的項目
    }
  
	$(function(){
		$("#loginForm").validate({
			errorClass: "control-label-validation",
			highlight: function(element, errorClass, validClass){
  				 			$(element).parent().parent().addClass("has-error")
					   },
			unhighlight: function(element, errorClass, validClass){
  				 			$(element).parent().parent().removeClass("has-error")
					   },	
			submitHandler:function(form){        
							var mail = $("#login-username").val();
							var pwd = $("#login-password").val();
							var rm = $("#login-remember").val();
							$.ajax({
								"type":"post",
								"url": "login.do",
								"dataType": "text",
								"data":{"memberMail":mail,"memberPassword":pwd,"rememberMe":rm,"mode":"normal_Login"},
								"success":function(data){
									if( data.substr(0,4) == "true"){
										location.href = data.substr(4);
									}else if( data.substr(0,13) == "twoStepVerify"){
										var url = '2stepverify.jsp';
										var form = $('<form style="display:none"action="' + url + '" method="post">' +
										  '<input type="text" name="guid" value="' + data.substr(13) + '" />' +
										  '</form>');
										$('body').append(form);
										form.submit();
									}else{
										$('#login_error').remove();
										$("#loginForm").prepend('<div id="login_error" class="row"><div class="col-xs-12 text-center"><p class="alert alert-warning"><span>用戶名稱或密碼不正確。</span></p></div></div>');
									}
											
								}
							});
							return false;
						},

			});
		$(".btn.btn-sm.btn-block.btn-facebook").bind("click",function(){
			fbLogin();
		})
	})
</script>
</body>
</html>