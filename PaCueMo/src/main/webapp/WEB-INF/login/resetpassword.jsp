<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html class="layout-signup">
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
    <title>密碼重設</title>
	<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reboot.bb8df22e.css">
  </head>
<body class="m-tw l-zh_HANT page-password-reset  p-password-reset  is-loggedout reboot  ">
	<div id="fb-root" class=" fb_reset">
	  <div style="position: absolute; top: -10000px; height: 0px; width: 0px;">
	    <div></div>
	  </div>
	</div>
	<div class="wrap">
	  <div class="sign-up">
	    <div class="l-signup-header">
	      <div class="container">
	        <div class="l-box-content"> <a class="pacuemo-logo" href="#"></a> </div>
	      </div>
	    </div>
	    <div class="l-signup-body">
	      <div class="container">
	        <div class="l-box-content">
	          <section class="password-reset" data-nolink="0">
	            <div class="content">
	              <h2 class="center hdr-l">重設密碼</h2>
	              <p class="secondary">請輸入你用作註冊的<b>電郵地址</b>。我們會發送一封電郵給你，裡面附有重設密碼的超連結。</p>
	              <p class="msg primary"></p>
	              <form id="reset-form" role="form" novalidate>
	                <div class="ajax-spinner hidden"></div>
	                <fieldset>
	                  <ul>
	                    <li>
	                      <label class="sr-only" for="password-reset">電郵地址:</label>
	                      <input placeholder="電郵地址" type="text" id="password-reset" required="" autocapitalize="off" autocomplete="off" autocorrect="off" data-msg-required="請輸入你的電郵地址" name="mail" class="valid">
	                      <label for="password-reset" class="has-error"></label>
	                    </li>
	                  </ul>
	                </fieldset>
	                <button id="password-button-password-submit" type="submit" class="btn btn-primary btn-sm btn-block js-gtm-event"> 傳送 </button>
	              </form>
	            </div>
	          </section>
	        </div>
	      </div>
	    </div>
	  </div>
	</div>
	<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script>

	<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script>

	<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script>
</body>
<script>
$("#reset-form").validate({
	errorClass: "has-error",
	submitHandler:function(form){        
		var mail = $("#password-reset").val();
		$.ajax({
			"type":"get",
			"url": "ForgetPassword",
			"dataType": "text",
			"data":{"mail":mail},
			"success":function(data){
				if( data == "success"){
					$('#reset_message').remove();
					$("#reset-form").prepend('<div id="reset_message" class="row"><div class="col-xs-12 text-center"><p class="alert alert-warning"><span>成功寄出，請於30分鐘內完成密碼修改</span></p></div></div>');
				
				}else{
					$('#reset_message').remove();
					$("#reset-form").prepend('<div id="reset_message" class="row"><div class="col-xs-12 text-center"><p class="alert alert-warning"><span>電郵地址不正確。</span></p></div></div>');
				}
						
			}
		});
		return false;
	},
});
</script>
</html>
