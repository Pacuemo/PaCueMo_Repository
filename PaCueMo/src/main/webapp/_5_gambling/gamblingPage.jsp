<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html>
<html>
  <head>
  <%@ page import="java.util.List" %>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>NBA 運彩專區</title>
	
     <link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling/plugins/slicePage/css/style.css" media="screen" type="text/css"/><!-- 分頁 -->
     <link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling/plugins/datePicker/css/reset.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling/plugins/datePicker/css/default.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling/plugins/datePicker/css/style.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling/plugins/notiny/css/notiny.min.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling/plugins/lobibox/dist/css/lobibox.min.css" type="text/css">
     <link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling/plugins/lobibox/dist/css/animate.css" type="text/css">
   
     <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/4.0.0-alpha.2/css/bootstrap.min.css" integrity="sha384-y3tfxAZXuh4HwSYylfB+J125MxIs6mR5FOHamPBG064zB+AFeWH94NdvaCBm8qnd" crossorigin="anonymous">
<!-- 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap-theme.min.css" integrity="sha384-rHyoN1iRsVXV4nD0JutlnGaslCJuC7uwjduW9SVrLvRYooPp2bWYgmgJQIXwl/Sp" crossorigin="anonymous"> -->
<!-- 	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"> -->
<%-- 	 <link rel="stylesheet" href="<%=request.getContextPath()%>/css/bootstrap.min.css"><!-- BOOTSTRAP --> --%>
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	 <link rel="stylesheet" href="//ajax.googleapis.com/ajax/libs/jqueryui/1.11.1/themes/ui-darkness/jquery-ui.min.css">
	<style type="text/css">
        #dialog-div tr {
            height:50px;
        }
        #dialog-div td {
            width:250px;
            text-align:center;
        }
        #dialog-div img {
        	display:block; margin:0 auto;
        }
        #betData{
        	background-color:#2F0000;
        }
        #betData td{
        	background-color:#2F0000;
        	border:2px groove #3C3C3C;
        }
        .ui-dialog { z-index: 9999 !important ;}/* 確保 dialog 最上層顯示 */
        
        div.myImage/*先發球員dialog*/
		{
		    display: none;	
		}
	</style>
  </head>
  <body>
  <jsp:include page="/fragment/top.jsp"/>
  <jsp:include page="/_5_gambling/sidebar.jsp"/>
       <div class="container">
       		<div class="row">
       			<div class="col-md-2"></div>       	
       			<div class="col-md-8">
        				
	       				<div class="page-header">
	       					<c:choose>
	       						<c:when test="${funFlag=='byTeamName'}">
	       							<h2><strong style="font-family:微軟正黑體;font-weight:bolder;color:orange;">${queryTeamName}</strong></h2>
	       						</c:when>
	       						<c:when test="${empty battleSetList}">
	       							<h2><strong style="font-family:微軟正黑體;font-weight:bolder;color:red;">查無資料</strong></h2>
	       						</c:when>
	       						<c:otherwise>
	       							<h2><strong style="font-family:微軟正黑體;font-weight:bolder;color:orange;">${queryDate}</strong></h2>
	       						</c:otherwise>
	       					</c:choose>	       			
						</div>
       					<div id="tableDiv">
       						<table id="myTable" class="table">
       							
       							<c:choose>
       								<c:when test="${funFlag=='byTeamName'}">
	       								<c:set var="startNum" value="0"/>
	     								<c:set var="endNum"   value="4"/>
       								</c:when>
       								<c:otherwise>
       									<c:set var="startNum" value="0"/>
       									<c:set var="endNum"   value="2"/>
       								</c:otherwise>
       							</c:choose>
       							
       							<c:forEach var="battleSetVO" items="${battleSetList}" begin="${startNum}" end="${endNum}" varStatus="vs">
       								<tr align='center' valign='middle'>
										<td><img width="150" class="img-rounded" alt="away"    src="<%=request.getContextPath()%>/_5_gambling/${battleSetVO['away'].teamLogoURL}"></td>
										<td><img width="70"  					 alt="vs4.gif" src="<%=request.getContextPath()%>/_5_gambling/image/VS4.gif"></td>
										<td><img width="150" class="img-rounded" alt="home"    src="<%=request.getContextPath()%>/_5_gambling/${battleSetVO['home'].teamLogoURL}"></td>
									</tr>
       								<tr align='center' valign='middle'>
										<td><h4 style="font-family:微軟正黑體;font-weight:bolder;color:white;">${battleSetVO['away'].teamName}</h4></td>
										<td>
											<Strong class='glyphicon glyphicon-time' style="padding-right:5px;color:white;">&nbsp;${battleSetVO['battleTime']}</Strong><p/><p/>
									    	<input  type="hidden" value="${battleSetVO.battleId}"/><!-- 紀錄 battleSetId -->
										    <button type="button" class="btn btn-warning" style="width:35px;height:35px;color:orange;font-size:14px;font-family:微軟正黑體;font-weight:800;vertical-align:baseline;">下 注</button>
										</td>
										<td><h4 style="font-family:微軟正黑體;font-weight:bolder;color:white;">${battleSetVO['home'].teamName}</h4></td>
									</tr>    				
       							</c:forEach>
       						</table>
       					</div>		 	

      					<div style="margin-left:250px;width:580px;padding:10px;background-color: rgb(50, 118, 110 , 0.8);">
				            <div id="slicePage"></div>
				        </div>
					       
       			</div>
       			<div class="col-md-2"></div>
       		 
       	   </div>
       </div>

    	<!-- ====================================================================== -->
		<!-- =======================【下注 dialog 開始】=========================== -->
		<!-- ====================================================================== -->
		<div id="dialog-div" title="下注場次" style="z-index: 9999;">
	        <form>
	            <table>
	                <tr id="row1" align='center' valign='middle' style="height:200px;"><!-- 隊徽 -->
	                    <td align="center"><img width="150" class="img-rounded" alt="away" 		src=""></td>
	                    <td align="center"><img width="70"  					alt="VS4.gif" 	src="image/VS4.gif"></td>
	                    <td align="center"><img width="150" class="img-rounded" alt="home" 		src=""></td>
	                </tr>
	                <tr id="row2"><!-- 隊名 : 由 ===【下注 開始】=== 動態塞入 -->
	                    <td align="center"></td><!-- away -->
	                    <td align="center"></td>
	                    <td align="center"></td><!-- home -->
	                </tr>
	            </table>
	            <p/>
	            <table style="border:2px outset #8E8E8E"> 
	                <tr id="row3" align='center' valign='middle'><!-- 比賽時間 -->
	                    <td align="center" colspan="3">比賽時間</td>
	                </tr>
	                <tr id="row4"><!-- 比分 -->
	                    <td></td>
	                    <td align="center">比分</td>
	                    <td></td>
	                </tr>
	                <tr id="row5" align='center' valign='middle'><!-- 賭金 -->
	                    <td></td>
	                    <td align="center">下注總額</td>
	                    <td></td>
	                </tr>
	            </table>
	            <p/>
	            <table id="betData">
	            	<tr align='center' valign='middle'>
	            		<td colspan="3">輸入下注金額</td>
	            	</tr>
	            	<tr align='center' valign='middle'>
	            		<td align="center" height="100">
	            			<label for="awayCoins">客隊金額：</label>
                   		    <input id="awayCoins" name="value" value="0" readonly="readonly"/>	
	            		</td>
	            		<td align="center" height="100">
							<label for="homeCoins">主隊金額：</label>
                   		    <input id="homeCoins" name="value" value="0" readonly="readonly"/>	
	            		</td>
	            	</tr>
	            </table>
	            
	            <input id="battleId_choosed" type="hidden" value=""/><!-- <hidden 欄位存放該場次 battleId > -->
	            <input id="awayId" 			 type="hidden" value=""/><!-- <hidden 欄位存放該場次 awayId > -->
	            <input id="homeId" 			 type="hidden" value=""/><!-- <hidden 欄位存放該場次 homeId > -->
	            <input type="submit" tabindex="-1" style="position:absolute; top:-1000px">
	        </form>
    	</div>
    	<!-- ***************************【下注 dialog 結束】***************************** -->
    	<!-- ====================================================================== -->
		<!-- ==================【 購買點數 - 信用卡 dialog 開始】================== -->
		<!-- ====================================================================== -->
		<div id="dialog-card" title="購買點數">
	            <div class="card-wrapper"></div>
	            <form action="">
	                  <div class="form-group has-feedback">
						  <label class="control-label" for="number" style="font-family:'微軟正黑體';font-weight:800;color:orange;">卡 號</label>
						  <input id="cardnumber" placeholder="Card number" type="text" name="number" class="form-control" value="4023 7845 6941 3354" autocomplete="off" style="color:BLUE;font-weight:800;"/>
					      <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            			  <span class="sr-only">(error)</span>
					  </div>					  
	                  <div class="form-group has-feedback">
						  <label class="control-label" for="fullname" style="font-family:'微軟正黑體';font-weight:800;color:orange;">姓 名</label>
						  <input id="fullname" placeholder="Full name" type="text" name="name" value="科比布萊恩" autocomplete="off" class="form-control"  style="font-family:'微軟正黑體';color:BLUE;font-weight:800;"/>
					 	  <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            			  <span class="sr-only">(error)</span>
					  </div>					
					  <div class="row">
		                  <div class="form-group col-xs-6">
							  <label class="control-label" for="expire_mm" style="font-family:'微軟正黑體';font-weight:800;color:orange;">期 限(月)</label>
							  <select id="expire_mm" class="form-control" style="font-family:'微軟正黑體';color:BLUE;font-weight:800;"></select>		  
						  </div>
						  <div class="form-group col-xs-6">
							  <label class="control-label" for="expire_yy" style="font-family:'微軟正黑體';font-weight:800;color:orange;">期 限(西元年)</label>
							  <select id="expire_yy" class="form-control" style="font-family:'微軟正黑體';color:BLUE;font-weight:800;"></select>   
						  </div>
					  </div>	
					  <div class="form-group has-feedback">
						  <label class="control-label" for="cvc" style="font-family:'微軟正黑體';font-weight:800;color:orange;" >代 碼(CVC)</label>
						  <input id="cvc" placeholder="CVC" type="text" name="cvc" class="form-control" value="346" autocomplete="off" pattern=".{3,}" style="color:BLUE;font-weight:800;"/>
					  	  <span class="glyphicon form-control-feedback" aria-hidden="true"></span>
            			  <span class="sr-only">(error)</span>
					  </div>
					 <div class="form-group has-feedback col-xs-6">
						  <label class="control-label" for="NTD" style="font-family:'微軟正黑體';font-weight:800;color:#00CACA;font-size:10px">購買金額 (1 NT$ : 100 P)</label>
						  <input id="NTD" placeholder="購買金額(NT)" type="text" name="NTD" class="form-control" value="990" autocomplete="off" style="color:BLUE;font-weight:800;"/>
					  	  <span class="glyphicon form-control-feedback" aria-hidden="true" style="padding-right:15px;"></span>
            			  <span class="sr-only">(error)</span>
					  </div>
					  <div class="form-group col-xs-6">
						  <label class="control-label" for="coin" style="font-family:'微軟正黑體';font-weight:800;color:#00CACA;font-size:10px;">代幣數量</label>
						  <input id="coin" placeholder="代幣數量" type="text" name="coin" class="form-control" readonly="readonly" style="color:DARKGREEN;font-weight:800;"/>
					  </div>
	            </form>
	    </div>
	    <!-- ***************************【 購買點數 - 信用卡 dialog 結束】***************************** -->
	    
	    <!-- *************************【先發球員Dialog 開始】******************************* -->
			<div id="start5" class="myImage" align="center">
				<table style="display:table-cell;">	
				</table>
			</div>
	    <!-- *************************【先發球員Dialog 結束】******************************* -->
		<!-- <h5 id="state" style="color:orange;">Test</h5> --><!-- 測試長連線 -->
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
       <script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> 
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/slicePage/js/jquery.paginate.js"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/datePicker/js/zebra_datepicker.js"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/datePicker/js/core.js"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/notiny/js/notiny.min.js"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/credit_card/js/jquery.card.js"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/credit_card/js/js_timeStamp.js"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/boostrapAlert/js/bootstrapAlert.min.js"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/plugins/lobibox/dist/js/lobibox.js"></script>
	   <script src="<%=request.getContextPath()%>/_5_gambling/util_js/util.js"></script>
       <jsp:include page="/_5_gambling/util_js/Ajax_LongPolling.jsp"/><!-- LongPolling(放jquery之後) -->

       <script type="text/javascript">
       		//=== 偵測user按下哪個按鈕 : funFlag ===
            var funFlag = "<%=request.getAttribute("funFlag")%>";    
            var myDialog , cardDialog;
            //alert( funFlag );
       		$(function(){       	

       			/************************************************************************************/ 
       			/*   背景偷偷做 Ajax_LongPolling.js/jsp 持續發請求給 RoutineTask.java(RESTservice)  */ 
       			/*   → 長連接 效果                                                                 */ 
       			/************************************************************************************/

       			
       			/* =========================== 【點隊徽顯示先發名單 開始】 ================================ */
       			
       			$("#tableDiv > table > tbody > tr:nth-child(odd) td:first-child").click(function(){ //點擊左邊(away)隊徽時

					var awayName = $(this).parent("tr").next('tr').find('h4').eq(0).text();
					
					$.ajax({
						 "type":"POST",//傳遞方式				
<%-- 	                	 "url" :"<%=request.getContextPath()%>" + "/_5_gambling"+ "/NbaTeam_Ajax_Servlet.do" , --%>
	               		 "url" :"<%=request.getContextPath()%>" + "/RESTservices"+ "/nbaSvc/" + awayName , /* 呼叫NBATeamService.java的 REST→getByTeamNameREST */
	               		 "dataType":"json",//Servlet回傳格式
// 	               		 "data":{"action" : "starting5" , "searchName" : awayName},
	      				 "success":function(dataJson){
	      					//alert(dataJson.start5URL);
	      					var url_start5 = dataJson.start5URL;
	      					
		      				myStart5_Dialog(url_start5);
			      		 },
			      		 "error":function(){
				      			BootstrapAlert.info({ //BootstrapAlert 特效
		 			                title: "網路忙線中",
		 			                message: "請稍候",
		 			                hideTimeout: 1800,
		 			        	});
				         }
					})

           		})
           		$("#tableDiv > table > tbody > tr:nth-child(odd) td:last-child").click(function(){//點擊右邊(home)隊徽時

           			var homeName = $(this).parent("tr").next('tr').find('h4').eq(1).text();

					$.ajax({
						 "type":"POST",//傳遞方式				
<%-- 	                	 "url" :"<%=request.getContextPath()%>" + "/_5_gambling"+ "/NbaTeam_Ajax_Servlet.do" , --%>
	               		 "url" :"<%=request.getContextPath()%>" + "/RESTservices"+ "/nbaSvc/" + homeName , /* 呼叫NBATeamService.java的 REST→getByTeamNameREST */
	               		 "dataType":"json",//Servlet回傳格式
// 	               	     "data":{"action" : "starting5" , "searchName" : homeName},
	      				 "success":function(dataJson){
	      					//alert(dataJson.start5URL);
	      					var url_start5 = dataJson.start5URL;
		      				myStart5_Dialog(url_start5);
			      		 },
			      		 "error":function(){
				      			BootstrapAlert.info({ //BootstrapAlert 特效
		 			                title: "網路忙線中",
		 			                message: "請稍候",
		 			                hideTimeout: 1800,
		 			        	});
				         }
					})
					
           		})
           		var myStart5_Dialog = function( imageURL ){

					var myTable = $("#start5 > table");
					var myTr    = $("<tr></tr>").attr({"height":"95"});
					myTr.attr({"align":"center","valign":"middle"}).appendTo( myTable );
					var cell1   = $("<td></td>").attr({"width":"200px"}).css({"border-bottom" :"1px solid gray"}).appendTo( myTr ); 
					var cell2   = $("<td></td>").attr({"width":"500px","align":"center"}).css({"border-bottom" :"1px solid gray"}).appendTo( myTr );
               		
               		$("<img></img>").attr( {"src" : "<%=request.getContextPath()%>/_5_gambling/image/NBA_teamLogo/" + (imageURL.substr(14)) ,
               								"width":"80px","text-align":"left"})
               						.css({"display":"block","margin-left":"0"})
               		.appendTo( cell1 );

       				$("<img></img>").attr( {"src"   : "<%=request.getContextPath()%>/_5_gambling" + imageURL  , 
       										"width" : "630px"}).css({"display":"block"})
       				.appendTo( cell2 );
       								
											
       				$("#start5").css('zIndex',8000).dialog({
						title: "先發五人",
    	                show : { effect :'fadeIn', duration: 1000 },
    	                hide : { effect :'fadeOut', duration: 500 },
         	            //height: 400,
    	                width: 580,
    	                resizable: "auto",
    	                position: { my: "left bottom", at: "center center", of: $("#dialog-div") },
    	                close:function(){
							$(this).find("tr").remove();// 關閉時移除舊的先發名單
        	            }
           			});
                }
       			/* =========================== 【點隊徽顯示先發名單 結束】 ================================ */

       			
       			/* ================ 【下注 開始】 ================= */
     			 /* ==== ﹝ 下注金額 spinner ﹞begin === */
         		  $("#awayCoins").spinner({
                      "step": 100,
                      "min" : 0
                  });
         		  $("#homeCoins").spinner({
                      "step": 100,
                      "min" : 0
                  });
         		/* ==== ﹝ 下注金額 spinner ﹞ end ==== */
       			
       			$("#myTable").find('button').click(function(){
       				//alert($(this)); // <button>
       				var inputsHidden = $(this).siblings('input:hidden'); // <button> 同層的所有 <input hidden..>       
       				var battleId 	 = inputsHidden[0].value ;
       				        				
	       			 //--- 按下【下注】按鈕ajax撈資料 開始 ---
	   				 $.ajax({
	   					 "type":"POST",//傳遞方式				
	               		 "url" :"<%=request.getContextPath()%>" + "/_5_gambling/" + 'BattleSet_Ajax_Servlet.do',
	               		 "dataType":"json",//Servlet回傳格式
	               		 "data":{ "action"     : 'queryByBattleSetId' ,  
	               			 	  "battleId"   :  battleId 
	               		  },
	      				 "success":function(dataVO){
	      					 
	      					var battleId     = dataVO.battleId;
	      					var awayName 	 = dataVO.away.teamName ;
	      					var homeName     = dataVO.home.teamName ;
	      					var awayLogoUrl  = dataVO.away.teamLogoURL ;
	      					var homeLogoUrl  = dataVO.home.teamLogoURL ;
	      					var battleTime   = dataVO.battleTime ; 
	      					var awayScore    = dataVO.awayScore ; 
	      					var homeScore    = dataVO.homeScore ;
	      					var awayBet 	 = dataVO.awaybet ;
	      					var homeBet 	 = dataVO.homebet ;
	      					var awayId 	     = dataVO.away.teamID ;
	      					var homeId 	     = dataVO.home.teamID ;
	      					  
	         				console.log("battleId " 	+ battleId);
	         				console.log("awayName " 	+ awayName);
	         				console.log("homeName " 	+ homeName);
	         				console.log("awayLogoUrl " 	+ awayLogoUrl);
	         				console.log("homeLogoUrl " 	+ homeLogoUrl);
	         				console.log("battleTime " 	+ battleTime);
	         				console.log("awayScore " 	+ awayScore);
	         				console.log("homeScore " 	+ homeScore);
	         				console.log("awayBet " 		+ awayBet);
	         				console.log("homeBet " 		+ homeBet);
	         				console.log("awayId " 		+ awayId);
	         				console.log("homeId " 		+ homeId);
	      					  
	      					$("#battleId_choosed").val(battleId);// input hidden
	           				$("#awayId").val(awayId);// input hidden
	           				$("#homeId").val(homeId);// input hidden
	           				$("#row1 img:eq(0)").attr('src', "<%=request.getContextPath()%>" + "/_5_gambling" +  awayLogoUrl);
	           				$("#row1 img:eq(2)").attr('src', "<%=request.getContextPath()%>" + "/_5_gambling" +  homeLogoUrl);
	           				$("#row2 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + awayName + "</h4>");
	           				$("#row2 td:eq(2)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + homeName + "</h4>");
	           				$("#row3 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>"+ "比賽時間：" + battleTime.substring(0,16) + "</h4>");
	           				$("#row4 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + awayScore + "</h4>");
	           				$("#row4 td:eq(2)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + homeScore + "</h4>");
	           				$("#row5 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + awayBet + "</h4>");
	           				$("#row5 td:eq(2)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + homeBet + "</h4>");
	       				 
	           	
	           				/*─────────────  判斷是否已分派彩金 開始 ───────────── */
	         				 switch( (awayScore + homeScore) == 0 ) // 若兩隊比分相加為 0 → 兩隊皆0分 → 表示"未"分配彩金&更新比數 
	         				 {
	         					 case false:
 		         					 	//alert("已分配");
		         						$("#confirmBet").attr("disabled",true); // 設定﹝確認下注﹞不能按
	           							$("#row2 td:eq(1)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:orange;'>" + "比賽結束" + "</h4>");
			         			     break;
	         					 case true:
 	         					 		//alert("未分配");
	         						  /*─────── 判斷目前時間vs比賽時間 開始 ─────── */
		   	           				 	if( compareDateTime( timeStamp()/*現在時間*/ , battleTime/*比賽時間*/ ) > -10 ){
		   	           						//alert("距比賽開始 < 10分鐘，不可下注");
			   	           					$("#confirmBet").attr("disabled",true); // 設定﹝確認下注﹞不能按
			   	           					$("#row2 td:eq(1)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:orange;'>" + "比賽結束" + "</h4>");
			   	           				}else{
			   	           					//alert("距比賽開始 > 10分鐘，可下注");
			   	           					$("#confirmBet").attr("disabled",false);// 設定﹝確認下注﹞可按
			   	           					$("#row2 td:eq(1)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:orange;'>" + "即將開賽" + "</h4>");
		   	           					 }
		   	    					 /*─────── 判斷目前時間vs比賽時間 結束 ─────── */
	         					 	 break;
		         				 default:
			         				 break;		 
		         		     }
	         				/*─────────────  判斷是否已分派彩金 結束 ─────────── */	 
	
       					 }
	   				 })
	   				 //--- 按下【下注】按鈕ajax撈資料 結束 ---
					 myDialog.dialog("open");
       			})
       			/* ================ 【下注 結束】 ================= */
       			/* ================ 【下注 Dialog 開始】 ================= */
//        		var myDialog, form;
         		var form;
	            myDialog = $("#dialog-div").dialog({
	                autoOpen: false,
	                show : { effect :'fold', duration: 1000 },
	                hide : { effect :'slide', duration: 500 },
	                height: 750,
	                width: 500,
	                modal: true,
	                resizable: false,
	                position: { my: "center", at: "center", of: window }, /* dialog 起始彈出位置 */
	                buttons:[{
	                			'id'    : 'confirmBet',
	                			'text'  : "確認下注",
	                			'class' : "btn btn-danger",
	                			'click' : function()
	                			 {
		                			 if( $("#awayCoins").val()==0 && $("#homeCoins").val()==0){ //判斷是否兩隊下注金額皆=0
		                				  BootstrapAlert.alert({ //BootstrapAlert 特效
					 			                title: "Inofrmation",
					 			                message: "下注金額不可為 0 ",
					 			                hideTimeout: 1800,
					 			          });
					                 }else
						             {
		                				 //alert('hi');	
		                				 //alert(($("#row3 td:eq(0) > h4").text()).substring(5) + ":00");
		                				 //---
		                				 $.ajax({
		                					 "type":"POST",//傳遞方式				
		                             		 "url" :"<%=request.getContextPath()%>" + '/_5_gambling/' + 'BattleSet_Ajax_Servlet.do',
		                             		 "dataType":"text",//Servlet回傳格式
		                             		 "data":{ "action"     : 'gamblingUpdate' ,   /* data : 由dialog格子取得場次及輸入的資料 */
		                             			 	  "battleId"   : $("#battleId_choosed").val() ,
		                             			 	  "awayName"   : $("#row2 td:eq(0) > h4").text(),
		                             			 	  "homeName"   : $("#row2 td:eq(2) > h4").text(),
		                             			 	  "battleTime" :($("#row3 td:eq(0) > h4").text()).substring(5) + ":00" , // 拆掉"比賽時間："字串，並串上 ":00" 秒數供 java.sql.TimeStamp.valueOf()用
		                             			 	  "awayScore"  : $("#row4 td:eq(0) > h4").text(),
		                             			 	  "homeScore"  : $("#row4 td:eq(2) > h4").text(),
		                             			 	  "awayBet"    : $("#row5 td:eq(0) > h4").text(),
		                             			 	  "homeBet"    : $("#row5 td:eq(2) > h4").text(),
		                             			 	  "awayId"     : $("#awayId").val(),// input hidden
		                             			 	  "homeId"	   : $("#homeId").val(),// input hidden
		                             			 	  "awayCoins"  : $("#awayCoins").val(),
		                             			 	  "homeCoins"  : $("#homeCoins").val(),
		                             			 	  "betTime"    : timeStamp()  // 會員下注時間
		                             		  },
		                    				 "success":function(data){
													
													switch(  $.trim(data)  ){
														case 'shortage':
															//alert(" 餘額不足，請【儲值】或【減少下注金額】 !!! ");
															BootstrapAlert.alert({
												                title: "Sorry!",
												                message: " 餘額不足，請【儲值】或【減少下注金額】 !!! "
												            });
														  break;											
														default:/*下注成功*/
															//alert("Session中會員剩餘點數 : " + data);
				                    						$.notiny({/* notiny 特效*/
			                        	 	                    theme:'dark',
			                        	 	                    text: '下注成功！',
			                        	 	                    image: 'http://cdn.imgs.tuts.dragoart.com/how-to-draw-the-nba-logo_1_000000001129_3.jpg',
			                        	 	                    delay: 1200,
			                        	 	                    animation_show: 'notiny-animation-show 0.5s forwards',
			                        	 	                    animation_hide: 'notiny-animation-hide 0.5s forwards' 
			                        	 					});
				                    						//【下注成功 → 修改右上方登入會員圖示的點數】
			 	                    						$("a.point").text("點數餘額："+ data + " 點 ");
													     break;
													}
		                    				 }
		                				 })
		                				 //---
											if($('#start5').is(':ui-dialog')) {//關閉先發名單Dialog
													$("#start5").dialog("close");
											}
		                				    // 關閉下注 dialog
		                					myDialog.dialog("close");
								     }

	                			 }
	                		 },
	                		 {
	                			 	'text' : "取消",
		                			'class': "btn btn-primary",
		                			'click' : function()
		                			 {

										if($('#start5').is(':ui-dialog')) {//關閉先發名單Dialog
											$("#start5").dialog("close");
										}
										 // 關閉下注 dialog
		                				 myDialog.dialog("close");
		                			 }
	                		 }
	                ]
	                ,
	                close: function () {

	                  	if($('#start5').is(':ui-dialog')) {//關閉先發名單Dialog
							$("#start5").dialog("close");
						}

	                    form[0].reset();
	                }
	            });
	
	            form = myDialog.find("form").on("submit", function (event) {
	                event.preventDefault();
	            });
       			/* ================ 【下注 Dialog 結束】 ================= */
       			/* ======== 【購買代幣按鈕】 ======= */
       			$("#buyCoin").click(function(){
       				cardDialog.dialog('open');
       			})
       			/* ======== 【購買代幣按鈕】 ======= */
       			/*=====================【信用卡textBox驗證 開始】=====================*/
       			//  ______________ 檢查所有欄位是否都填入 開始 ______________
       			var cardnumberInput = $("#cardnumber");
       			var fullNameInput   = $("#fullname");
       			var cvcInput        = $("#cvc");
       			var ntdInput        = $("#NTD");
       			var coinText        = $("#coin");	
       			
       			var isAllFilled = function(){

	       		     if(cardnumberInput.val() == "empty" || cardnumberInput.val() == ""){
	       		    	 cardnumberInput.parent('div').switchClass('has-success','has-error');
	       		    	 cardnumberInput.next('span').switchClass('glyphicon-ok','glyphicon-remove');
	    			 }else{
	    				 cardnumberInput.parent('div').switchClass('has-error','has-success');
	    				 cardnumberInput.next('span').switchClass('glyphicon-remove','glyphicon-ok');
	    			 }
       			     if(fullNameInput.val() == "empty" || fullNameInput.val() == ""){
       			    	 fullNameInput.parent('div').switchClass('has-success','has-error');
       			    	 fullNameInput.next('span').switchClass('glyphicon-ok','glyphicon-remove');
        			 }else{
        				 fullNameInput.parent('div').switchClass('has-error','has-success');
        				 fullNameInput.next('span').switchClass('glyphicon-remove','glyphicon-ok');
        			 }
       			   	 if(cvcInput.val() == "empty" || cvcInput.val() == ""){
	       			   	 cvcInput.parent('div').switchClass('has-success','has-error');
	       			 	 cvcInput.next('span').switchClass('glyphicon-ok','glyphicon-remove');
      			 	 }else{
      			 		 cvcInput.parent('div').switchClass('has-error','has-success');
      			 		 cvcInput.next('span').switchClass('glyphicon-remove','glyphicon-ok');
      			 	 }
      				 if(ntdInput.val() == "empty" || ntdInput.val() == "" || ntdInput.val() == 0 ){
      					 ntdInput.parent('div').switchClass('has-success','has-error');
      					 ntdInput.next('span').switchClass('glyphicon-ok','glyphicon-remove');
      					 coinText.val(0);// 點數textBox 設 0
      			 	 }else{
      			 		 ntdInput.parent('div').switchClass('has-error','has-success');
      			 		 ntdInput.next('span').switchClass('glyphicon-remove','glyphicon-ok');
      			 		 coinText.val( ntdInput.val() * 100 );// 點數textBox 設 0
      			 	 }
 
       				 falgNumber = ( cardnumberInput.val() == "empty" || $.trim( cardnumberInput.val() ) == "" ) ? false : true;
       				 flagName   = ( fullNameInput.val()   == "empty" || $.trim( fullNameInput.val() )   == "")  ? false : true;
       				 flagCvc    = ( cvcInput.val()        == "empty" || $.trim( cvcInput.val() )        == "")  ? false : true;
       				 falgNtd    = ( ntdInput.val()        == "empty" || $.trim( ntdInput.val() )        == 0 )  ? false : true;
       				 return falgNumber && flagName && flagCvc && falgNtd ;
       			}
       			//  ______________ 檢查所有欄位是否都填入 結束 ______________
       			// onClick 、 blur 時動作↓↓↓↓↓↓↓↓↓↓↓
  				$("#cardnumber").click(function(){$(this).val("")}).blur(function(){
  					if($(this).val()==""){
						$(this).val('empty').css({'color':'red' , 'font-style':'italic'});
						$(this).parent('div').switchClass('has-success','has-error');
						$(this).next('span').switchClass('glyphicon-ok','glyphicon-remove');
					}
  					else{
  						$(this).css({'color':'blue' , 'font-style':'normal'});
  						$(this).parent('div').switchClass('has-error','has-success');
  						$(this).next('span').switchClass('glyphicon-remove','glyphicon-ok');
  					}
  				}).keyup(function(){// 檢查是否都填寫
  					if(isAllFilled()){
                		$("#confirm").attr("disabled",false);
                	}else{
                		$("#confirm").attr("disabled",true);
                	}
  	  			})
  				
  				$("#fullname").click(function(){$(this).val("")}).blur(function(){
  					if($(this).val()==""){
						$(this).val('empty').css({'color':'red' , 'font-style':'italic'});
						$(this).parent('div').switchClass('has-success','has-error');
						$(this).next('span').switchClass('glyphicon-ok','glyphicon-remove');
					}
  					else{
  						$(this).css({'color':'blue' , 'font-style':'normal'});
  						$(this).parent('div').switchClass('has-error','has-success');
  						$(this).next('span').switchClass('glyphicon-remove','glyphicon-ok');
  					}
  				}).keyup(function(){ return ValidateChi_Eng(this,$(this).val())} /*限定中英文*/)
  				.keyup(function(){// 檢查是否都填寫
  					if(isAllFilled()){
                		$("#confirm").attr("disabled",false);
                	}else{
                		$("#confirm").attr("disabled",true);
                	}
  	  			})
  				
  				$("#cvc").click(function(){$(this).val("")}).blur(function(){
  					if($(this).val()==""){
						$(this).val('empty').css({'color':'red' , 'font-style':'italic'});
						$(this).parent('div').switchClass('has-success','has-error');
						$(this).next('span').switchClass('glyphicon-ok','glyphicon-remove');
					}
  					else{
  						$(this).css({'color':'blue' , 'font-style':'normal'});
  						$(this).parent('div').switchClass('has-error','has-success');
  						$(this).next('span').switchClass('glyphicon-remove','glyphicon-ok');
  					}
  				}).keyup(function(){
  					if(isAllFilled()){// 檢查是否都填寫
                		$("#confirm").attr("disabled",false);
                	}else{
                		$("#confirm").attr("disabled",true);
                	}
  	  			})
  				
  				
  				$("#NTD").click(function(){$(this).val("");$("#coin").val(0)}).blur(function(){
  					if($(this).val()==""){
						$(this).val('empty').css({'color':'red' , 'font-style':'italic'});
						$(this).parent('div').switchClass('has-success','has-error');
						$(this).next('span').switchClass('glyphicon-ok','glyphicon-remove');
					}
  					else{
  						$(this).css({'color':'blue' , 'font-style':'normal'});
  						$(this).parent('div').switchClass('has-error','has-success');
  						$(this).next('span').switchClass('glyphicon-remove','glyphicon-ok');
  					}
  				}).keyup(function(){ return ValidateFloat2(this,$(this).val())} /*可以輸入小數點（限制小數點後一位)*/)
  				.keyup(function(){
  					if(isAllFilled()){
                		$("#confirm").attr("disabled",false);
                	}else{
                		$("#confirm").attr("disabled",true);
                	}
  	  			})
  				
  				
  				/*格式驗證function : 可以輸入小數點（限制小數點後一位)*/
  				function ValidateFloat2(e, pnumber)
				{
				    if (!/^\d+[.]?[1-9]?$/.test(pnumber))
				    {
				        e.value = /\d+[.]?[1-9]?/.exec(e.value);
				    }
				    return false;
				}
  				/*格式驗證function : 只可輸入中英文*/
  				function ValidateChi_Eng(e, input)
				{
				    if (!/^[\u0391-\uFFE5A-Za-z]+$/.test( input ))
				    {
				        e.value = /^[\u0391-\uFFE5A-Za-z]+$/.exec(e.value);
				    }
				    return false;
				}
  				/*格式驗證function : 只可輸入數字 (套在卡號欄位會怪怪的)*/
//   				function ValidateNumber(e, input){
//   					if (!/^\d+$/.test( input ))
//   				    {
//   				        $(e).val(/^\d+/.exec($(e).val()));
//   				    }
//   				    return false;
//   	  			}
  				/*=====================【信用卡textBox驗證 結束】=====================*/
       			
       			
       			/* ================ 【信用卡 Dialog 開始】 ======================= */
				var formCard;
	       		cardDialog = $("#dialog-card").dialog({
	                'autoOpen': false,
	                'show' : { effect :'fold' , duration: 1000 },
	                'hide' : { effect :'blind', duration: 500 },
	                'height': 815,
	                'width': 500,
	                'modal': true,
	                'resizable': false,
	                'open': function(){
	                	var text_mm = $(this).find("select[id='expire_mm']"); //月份下拉選單
	                	var text_yy = $(this).find("select[id='expire_yy']"); //年份下拉選單
	                	text_mm.children('option').remove();// -- 移除舊有的 <option> 標籤
	                	text_yy.children('option').remove();// -- 移除舊有的 <option> 標籤
	                	for(var mm = 1 ; mm <= 12 ; mm++){
	                		if(mm < 10){
	                			mm = "0" + mm; // <10月,補"0"
	                		}
	                		var tmp = $("<option></option>").val(mm).text(mm);
	                		text_mm.append(tmp);
	                	}
	                	for(var yy = 2017 ; yy <= 2027 ; yy++){
	                		var tmp = $("<option></option>").val(yy).text(yy);
	                		text_yy.append(tmp);
	                	}
	                	if(isAllFilled()){// 檢察dialog欄位是否都輸入
	                		//$("#confirm").attr("disabled",false);
	                		$(this).next('div').find('button').attr("disabled",false);
	                		//alert($(this).next('div').find('button').prop('id'));   // confirm button
	                	}else{
	                		//$("#confirm").attr("disabled",true);
	                		$(this).next('div').find('button').attr("disabled",true); // confirm button
	                		//alert($(this).next('div').find('button').prop('id'));
	                	}
	                },
	              //position: { my: "center", at: "center" ,of: window }, /* dialog 起始彈出位置 */
	               'position':{my:"left top",at:"left top", of: $("#sidebar")},
	                buttons:[
	                          {
                           //"disabled" : true , 
                            	   "id" : "confirm",
	                        	 "text" : "確認購買",
                        	 	"class" : "btn btn-primary",
                        	 	"click" : function (){

		                  					if( !isAllFilled() ){
		        				      			BootstrapAlert.alert({ //BootstrapAlert 特效
		        		 			                title: "溫馨提醒",
		        		 			                message: "是否有欄位未填寫或為0",
		        		 			                hideTimeout: 2200,
		        		 			        	});
		                                		//$("#confirm").attr("disabled",false);
		                                	}else{
		                                		//$("#confirm").attr("disabled",true);
		                                	
                        	 		
		                        	 		   //alert($(this).prop('tagName') +" 確認" );
		                        	 		    var cardNum  = $("input[placeholder='Card number']").val();
		                        	 		    var fullName = $("input[placeholder='Full name']").val();
		                        	 		    var expireMM = $("#expire_mm").val();
		                        	 		    var expireYY = $("#expire_yy").val();
		                        	 		    var cvc      = $("input[placeholder='CVC']").val();
		                        	 		    var ntd      = $("input[placeholder='購買金額(NT)']").val();
		                        	 		    var coin     = $("input[placeholder='代幣數量']").val();
		                        	 		    var bookingTime = timeStamp();
		                        	 		    //alert(bookingTime);
		                        	 			//======================================================
		                        	 			//==============【傳送信用卡資訊到servlet】=============
		                        	 			//======================================================	
		                        	 				//alert($('#confirm').prop('id'));
		                        	 				console.log('cardNum  '     + cardNum);
		                        	 				console.log('fullName  '    + fullName);
		                        	 				console.log('expireMM  '    + expireMM);
		                        	 				console.log('expireYY  '    + expireYY);
		                        	 				console.log('cvc  '         + cvc);
		                        	 				console.log('ntd  '         + ntd);
		                        	 				console.log('coin  '        + coin);
		                        	 				console.log('bookingTime  ' + bookingTime);
		                        	 			$.ajax({
		                        	 				"type" : "POST",                        	 				
		                        	 				"url"  :"<%=request.getContextPath()%>" + "/_5_gambling/" + 'GoodsOrder_Ajax_Servlet.do',
		                        	 				"dataType":"text",//Servlet回傳格式
		                        	 				"data" : { 
		                        	 						   'action'      :  'buyCoins'  , 
		                        	 						   'cardNum'     :   cardNum    ,
		                        	 						   'fullName'    :   fullName   ,
		                        	 						   'expireMM'    :   expireMM   ,
		                        	 						   'expireYY'    :   expireYY   ,
		                        	 						   'cvc'         :   cvc        ,
		                        	 						   'ntd'         :   ntd        ,
		                        	 						   'coin'        :   coin       ,
		                        	 						   'bookingTime' :   bookingTime   //下訂時間(call from js_timestamp.js)
		                        	 				},
		                        	 				"success" : function(data){/* Servlet回應成功 */
		                        	 					//alert('hello' + data );
		
		                        	 					switch(  $.trim(data)  ){
															case 'exception':
																//alert(" 下訂發生例外，請稍候 ");
																BootstrapAlert.alert({
													                title: "Sorry!",
													                message: " 下訂發生例外，請稍候 "
													            });
															  break;											
															default:/*下注成功*/
																//alert("Session中會員剩餘點數 : " + data);
																BootstrapAlert.warning({ //BootstrapAlert 特效
				                        	 			                title: "訂單成立!",
				                        	 			                message: "已為您儲值點數",
				                        	 			                hideTimeout: 1800,
				                        	 			                //parentClass: 'bootstrap-alert',
				                        	 			       			//innerClass:  'bootstrap-alert-message'
				                        	 			        });
				                        	 					//【購買點數成功 → 修改右上方登入會員圖示的點數】
				 	                    						$("a.point").text("點數餘額："+ data + " 點 ");
														     break;
														}	         	 			        
		                        	 				},
		                        	 				"error" : function(){/* Servlet回應錯誤 */
		                        	 					//alert('下訂失敗');
		        						      			BootstrapAlert.info({ //BootstrapAlert 特效
		        				 			                title: "下訂失敗",
		        				 			                message: "網路忙線中~請稍候 ^^",
		        				 			                hideTimeout: 1800,
		        				 			        	});
		                        	 				}
		                        	 			})
		                        	 			//======================================================
		                                    	cardDialog.dialog("close");/*關閉 dialog*/
		                                	}
								 	}/*click*/
	                         }/*buttons*/  ,
	                         {
                        	 	 text  : "取消",
                        	 	'class' : "btn btn-info",
                        	 	 click : function (){
                        	 		 //alert($(this).prop('tagName')+"cancel");                        	 		 
                                     cardDialog.dialog("close");/*關閉 dialog*/
								 }
                         	 }
	                         
	               ] ,
	
	                close: function () {
	                	formCard[0].reset();
	                }
	            });
	
	       		formCard = cardDialog.find("form").on("submit", function (event) {
	                event.preventDefault();
	            });

       			/* ================ 【信用卡 Dialog 結束】 ======================= */
       				
       				/* key-in 台幣 => 轉代幣  */
					$("input[placeholder='購買金額(NT)']").keyup(function(){ 
						$("input[placeholder='代幣數量']").css('color','red').val($(this).val() * 100 /* 代幣比值 */);
					})
       			   	//------------ ﹝信用卡本體 開始﹞ --------------
		            $('#dialog-card').card({
		                // a selector or DOM element for the container
		                // where you want the card to appear
		                container: '.card-wrapper', // *required*
		                // all of the other options from above
		            });
		           //------------ ﹝信用卡本體 結束﹞ --------------
       			
       			/* ========================================================================= */
       			/* ========================= 【DatePicker 開始】 =========================== */
       			/* ========================================================================= */
       		    $('#myDatepicker').Zebra_DatePicker({

       		        always_visible: $('#dateBox') ,
       		    	onSelect:function(){
       		    		
       		    		//******** 判斷user按下按鈕的flag *********
    	   				funFlag = 'byDatePicker';
    					//alert( funFlag );
    	   				//*****************************************
       		    		var chooseDate = $(this).val(); // user 選擇的日期 
       		    		// 更改pageHeader日期
       		    		var pageHeader = $("div.page-header");
   	       				pageHeader.children('h2').remove();
   	       				pageHeader.append("<h2><strong style='font-family:微軟正黑體;font-weight:bolder;color:orange;'>" + chooseDate + "</strong></h2>");	

       		    		$.ajax({
       		    			"type":"POST",//傳遞方式				
                    		"url" :"<%=request.getContextPath()%>" + '/_5_gambling/' + 'BattleSet_Ajax_Servlet.do',
                    		"dataType":"text",//Servlet回傳格式
                    		"data":{ "action" : "queryCountByDate" ,"datepickerDate" : chooseDate },
           					"success":function(countData){

           						/**【按下Datepicker → 先查詢一次 pageNo=1 】**/
	           					myAjaxFunction( "BattleSet_Ajax_Servlet.do" , "queryByDateAndPage" , "" , chooseDate , 1 );
           				
				           		/* ==================== 【分頁開始】 =================== */
				           		//....計算總頁數...
 				           		//alert("日期對應的總場數 =  " + countData ); //日期對應的總場數
          						var totalPages = ( $.trim(countData) % 3 == 0) ? (countData/3) : (Math.floor(countData/3) + 1 ); /* 總頁數 */          				
             					//alert('共 ' + totalPages + '頁');
           						//-----------------
				       			$("#slicePage").paginate({		              	             
						                count: totalPages,/* 總頁數 = 查到的資料/每頁顯示筆數 ， (1)若是由dispatcher跳轉：${battleSetList_len}，(2)若是Ajax查詢到的總筆數，在對應的$.ajax中設定 totalCount 全域變數*/
						                start: 1,
						                display: 10,
						                border: true,
						                text_color: 'rgb(93, 213, 83)',
						                background_color: 'rgb(40, 46, 67)',
						                text_hover_color: 'rgb(234, 57, 57)',
						                background_hover_color: '#00BBFF',
						                onChange: function (pageNo) {  /* pageNo → 當前頁數 */   //alert(pageNo); 

						                	myAjaxFunction( "BattleSet_Ajax_Servlet.do" , "queryByDateAndPage" , "" , chooseDate , pageNo );// 根據點擊頁碼按鈕的 pageNo 查詢
						                }
						        });
				       			/* ==================== 【分頁結束】 =================== */
           					}
       		    		})
       		    	}       		      
       			});
       			/* ========================================================================= */
       			/* ========================= 【DatePicker 結束】 =========================== */
       			/* ========================================================================= */
       
       			/* ================ 【隊名Auto-complete】 ================= */
				$("#searchName").keyup(function(){
					
					var input = $(this).val(); // textbox 輸入值
					$.ajax({
						"type":"post",//傳遞方式				
                		"url" :"<%=request.getContextPath()%>" + "/_5_gambling/" + 'NbaTeam_Ajax_Servlet.do',
                		"dataType":"json",//Servlet回傳格式
                		"data":{ "action": "autoComplete"  ,"searchName" : input },
       					"success":function(data){
        					//console.log(data);
        					var parentDIV = $("#searchName").parent();
        					parentDIV.children("button").remove();// 移除→避免backspace建立過多<Button>
        					$.each(data , function(index , obj){	       						
        						var tBtn = $('<button></button>').addClass("list-group-item").text( obj.teamName );
        						//=== ﹝註冊事件開始﹞ ===//
	       						tBtn.click(function(event){
	       							event.preventDefault();// 防止Button點擊直接link到空白頁
	       							$("#searchName").val( tBtn.text() );
	       							parentDIV.children("button").remove();
	       						})
	       						//=== ﹝註冊事件結束﹞ ===//
	           			    	parentDIV.append(tBtn);        						        					        					
        					})
       					}
					})
					
				})
				/* ================ 【隊名Auto-complete 結束】 ================= */
				
				/* ================ 【隊名搜尋Button發出請求 開始】================= */
				$("#searchBtn").click(function(){
					
	   				//******** 判斷user按下按鈕的flag *********
	   				funFlag = 'byTeamName';
					//alert( funFlag );
	   				//*****************************************
					var searchName = $("#searchName").val(); // 搜尋textBox的值(隊名)
					$('#searchForm').attr({ 'ACTION':"<%=request.getContextPath()%>" + '/_5_gambling/' +
											'BattleSet_Servlet.do?'+
											'action=queryByName'+'&teamName='+ searchName +'&funFlag='+ funFlag , 
					  'METHOD':'POST'}).submit();
				})
				/* ================ 【隊名搜尋Button發出請求 結束】================= */
				
       			/* ==================== 【分頁開始】由index.html進入時先呼叫這支  =================== */
       			$("#slicePage").paginate({
		                count: "${battleSetList_len}",/* 分頁的總筆數 = 查到的資料/每頁顯示筆數 */
		                start: 1,
		                display: 10,
		                border: true,
		                text_color: 'rgb(93, 213, 83)',
		                background_color: 'rgb(40, 46, 67)',
		                text_hover_color: 'rgb(234, 57, 57)',
		                background_hover_color: '#00BBFF',
		                onChange: function (pageNo) {  /* pageNo → 當前頁數 */   //alert(pageNo); 
		               
			                //alert(funFlag); // 判斷使用者按下哪個按鈕
			                //alert(totalCount);
			                //===﹝ 根據 funFlag 決定 呼叫哪支 controller 的 action ﹞===
			                var actionName = "";       
			                var ajaxUrl    = "";
			                var searchName = "";
			                var chooseDate = "";
			                switch ( funFlag ) {
								case "byTeamName":
									actionName = "queryByNameAndPage";
									ajaxUrl    = "BattleSet_Ajax_Servlet.do";
									searchName = $("#searchName").val();   // 查詢的隊伍名稱;
									break;
								/*case "byDatePicker":
									actionName = "queryByDateAndPage";
									ajaxUrl    = "BattleSet_Ajax_Servlet.do";
									chooseDate = $("#myDatepicker").val(); // user 選擇的日期
									break;*/
								default:
									/*=== user都沒選擇動作→直接查〈當天〉===*/
									actionName = "queryByDateAndPage";
									ajaxUrl    = "BattleSet_Ajax_Servlet.do";
									break;
							}
	
			        		myAjaxFunction( ajaxUrl , actionName , searchName , "" , pageNo );// 呼叫﹝撈分頁資料 $.ajax function﹞

		                }
		        });
       			/* ==================== 【分頁結束】 =================== */
       		})
       		
       		//======================================================================================
       		//=========================【 撈分頁資料 $.ajax function 開始】=========================
       		//======================================================================================
       		function myAjaxFunction( var_ajaxUrl , var_actionName , var_searchName , var_searchDate , var_pageNo) {

	            	$.ajax({
	            		"type": "POST" ,  //傳遞方式				
	            		"url" :  "<%=request.getContextPath()%>" + "/_5_gambling/" + var_ajaxUrl , 
	            		"dataType":"json",//Servlet回傳格式
	            		"data":{ "action": var_actionName , "pageNo":var_pageNo , "searchName": var_searchName , "datepickerDate" : var_searchDate },
	            		"success":function(data){
	            			//console.log(data[0]);
	            			var tableDiv = $("#tableDiv");
	            			tableDiv.children('.table').remove();// 每次按下換頁，先移除舊資料
	            			var mytable =  $('<table></table>').addClass("table");
	    					var mybody  =  $('<tbody></tbody>');
	    					mytable.append(mybody);
	    				
							$.each(data , function( index , obj ){
								
								var img1    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + obj.away.teamLogoURL , 'width':150});										
								var img2    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + '/image/VS4.gif',      'width':70 });										
								var img3    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + obj.home.teamLogoURL , 'width':150});										
								var cell11  =  $('<td></td>');
								var cell12  =  $('<td></td>');
								var cell13  =  $('<td></td>');
								img1.appendTo(cell11);
								img2.appendTo(cell12);
								img3.appendTo(cell13);
							
								var myrow1  =  $('<tr></tr>').attr({'align':'center','valign':'middle'});
								var myrow2  =  $('<tr></tr>').attr({'align':'center','valign':'middle'});
								var cell21  =  $('<td></td>').html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + obj.away.teamName + "</h4>");
								var cell22  =  $('<td></td>').append("<Strong class='glyphicon glyphicon-time' style='padding-right:5px;color:white;'>&nbsp;" + obj.battleTime + "</Strong><p/>");
/*hidden 欄位 紀錄 battleSetId*/    cell22.append("<input  type='hidden' "+" value='"+ obj.battleId +"'/>") 
				/* 下注按鈕 */	    cell22.append("<button type='button' class='btn btn-warning' style='width:35px;height:35px;color:orange;font-size:14px;font-family:微軟正黑體;font-weight:800;vertical-align:baseline;'>下 注</button>");
								var cell23  =  $('<td></td>').html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + obj.home.teamName + "</h4>");
								myrow1.append([ cell11 , cell12 , cell13 ]);
								myrow2.append([ cell21 , cell22 , cell23 ]);
								
								myrow1.appendTo(mybody);
								myrow2.appendTo(mybody);
							})	
							tableDiv.append(mytable);// ！--表格建立完成--！


			///////////////////////////////////////【點擊隊徽顯示先發名單 開始】////////////////////////////////////////////////////
					$("#tableDiv > table > tbody > tr:nth-child(odd) td:first-child").click(function(){ //點擊左邊(away)隊徽時
	
						var awayName = $(this).parent("tr").next('tr').find('h4').eq(0).text();
						
						$.ajax({
							 "type":"POST",//傳遞方式				
		               	<%-- "url" :"<%=request.getContextPath()%>" + "/_5_gambling"+ "/NbaTeam_Ajax_Servlet.do" , --%>
		               		 "url" :"<%=request.getContextPath()%>" + "/RESTservices"+ "/nbaSvc/" + awayName , /* 呼叫NBATeamService.java的 REST→getByTeamNameREST */
		               		 "dataType":"json",//Servlet回傳格式
		               	   //"data":{"action" : "starting5" , "searchName" : awayName},
		      				 "success":function(dataJson){
		      					//alert(dataJson.start5URL);
		      					var url_start5 = dataJson.start5URL;
		      					myStart5_Dialog_forSlicePage( url_start5 );//自訂function : 動態建立先發名單 Dialog 
				      		 },
				      		 "error":function(){
					      			BootstrapAlert.info({ //BootstrapAlert 特效
			 			                title: "網路忙線中",
			 			                message: "請稍候",
			 			                hideTimeout: 1800,
			 			        	});
					         }
						})
	
	           		})
					$("#tableDiv > table > tbody > tr:nth-child(odd) td:last-child").click(function(){//點擊右邊(home)隊徽時

	           			var homeName = $(this).parent("tr").next('tr').find('h4').eq(1).text();
	
						$.ajax({
							 "type":"POST",//傳遞方式				
		                <%-- "url" :"<%=request.getContextPath()%>" + "/_5_gambling"+ "/NbaTeam_Ajax_Servlet.do" , --%>
		               		 "url" :"<%=request.getContextPath()%>" + "/RESTservices"+ "/nbaSvc/" + homeName , /* 呼叫NBATeamService.java的 REST→getByTeamNameREST */
		               		 "dataType":"json",//Servlet回傳格式
		               	   //"data":{"action" : "starting5" , "searchName" : homeName},
		      				 "success":function(dataJson){
		      					//alert(dataJson.start5URL);
		      					var url_start5 = dataJson.start5URL;
		      					myStart5_Dialog_forSlicePage(url_start5);//自訂function : 動態建立先發名單 Dialog 
				      		 },
				      		 "error":function(){
					      			BootstrapAlert.info({ //BootstrapAlert 特效
			 			                title: "網路忙線中",
			 			                message: "請稍候",
			 			                hideTimeout: 1800,
			 			        	});
					         }
						})
						
	           		})
				///////////////////////////////////////【點擊隊徽顯示先發名單 結束】////////////////////////////////////////////////////

							
							/*========== ﹝註冊分頁功能下，Button 的﹝下注 click﹞事件﹞開始 ==============*/
							tableDiv.find('button').click(function(){
								//================= 
								//alert("battleSetId = " + $(this).prev('input').val()); /* $(this)此時為<button> */
								//=================	       
									var battleId = $(this).prev('input').val(); // 呼叫<button>標籤前一個<input type='hidden'...的 value
			       				
				       			 //--- 按下【下注】按鈕ajax撈資料 開始 --- ◎◎內層Ajax → 下注 dialog ◎◎
				   				 $.ajax({
				   					 "type":"POST",//傳遞方式				
				               		 "url" :"<%=request.getContextPath()%>" + "/_5_gambling/" + 'BattleSet_Ajax_Servlet.do',
				               		 "dataType":"json",//Servlet回傳格式
				               		 "data":{ "action"     : 'queryByBattleSetId' ,  
				               			 	  "battleId"   :  battleId 
				               		  },
				      				 "success":function(dataVO){
				      					 
				      					var battleId     = dataVO.battleId;
				      					var awayName 	 = dataVO.away.teamName ;
				      					var homeName     = dataVO.home.teamName ;
				      					var awayLogoUrl  = dataVO.away.teamLogoURL ;
				      					var homeLogoUrl  = dataVO.home.teamLogoURL ;
				      					var battleTime   = dataVO.battleTime ; 
				      					var awayScore    = dataVO.awayScore ; 
				      					var homeScore    = dataVO.homeScore ;
				      					var awayBet 	 = dataVO.awaybet ;
				      					var homeBet 	 = dataVO.homebet ;
				      					var awayId 	     = dataVO.away.teamID ;
				      					var homeId 	     = dataVO.home.teamID ;
				      					  
				         				console.log("battleId " 	+ battleId);
				         				console.log("awayName " 	+ awayName);
				         				console.log("homeName " 	+ homeName);
				         				console.log("awayLogoUrl " 	+ awayLogoUrl);
				         				console.log("homeLogoUrl " 	+ homeLogoUrl);
				         				console.log("battleTime " 	+ battleTime);
				         				console.log("awayScore " 	+ awayScore);
				         				console.log("homeScore " 	+ homeScore);
				         				console.log("awayBet " 		+ awayBet);
				         				console.log("homeBet " 		+ homeBet);
				         				console.log("awayId " 		+ awayId);
				         				console.log("homeId " 		+ homeId);

				      					/* 查詢成功→將資料塞到dialog*/  
				      					$("#battleId_choosed").val(battleId);// input hidden
				           				$("#awayId").val(awayId);// input hidden
				           				$("#homeId").val(homeId);// input hidden
				           				$("#row1 img:eq(0)").attr('src', "<%=request.getContextPath()%>" + "/_5_gambling" +  awayLogoUrl);
				           				$("#row1 img:eq(2)").attr('src', "<%=request.getContextPath()%>" + "/_5_gambling" +  homeLogoUrl);
				           				$("#row2 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + awayName + "</h4>");
				           				$("#row2 td:eq(2)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + homeName + "</h4>");
				           				$("#row3 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>"+ "比賽時間：" + battleTime.substring(0,16) + "</h4>");
				           				$("#row4 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + awayScore + "</h4>");
				           				$("#row4 td:eq(2)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + homeScore + "</h4>");
				           				$("#row5 td:eq(0)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + awayBet + "</h4>");
				           				$("#row5 td:eq(2)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + homeBet + "</h4>");
				       				 
				   				 
				           				/*─────────────  判斷是否已分派彩金 開始 ───────────── */
				         				 switch( (awayScore + homeScore) == 0 ) // 若兩隊比分相加為 0 → 兩隊皆0分 → 表示"未"分配彩金&更新比數 
				         				 {
				         					 case false:
			 		         					 	//alert("已分配");
					         						$("#confirmBet").attr("disabled",true); // 設定﹝確認下注﹞不能按
				           							$("#row2 td:eq(1)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:orange;'>" + "比賽結束" + "</h4>");
						         			     break;
				         					 case true:
			 	         					 		//alert("未分配");
				         						  /*─────── 判斷目前時間vs比賽時間 開始 ─────── */
					   	           				 	if( compareDateTime( timeStamp()/*現在時間*/ , battleTime/*比賽時間*/ ) > -10 ){
					   	           						//alert("距比賽開始 < 10分鐘，不可下注");
						   	           					$("#confirmBet").attr("disabled",true); // 設定﹝確認下注﹞不能按
						   	           					$("#row2 td:eq(1)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:orange;'>" + "比賽結束" + "</h4>");
						   	           				}else{
						   	           					//alert("距比賽開始 > 10分鐘，可下注");
						   	           					$("#confirmBet").attr("disabled",false);// 設定﹝確認下注﹞可按
						   	           					$("#row2 td:eq(1)").html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:orange;'>" + "即將開賽" + "</h4>");
					   	           					 }
					   	    					 /*─────── 判斷目前時間vs比賽時間 結束 ─────── */
				         					 	 break;
					         				 default:
						         				 break;		 
					         		     }
				         				/*─────────────  判斷是否已分派彩金 結束 ─────────── */	 
				   				 
				   				 	 }
				   				 })
				   				 //--- 按下【下注】按鈕ajax撈資料 結束 ---
								 myDialog.dialog("open");
								//=================
							
							})
							/*========== ﹝註冊分頁功能下，Button 的﹝下注 click﹞事件﹞結束 ==============*/
	            		}
	            	})
			}      				      			
       		//======================================================================================
       		//=========================【 撈分頁資料 $.ajax function 結束】=========================
       		//======================================================================================
 
 			//=====================================【動態建立先發名單 Dialog 開始】================================================
            var myStart5_Dialog_forSlicePage = function( imageURL ){

					var myTable = $("#start5 > table");
					var myTr    = $("<tr></tr>").attr({"height":"95"});
					myTr.attr({"align":"center","valign":"middle"}).appendTo( myTable );
					var cell1   = $("<td></td>").attr({"width":"200px"}).css({"border-bottom" :"1px solid gray"}).appendTo( myTr ); 
					var cell2   = $("<td></td>").attr({"width":"500px","align":"center"}).css({"border-bottom" :"1px solid gray"}).appendTo( myTr );
						
						$("<img></img>").attr( {"src" : "<%=request.getContextPath()%>/_5_gambling/image/NBA_teamLogo/" + (imageURL.substr(14)) ,
												"width":"80px","text-align":"left"})
										.css({"display":"block","margin-left":"0"})
						.appendTo( cell1 );
				
						$("<img></img>").attr( {"src"   : "<%=request.getContextPath()%>/_5_gambling" + imageURL  , 
												"width" : "630px"}).css({"display":"block"})
						.appendTo( cell2 );
										
											
						$("#start5").css('zIndex',8000).dialog({
							title: "先發五人",
					        show : { effect :'fadeIn' , duration: 1000 },
					        hide : { effect :'fadeOut', duration: 500 },
					         //height: 400,
					        width: 580,
					        resizable: "auto",
					        position: { my: "left bottom", at: "center center", of: $("#dialog-div") },
					        close:function(){
								$(this).find("tr").remove();// 關閉時移除舊的先發名單
					        }
						});
			}
          //=====================================【動態建立先發名單 Dialog 結束】================================================
       </script>
  </body>
</html>
