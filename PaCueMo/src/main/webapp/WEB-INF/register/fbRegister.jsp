<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<!DOCTYPE html>
<html class="layout-signup">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
<meta charset="UTF-8">
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
<title>註冊 - PACUEMO</title>

<!-- Bootstrap -->
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/reboot.bb8df22e.css">

<!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
      <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
      <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->
</head>
<body class="page-signup page-signup  p-signup page-signup  is-loggedout reboot">
<div class="sign-up">
  <div class="l-signup-header">
    <div class="container">
      <div class="l-box-content"> <a class="pacuemo-logo" href="/tw/"></a> </div>
    </div>
  </div>
  <div class="l-signup-body">
    <div class="container">
      <div class="l-box-content">
      	<br>
        <section class="register">
          <div class="content">
            <h2 class="center hdr-l"> 以  Facebook 帳戶註冊</h2>
            <form id="js-register-with-email" method="post" action="/tw/xhr/json/sign-up-for-spotify.php" novalidate>
              <div class="hidden ajax-spinner"></div>
              <div class="js-general-error alert alert-info hidden" data-error="糟糕！發生錯誤，請再次嘗試或到我們的<a href=''>說明中心</a>"></div>
              <fieldset>
                <ul>
                  <li>
                    <div id="register-dob1" class="register-dob">
                      <div class="name">
                        <label class="sr-only" for="register-userLastName">姓氏:</label>
                        <input type="text" id="register-userLastName" name="userLastName" placeholder="姓氏" value="${param.lastName}" required="" data-msg-required="請輸入您的姓氏。"  maxlength="20" autocapitalize="off" autocorrect="off" >
                      </div>
                      <div class="name">
                        <label class="sr-only" for="register-userFirstName">名字:</label>
                        <input type="text" id="register-userFirstName" name="userFirstName" value="${param.firstName}" placeholder="名字" required="" data-msg-required="請輸入您的名字。"  maxlength="20" autocapitalize="off" autocorrect="off">
                      </div>
                    </div>
                  </li>
                  <li>
                    <label class="sr-only" for="register-email">Email:</label>
                    <input type="email" id="register-email" name="email" value="${param.email}" placeholder="Email" required="" data-msg-required="請輸入你的電郵地址。" data-msg-email="你所提供的電子郵件無效。" data-rule-remote="Mailcheck" data-msg-remote="很抱歉，此電郵地址已有用戶使用。" maxlength="100">
                  </li>
                  <li>
                    <label class="sr-only" for="register-phone">手機號碼:</label>
                    <input type="tel" id="register-phone" name="phone" placeholder="手機號碼" pattern="[0-9]*" required="" data-msg-required="請輸入你的手機號碼。" data-rule-minlength="10" data-msg-minlength="你的手機號碼格式不正確。" maxlength="10" autocomplete="off">
                  </li>
                  <li id="li-dob" class="controls-dob" data-error-age="很抱歉，你的年齡並不符合 Pacuemo 的規定。">
                    <label for="register-age">出生日期：</label>
                    <div id="register-dob" class="register-dob">
                      <div class="controls controls-year">
						<select id="register-dob-year" class="dob" name="dob_year" max="2003" data-msg-max="很抱歉，你的年齡並不符合 Pacuemo 的規定。" required data-msg-required="請選擇您出生的年份">
                          <option value="" selected="" disabled="">年</option>
                          </select>
                      </div>
                      <div class="controls controls-month">
                        <select id="register-dob-month" class="dob" name="dob_month" required data-msg-required="請選擇您出生的月份">
                          <option value="" selected="" disabled="">月份</option>
                          <option value="01">一月</option>
                          <option value="02">二月</option>
                          <option value="03">三月</option>
                          <option value="04">四月</option>
                          <option value="05">五月</option>
                          <option value="06">六月</option>
                          <option value="07">七月</option>
                          <option value="08">八月</option>
                          <option value="09">九月</option>
                          <option value="10">十月</option>
                          <option value="11">十一月</option>
                          <option value="12">十二月</option>
                        </select>
                      </div>
                       <div class="controls controls-day">
						<select id="register-dob-day" class="dob" name="dob_day" required data-msg-required="請選擇您出生的日期">
                          <option value="" selected="" disabled="">日</option>
                          </select>
                          <input type="hidden" id="facebookId" value = "${param.facebookId}"/>
                      </div>
                    </div>
                  </li>
                  <li class="li-terms-notick">
                    <p class="notice">透過按註冊，你同意<a href="/tw/legal/end-user-agreement/" target="_blank">Pacuemo 的條款及細則</a>與<a href="/tw/legal/privacy-policy/" target="_blank">私隱政策</a></p>
                  </li>
                </ul>
              </fieldset>
              <button id="register-button-email-submit" class="btn btn-primary btn-sm btn-block js-signup-email-submit" >註冊</button>
            </form>
            <p class="primary"> 已經擁有帳戶？ <a id="register-link-login" data-section="login" href="https://www.spotify.com/tw/login/?continue=https%3A//www.spotify.com/tw/account/overview/">登入</a> </p>
          </div>
        </section>
      </div>
    </div>
  </div>
