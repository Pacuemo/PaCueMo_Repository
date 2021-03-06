﻿<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
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

     <title>PACUEMO BackStage</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />

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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
input[type="text"]  {
	border: 0px;
	width:inherit;
	height:inherit; 
	background-color: inherit;
}

input[type='date']{
    border: 0px;
	width:inherit;
	height:inherit; 
	background-color: inherit;
}
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
	                           <a href="<%=request.getContextPath()%>/indexBackStage.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard - HOME</a>
	                        </li>
	                       
	                       
	                        <!-- ============================================================================== -->
	                        <!-- =============================【後臺功能頁籤 開始】============================== -->
	                        <!-- ============================================================================== -->

	                        <li>
	                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 聯賽管理 <span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <a href="<%=request.getContextPath()%>/spring/leagueBackStage/league"> - 聯賽管理 - </a>
	                                </li>
	                            </ul>
	                            <!-- /.nav-second-level -->
	                        </li>
	                        <li>
	                            <a href="#"><i class="fa fa-files-o fa-fw"></i> 運彩管理 <span class="fa arrow"></span></a>
	                            <ul class="nav nav-second-level">
	                                <li>
	                                    <%-- <a href="<%=request.getContextPath()%>/_5_gambling_backstage/_gambleOrder_manager.jsp"> - 下注訂單管理 - </a> --%>
	                                    <a href="<%=request.getContextPath()%>/spring/gambleOrder/getAllGambleOrder"> - 下注訂單管理 - </a>
	                                </li>
	                                <li>	                               
	                                    <a href="<%=request.getContextPath()%>/spring/goodsOrder/allGoodsOrders"> - 代幣訂單管理 - </a>
	                                </li>
	                                <li>
	                                    <%-- <a href="<%=request.getContextPath()%>/_5_gambling_backstage/_allocateTime_mamager.jsp"> - 派彩時間設定 - </a> --%>
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
	                    <h1 class="page-header">聯賽管理</h1>
	                </div>
	                <!-- /.col-lg-12 -->
	            </div>
	            <!-- /.row -->
	            <div class="row">
	                <div class="col-lg-12">
	                    <div class="panel panel-default">
	                        <div class="panel-heading">
	                            DataTables 
	                        </div>
	                        <!-- /.panel-heading -->
	                        <div class="panel-body">
	                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                <thead>
	                                    <tr>
	                                        <th style="background-color:#0066FF;color:white">League Name</th>
	                                        <th style="background-color:#0066FF;color:white">Club Amount</th>
	                                        <th style="background-color:#0066FF;color:white">Start Date</th>
	                                        <th style="background-color:#0066FF;color:white">End Date</th>
	                                        <th style="background-color:#0066FF;color:white">Court Id</th>
	                                        <th style="background-color:#0066FF;color:white">Button </th>
	                                    </tr>
	                                </thead>
	                                <tbody>	                             
	                                    <c:forEach items="${leagueVOs}" var="leagueVO">
	                                    <tr>          
	                                        <td><a href="../leagueClubBackStage/getLeagueClub?leagueId=${leagueVO.leagueID}&leagueName=${leagueVO.leagueName}"><span style="display:none">${leagueVO.leagueID}</span><input type='text' name='leagueName'  disabled="disabled" value="${leagueVO.leagueName}" onclick='query()'></a></td>
	                                        <td><input type='text' name='clubAmount'  disabled="disabled" value="${leagueVO.clubAmount}"></td>
	                                        <td><input type='date' name='startDate'  disabled="disabled" value="${leagueVO.startDate}"></td>
	                                        <td class="center"><input type="date" name='endDate'  disabled="disabled"  value="${leagueVO.endDate}"></td>
	                                        <td class="center"><input type='text' name='placeID'  disabled="disabled" value="${leagueVO.placeID}"></td>
	                                        <td class="center">                            
	                                        <a class="btn btn-default forUpdate" href="#" role="button">修改</a>
	                                        <input type="button" class='btn btn-default submitInfo' value="送出" style="display: none">
	                                        </td>	                                    
	                                    </tr>	                             
	                                    </c:forEach>
	                                  
	                                </tbody>
	                            </table>
	                            <a class="btn btn-primary " id="addLeague" href="#" role="button">新增聯賽</a>
	               
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
	
	    <!-- jQuery -->
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/jquery/jquery.min.js"></script>
	
	    <!-- Bootstrap Core JavaScript -->
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/bootstrap/js/bootstrap.min.js"></script>
	
	    <!-- Metis Menu Plugin JavaScript -->
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/metisMenu/metisMenu.min.js"></script>
	
	    <!-- DataTables JavaScript -->
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/datatables/js/jquery.dataTables.min.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
	    <script src="<%=request.getContextPath()%>/_99_backstage/vendor/datatables-responsive/dataTables.responsive.js"></script>
	
	    <!-- Custom Theme JavaScript -->
	    <script src="<%=request.getContextPath()%>/_99_backstage/dist/js/sb-admin-2.js"></script>
	
	    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
	    
	    <script src="<%=request.getContextPath()%>/js/bootstrapAlert.js"></script>
	    <script src="<%=request.getContextPath()%>/js/bk_league/league.js"></script>
	    <script>
		    $(document).ready(function() {
		        $('#dataTables-example').DataTable({
		            responsive: true
		        });
		    });
	    </script>
	
	</body>
</html>
