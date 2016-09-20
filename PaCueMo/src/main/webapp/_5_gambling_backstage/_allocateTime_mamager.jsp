<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
	<head>
	    <meta charset="utf-8">
	    <meta http-equiv="X-UA-Compatible" content="IE=edge">
	    <meta name="viewport" content="width=device-width, initial-scale=1">
	    <meta name="description" content="">
	    <meta name="author" content="">
	
	    <title>SB Admin 2 - Bootstrap Admin Theme</title>
	
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
	 
	
	    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
	    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
	    <!--[if lt IE 9]>
	        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
	        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
	    <![endif]-->
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
                <a class="navbar-brand" href="index.html">SB Admin v2.0</a>
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
                        <li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a>
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
                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard - Home</a>
                        </li>
                        <!-- ============================================================================== -->
                        <!-- =============================【後臺功能頁籤 開始】============================== -->
                        <!-- ============================================================================== -->
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 球員卡管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 約戰管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 隊伍管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 聯賽管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 社團管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 運彩管理 <span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/_5_gambling_backstage/_gambleOrder_manager.jsp"> - 下注訂單管理 - </a>
	                                </li>
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/_5_gambling_backstage/_goodsOrder_manager.jsp"> - 代幣訂單管理 - </a>
	                                </li>
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/_5_gambling_backstage/_allocateTime_mamager.jsp"> - 派彩時間設定 - </a>
	                                </li>
	                                <li>
	                                    <a href="tables.jsp"><i class="fa fa-table fa-fw"></i> Tables</a>
	                                </li>
	                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 場地管理 <span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <!-- ============================================================================== -->
                        <!-- =============================【後臺功能頁籤 結束】============================== -->
                        <!-- ============================================================================== -->
                        <li>
                            <a href="#"><i class="fa fa-table fa-fw"></i>以下 Tables、Forms 參考用</a>
                        </li>
                        <li>
                            <a href="tables.html"><i class="fa fa-table fa-fw"></i> Tables</a>
                        </li>
                        <li>
                            <a href="forms.html"><i class="fa fa-edit fa-fw"></i> Forms</a>
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> Sample Pages<span class="fa arrow"></span></a>
                            <ul class="nav nav-second-level">
                                <li>
                                    <a href="blank.html">Blank Page</a>
                                </li>
                                <li>
                                    <a href="login.html">Login Page</a>
                                </li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
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
                    <div class="col-lg-12">
                        <h1 class="page-header" style="font-family:微軟正黑體;font-weight:800">分派彩金時間設定</font></h1>
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
                    </div><!-- /.col-lg-12 -->  
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
							"success":function(data){
								//alert('fuck');
				      			BootstrapAlert.success({ //BootstrapAlert 特效
		 			                title: "設定成功",
		 			                message: "設定分派彩金時間為：" + hour + " 時 " + min + " 分 " + sec + " 秒 ",
		 			                hideTimeout: 2300,
		 			        	});		
							},
				      		"error":function(){
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





