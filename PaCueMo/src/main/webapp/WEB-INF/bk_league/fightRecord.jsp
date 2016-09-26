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

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<style type="text/css">
.changeData{
	border: 0px;
	width:100%;
	height:inherit; 
	background-color: inherit;
}
.createData{
	border: 1px solid #e6e600;
	width:100%;
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
	                            <a href="index.html"><i class="fa fa-dashboard fa-fw"></i> Dashboard</a>
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
	                    <h1 class="page-header">聯賽場次資訊</h1>
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
	                        <h1> ${requestScope.leagueRecordVO.clubA.clubName}</h1>
	                        <div class="panel-body">
	                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-example">
	                                <thead>
	                                    <tr>
		                                    <th style="background-color:#0066FF;color:white;">球員</th>
								   		    <th style="background-color:#0066FF;color:white;">背號</th>
											<th style="background-color:#0066FF;color:white;">位置</th>
											<th style="background-color:#0066FF;color:white;">先發</th>
											<th style="background-color:#0066FF;color:white;">上場</th>
											<th style="background-color:#0066FF;color:white;">3PA</th>
											<th style="background-color:#0066FF;color:white;">3PM</th>
											<th style="background-color:#0066FF;color:white;">3PP</th>
											<th style="background-color:#0066FF;color:white;">2PA</th>
											<th style="background-color:#0066FF;color:white;">2PM</th>
											<th style="background-color:#0066FF;color:white;">2PP</th>
											<th style="background-color:#0066FF;color:white;">FTA</th>
											<th style="background-color:#0066FF;color:white;">FTM</th>
											<th style="background-color:#0066FF;color:white;">FTP</th>
											<th style="background-color:#0066FF;color:white;">OR</th>
											<th style="background-color:#0066FF;color:white;">DR</th>
											<th style="background-color:#0066FF;color:white;">TR</th>
											<th style="background-color:#0066FF;color:white;">ASS</th>
											<th style="background-color:#0066FF;color:white;">ST</th>
											<th style="background-color:#0066FF;color:white;">BS</th>
											<th style="background-color:#0066FF;color:white;">TO</th>
											<th style="background-color:#0066FF;color:white;">PF</th>
											<th style="background-color:#0066FF;color:white;">PT</th>
											<th style="background-color:#0066FF;color:white;width:100px">button</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
					                        <c:forEach items="${requestScope.fightRecordVOs}" var="fightRecordVO">
											    <c:if test="${fightRecordVO.clubId == requestScope.leagueRecordVO.clubIdA}">
												<tr>
													<td memberId='${fightRecordVO.memberVO.memberId}' clubId='${fightRecordVO.clubId}'>${fightRecordVO.memberVO.memberLastName}${fightRecordVO.memberVO.memberFirstName}</td>
													<td class='change'>${fightRecordVO.gamePlayer}</td>
													<td class='change'>${fightRecordVO.position}</td>
													<td class='change'><c:if test="${fightRecordVO.gameStart}">V</c:if></td>
													<td class='change'>${fightRecordVO.minPlay}</td>
													<td class='change'>${fightRecordVO.trePA}</td>
													<td class='change'>${fightRecordVO.trePM}</td>
													<td >${fightRecordVO.trePP}%</td>
													<td class='change'>${fightRecordVO.twoPA}</td>
													<td class='change'>${fightRecordVO.twoPM}</td>
													<td >${fightRecordVO.twoPP}%</td>
													<td class='change'>${fightRecordVO.fta}</td>
													<td class='change'>${fightRecordVO.fta}</td>
													<td >${fightRecordVO.ftp}%</td>
													<td class='change'>${fightRecordVO.ofRep}</td>
													<td class='change'>${fightRecordVO.deRep}</td>
													<td>${fightRecordVO.totalRep}</td>
													<td class='change'>${fightRecordVO.ass}</td>
													<td class='change'>${fightRecordVO.steal}</td>
													<td class='change'>${fightRecordVO.block}</td>
													<td class='change'>${fightRecordVO.turnOver}</td>
													<td class='change'>${fightRecordVO.fouls}</td>
													<td class='change'>${fightRecordVO.score}</td>
													<td><a class="btn btn-default updateRecord" href="#"  role="button">修改</a>
													         <a class="btn btn-default deleteRecord" href="#" role="button">刪除</a>
													         <a class="btn btn-default cancelRecord" href="#" style='display: none' role="button">取消</a>
													        <a class="btn btn-default submitRecord" href="#" style='display: none' role="button">送出</a>													         
													</td>
												</tr>
											</c:if>
										</c:forEach>	                                   
	                                </tbody>
	                            </table>
	                             <a class="btn btn-default clubA create"  href="#"  role="button" clubId="${leagueRecordVO.clubIdA}">新增</a>



	                               <h1> ${requestScope.leagueRecordVO.clubB.clubName}</h1>
	                            <table width="100%" class="table table-striped table-bordered table-hover" id="dataTables-examples">
	                                <thead>
	                                    <tr>
		                                    <th style="background-color:#0066FF;color:white">球員</th>
								   		    <th style="background-color:#0066FF;color:white">背號</th>
											<th style="background-color:#0066FF;color:white">位置</th>
											<th style="background-color:#0066FF;color:white">先發</th>
											<th style="background-color:#0066FF;color:white">上場</th>
											<th style="background-color:#0066FF;color:white">3PA</th>
											<th style="background-color:#0066FF;color:white">3PM</th>
											<th style="background-color:#0066FF;color:white">3PP</th>
											<th style="background-color:#0066FF;color:white">2PA</th>
											<th style="background-color:#0066FF;color:white">2PM</th>
											<th style="background-color:#0066FF;color:white">2PP</th>
											<th style="background-color:#0066FF;color:white">FTA</th>
											<th style="background-color:#0066FF;color:white">FTM</th>
											<th style="background-color:#0066FF;color:white">FTP</th>
											<th style="background-color:#0066FF;color:white">OR</th>
											<th style="background-color:#0066FF;color:white">DR</th>
											<th style="background-color:#0066FF;color:white">TR</th>
											<th style="background-color:#0066FF;color:white">ASS</th>
											<th style="background-color:#0066FF;color:white">ST</th>
											<th style="background-color:#0066FF;color:white">BS</th>
											<th style="background-color:#0066FF;color:white">TO</th>
											<th style="background-color:#0066FF;color:white">PF</th>
											<th style="background-color:#0066FF;color:white">PT</th>
											<th style="background-color:#0066FF;color:white;width:100px">button</th>
	                                    </tr>
	                                </thead>
	                                <tbody>
					                        <c:forEach items="${requestScope.fightRecordVOs}" var="fightRecordVO">
											    <c:if test="${fightRecordVO.clubId == requestScope.leagueRecordVO.clubIdB}">
												<tr>
													<td memberId='${fightRecordVO.memberVO.memberId}' clubId='${fightRecordVO.clubId}'>${fightRecordVO.memberVO.memberLastName}${fightRecordVO.memberVO.memberFirstName}</td>
													<td class='change'>${fightRecordVO.gamePlayer}</td>
													<td class='change'>${fightRecordVO.position}</td>
													<td class='change'><c:if test="${fightRecordVO.gameStart}">V</c:if></td>
													<td class='change'>${fightRecordVO.minPlay}</td>
													<td class='change'>${fightRecordVO.trePA}</td>
													<td class='change'>${fightRecordVO.trePM}</td>
													<td >${fightRecordVO.trePP}%</td>
													<td class='change'>${fightRecordVO.twoPA}</td>
													<td class='change'>${fightRecordVO.twoPM}</td>
													<td >${fightRecordVO.twoPP}%</td>
													<td class='change'>${fightRecordVO.fta}</td>
													<td class='change'>${fightRecordVO.fta}</td>
													<td >${fightRecordVO.ftp}%</td>
													<td class='change'>${fightRecordVO.ofRep}</td>
													<td class='change'>${fightRecordVO.deRep}</td>
													<td>${fightRecordVO.totalRep}</td>
													<td class='change'>${fightRecordVO.ass}</td>
													<td class='change'>${fightRecordVO.steal}</td>
													<td class='change'>${fightRecordVO.block}</td>
													<td class='change'>${fightRecordVO.turnOver}</td>
													<td class='change'>${fightRecordVO.fouls}</td>
													<td class='change'>${fightRecordVO.score}</td>
													<td><a class="btn btn-default updateRecord" href="#" role="button">修改</a>
													         <a class="btn btn-default deleteRecord" href="#" role="button">刪除</a>
													         <a class="btn btn-default cancelRecord" href="#" style='display: none' role="button">取消</a>
													        <a class="btn btn-default submitRecord" href="#" style='display: none' role="button">送出</a>												        
													</td>
												</tr>
											</c:if>
										</c:forEach>	                                   
	                                </tbody>
	                            </table>
	                           <a class="btn btn-default clubB create"  href="#"  role="button" clubId="${leagueRecordVO.clubIdB}">新增</a>
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
	    <script src="<%=request.getContextPath()%>/js/bootstrapAlert.js"></script>
	
	    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
	    <script>
		    $(document).ready(function() {
		        $('#dataTables-example').DataTable({
		            responsive: true
		        });

		        $('#dataTables-examples').DataTable({
		            responsive: true
		        });
		        var tds;
		        $('.updateRecord').click(function(e){
                      e.preventDefault();
                      var tr=$(this).parent().parent();                     
                    	  tds= tr.children().clone(true);
                      $(this).css('display','none').next().css('display','none').next().css('display','inline-block').next().css('display','inline-block');
                      tr.css('background-color','rgb(255, 255, 153)');
                      tr.find('.change').each(function(index,element){
                    	  var text=$(this).text();
                    	  $(this).text('').append($('<input type="text" class="changeData" value="'+text+'">'));
                          });
     
			        });

                $('.cancelRecord').click(function(e){
                    console.log('3');
                	e.preventDefault();                    	
                	$(this).parents('tr').empty().append(tds).css('background-color','');
                    });  

          
	              $('.submitRecord').click(function(e){
                      var button=$(this);    
	            	  var tr =$(this).parent().parent();
                      var data={};
                      var gamePlayer=tr.find('td').eq(1);
                      var position=tr.find('td').eq(2);
                      data['fightId']=${fightId};
                      data['clubId']=tr.find('td').first().attr('clubId');
                      data['clubMemberId']=tr.find('td').first().attr('memberId');
                      data['gamePlayer']=gamePlayer.find('input').val();
                      data['position']=position.find('input').val();
                      var gameStart=tr.find('td').eq(3);
                      gameStartVal=gameStart.find('input').val();
                      if(gameStartVal!=null || $.trim(gameStartVal) !=""){
                    	  data['gameStart']=true;
                           }else{
                          data['gameStart']=false;
                               };
                      var minPlay=tr.find('td').eq(4);        
                      data['minPlay']=minPlay.find('input').val();
                      var trePA=tr.find('td').eq(5);
                      data['trePA']=trePA.find('input').val();
                      var trePM=tr.find('td').eq(6);
                      data['trePM']=trePM.find('input').val();
                      var trePP=tr.find('td').eq(7);                     
                      data['trePP']=(data['trePM']/data['trePA'])*100;
                      var twoPA=tr.find('td').eq(8);
                      data['twoPA']=twoPA.find('input').val();
                      var twoPM=tr.find('td').eq(9);
                      data['twoPM']=twoPM.find('input').val();
                      var twoPP=tr.find('td').eq(10);
                      data['twoPP']=(data['twoPM']/data['twoPA'])*100;
                      var fta=tr.find('td').eq(11);
                      data['fta']=fta.find('input').val();
                      var ftm=tr.find('td').eq(12);
                      data['ftm']=ftm.find('input').val();
                      var ftp=tr.find('td').eq(13);
                      data['ftp']=(data['ftm']/data['fta'])*100;
                      var ofRep=tr.find('td').eq(14);
                      data['ofRep']=ofRep.find('input').val();
                      var deRep=tr.find('td').eq(15);
                      data['deRep']=deRep.find('input').val();
                      var totalRep=tr.find('td').eq(16);
                      data['totalRep']=(data['ofRep']+data['deRep']);
                      var ass=tr.find('td').eq(17);
                      data['ass']=ass.find('input').val();
                      var steal=tr.find('td').eq(18);
                      data['steal']=steal.find('input').val();
                      var block=tr.find('td').eq(19);
                      data['block']=block.find('input').val();
                      var turnOver=tr.find('td').eq(20);
                      data['turnOver']=turnOver.find('input').val();
                      var fouls=tr.find('td').eq(21);
                      data['fouls']=fouls.find('input').val();
                      var score=tr.find('td').eq(22);
                      data['score']=score.find('input').val();

                      $.ajax({
							type:'POST',
							url:'updatefightRecord',
							contentType: "application/json",
							data: JSON.stringify(data),
							dataType: 'json',
							success: function(message){
								 BootstrapAlert.success({ title : "Congrat!", message : "成功修改一筆球員紀錄" });
								 gamePlayer.empty().text(message.fightRecordVO.gamePlayer);
							     position.empty().text(message.fightRecordVO.position);
							     if(message.fightRecordVO.gameStart==true){
							     gameStart.empty().text('V');
							     }else{gameStart.empty().text('')};
							     minPlay.empty().text(message.fightRecordVO.minPlay);
							     trePA.empty().text(message.fightRecordVO.trePA);
							     trePM.empty().text(message.fightRecordVO.trePM);
							     trePP.empty().text(message.fightRecordVO.trePP);
							     twoPA.empty().text(message.fightRecordVO.twoPA);
							     twoPM.empty().text(message.fightRecordVO.twoPM);
							     twoPP.empty().text(message.fightRecordVO.twoPP);
							     fta.empty().text(message.fightRecordVO.fta);
							     ftm.empty().text(message.fightRecordVO.ftm);
							     ftp.empty().text(message.fightRecordVO.ftp);
							     ofRep.empty().text(message.fightRecordVO.ofRep);
							     deRep.empty().text(message.fightRecordVO.deRep);
							     totalRep.empty().text(message.fightRecordVO.totalRep);
							     ass.empty().text(message.fightRecordVO.ass);
							     steal.empty().text(message.fightRecordVO.steal);
							     block.empty().text(message.fightRecordVO.block);
							     turnOver.empty().text(message.fightRecordVO.turnOver);
							     fouls.empty().text(message.fightRecordVO.fouls);
							     score.empty().text(message.fightRecordVO.score);
							     button.css('display','none').prev().css('display','none').prev().css('display','inline-block').prev().css('display','inline-block');
							     tr.css('background-color','');
	                               
								}
                          });
		              });  

                  $('.create').click(function(e){
							e.preventDefault();
							var table;
							var club;
							if($(this).hasClass( 'clubA' )){
								table=$('#dataTables-example');
								club=$('#clubA').clone(true);
								}else{
								table=$('#dataTables-examples');
								club=$('#clubB').clone(true);
									}
							 var tr =$('<tr></tr>').css('background-color','rgb(255, 255, 153)').appendTo(table);
							for (i = 0; i <24 ; i++) { 
							    $('<td ><input type="text" class="createData"></td>').appendTo(tr);
							}
		                       tr.find('td').first().empty().append(club)
		                          .nextAll(':eq(6)').empty()
		                          .nextAll(':eq(2)').empty()
		                          .nextAll(':eq(2)').empty()
		                          .nextAll(':eq(2)').empty()
		                          .nextAll(':last').empty()
		                          .append($('<a class="btn btn-default submitFightRecord" href="#" role="button" style="background-color:#ccffcc;margin-right:8px;padding:3px 10px">O</a>'))
		                          .append($('<a class="btn btn-default cancel" href="#" role="button" style="background-color:#ffcccc;padding:3px 10px">X</a>'));

		                          $('.cancel').bind('click',function(e){
                                      e.preventDefault();
                                      $(this).parents('tr').remove();
			                          });

		                          $('.submitFightRecord').bind('click',add);
                      });

                  $('.deleteRecord').click(function(e){
                	  e.preventDefault();
                	  var tr=$(this).parents('tr');
                	  $.ajax({
							type:'GET',
							url:'deletefightRecord',
							data:{'fightId':${fightId},'memberId':tr.find('td:eq(0)').attr('memberId')},
							dataType: 'json',
							success:function(message){
									if(message.status==1){
										 BootstrapAlert.success({ title : "Congrat!", message : "成功刪除一筆球員紀錄" });
										 tr.remove();
										}								
								}
                    	  });
                      })
	              
		    });

		    function add(e){
			    
                e.preventDefault();					
                var button=$(this);    
          	    var tr =$(this).parent().parent();
                var data={};
                data['fightId']=${fightId};
                var gamePlayer=tr.find('td').eq(1);
                data['gamePlayer']=gamePlayer.find('input').val();
                var position=tr.find('td').eq(2);
                data['position']=position.find('input').val();
                var clubMemberName=tr.find('td').first();
                data['clubId']=clubMemberName.find('select').attr('clubId');
                data['clubMemberId']=clubMemberName.find('option:selected').val();      
                var clubMemberName1= clubMemberName.find('option:selected').text();                     
                var gameStart=tr.find('td').eq(3);
                gameStartVal=gameStart.find('input').val();
                if(gameStartVal!=null || $.trim(gameStartVal) !=""){
              	  data['gameStart']=true;
                     }else{
                    data['gameStart']=false;
                         };
                var minPlay=tr.find('td').eq(4);        
                data['minPlay']=minPlay.find('input').val();
                var trePA=tr.find('td').eq(5);
                data['trePA']=trePA.find('input').val();
                var trePM=tr.find('td').eq(6);
                data['trePM']=trePM.find('input').val();
                var trePP=tr.find('td').eq(7);                     
                data['trePP']=(data['trePM']/data['trePA'])*100;
                var twoPA=tr.find('td').eq(8);
                data['twoPA']=twoPA.find('input').val();
                var twoPM=tr.find('td').eq(9);
                data['twoPM']=twoPM.find('input').val();
                var twoPP=tr.find('td').eq(10);
                data['twoPP']=(data['twoPM']/data['twoPA'])*100;
                var fta=tr.find('td').eq(11);
                data['fta']=fta.find('input').val();
                var ftm=tr.find('td').eq(12);
                data['ftm']=ftm.find('input').val();
                var ftp=tr.find('td').eq(13);
                data['ftp']=(data['ftm']/data['fta'])*100;
                var ofRep=tr.find('td').eq(14);
                data['ofRep']=ofRep.find('input').val();
                var deRep=tr.find('td').eq(15);
                data['deRep']=deRep.find('input').val();
                var totalRep=tr.find('td').eq(16);
                data['totalRep']=(data['ofRep']+data['deRep']);
                var ass=tr.find('td').eq(17);
                data['ass']=ass.find('input').val();
                var steal=tr.find('td').eq(18);
                data['steal']=steal.find('input').val();
                var block=tr.find('td').eq(19);
                data['block']=block.find('input').val();
                var turnOver=tr.find('td').eq(20);
                data['turnOver']=turnOver.find('input').val();
                var fouls=tr.find('td').eq(21);
                data['fouls']=fouls.find('input').val();
                var score=tr.find('td').eq(22);
                data['score']=score.find('input').val();


                $.ajax({
					type:'POST',
					url:'submitfightRecord',
					contentType: "application/json",
					data: JSON.stringify(data),
					dataType: 'json',
					success: function(message){
						 BootstrapAlert.success({ title : "Congrat!", message : "成功新增一筆球員紀錄" });
						 clubMemberName.empty().text(clubMemberName1).attr('memberId',message.fightRecordVO.clubMemberId).attr('clubId',message.fightRecordVO.clubId);
						 gamePlayer.empty().text(message.fightRecordVO.gamePlayer);
					     position.empty().text(message.fightRecordVO.position).addClass('change');
					     if(message.fightRecordVO.gameStart==true){
					     gameStart.empty().text('V').addClass('change');
					     }else{gameStart.empty().text('')};
					     minPlay.empty().text(message.fightRecordVO.minPlay).addClass('change');
					     trePA.empty().text(message.fightRecordVO.trePA).addClass('change');
					     trePM.empty().text(message.fightRecordVO.trePM).addClass('change');
					     trePP.empty().text(message.fightRecordVO.trePP);
					     twoPA.empty().text(message.fightRecordVO.twoPA).addClass('change');
					     twoPM.empty().text(message.fightRecordVO.twoPM).addClass('change');
					     twoPP.empty().text(message.fightRecordVO.twoPP);
					     fta.empty().text(message.fightRecordVO.fta).addClass('change');
					     ftm.empty().text(message.fightRecordVO.ftm).addClass('change');
					     ftp.empty().text(message.fightRecordVO.ftp);
					     ofRep.empty().text(message.fightRecordVO.ofRep).addClass('change');
					     deRep.empty().text(message.fightRecordVO.deRep).addClass('change');
					     totalRep.empty().text(message.fightRecordVO.totalRep);
					     ass.empty().text(message.fightRecordVO.ass).addClass('change');
					     steal.empty().text(message.fightRecordVO.steal).addClass('change');
					     block.empty().text(message.fightRecordVO.block).addClass('change');
					     turnOver.empty().text(message.fightRecordVO.turnOver).addClass('change');
					     fouls.empty().text(message.fightRecordVO.fouls).addClass('change');
					     score.empty().text(message.fightRecordVO.score).addClass('change');
					     var ahrefs=$('#clickButton').find('a').clone(true);
					     button.parent().empty().append(ahrefs);       
					     tr.css('background-color','');
                           
						}
                  });

              
			    }
	    </script>

	</body>
<div style="display:none">
	 <select id="clubA"  clubId="${clubA.clubID}">
	<c:forEach items="${clubA.clubmembers}" var="clubMember">
	<option value="${clubMember.member.memberId}">${clubMember.member.memberLastName}${clubMember.member.memberFirstName}</option>
	</c:forEach>
	</select>
	<select id="clubB" clubId="${clubA.clubID}">
	<c:forEach items="${clubB.clubmembers}" var="clubMember">
	<option value="${clubMember.member.memberId}">${clubMember.member.memberLastName}${clubMember.member.memberFirstName}</option>
	</c:forEach>
	</select>
	
	<div id='clickButton'>
	<a class="btn btn-default updateRecord" href="#"  role="button">修改</a>
	<a class="btn btn-default deleteRecord" href="#" role="button">刪除</a>
	<a class="btn btn-default cancelRecord" href="#" style='display: none' role="button">取消</a>
	<a class="btn btn-default submitRecord" href="#" style='display: none' role="button">送出</a>
	</div>
</div>
</html>
