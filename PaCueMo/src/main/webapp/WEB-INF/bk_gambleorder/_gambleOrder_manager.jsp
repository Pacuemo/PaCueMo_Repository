<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
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

    <!-- DataTables CSS -->
    <link href="<%=request.getContextPath()%>/_99_backstage/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="<%=request.getContextPath()%>/_99_backstage/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="<%=request.getContextPath()%>/_99_backstage/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="<%=request.getContextPath()%>/_99_backstage/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

	<!-- jQuery Ui -->
	<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	
    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
	<style type="text/css">
		.ui-dialog { z-index: 9999 !important ;}/* 確保 dialog 最上層顯示 */
	</style>
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
                                <li><a href="<%=request.getContextPath()%>/spring/leagueBackStage/league"> - 聯賽管理 - </a></li>
                            </ul>
                            <!-- /.nav-second-level -->
                        </li>
                        <li>
                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 運彩管理 <span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href="#"> - 下注訂單管理 - </a>
	                                </li>
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/spring/goodsOrder/allGoodsOrders"> - 代幣訂單管理 - </a>
	                                </li>
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/spring/gambleOrder/timerSetter"> - 派彩時間設定 - </a>
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
	
	        <div id="page-wrapper">
	            <div class="row">
	                <div class="col-lg-12">
	                    <h1 class="page-header" style="font-family:微軟正黑體;font-weight:800">下注訂單管理</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            DataTables Advanced Tables
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div id="tableDiv"  class="panel-body">
	                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                <thead>
	                                    <tr>
	                                        <th>訂單編號</th>
	                                        <th>會員id</th>
	                                        <th>會員姓名</th>
	                                        <th>場次編號</th>
	                                        <th>主隊下注</th>
	                                        <th>客隊下注</th>
	                                        <th>下注時間</th>
	                                        <th>修改/刪除</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
	                                
	                                	<c:forEach var="gambleOrderVO" items="${requestScope.allGambleOrder}">	                                		
	                                		<tr class="odd gradeX">
	                                			<td class="center">${gambleOrderVO.gambleId}</td>
	                                			<td class="center">${gambleOrderVO.memberId}</td>
	                                			<td class="center">${gambleOrderVO.memberVO.memberLastName}&nbsp;${gambleOrderVO.memberVO.memberFirstName}</td>
	                                			<td class="center">${gambleOrderVO.battleId}</td>
	                                			<td class="center">${gambleOrderVO.betHome}</td>
	                                			<td class="center">${gambleOrderVO.betAway}</td>
	                                			<td class="center">${gambleOrderVO.betTime}</td>
	                                			<td>
	                                				<button class="btn btn-warning">修改</button>
	                                				<button class="btn btn-danger">刪除</button>
	                                			</td>
	                                		</tr>	                                		
	                                	</c:forEach>
	                           
	                                </tbody>
	                            </table>
	               
	                        </div>
	                        <!-- /.panel-body -->
	                    </div>
	                    <!-- /.panel -->
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	           
	        </div>
	        <!-- /#page-wrapper -->
	
	    </div>
	    <!-- /#wrapper -->
	
		<!-- ====================【 修改 Dialog 開始 】=====================  -->
			<div id="modify" align="center" style="display: none;">
				<table class="table table-striped table-bordered table-hover" width="100%" style="display:table-cell;">	
					<tr>
						<th scope="row" valign="middle">訂單編號</th>
						<td valign="middle" style="color:blue;font-weight:800;">text</td>
						<td valign="middle" style="background-color:#ADADAD;">&nbsp;</td>
					</tr>
					<tr>
						<th scope="row" valign="middle">會員姓名</th>
						<td valign="middle" style="color:blue;font-weight:800;">text</td>
						<td valign="middle" style="background-color:#ADADAD;">&nbsp;</td>
					</tr>
					<tr>
						<th scope="row" valign="middle">場次編號</th>
						<td valign="middle" style="color:blue;font-weight:800;">text</td>
						<td valign="middle" style="background-color:#ADADAD;">&nbsp;</td>
					</tr>
					<tr>
						<th class="bg-primary" scope="row" valign="middle">主隊下注</th>
						<td class="bg-primary" valign="middle" style="font-size:large;font-weight:800;color:yellow;">text</td>
						<td class="bg-primary" valign="middle">
							<input class="form-control" style="color:red;font-weight:800;" type="text" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th class="bg-primary" scope="row" valign="middle">客隊下注</th>
						<td class="bg-primary" valign="middle" style="font-size:large;font-weight:800;color:yellow;">text</td>
						<td class="bg-primary" valign="middle">
							<input class="form-control" style="color:red;font-weight:800;" type="text" autocomplete="off"/>
						</td>
					</tr>
					<tr>
						<th scope="row" valign="middle">下注時間</th>
						<td valign="middle">text</td>
						<td valign="middle" style="background-color:#ADADAD;">&nbsp;</td>
					</tr>
				</table>
			</div>
		<!-- ====================【 修改 Dialog 結束 】=====================  -->
		
		
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/jquery/jquery.min.js"></script>
	    <script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/bootstrap/js/bootstrap.min.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/metisMenu/metisMenu.min.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/datatables/js/jquery.dataTables.min.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/datatables-responsive/dataTables.responsive.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/dist/js/sb-admin-2.js"></script>
		<script src="<%=request.getContextPath()%>/_5_gambling/plugins/boostrapAlert/js/bootstrapAlert.min.js"></script>
		<script src="<%=request.getContextPath()%>/_5_gambling_backstage/plugins/Bootbox/js/bootbox.min.js"></script>
	    <script>
		    $(function() {
		    	
		    	//bootbox.alert("Hello world!");
		    	
		    	$('#tableDiv button:nth-child(1)').click(function(){ // ﹝修改﹞按鈕
		    		//alert('fuck1');
		    		var gambleId  = $(this).parents('tr').children(':nth-child(1)').text();
		    		var mbId      = $(this).parents('tr').children(':nth-child(2)').text();
		    		var mbName    = $(this).parents('tr').children(':nth-child(3)').text();
		    		var battleId  = $(this).parents('tr').children(':nth-child(4)').text();
		    		var betHome   = $(this).parents('tr').children(':nth-child(5)').text();
		    		var betAway   = $(this).parents('tr').children(':nth-child(6)').text();
		    		var betTime   = $(this).parents('tr').children(':nth-child(7)').text();
		    		$('#modify input:eq(0)').val(betHome);// 給修改金額textbox預設值
		    		$('#modify input:eq(1)').val(betAway);// 給修改金額textbox預設值
		    		
		    		console.log( 'gambleId : ' 	+  gambleId );
		    		console.log( 'mbId     : ' 	+  mbId );
		    		console.log( 'mbName   : ' 	+  mbName );
		    		console.log( 'battleId : ' 	+  battleId );
		    		console.log( 'betHome  : '	+  betHome );
		    		console.log( 'betAway  : '	+  betAway );
		    		console.log( 'betTime  : ' 	+  betTime );
		    		
		    		$('#modify td:eq(0)').text( gambleId );
		    		$('#modify td:eq(2)').text( mbName );
		    		$('#modify td:eq(4)').text( battleId );
		    		$('#modify td:eq(6)').text( betHome );
		    		$('#modify td:eq(8)').text( betAway );
		    		$('#modify td:eq(10)').text( betTime );
		    		
		    		var tmpTr = $(this).parents('tr');// 目前選到的 <tr>
		    		
				  var myDialog = $("#modify").dialog({
								 title  : "修改訂單",
						         show   : { effect :'fold' , duration: 1000 },
						         hide   : { effect :'clip' , duration: 500 },
						       //height    : '400',
						        'width'    : '630',
						        'resizable':  false,
						        'position' : { my: "center", at: "center center", of: window },
						        'open'     : function(){ /*do-nothing*/ },
						         buttons   :[
								        {
								        	'id'    : 'btnConfirm',
				                			'text'  : "確認修改",
				                			'class' : "btn btn-warning",
				                			'click' :  function(){
						            		    		var modify_betHome = $('#modify input:eq(0)').val();// 要修改的下注金額(home)
						            		    		var modify_betAway = $('#modify input:eq(1)').val();// 要修改的下注金額(away)
				                						//-------- 到後台更新資料 -----------
	                									$.ajax({
															"type":"POST",//傳遞方式				
									                		"url" :"<%=request.getContextPath()%>/spring/gambleOrder/updateOrder",
									                		"dataType":"text",//Servlet回傳格式
									                		"data":{ "gambleId" 	   : gambleId ,
									                				 "modify_betHome"  : modify_betHome  ,
									                				 "modify_betAway"  : modify_betAway  ,
									                				 "battleId"        : battleId ,
									                				 "betTime"         : betTime  ,
									                				 "mbId"            : mbId
									                		},
									       					"success":function(dataText){
																//alert('ggg ' + dataText);
												      			BootstrapAlert.success({ //BootstrapAlert 特效
										 			                title  : "系統訊息",
										 			                message: "更新成功",
										 			                hideTimeout: 2500,
										 			        	});
												      			//---- 修改 <tr>→<td> 為新金額 ----
												      			//alert(tmpTr.prop('tagName'));
												      			tmpTr.children(':nth-child(5)').text( modify_betHome );
												      			tmpTr.children(':nth-child(6)').text( modify_betAway );
									       					},
												      		"error":function(){
													      			BootstrapAlert.info({ //BootstrapAlert 特效
											 			                title  : "網路忙線中",
											 			                message: "請稍候",
											 			                hideTimeout: 2300,
											 			        	});
													        }
														})
				                					    //-------- 關閉 dialog --------------
				                						myDialog.dialog("close");
				                			 		  }
								        },
								        {
								        	'id'    : 'btnCancel',
				                			'text'  : "取消",
				                			'class' : "btn btn-success",
				                			'click' : function(){
				                				
				                						myDialog.dialog("close");
				                			          }
								        }
						        ],
						        'close': function(){
						        	// do-nothing
						        }
							});
		    	})
		    	
		    	
		    	$('#tableDiv button:nth-child(2)').click(function(){ // ﹝刪除﹞按鈕
		    		//alert('fuck2');
		    		var gambleId  = $(this).parents('tr').children(':nth-child(1)').text();
		    		console.log( 'gambleId : ' 	+  gambleId );
		    		console.log( 'mbId     : ' 	+  $(this).parents('tr').children(':nth-child(2)').text() );
		    		console.log( 'mbName   : ' 	+  $(this).parents('tr').children(':nth-child(3)').text() );
		    		console.log( 'battleId : ' 	+  $(this).parents('tr').children(':nth-child(4)').text() );
		    		console.log( 'betHome  : '	+  $(this).parents('tr').children(':nth-child(5)').text() );
		    		console.log( 'betAway  : '	+  $(this).parents('tr').children(':nth-child(6)').text() );
		    		console.log( 'betTime  : ' 	+  $(this).parents('tr').children(':nth-child(7)').text() );
		    		
		    		var tmp = $(this);//暫存 $(this)

					//////////////////////////////////////////////////////
				    bootbox.dialog({/*confirm box*/
							  message: " ※ 注意：刪除資料將無法復原！！！",
							  title: " -- 系統訊息 -- ",
							  buttons: {
							    danger: {
							      label: "確認",
							      className: "btn-danger",
							      callback: function() {
								      
											$.ajax({
												"type":"POST",//傳遞方式				
						                		"url" :"<%=request.getContextPath()%>/spring/gambleOrder/deleteOrder",
						                		"dataType":"text",//Servlet回傳格式
						                		"data":{ "gambleId" : gambleId },
						       					"success":function(dataText){
													//alert('ggg ' + dataText);
													switch ( $.trim(dataText) ) 
													{
														case 'del_success':
															//alert('fuck' + dataText);
											      			BootstrapAlert.success({ //BootstrapAlert 特效
									 			                title: "系統訊息",
									 			                message: "刪除成功",
									 			                hideTimeout: 2500,
									 			        	});
											      			
											      			tmp.closest('tr').remove();//刪除本列
						
														  break;
														default:
											      			BootstrapAlert.info({ //BootstrapAlert 特效
									 			                title: "網路忙線中",
									 			                message: "請稍候",
									 			                hideTimeout: 2000,
									 			        	});
														  break;
													}
						       					}
											})/*end-of $ajax*/
							      }/*end-of callback: function()*/
							    },
							    main: {
							      label: "取消",
							      className: "btn-primary",
							      callback: function() {
							    	  /*do-nothing*/
							      }
							    }
							  }
					});	/*end-of bootbox.dialog*/	    		
					/////////////////////////////////////////////////////
		    	})/*end-of click event*/	
		    	//----------------------------------
		    	
		    	
		    	
		    	
		        $('#dataTables-example').DataTable({
		            responsive: true,

		        }).on('page', function(){
		        	//alert("換頁事件這樣寫")
		        });
		        
		    	
		    });


		    var bDialog = function(){

		    	bootbox.dialog({
					  message: " ※ 注意：刪除資料將無法復原！！！",
					  title: " -- 系統訊息 -- ",
					  buttons: {
					    danger: {
					      label: "確認",
					      className: "btn-danger",
					      callback: function() {
					        /*do-nothing*/
	
					      }
					    },
					    main: {
					      label: "Click ME!",
					      className: "btn-primary",
					      callback: function() {
					    	  /*do-nothing*/
					      }
					    }
					  }
					});
			}
	    </script>
	
	</body>
</html>
