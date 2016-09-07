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
<div class="container container-content">
	<div class="row">
		<div class="col-sm-12">
			<div class="content">
				<div class="page-header">
    				<h1>帳戶概覽</h1>
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
					 </div>
					 <div class="col-sm-12 col-md-4">
					 	<div class="well card receipt" id="">
							<h3 class="text-primary1">帳戶明細</h3>
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
<c:choose>
	<c:when test="${LoginOK.member2StepVerify == false}">
	<script>
		$(function(){
			$("#btn-act-2step").bind("click",function(e){
				e.preventDefault();
				$.ajax({
					"type":"post",
					"url": "activate.do",
					"dataType": "json",
					"data":{"mode":"activate"},
					"success":function(data){
						console.log(data.status);
						console.log(data.url);
						console.log(data.sKey);
						var newDiv = $("<div id='dialog'></div>");
						var urlImg =$("<img></img>");
						var text1 = $("<p>請開啟Google Authenticator來掃描QR CODE</p>");
						var text2 = $("<p>請輸入由Google Authenticator產生的驗證碼</p>");
						var input1 = $("<div><input type='text' placeholder='請輸入6位數驗證碼' id='code' required/><div>");
						var input2 = $("<input type='hidden' id='key'>");
						var input3 = $("<div><input type='button' value='送出' id='send'/></div>");
						input2.val(data.sKey);
						urlImg.attr("src",data.url);
						urlImg.attr("style","margin:auto;");
						input1.attr("style","margin:auto;text-align:center;");
						input3.attr("style","margin:10px;text-align:center;");
						newDiv.append(text1).append(urlImg).append(text2).append(input1).append(input2).append(input3);
		 				newDiv.dialog();
		 				$("#send").on("click",function(e){
		 					var key = $("#key").val();
		 					var code = $("#code").val();
		 					$.ajax({
		 						"type":"post",
		 						"url": "activate.do",
		 						"dataType": "json",
		 						"data":{"mode":"store","sKey":key,"code":code},
		 						"success":function(data){
		 							if(data.status == "true"){;
		 								$('#dialog').dialog('close');
			 							location.reload();
		 							}else{
		 								newDiv.remove($("#error"))
		 								newDiv.append("<h5 sytle='color:red' id='error'>驗證碼錯誤</h5>");	
		 							}
		 							
		 						}
		 					});
		 				});
					}
				});	
			});
		});
	</script>
	</c:when>
	<c:otherwise>
	<script>
	$(function(){
		$("#btn-deact-2step").bind("click",function(e){
			e.preventDefault();
			$( "#dialog-confirm" ).dialog({
			      resizable: false,
			      height: "auto",
			      width: 400,
			      modal: true,
			      buttons: {
			        "我確定關閉兩階段驗證": function() {
			        	$.ajax({
							"type":"post",
							"url": "deactivate.do",
							"dataType": "json",
							"data":{"mode":"delete"},
							"success":function(data){
								if(data.status == "true"){
									location.reload();
								}
							}
						});	
			          $( this ).dialog( "close" );
			        },
			        "取消": function() {
			          $( this ).dialog( "close" );
			        }
			      }
			    });
			
		});
	});
	</script>
	</c:otherwise>
</c:choose>
<c:choose>
	<c:when test="${empty LoginOK.memberFBId }">
	<script>
	  $(function(){
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
									"url": "connect.do",
									"dataType": "json",
									"data":{"facebookId":response.id,"mode":"fb_connect"},
									"success":function(data){
										if(data.status == "true"){
											location.reload();
										}else{
											alert("error");
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
			    
				$("#btn-fb-connect").bind("click",function(){
					fbLogin();
				})
		  
	  });
	</script>
	</c:when>
</c:choose>
</html>