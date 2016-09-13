<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>Insert title here</title>
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/playercard.css">
    <link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/jquery-ui.min.css">
    <style>
    .ui-widget {
   		z-index:1000000 !important; /* The default is 100. !important overrides the default. */
	}	
    </style>
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
	  				<c:if test="${LoginOK.memberHaveCard == true }">
					<div class="row">
					yes
					
	   				</div>
	   				</c:if>
	   				<c:if test="${LoginOK.memberHaveCard == false }">
					<div class="row">
						<div class="col-sm-12 col-md-12">
	   						<div class="well card profile"  style="min-height:500px;" id="">
	   						<h2 style="color:red;font-sizw:40px">您還沒有球員卡喔!!!</h2>
	   						<div class="test001">
	   						<a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-create_playercard">建立球員卡</a>
	   						</div>
	   						</div>
		   				</div>	
	   				</div>
	   				</c:if>
				</div>
			</div>
		</div>
	</div>
	<c:if test="${LoginOK.memberHaveCard == false }">
	<div id="dialog-form" title="建立球員卡" style="display:none">
 			 <form id="js-register-with-email" class="reboot" novalidate>
              <fieldset>
                <ul>
                  <li>
                    <div id="register-dob1" class="register-dob">
                      <div class="name">
                        <label class="sr-only" for="playercard-weight">體重:</label>
                        <input type="text" id="register-userWeight" name="userWeight" placeholder="體重" required="" data-msg-required="請輸入您的體重。">
                      </div>
                      <div class="name">
                        <label class="sr-only" for="playercard-height">身高:</label>
                        <input type="text" id="register-userHeight" name="userHeight" placeholder="身高" required="" data-msg-required="請輸入您的身高。">
                      </div>
                    </div>
                  </li>
                  <li>
                    <div id="register-dob1" class="register-dob">
                      <div class="name">
                        <label class="sr-only" for="playercard-gender">性別:</label>
                       <div class="controls">
                        <select id="playercard-gender" class="dob" name="userGender" required data-msg-required="請選擇您的性別">
                          <option value="" selected="" disabled="">性別</option>
                          <option value="1">男</option>
                          <option value="2">女</option>
                        </select>
                       </div>
                      </div>
                      <div class="name">
                        <label class="sr-only" for="playercard-hand">慣用手:</label>
                        <div class="controls">
                        <select id="playercard-hand" class="dob" name="userHand" required data-msg-required="請選擇您的慣用手">
                          <option value="" selected="" disabled="">慣用手</option>
                          <option value="1">左手</option>
                          <option value="2">右手</option>
                        </select>
                       </div>
                      </div>
                    </div>
                  </li>
                  <li>
                    <div id="register-dob1" class="register-dob">
                      <div class="name">
                        <label class="sr-only" for="playercard-position">擅長球位:</label>
                        <select id="playercard-position" class="dob" name="userPosition" required data-msg-required="請選擇您的擅長球位">
                          <option value="" selected="" disabled="">擅長球位</option>
                          <option value="SF">小前鋒(SF)</option>
                          <option value="SG">得分後衛(SG)</option>
                          <option value="PF">大前鋒(PF)</option>
                          <option value="PG">控球後衛(PG)</option>
                          <option value="C">中鋒(C)</option>
                        </select>
                      </div>
                      <div class="name">
                        <label class="sr-only" for="playercard-location">活動地區:</label>
                        <select id="playercard-location" class="dob" name="userLocation" required data-msg-required="請選擇您的活動地區">
                          <option value="" selected="" disabled="">活動地區</option>
                          <option value="臺北市">臺北市</option>
                          <option value="新北市">新北市</option>
                          <option value="桃園市">桃園區</option>
                          <option value="臺中市">臺中市</option>
                          <option value="臺南市">臺南市</option>
                          <option value="高雄市">高雄市</option>
                          <option value="基隆市">基隆市</option>
                          <option value="新竹市">新竹市</option>
                          <option value="嘉義市">嘉義市</option>
                          <option value="新竹縣">新竹縣</option>
                          <option value="苗栗縣">苗栗縣</option>
                          <option value="彰化縣">彰化縣</option>
                          <option value="南投縣">南投縣</option>
                          <option value="雲林縣">雲林縣</option>
                          <option value="嘉義縣">嘉義縣</option>
                          <option value="屏東縣">屏東縣</option>
                          <option value="宜蘭縣">宜蘭縣</option>
                          <option value="花蓮縣">花蓮縣</option>
                          <option value="臺東縣">臺東縣</option>
                          <option value="澎湖縣">澎湖縣</option>
                        </select>
                      </div>
                    </div>
                  </li>
                  <li>
                    <label class="sr-only" for="playercard-introduce">自我介紹:</label>
                    <textarea required="" placeholder="請簡單的介紹自己"></textarea>
                  </li>
                  <li id="li-dob" class="controls-dob1">
                    <label for="player-ability" id="point">能力值：(總計20點)</label>
                    <div id="register-dob" class="register-dob">
                     <div class="controls">
                        <select id="str" class="dob" name="str" required>
                          <option value="" selected="" disabled="">力量</option>
                        </select>
                      </div>
                     <div class="controls">
                        <select id="con" class="dob" name="con" required>
                          <option value="" selected="" disabled="">體力</option>
                        </select>
                      </div>
                     <div class="controls">
                        <select id="dex" class="dob" name="dex" required>
                          <option value="" selected="" disabled="">敏捷</option>
                        </select>
                      </div>
                     <div class="controls">
                        <select id="int" class="dob" name="int" required>
                          <option value="" selected="" disabled="">智力</option>
                        </select>
                      </div>
                     <div class="controls">
                        <select id="wis" class="dob" name="wis" required>
                          <option value="" selected="" disabled="">感知</option>
                        </select>
                      </div>
                     <div class="controls">
                        <select id="cha" class="dob" name="cha" required>
                          <option value="" selected="" disabled="">魅力</option>
                        </select>
                      </div>
                    </div>
                  </li>
                </ul>
              </fieldset>
            </form>
	</div>
	<script type="text/javascript">
	var point = 20;
	
	$(function(){
		 dialog = $( "#dialog-form" ).dialog({
		        autoOpen: false,
		        height: 500,
		        width: 600,
		        modal: true,
		        open:function(){
				  	for(var p = 0; p<=20; p++){
				  		var tmp = $("<option></option>").val(p).text(p);
						$("#str").append(tmp.clone());
						$("#con").append(tmp.clone());
						$("#dex").append(tmp.clone());
						$("#int").append(tmp.clone());
						$("#wis").append(tmp.clone());
						$("#cha").append(tmp.clone());
					};
					
					$("#str,#con,#dex,#int,#wis,#cha ").bind("change",function(){
						var p = 20-$("#str").val()-$("#con").val()-$("#dex").val()-$("#int").val()-$("#wis").val()-$("#cha").val();
						var str = $("#str").val();
						var con = $("#con").val();
						var dex = $("#dex").val();
						var inte = $("#int").val();
						var wis = $("#wis").val();
						var cha = $("#cha").val();
						if(str != null){
							var str1 = parseInt(str, 10) + parseInt(p, 10);
						}else{
							var str1 = parseInt(p, 10);
						}
						if(con != null){
							var con1 = parseInt(con, 10) + parseInt(p, 10);
						}else{
							var con1 = parseInt(p, 10);
						}
						if(dex != null){
							var dex1 = parseInt(dex, 10) + parseInt(p, 10);
						}else{
							var dex1 = parseInt(p, 10);
						}
						if(inte != null){
							var inte1 = parseInt(inte, 10) + parseInt(p, 10);
						}else{
							var inte1 = parseInt(p, 10);
						}
						if(wis != null){
							var wis1 = parseInt(wis, 10) + parseInt(p, 10);
						}else{
							var wis1 = parseInt(p, 10);
						}
						if(cha != null){
							var cha1 = parseInt(cha, 10) + parseInt(p, 10);
						}else{
							var cha1 = parseInt(p, 10);
						}

						$("#str>option:gt(1)").remove();
						$("#con>option:gt(1)").remove();
						$("#dex>option:gt(1)").remove();
						$("#int>option:gt(1)").remove();
						$("#wis>option:gt(1)").remove();
						$("#cha>option:gt(1)").remove();

						for(var p = 1; p<=str1; p++){
					  		var tmp = $("<option></option>").val(p).text(p);
							$("#str").append(tmp);
						};
						$("#str").val(str);
					  	for(var p = 1; p<=con1; p++){
					  		var tmp = $("<option></option>").val(p).text(p);
							$("#con").append(tmp);
						};
						$("#con").val(con);
					  	for(var p = 1; p<=dex1; p++){
					  		var tmp = $("<option></option>").val(p).text(p);
							$("#dex").append(tmp);
						};
						$("#dex").val(dex);
					  	for(var p = 1; p<=inte1; p++){
					  		var tmp = $("<option></option>").val(p).text(p);
							$("#int").append(tmp);
						};
						$("#int").val(inte);
					  	for(var p = 1; p<=wis1; p++){
					  		var tmp = $("<option></option>").val(p).text(p);
							$("#wis").append(tmp);
						};
						$("#wis").val(wis);
					  	for(var p = 1; p<=cha1; p++){
					  		var tmp = $("<option></option>").val(p).text(p);
							$("#cha").append(tmp);
						};
						$("#cha").val(cha);

						
					});
		        },
		        buttons: {
		          "建立球員卡": function(){
		        	  
		        	  
		          },
		          "取消": function() {
		            dialog.dialog( "close" );
		          }
		        },
		        close: function() {
		          form[ 0 ].reset();
		        }
		      });
		   
		      form = dialog.find( "form" ).on( "submit", function( event ) {
		        event.preventDefault();
		      });
		      
		      $( "#btn-create_playercard" ).bind( "click", function( event ) {
		    	  event.preventDefault();
		          dialog.dialog( "open" );
		      });   

	});
	
	


	</script>
	</c:if>
  </body>
</html>
