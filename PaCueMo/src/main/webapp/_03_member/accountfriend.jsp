<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
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
    				<h1>朋友列表</h1>
  				</div>
				<div class="row">
   					<div class="col-sm-12 col-md-8">
	   					<div class="well card friendlist" id="">
	   						<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
		   					<h3 class="text-primary1">好友名單 <button id="edit-friendlist">編輯名單</button></h3>
		   					</c:when>
		   					<c:otherwise>
		   					<h3 class="text-primary1">好友名單 </h3>
		   					</c:otherwise>
		   					</c:choose>
		   					<div class="row">
		   					<div class="col-sm-6 col-md-6">
		   					<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
							<c:forEach var="i" begin="0" end="${fn:length(friends.ids)-1}">
							<c:if test="${i%2 == 0}">
								<c:choose>
							        <c:when test="${not empty friends.fbIds[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${friends.fbIds[i]}/picture?width=64&amp;height=64" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty friends.imgs[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${friends.imgs[i]}" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:otherwise>
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${friends.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
      						</c:if>	
							</c:forEach>
							</c:when>
							</c:choose>
							</div>
							<div class="col-sm-6 col-md-6">
							<c:choose>
							<c:when test="${fn:length(friends.ids) > 0}">
							<c:forEach var="i" begin="0" end="${fn:length(friends.ids)-1}">
							<c:if test="${i%2 == 1}">
								<c:choose>
							        <c:when test="${not empty friends.fbIds[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${friends.fbIds[i]}/picture?width=64&amp;height=64" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty friends.imgs[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${friends.imgs[i]}" alt="${friends.names[i]}"><font>${friends.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:otherwise>
							        <div class="test form-group">
							        <button class="form-control-static1 test1 f" value="${friends.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${friends.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
      						</c:if>	
							</c:forEach>
							</c:when>
							</c:choose>
							</div>
	   				    </div>
	   				    	<c:if test="${fn:length(friends.ids) == 0}">
								<div class="form-group">
								<div class="form-control-static test"><h5>您還尚未擁有好友喔!!!</h5></div>
								</div>
							</c:if>
	   				    </div>								
					 </div>
					 <div class="col-sm-12 col-md-4">
						<div class="well card friendlist" id="">
							<h3 class="text-primary1">好友邀請</h3>
							<c:choose>
							<c:when test="${fn:length(invite.ids) > 0}">
							<c:forEach var="i" begin="0" end="${fn:length(invite.ids)-1}" varStatus ="vs">
								<c:choose>
							        <c:when test="${not empty invite.fbIds[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1" value="${invite.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${invite.fbIds[i]}/picture?width=64&amp;height=64" alt="${invite.names[i]}"><font>${invite.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty invite.imgs[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1" value="${invite.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${invite.imgs[i]}" alt="${invite.names[i]}"><font>${invite.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:otherwise>
							        <div class="test form-group">
							        <button class="form-control-static1 test1" value="${invite.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${invite.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							<c:if test="${fn:length(invite.ids) == 0}">
								<div class="form-group">
								<div class="form-control-static test"><h5>目前沒有好友邀請喔!!!</h5></div>
								</div>
							</c:if>
						</div>
						<div class="well card friendlist" id="">
					 	    <h3 class="text-primary1">發出的邀請</h3>
					 	    <c:choose>
							<c:when test="${fn:length(inviting.ids) > 0}">
							<c:forEach var="i" begin="0" end="${fn:length(inviting.ids)-1}" varStatus ="vs">
								<c:choose>
							        <c:when test="${not empty inviting.fbIds[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1" value="${inviting.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="https://graph.facebook.com/${inviting.fbIds[i]}/picture?width=64&amp;height=64" alt="${inviting.names[i]}"><font>${inviting.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:when test="${not empty inviting.imgs[i]}">
							        <div class="test form-group">
							        <button class="form-control-static1 test1" value="${inviting.ids[i]}"><img class="user-img img-circle navbar-user-img2" src="${pageContext.request.contextPath}/image/member/${inviting.imgs[i]}" alt="${inviting.names[i]}"><font>${inviting.names[i]}</font></button>
							        </div>
							        </c:when>
							        <c:otherwise>
							        <div class="test form-group">
							        <button class="form-control-static1 test1" value="${inviting.ids[i]}"><div class="user-icon-container img-circle navbar-user-img2"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use></svg></div><font>${inviting.names[i]}</font></button>
							        </div>
							        </c:otherwise>							    
      							</c:choose>
							</c:forEach>
							</c:when>
							</c:choose>
							<c:if test="${fn:length(inviting.ids) == 0}">
								<div class="form-group">
								<div class="form-control-static test"><h5>目前沒有發出邀請喔!!!</h5></div>
								</div>
							</c:if>
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
<script type="text/javascript">
$(function(){
	$(".form-control-static1.test1").bind("click",function(){
		var guid = $(this).val();
		location.href = "../spring/playercard/Playercard?guid="+guid;
	})	
})
</script>

<c:if test="${fn:length(friends.ids) > 0}">
<script>
	function addlink(){
		var id = $(this).val();
		location.href = "../spring/playercard/Playercard?guid="+id;
	};
	
	
	
	$(function(){
		$(".form-control-static1.test1.f").bind("click",addlink);
		
		$(document.body).on("click","#edit-friendlist",function(){
			$(this).attr("id","complete-edit");
			$(this).text("結束編輯");
			$(".form-control-static1.test1.f").unbind("click");
			$(".form-control-static1.test1.f").bind("click",function(){
				$(this).closest(".test.form-group").attr("style","-moz-box-shadow:4px 4px 12px -2px rgba(20%,20%,40%,0.5);-webkit-box-shadow:4px 4px 12px -2px rgba(20%,20%,40%,0.5);box-shadow:4px 4px 12px -2px rgba(20%,20%,40%,0.5);background-color:#F0F0F0");
				$(this).after("<div class='form-control-static2 test1 b'><button class='delete' style:'color:red'>刪除</button><button class='cancel' style:'color:blue'>取消</button></div>");
				$(this).prop("disabled",true)
			});
			
		});
		
		$(document.body).on("click","#complete-edit",function(){
			$(".test.form-group").removeAttr("style");
			$(".form-control-static2.test1.b").prev().prop("disabled",false);	
			$(".form-control-static2.test1.b").remove();
			$(".form-control-static1.test1.f").unbind("click");
			$(".form-control-static1.test1.f").bind("click",addlink)
			$(this).attr("id","edit-friendlist");
			$(this).text("編輯名單");
		});
	
		
		
		$(document.body).on("click","button.cancel",function(){
			$(this).closest(".test.form-group").removeAttr("style");
			$(this).parent().prev().prop("disabled",false);
			$(this).parent().remove();	
		});
		
		$(document.body).on("click","button.delete",function(){
			var id = $(this).parent().prev().val();
			var outterDiv = $(this).parent().parent();
			 $.ajax({
					"type":"post",
					"url": "",
					"dataType": "json",
					"data":{"friendId":id,mode:"delete_friend"},
					"success":$.proxy(function(data){
						if(data.status == "true"){
							outterDiv.remove();
						}else{
							alert("error");
						}		
					},this)
				});
			$(this).parent().prev().prop("disabled",false);
			$(this).parent().remove();	
		});
	})
	
</script>
</c:if>
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