</div>
<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script> 

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.validate.js"></script> 
<script>
$(function(){
	$("#js-register-with-email").validate({
		errorClass: "has-error",
		errorPlacement: function(error, element) {
							if(element.is('#register-dob-year')||element.is('#register-dob-month')||element.is('#register-dob-day')){
								$("#li-dob").append(error);
							}else if(element.is('#register-userLastName')||element.is('#register-userFirstName')){
								$("#register-dob1").after(error);
							}else{
								error.insertAfter(element);
							};
						},
						submitHandler:function(form){        
							var mail = $("#register-email").val();
							var lastName = $("#register-userLastName").val();
							var firstName = $("#register-userFirstName").val();
							var phone = $("#register-phone").val();
							var year = $("#register-dob-year").val();
							var month = $("#register-dob-month").val();
							var day = $("#register-dob-day").val();
							var fbId = $("#facebookId").val();
							$.ajax({
								"type":"post",
								"url": "Register",
								"dataType": "text",
								"data":{"mail":mail,"fbId":fbId,"lastName":lastName,"firstName":firstName,"phone":phone,"year":year,"month":month,"day":day,"model":"register_fb"},
								"success":function(data){
									if( data == "true"){
										location.href = "../../index.jsp";
									}else{
										
									}
												
								}
							});
							return false;
						},						
	});		
	var date = new Date();
	var year = date.getFullYear();
	
	for(var y = year ; y>=1900; y--){
		var option = $("<option></option>").val(y).text(y);
		$("#register-dob-year").append(option);
	};
	
	for(var d = 1; d<=30; d++){
		var option = $("<option></option>").val(d).text(d);
		$("#register-dob-day").append(option);
	};
	
	$("#register-dob-year").bind("change",function(){
		var y = $("#register-dob-year").val();;
		var m = $("#register-dob-month").val();
		if( m != null){
			date = new Date(y,m,0);
			var day = date.getDate();
			$("#register-dob-day>option:gt(0)").remove();
			for(var d = 1; d<=day; d++){
				var option = $("<option></option>").val(d).text(d);
				$("#register-dob-day").append(option);
			};
		} 	
	});
	
	$("#register-dob-month").bind("change",function(){
		var y = $("#register-dob-year").val();;
		var m = $("#register-dob-month").val();
		if( y != null){
			date = new Date(y,m,0);
			var day = date.getDate();
			$("#register-dob-day>option:gt(0)").remove();
			for(var d = 1; d<=day; d++){
				var option = $("<option></option>").val(d).text(d);
				$("#register-dob-day").append(option);
			};
		} 	
	});
});
</script>
</body>
</html>
