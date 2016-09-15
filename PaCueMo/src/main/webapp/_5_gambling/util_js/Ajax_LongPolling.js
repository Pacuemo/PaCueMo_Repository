/************************************************************************************************
 *                                                                                              *
 *                             【Ajax 長連線 js 檔】                                            *
 *                                                                                              *
 *    用法：將本js引入每個頁面，本程式將持續不間斷對後端restful分派彩金程式送請求               *
 *        ，當Timer設定分派彩金的時間一到，將會執行分派彩金的動作，並增加jquery效果             *
 *                                                                                              * 
 ************************************************************************************************/


(function longPolling() {    
		        $.ajax({
		            url: "../RESTservices/routineTask", // _59_task_routine → RoutineTask.java
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
		                		alert('fuck');
		                	}
		                
		                    longPolling(); // 遞迴
		                }
		            }
		        }  , 1000 /*延遲時間*/);
		    })();


