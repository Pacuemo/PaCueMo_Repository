
<!-- 	/************************************************************************************************  -->
<!-- 	 *                                                                                              *  -->
<!-- 	 *                             【Ajax 長連線 js 檔】                                            *  -->
<!-- 	 *                                                                                              *  -->
<!-- 	 *    用法：將本js引入每個頁面，本程式將持續不間斷對後端restful分派彩金程式送請求               *  -->
<!-- 	 *        ，當Timer設定分派彩金的時間一到，將會執行分派彩金的動作，並增加jquery效果             *  -->
<!-- 	 *                       (因url要用EL→故用.jsp而非.js)                                         *  -->
<!-- 	 ************************************************************************************************/ -->

<%@page import="_9_41_member_model.MemberVO"%>
<script>

	(function longPolling() {   
		
		setTimeout(function(){
			/////////////////////////////////
			$.ajax({
	            url: "${pageContext.request.contextPath}/RESTservices/routineTask", // _59_task_routine → RoutineTask.java
	            data: {"timed": new Date().getTime()},
	            dataType: "text",
	            timeout: 5000,
	            error: function (XMLHttpRequest, textStatus, errorThrown) {		            	
	                //$("#state").append("[state: " + textStatus + ", error: " + errorThrown + " ]<br/>");
	                if (textStatus == "timeout") { // 請求逾時
	                        longPolling(); // 遞迴
	                    
	                    // 其他錯誤，如網路錯誤
	                    } else { 
	                        longPolling(); // 遞迴
	                    }
	                },
	            success: function (data, textStatus) {
	                //$("#state").append("[state: " + textStatus + ", data: { " + data + "} ]<br/>");
	                
	                if (textStatus == "success") { // 請求成功
	                
	                	if(data == "start_Update"){

							//----------------【取得session中memberId】------------------
							var memberId = "<%=((MemberVO) request.getSession().getAttribute("LoginOK")).getMemberId()%>";
							//-----------------------------------------------------------
							$.ajax({
								"type":"POST",//傳遞方式	
								"url" :"<%=request.getContextPath()%>/spring/gambleSVC/getPoints", /* 呼叫 _55_memberpoints_controller → getMbPoints */
								"dataType":"text",//回傳格式
								"data" :{ 'mbId' : memberId  },
								"success":function(dataText){			      				
			      					//console.log(" 由session中meID查詢到的會員點數 : " + dataText);
             						$("a.point").text("點數餘額：" + dataText + " 點 "); //【修改右上方登入會員圖示的點數】
             						//----------------------------------------
       							    Lobibox.notify( // 有音效的alert特效
	       					               'success',/*色彩調這裡 warning , error , info ,success*/
	       					               {
	       					                   class: 'lobibox-notify-info',
	       					                   icon: 'glyphicon glyphicon-info-sign',
	       					                   title: '【系統公告】',           // Title of notification. Do not include it for default title or set custom string. Set this false to disable title
	       					                   size: 'normal',             // normal, mini, large
	       					                   //showClass: 'flipInX',       // Show animation class. (Uses animate.css)
	       					                   //hideClass: 'zoomOutDown',   // Hide animation class (Uses animate.css)
	       					                   icon: true,                 // Icon of notification. Leave as is for default icon or set custom string
	       					                   msg: '-- 本日NBA彩金已分配 --',// Message of notification
	       					                   img: '<%=request.getContextPath()%>/_5_gambling/plugins/lobibox/dist/photo/kobe.jpg', // Image source string
	       					                   closable: true,             // Make notifications closable
	       					                   delay: 5000,                // Hide notification after this time (in miliseconds)
	       					                   delayIndicator: true,       // Show timer indicator
	       					                   closeOnClick: true,         // Close notifications by clicking on them
	       					                   width: 600,                 // Width of notification box
	       					                   //sound: true,              // Sound of notification. Set this false to disable sound. Leave as is for default sound or set custom soud path
	       					                   soundPath: '<%=request.getContextPath()%>/_5_gambling/plugins/lobibox/dist/sounds/',
	       					                   sound: 'msn',
	       					                   position: "top center"    // Place to show notification. Available options: "top left", "top right", "bottom left", "bottom right"       
	       					               }
	       					        );
       								//----------------------------------------	   
					      		 },
					      		 "error":function(){
						      			BootstrapAlert.info({ //BootstrapAlert 特效
				 			                title: "Sorry~NBA彩金分配發生例外",
				 			                message: "網路忙線中~請稍候 ^___^",
				 			                hideTimeout: 1800,
				 			        	});
						         }
							})												
     			
	                	}
	                
	                    longPolling(); // 遞迴
	                }
	            }
	        }  /*, 1000 延遲時間*/);
			/////////////////////////////////
		},500)//--setTimeout() , 每 0.5 秒發一次請求給後端 RESTful
		
		 
		  
		
	})();
</script>

