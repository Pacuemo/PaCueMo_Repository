
<!-- 	/************************************************************************************************  -->
<!-- 	 *                                                                                              *  -->
<!-- 	 *                             【Ajax 長連線 js 檔】                                            *  -->
<!-- 	 *                                                                                              *  -->
<!-- 	 *    用法：將本js引入每個頁面，本程式將持續不間斷對後端restful分派彩金程式送請求               *  -->
<!-- 	 *        ，當Timer設定分派彩金的時間一到，將會執行分派彩金的動作，並增加jquery效果             *  -->
<!-- 	 *                       (因url要用EL→故用.jsp而非.js)                                         *  -->
<!-- 	 ************************************************************************************************/ -->

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
	                $("#state").append("[state: " + textStatus + ", error: " + errorThrown + " ]<br/>");
	                if (textStatus == "timeout") { // 請求逾時
	                        longPolling(); // 遞迴
	                    
	                    // 其他錯誤，如網路錯誤
	                    } else { 
	                        longPolling(); // 遞迴
	                    }
	                },
	            success: function (data, textStatus) {
	                $("#state").append("[state: " + textStatus + ", data: { " + data + "} ]<br/>");
	                
	                if (textStatus == "success") { // 請求成功
	                
	                	if(data=="start_Update"){
	                		//alert('fuck');
	                		BootstrapAlert.info({ //BootstrapAlert 特效
	 			                title: " 【系統訊息】 ",
	 			                message: "-- 本日NBA彩金已分配 --",
	 			                hideTimeout: 5000,
	 			                //parentClass: 'bootstrap-alert',
	 			       			//innerClass:  'bootstrap-alert-message'
	 			        	});
	 			        	
	                		// 播放音效
	             	       (function playAudio() {
	                           $('<audio id="myAudio"><source src="<%=request.getContextPath()%>/_5_gambling/audio/msn.mp3" type="audio/mpeg"></audio>').appendTo('body');//载入声音文件 
	                           $('#myAudio')[0].play();  //myAudio為注入audio元件時設定的id
	                           //$("body>audio").remove();
	                       })()
	                	}
	                
	                    longPolling(); // 遞迴
	                }
	            }
	        }  /*, 1000 延遲時間*/);
			/////////////////////////////////
		},500)//--setTimeout()
		
		 
		  
		
	})();
</script>

