<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<c:url var="home" value="/" scope="request" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.color_w {
	color: white;
}

.teamName {
	font-size: 36px;
	margin:0px;
	color: white;
}

.margin_form {
	margin: 15px;
}
</style>
<script>
	
</script>
</head>
<body>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />

	<div class="row">
		<div class="col-md-2">
			<form style="margin: 0px auto;" name="myData" action="Index.jsp" method="get">
				<div class="form-group">
					<input type="text" class="form-control" id="txtSearch" name="keyword" autocomplete="off">
					<!-- 				    <input type="submit" -->
					<!-- 						value="送出" class="btn btn-default btn-xs"> -->
				</div>
			</form>
			<div id="div1"></div>
		</div>
		<div class="col-md-8">
			<form class="form-horizontal margin_form">

				<div class="form-group">
					<h2 class="col-sm-3 col-md-2 control-label teamName color_w">約戰方：</h2>
					<div class="col-sm-3 col-md-4">
						<select id="select_teamB" class="form-control" style="margin: 7px;">
							<option>老師說的隊</option>
						</select>
					</div>



					<c:choose>
						<c:when test="">
							<label class="col-sm-3 col-md-2 control-label teamName color_w">挑戰方：</label>
							<div class="col-md-3">
								<select id="select_teamB" class="form-control" style="margin: 7px;"></select>
							</div>
						</c:when>
						<c:when test="">						
							<label class="col-sm-3 col-md-2 control-label teamName color_w">地點：</label>
							<div class="col-sm-3 col-md-4">
								<h2 >11</h2>
							</div>
							</c:when>
						<c:otherwise>
							<h2 class="col-sm-3 col-md-2 control-label teamName color_w">挑戰方：</h2>
							<div class="col-sm-3 col-md-4">
								<h2 class="teamName">11</h2>
							</div>
						</c:otherwise>
					</c:choose>


				</div>
				<div class="form-group">
					<div class="col-sm-2"><label class="col-sm-2" for="address">地址：</label></div>
				 
					<input class="form-control" id="address" placeholder="地址"> 
				</div>
				<div class="form-group">
					<label for="exampleInputPassword1">Password</label>
					<input class="form-control" id="exampleInputPassword1" placeholder="Password">
				</div>
				<div class="form-group">
					<label for="exampleInputFile">File input</label> <input type="file" id="exampleInputFile">
					<p class="help-block">Example block-level help text here.</p>
				</div>
				<div class="checkbox">
					<label> <input type="checkbox"> Check me out
					</label>
				</div>
				<button type="submit" class="btn btn-success">Submit</button>
			</form>
			
			<hr>
			
			<form id="js-register-with-email" novalidate>
              <div class="hidden ajax-spinner"></div>
              <div class="js-general-error alert alert-info hidden" data-error="糟糕！發生錯誤，請再次嘗試或到我們的<a href=''>說明中心</a>"></div>
              <fieldset>
                <ul>
                  <li>
                    <div id="register-dob1" class="register-dob">
                      <div class="name">
                        <label class="sr-only" for="register-userLastName">姓氏:</label>
                        <input type="text" id="register-userLastName" name="userLastName" placeholder="姓氏" required="" data-msg-required="請輸入您的姓氏。"  maxlength="20" autocapitalize="off" autocorrect="off" >
                      </div>
                      <div class="name">
                        <label class="sr-only" for="register-userFirstName">名字:</label>
                        <input type="text" id="register-userFirstName" name="userFirstName" placeholder="名字" required="" data-msg-required="請輸入您的名字。"  maxlength="20" autocapitalize="off" autocorrect="off">
                      </div>
                    </div>
                  </li>
                  <li>
                    <label class="sr-only" for="register-password">密碼:</label>
                    <input type="password" id="register-password" name="password" placeholder="密碼" required="" data-msg-required="請選擇密碼。" data-rule-minlength="4" data-msg-minlength="你的密碼太短。" maxlength="100" autocomplete="off">
                  </li>
                  <li>
                    <label class="sr-only" for="register-email">Email:</label>
                    <input type="email" id="register-email" name="email" value="" placeholder="Email" required="" data-msg-required="請輸入你的電郵地址。" data-msg-email="你所提供的電子郵件無效。" data-rule-remote="../_02_register/checkMail.do?model=checkMail" data-msg-remote="很抱歉，此電郵地址已有用戶使用。" maxlength="100">
                  </li>
                  <li>
                    <label class="sr-only" for="register-confirm-email">確認電郵:</label>
                    <input type="email" id="register-confirm-email" name="confirm_email" value="" placeholder="確認電郵" required="" data-msg-required="請確認你的電郵地址。" data-msg-email="你所提供的電子郵件無效。" data-rule-equalto="#register-email" data-msg-equalto="電郵地址不符。" maxlength="100">
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
			
		</div>
		<div class="col-md-2">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<div id="cont_ca9ddef90f63f255a3e37230d88fb6e7">
					<script type="text/javascript" async src="https://www.theweather.com/wid_loader/ca9ddef90f63f255a3e37230d88fb6e7"></script>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
	$( function() {
	 	var datas;
	 	var availableTags = [
	 	                    "ActionScript",
	 	                    "AppleScript",
	 	                    "Asp",
	 	                    "BASIC",
	 	                    "C",
	 	                    "C++",
	 	                    "Clojure",
	 	                    "COBOL",
	 	                    "ColdFusion",
	 	                    "Erlang",
	 	                    "Fortran",
	 	                    "Groovy",
	 	                    "Haskell",
	 	                    "Java",
	 	                    "JavaScript",
	 	                    "Lisp",
	 	                    "Perl",
	 	                    "PHP",
	 	                    "Python",
	 	                    "Ruby",
	 	                    "Scala",
	 	                    "Scheme"
	 	                  ];
	 	 $( "#address" ).keyup( function ()
		{
	 	$.ajax({
	 		"type":"get",
	 		"url" : "${home}spring/battle_rec/getCourtVOs",
	 		"data" : {"address" : $(this).val() },
	 		"dataType":"json",
	 		"success":function(data){
		 		
	 			$("#address").autocomplete( "option", "source", availableTags  );
	 		}
	 	});
	 
		});
		
		
	    $( "#address" ).autocomplete({
	      source: availableTags
	    });
	    
	  });
	</script>
</body>
</html>
