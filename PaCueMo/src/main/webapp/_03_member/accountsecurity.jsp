<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>帳戶 - Pacuemo</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/member.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
<style type="text/css">
    .ui-widget {
   		z-index:1000000 !important; /* The default is 100. !important overrides the default. */
	}	
</style>
</head>
<body>
<jsp:include page="/fragment/top.jsp" />
<jsp:include page="/_03_member/fragment/sidebar.jsp" />
<div class="container container-content">
	<div class="row">
		<div class="col-sm-12">
			<div class="content">
				<div class="page-header">
    				<h1>安全性設定</h1>
  				</div>
				<div class="row">
   					<div class="col-sm-12 col-md-6">
							<div class="well card profile" id="">
								<h3 class="text-primary1">更改密碼</h3>
								<br>	
								<a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-edit-profile">更改密碼</a>
							</div>		
					 </div>
					 <div class="col-sm-12 col-md-6">
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
</html>