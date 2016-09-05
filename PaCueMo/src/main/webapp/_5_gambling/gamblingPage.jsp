<%@page import="java.util.List"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>NBA 運彩專區</title>
	
	 <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/_5_gambling/advertisment/css/demo.css" />
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/_5_gambling/advertisment/css/slicebox.css" />
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/_5_gambling/advertisment/css/custom.css" />
     <link rel="stylesheet" type="text/css" href="<%=request.getContextPath()%>/_5_gambling/slicePage/css/style.css" media="screen" /><!-- 分頁 -->
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"><!-- BOOTSTRAP -->
	<style type="text/css">
       
	</style>
  </head>
  <body>
  		<%-- <jsp:include page="myTop.jsp"/> --%>
		<jsp:include page="/fragment/top.jsp"/>
		<jsp:include page="sidebar.jsp"/>

       <div class="container">
       		<div class="row">
       			<div class="col-md-2"></div>
       			<div class="col-md-8">
        				
	       				<div class="page-header">
							<h2><strong style="font-family:微軟正黑體;font-weight:bolder;color:orange;">${queryDate}</strong></h2>
						</div>
       					<div id="tableDiv">
       						<table class="table">
       							<c:forEach var="battleSetVO" items="${battleSetList}" begin="1" end="3">
       								<tr align='center' valign='middle'>
										<td><img width="150" class="img-rounded" alt="home"   src="<%=request.getContextPath()%>/_5_gambling/${battleSetVO['home'].teamLogoURL}"></td>
										<td><img width="70"  					 alt="vs.gif" src="<%=request.getContextPath()%>/_5_gambling/image/VS4.gif"></td>
										<td><img width="150" class="img-rounded" alt="away"   src="<%=request.getContextPath()%>/_5_gambling/${battleSetVO['away'].teamLogoURL}"></td>
									</tr>
       								<tr align='center' valign='middle'>
										<td><h4 style="font-family:微軟正黑體;font-weight:bolder;color:white;">${battleSetVO['home'].teamName}</h4></td>
										<td><Strong class='glyphicon glyphicon-time' style="padding-right:5px;color:white;">&nbsp;${battleSetVO['battleTime']}</Strong></td>
										<td><h4 style="font-family:微軟正黑體;font-weight:bolder;color:white;">${battleSetVO['away'].teamName}</h4></td>
									</tr>    				
       							</c:forEach>
       						</table>
       					</div>		 	

      					<div style="margin-left:250px;width:580px;padding:10px;background-color: rgb(50, 118, 110 , 0.8);">
				            <div id="slicePage" ></div>
				        </div>
					       
       			</div>
       			<div class="col-md-2"></div>
       		</div>
       </div>
       
       <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	   <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	   <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
       <script src="<%=request.getContextPath()%>/_5_gambling/slicePage/js/jquery.paginate.js"></script>
       <script type="text/javascript">
           
       		var funFlag = undefined;//=== 偵測user按下哪個按鈕 ===
       
       		$(function(){
       			/* ================ 【隊名Auto-complete】 ================= */
				$("#searchName").keyup(function(){
					
					var input = $(this).val(); // textbox 輸入值
					$.ajax({
						"type":"post",//傳遞方式				
                		"url" :"NbaTeam_Ajax_Servlet.do",
                		"dataType":"json",//Servlet回傳格式
                		"data":{ "searchName" : input },
       					"success":function(data){
        					//console.log(data);
        					var parentDIV = $("#searchName").parent();
        					parentDIV.children("button").remove();// 移除→避免backspace建立過多<Button>
        					$.each(data , function(index , obj){	       						
        						var tBtn = $('<button></button>').addClass("list-group-item").text( obj.teamName );
        						//=== ﹝註冊事件開始﹞===//
	       						tBtn.click(function(event){
	       							event.preventDefault();// 防止Button點擊直接link到空白頁
	       							$("#searchName").val( tBtn.text() );
	       							parentDIV.children("button").remove();
	       						})
	       						//=== ﹝註冊事件結束﹞===//
	           			    	parentDIV.append(tBtn);        						        					        					
        					})
       					}
					})
					
				})
				/* ================ 【隊名Auto-complete結束】 ================= */
       			/* ==================== 【隊名查詢開始】 =================== */
       			$("#searchBtn").click(function(){       				
       				var searchName = $("#searchName").val();// 查詢的隊伍名稱
       				//alert(searchName);
       				
       				//*********************
       				funFlag = 'byTeamName';
       				//*********************
       				
       				$.ajax({
       					"type":"post",//傳遞方式				
                		"url" :"BattleSet_Ajax_Servlet.do",
                		"dataType":"json",//Servlet回傳格式
                		"data":{ "action":"queryByName" , "searchName":searchName },
       					"success":function(data){
       						if( data.err != undefined ){ //若Servlet有 out.println 錯誤訊息 → alert
	       						alert( data.errMsg );  
       							return;
       						}else
       						{	
       							// ================== ﹝表頭開始﹞==================
       							$(".page-header > h2").empty(); // 清空 h2 以下的元素
       		       				var tmp = $("<STRONG style='font-family:微軟正黑體;font-weight:bolder;color:orange;'></STRONG>").html(searchName);
       		       				$(".page-header > h2").append(tmp);
       		       				// ================== ﹝表頭結束﹞==================
       							$("#tableDiv").children('.table').remove();// 先移除舊資料
	                			var mytable =  $('<table></table>').addClass("table");
	        					var mybody =  $('<tbody></tbody>');
	        					mytable.append(mybody);

								$.each(data , function( index , obj ){

									var img1    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + obj.away.teamLogoURL , 'width':150});										
									var img2    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + '/image/VS4.gif'		, 'width':70 });										
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
									var cell22  =  $('<td></td>').html("<Strong class='glyphicon glyphicon-time' style='padding-right:5px;color:white;'>&nbsp;" + obj.battleTime + "</Strong>");
									var cell23  =  $('<td></td>').html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + obj.home.teamName + "</h4>");
									myrow1.append([ cell11 , cell12 , cell13 ]);
									myrow2.append([ cell21 , cell22 , cell23 ]);
									
									myrow1.appendTo(mybody);
									myrow2.appendTo(mybody);
								})
									
								$("#tableDiv").append(mytable);
       						}       			
       					},
                		"error":function(data){
                			alert(" ※ 查無隊伍，請重新輸入！");
                		}
       				})
       				
       			})
       			/* ==================== 【隊名查詢結束】 =================== */
       			/* ==================== 【分頁開始】 =================== */
       			$("#slicePage").paginate({
		                count: "${battleSetList_len}",/*總資料長度*/
		                start: 1,
		                display: 10,
		                border: true,
		                text_color: 'rgb(93, 213, 83)',
		                background_color: 'rgb(40, 46, 67)',
		                text_hover_color: 'rgb(234, 57, 57)',
		                background_hover_color: '#00BBFF',
		                onChange: function (pageNo) {  /* pageNo → 當前頁數 */   //alert(pageNo); 
		                	
		                //===﹝根據funFlag 決定 呼叫 controller 的 action﹞===
		                var actionName = "";                               
		                switch (funFlag) {
							case "byTeamName":
								actionName = "queryByName";
								break;
							default:
								actionName = "queryByDateAndPage";
								break;
						}
		                //====================================================
		                
		                	$.ajax({
		                		"type":"post",//傳遞方式				
		                		"url":"BattleSet_Ajax_Servlet.do",
		                		"dataType":"json",//Servlet回傳格式
		                		"data":{ "action": actionName , "pageNo":pageNo },
		                		"success":function(data){
		                			//console.log(data[0]);
		                			$("#tableDiv").children('.table').remove();// 每次按下換頁，先移除舊資料
		                			var mytable =  $('<table></table>').addClass("table");
		        					var mybody =  $('<tbody></tbody>');
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
										var cell22  =  $('<td></td>').html("<Strong class='glyphicon glyphicon-time' style='padding-right:5px;color:white;'>&nbsp;" + obj.battleTime + "</Strong>");
										var cell23  =  $('<td></td>').html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + obj.home.teamName + "</h4>");
										myrow1.append([ cell11 , cell12 , cell13 ]);
										myrow2.append([ cell21 , cell22 , cell23 ]);
										
										myrow1.appendTo(mybody);
										myrow2.appendTo(mybody);
									})
										
									$("#tableDiv").append(mytable);
		                	
		                		}
		                	})
		        
		                }
		        });
       			/* ==================== 【分頁結束】 =================== */
       		})
       </script>
  </body>
</html>
