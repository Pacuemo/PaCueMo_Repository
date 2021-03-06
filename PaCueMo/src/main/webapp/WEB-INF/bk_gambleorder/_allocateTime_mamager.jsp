﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	     <title>PACUEMO BackStage</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
	
	    <!-- Bootstrap Core CSS -->
	    <link href="<%=request.getContextPath()%>/_99_backstage/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
	
	    <!-- MetisMenu CSS -->
	    <link href="<%=request.getContextPath()%>/_99_backstage/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">
	
	    <!-- Custom CSS -->
	    <link href="<%=request.getContextPath()%>/_99_backstage/dist/css/sb-admin-2.css" rel="stylesheet">
	
	    <!-- Custom Fonts -->
	    <link href="<%=request.getContextPath()%>/_99_backstage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">
		
		<!-- jquery-ui.css -->
		<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	 
		<!-- 小時鐘 -->
		<link rel="stylesheet" href="<%=request.getContextPath()%>/_5_gambling_backstage/plugins/CSS3-digital-clock/css/clock.css"/>

	</head>
<body>

    <div id="wrapper">

        <!-- Navigation -->
        <nav class="navbar navbar-default navbar-static-top" role="navigation" style="margin-bottom: 0">
            <div class="navbar-header">
                <button type="button" class="navbar-toggle" data-toggle="collapse" data-target=".navbar-collapse">
                    <span class="sr-only">Toggle navigation</span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                    <span class="icon-bar"></span>
                </button>
                <a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">PaCueMo</a>
            </div>
            <!-- /.navbar-header -->

            <ul class="nav navbar-top-links navbar-right">
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-messages">
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <strong>John Smith</strong>
                                    <span class="pull-right text-muted">
                                        <em>Yesterday</em>
                                    </span>
                                </div>
                                <div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>Read All Messages</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-messages -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-tasks">
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 1</strong>
                                        <span class="pull-right text-muted">40% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                                            <span class="sr-only">40% Complete (success)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 2</strong>
                                        <span class="pull-right text-muted">20% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
                                            <span class="sr-only">20% Complete</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 3</strong>
                                        <span class="pull-right text-muted">60% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                                            <span class="sr-only">60% Complete (warning)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <p>
                                        <strong>Task 4</strong>
                                        <span class="pull-right text-muted">80% Complete</span>
                                    </p>
                                    <div class="progress progress-striped active">
                                        <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                                            <span class="sr-only">80% Complete (danger)</span>
                                        </div>
                                    </div>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Tasks</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-tasks -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-alerts">
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-comment fa-fw"></i> New Comment
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-twitter fa-fw"></i> 3 New Followers
                                    <span class="pull-right text-muted small">12 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-envelope fa-fw"></i> Message Sent
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-tasks fa-fw"></i> New Task
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a href="#">
                                <div>
                                    <i class="fa fa-upload fa-fw"></i> Server Rebooted
                                    <span class="pull-right text-muted small">4 minutes ago</span>
                                </div>
                            </a>
                        </li>
                        <li class="divider"></li>
                        <li>
                            <a class="text-center" href="#">
                                <strong>See All Alerts</strong>
                                <i class="fa fa-angle-right"></i>
                            </a>
                        </li>
                    </ul>
                    <!-- /.dropdown-alerts -->
                </li>
                <!-- /.dropdown -->
                <li class="dropdown">
                    <a class="dropdown-toggle" data-toggle="dropdown" href="#">
                        <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
                    </a>
                    <ul class="dropdown-menu dropdown-user">
                        <li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a>
                        </li>
                        <li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a>
                        </li>
                        <li class="divider"></li>
                        <li><a href="${pageContext.request.contextPath}/_41_login_controller/logout.do"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
                        </li>
                    </ul>
                    <!-- /.dropdown-user -->
                </li>
                <!-- /.dropdown -->
            </ul>
            <!-- /.navbar-top-links -->

            <div class="navbar-default sidebar" role="navigation">
                <div class="sidebar-nav navbar-collapse">
                    <ul class="nav" id="side-menu">
                        <li class="sidebar-search">
                            <div class="input-group custom-search-form">
                                <input type="text" class="form-control" placeholder="Search...">
                                <span class="input-group-btn">
                                    <button class="btn btn-default" type="button">
                                        <i class="fa fa-search"></i>
                                    </button>
                                </span>
                            </div>
                            <!-- /input-group -->
                        </li>
                        <li>
                            <a href="<%=request.getContextPath()%>/_99_backstage/pages/index.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard - HOME</a>
                        </li>
                        <!-- ============================================================================== -->
                        <!-- =============================【後臺功能頁籤 開始】============================== -->
                        <!-- ============================================================================== -->
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 聯賽管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                               	<li><a href="<%=request.getContextPath()%>/spring/leagueBackStage/league"> - 聯賽管理 - </a></li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 運彩管理 <span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/spring/gambleOrder/getAllGambleOrder"> - 下注訂單管理 - </a>
	                                </li>
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/spring/goodsOrder/allGoodsOrders"> - 代幣訂單管理 - </a>
	                                </li>
	                                <li>
	                                    <a href="#"> - 派彩時間設定 - </a>
	                                </li>
	                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <!-- ============================================================================== -->
                        <!-- =============================【後臺功能頁籤 結束】============================== -->
                        <!-- ============================================================================== -->
      
                    </ul>
                </div>
                <!-- /.sidebar-collapse -->
            </div>
            <!-- /.navbar-static-side -->
        </nav>

        <!-- Page Content -->
        <div id="page-wrapper">
            <div class="container-fluid">
                <div class="row">
                    <div class="col-md-4">
                        <h1 class="page-header" style="font-family:微軟正黑體;font-weight:800">分派彩金時間設定</h1>
                        <!-- --------------------------------------------------------------------- -->
                        <!-- --------------------------------------------------------------------- -->
                        <!-- --------------------------【每頁不同 開始】-------------------------- -->
                        <!-- --------------------------------------------------------------------- -->
                        <!-- --------------------------------------------------------------------- -->
							<%-- <form class="form-inline" action="<%=request.getContextPath()%>/RESTservices/TimerManager/setAllocateTime" method="POST"> --%>
							<form id="timerForm" class="form-inline" action="" method="POST">
								  <div class="form-group">
									    <label for="hour">Hour</label>
									    <input id="hour" type="text" value="0" name="hour" class="form-control"  placeholder="hour(24h type)" required="required" pattern="[0-9]*" data-msg-required="please input" min="0" max="23" maxlength="2" autocomplete="off">
								  		<span id="err1" style="color:red;font-style:italic;"></span>
								  </div>
								  <p/>
								  <div class="form-group">
									    <label for="min">min</label>
									    <input id="min"  type="text" value="0"  name="min" class="form-control"  placeholder="minute" required="required" pattern="[0-9]*" data-msg-required="please input" min="0" max="59" maxlength="2" autocomplete="off" style="margin-left:9px;">
								 		<span id="err2" style="color:red;font-style:italic;"></span>
								  </div>
								  <p/>
								  <div class="form-group">
									    <label for="sec">sec</label>
									    <input id="sec"  type="text" value="0" name="sec" class="form-control"   placeholder="second" required="required" pattern="[0-9]*" data-msg-required="please input" min="0" max="59" maxlength="2" autocomplete="off" style="margin-left:10px;">
								 		<span id="err3" style="color:red;font-style:italic;"></span>
								  </div>
								  <p/><p/>
								  <button id="submitBtn" class="btn btn-danger btn-lg" style="margin-left:115px;width:120px;">確認</button>
							</form>
						<!-- --------------------------------------------------------------------- -->
						<!-- --------------------------------------------------------------------- -->
                        <!-- --------------------------【每頁不同 結束】-------------------------- -->
                        <!-- --------------------------------------------------------------------- -->
                        <!-- --------------------------------------------------------------------- -->
                    </div><!-- /.col-md-6 -->  
                    <div class="col-md-3"><!-- 時鐘 -->
                        <ul class="clock_ul">
			                <li id='gg' class="clock_li">${applicationScope['timerHH'] + applicationScope['timeDiff']}</li>
			                <li class="clock_li">:</li>
			                <li class="clock_li">${applicationScope['timerMM']}</li>
			                <li class="clock_li">:</li>
			                <li class="clock_li">${applicationScope['timerSS']}</li>
			            </ul>
                    </div>                
                </div><!-- /.row --> 
            </div><!-- /.container-fluid -->
        </div> <!-- /#page-wrapper -->
       

    
    </div><!-- /#wrapper -->

    <!-- jQuery -->
    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/jquery/jquery.min.js"></script>
    <!-- jQuery UI CDN -->
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
    <!-- Bootstrap Core JavaScript -->
    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/bootstrap/js/bootstrap.min.js"></script>
    <!-- Metis Menu Plugin JavaScript -->
    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/metisMenu/metisMenu.min.js"></script>
    <!-- Custom Theme JavaScript -->
    <script src="<%=request.getContextPath()%>/_99_backstage/dist/js/sb-admin-2.js"></script>
    <script src="<%=request.getContextPath()%>/_5_gambling/plugins/boostrapAlert/js/bootstrapAlert.min.js"></script>
	<script src="<%=request.getContextPath()%>/js/jquery.validate.js"></script> 
	
	<script type="text/javascript">
		$(function(){		
// 			alert($('.clock_ul li:eq(0)').text())
			var liHH = $('.clock_ul li:eq(0)'); 
			var liMM = $('.clock_ul li:eq(2)'); 
			var liSS = $('.clock_ul li:eq(4)'); 
			//alert( liHH.text() + "  " + liMM.text()  + "  " + liSS.text() );

			//---------- 載入完成時，設定時鐘初值 = inputBox的值-------------
			if( liHH.text().length < 2 ){
				liHH.text('0' + liHH.text() );
			}
			if( liMM.text().length < 2 ){
				liMM.text('0' + liMM.text() );
			}
			if( liSS.text().length < 2 ){
				liSS.text('0' + liSS.text() );
			}
			
			//---------- jQuery 表單驗證 -----------
			$("#timerForm").validate({
		 		errorClass: "has-error",
				errorPlacement: 
					function(error, element) {
						if(element.is('#hour')){
								$("#err1").append(error);
						}else if(element.is('#min')){
								$("#err2").append(error);
						}else if(element.is('#sec')){
								$("#err3").append(error);
						};
				}, 
				submitHandler:function(form){        
					
					var hour = $("#hour").val();
					var min  = $("#min").val();
					var sec  = $("#sec").val();
					//alert("幹");
					$.ajax({
							"type":"POST",
							"url": "<%=request.getContextPath()%>/RESTservices/TimerManager/setAllocateTime", /* _59_task_routine → TimerManager.java → setPointsTime() */
							"dataType": "text",
							"data":{
									"hour":hour,							
									"min" :min,
									"sec" :sec
							},
							success:function(data){
								//alert('fuck');
								//alert(data);
				      			BootstrapAlert.success({ //BootstrapAlert 特效
		 			                title: "設定成功",
		 			                message: "設定分派彩金時間為：" + hour + " 時 " + min + " 分 " + sec + " 秒 ",
		 			                hideTimeout: 2300,
		 			        	});		
				      			//-------設定時鐘值---------
				      			if( $("#hour").val() < 10 ){
				      				$(".clock_ul li:eq(0)").text( '0' + $("#hour").val() );
						      	}else{
						      		$(".clock_ul li:eq(0)").text( $("#hour").val() );
								}
								if( $("#min").val() < 10 ){
									$(".clock_ul li:eq(2)").text( '0' + $("#min").val() );
								}else{
									$(".clock_ul li:eq(2)").text( $("#min").val() );
								}
								if( $("#sec").val() < 10 ){
									$(".clock_ul li:eq(4)").text( '0' + $("#sec").val() );
								}else{
									$(".clock_ul li:eq(4)").text( $("#sec").val() );
								}
								
							},
				      		error:function(){
				      			BootstrapAlert.info({ //BootstrapAlert 特效
		 			                title: "網路忙線中",
		 			                message: "請稍候",
		 			                hideTimeout: 2300,
		 			        	});
					         }
						});
						//return false;
				}

			});	
		})
	</script>

</body>
</html>





