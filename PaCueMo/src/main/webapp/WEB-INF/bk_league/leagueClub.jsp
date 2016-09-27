<%@page import="java.text.SimpleDateFormat"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

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
input[type="text"] {
	border: 0px;
	width: inherit;
	height: inherit;
	background-color: inherit;
}

input[type='date'] {
	border: 0px;
	width: inherit;
	height: inherit;
	background-color: inherit;
}

input[type='time'] {
	border: 0px;
	width: inherit;
	height: inherit;
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
					<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="<%=request.getContextPath()%>/index.jsp">PaCueMo</a>
			</div>
			<!-- /.navbar-header -->

			<ul class="nav navbar-top-links navbar-right">
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-envelope fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-messages">
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted"> <em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted"> <em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<strong>John Smith</strong> <span class="pull-right text-muted"> <em>Yesterday</em>
									</span>
								</div>
								<div>Lorem ipsum dolor sit amet, consectetur adipiscing elit. Pellentesque eleifend...</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>Read All Messages</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-messages --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-tasks fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-tasks">
						<li><a href="#">
								<div>
									<p>
										<strong>Task 1</strong> <span class="pull-right text-muted">40% Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
											<span class="sr-only">40% Complete (success)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 2</strong> <span class="pull-right text-muted">20% Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="20" aria-valuemin="0" aria-valuemax="100" style="width: 20%">
											<span class="sr-only">20% Complete</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 3</strong> <span class="pull-right text-muted">60% Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
											<span class="sr-only">60% Complete (warning)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<p>
										<strong>Task 4</strong> <span class="pull-right text-muted">80% Complete</span>
									</p>
									<div class="progress progress-striped active">
										<div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
											<span class="sr-only">80% Complete (danger)</span>
										</div>
									</div>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See All Tasks</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-tasks --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-bell fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-alerts">
						<li><a href="#">
								<div>
									<i class="fa fa-comment fa-fw"></i> New Comment <span class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-twitter fa-fw"></i> 3 New Followers <span class="pull-right text-muted small">12 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-envelope fa-fw"></i> Message Sent <span class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-tasks fa-fw"></i> New Task <span class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a href="#">
								<div>
									<i class="fa fa-upload fa-fw"></i> Server Rebooted <span class="pull-right text-muted small">4 minutes ago</span>
								</div>
						</a></li>
						<li class="divider"></li>
						<li><a class="text-center" href="#"> <strong>See All Alerts</strong> <i class="fa fa-angle-right"></i>
						</a></li>
					</ul> <!-- /.dropdown-alerts --></li>
				<!-- /.dropdown -->
				<li class="dropdown"><a class="dropdown-toggle" data-toggle="dropdown" href="#"> <i class="fa fa-user fa-fw"></i> <i class="fa fa-caret-down"></i>
				</a>
					<ul class="dropdown-menu dropdown-user">
						<li><a href="#"><i class="fa fa-user fa-fw"></i> User Profile</a></li>
						<li><a href="#"><i class="fa fa-gear fa-fw"></i> Settings</a></li>
						<li class="divider"></li>
						<li><a href="login.html"><i class="fa fa-sign-out fa-fw"></i> Logout</a></li>
					</ul> <!-- /.dropdown-user --></li>
				<!-- /.dropdown -->
			</ul>
			<!-- /.navbar-top-links -->

			<div class="navbar-default sidebar" role="navigation">
				<div class="sidebar-nav navbar-collapse">
					<ul class="nav" id="side-menu">
						<li class="sidebar-search">
							<div class="input-group custom-search-form">
								<input type="text" class="form-control" placeholder="Search..."> <span class="input-group-btn">
									<button class="btn btn-default" type="button">
										<i class="fa fa-search"></i>
									</button>
								</span>
							</div> <!-- /input-group -->
						</li>
						<li><a href="<%=request.getContextPath()%>/indexBackStage.jsp"><i class="fa fa-dashboard fa-fw"></i> Dashboard - HOME</a></li>


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
				<!-- 	                <div class="col-lg-12"> -->
				<!-- 	                    <h1 class="page-header">聯賽社團管理</h1> -->
				<!-- 	                </div> -->
				<!-- /.col-lg-12 -->
				<nav class="navbar navbar-default" style="height: 70px;">
					<div class="container" style="height: 100%; text-align: center;font-size: 200%; font-weight: bold;">
						<ul class="nav nav-pills" style="margin-top: 0.5%;">
							<li role="presentation" style="margin-left: 35%;"><a href="#" id="btn-club" style="color:#262626">聯賽社團管理</a></li>
							<li role="presentation"><a href="#" id="btn-record" style="color:#bfbfbf">聯賽場次管理</a></li>	
						</ul>
					</div>
				</nav>
			</div>
			<!-- /.row -->
			<div class="row"  id='leagueClubInfo' style="display: block">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">DataTables</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%" class="table table-striped table-bordered table-hover" >
								<thead>
									<tr>
										<th style="background-color:#0066FF;color:white">League Name</th>
										<th style="background-color:#0066FF;color:white">Club Name</th>
										<th style="background-color:#0066FF;color:white">Fight Groups</th>
										<th style="background-color:#0066FF;color:white">Button</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${LeagueClubVOs}" var="LeagueClubVO">
										<tr>
											<td name="${LeagueClubVO.leagueId}">${leagueName}</td>
											<td name="${LeagueClubVO.clubId}">${LeagueClubVO.clubVO.clubName}</td>
											<td><input type='text' name='Groups' disabled="disabled" value="${LeagueClubVO.groups}"></td>
											<td class="center"><a class="btn btn-default forUpdateClub" href="#" role="button">修改</a> <a class="btn btn-default delete" href="#" role="button" leagudId="${LeagueClubVO.leagueId}" clubId="${LeagueClubVO.clubId}">刪除</a> <input type="button" class='btn btn-default submitInfo' value="送出" style="display: none"></td>
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
<!-- 社團場次管理 -->
			<div class="row"  id='leagueRecordInfo' style="display: none">
				<div class="col-lg-12">
					<div class="panel panel-default">
						<div class="panel-heading">DataTables</div>
						<!-- /.panel-heading -->
						<div class="panel-body">
							<table width="100%" class="table table-striped table-bordered table-hover"  id='leagueRecordTable' >
								<thead>
									<tr>
										<th style="background-color:#0066FF;color:white">League Name</th>
										<th style="background-color:#0066FF;color:white">Club A(主)</th>
										<th style="background-color:#0066FF;color:white">Score A(主)</th>
										<th style="background-color:#0066FF;color:white">Club B(客)</th>
										<th style="background-color:#0066FF;color:white">Score B(客)</th>
										<th style="background-color:#0066FF;color:white">BattleTime(天)</th>
										<th style="background-color:#0066FF;color:white">BattleTime(時)</th>
										<th style="background-color:#0066FF;color:white">Round</th>
										<th style="background-color:#0066FF;color:white">Total Time</th>
										<th style="background-color:#0066FF;color:white;width:18%">Button</th>
									</tr>
								</thead>
								<tbody>
									<c:forEach items="${LeagueRecordVOs}" var="LeagueRecordVO">
										<jsp:useBean id="fightDateTime" class="java.util.Date"/>
										<jsp:setProperty property="time" name="fightDateTime" value="${LeagueRecordVO.fightDateTime.time}"/>
										<tr>
											<td >${leagueName}</td>
											<td >${LeagueRecordVO.clubA.clubName}</td>
											<td ><input type="text" class="scoreA"   disabled="disabled" value="${LeagueRecordVO.scoreA}"></td>
											<td >${LeagueRecordVO.clubB.clubName}</td>
											<td ><input type="text"  class="scoreB"  disabled="disabled"  value="${LeagueRecordVO.scoreB}"></td>	
											<fmt:formatDate var="fightDate" value="${fightDateTime}" type="Date" pattern="yyyy-MM-dd"  />										
											<td><input type="date" disabled="disabled"  value="${fightDate}"></td>
											<fmt:formatDate var="fightTime" value="${fightDateTime}" type="Time" pattern="HH:mm:ss"  />
											<td><input type="time" disabled="disabled"  value="${fightTime}"></td>
											<td><input type="text"  class="rounds" disabled="disabled"  value="${LeagueRecordVO.rounds}"></td>
											<td><input type="text" class="totalTime" disabled="disabled"  value="${LeagueRecordVO.totalTime}"></td>
											<td class="center"><a class="btn btn-default forUpdate" href="#" role="button">修改</a> <a class="btn btn-default deleteRecord" href="#" role="button"  fightId="${LeagueRecordVO.fightId}">刪除</a> 
											<input type="button" class='btn btn-default submitIRecord' value="送出" style="display: none"  clubIdA="${LeagueRecordVO.clubIdA}" clubIdB="${LeagueRecordVO.clubIdB}">
											<a class="btn btn-default fightRecord"  href="../fightRecordBackStage/getfightRecord?fightId=${LeagueRecordVO.fightId}&clubIdA=${LeagueRecordVO.clubIdA}&clubIdB=${LeagueRecordVO.clubIdB}" role="button" >場次資料</a></td>
										</tr>
									</c:forEach>

								</tbody>
							</table>
                             <a class="btn btn-default" href="#" role="button"  id="create">新增</a>
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

	<script src="<%=request.getContextPath()%>/js/bk_league/leagueClub.js"></script>

	<script>
		$(document).ready(function()
		{
			$('#dataTables-example').DataTable({ responsive : true });
            $('.deleteRecord').bind('click',deleteRecord);
        	$('.submitIRecord').bind('click',submitRecord);

			var leagueClubName=${LeagueclubNames};

			$("#create").click(function(e)
			               	{
			               		e.preventDefault();
			               		var tr=$('<tr></tr>');
			               		tr.css('background-color','#ffff99').
			               		append($('<td>${leagueName}</td>'+
											'<td ><select></select></td>'+
											'<td ></td>'+
											'<td ><select></select></td>'+
											'<td ></td>'	+																	
											'<td><input type="date" class="date" ></td>'+
											'<td><input type="time" class="time" ></td>'+
											'<td><input type="text"  class="rounds"></td>'+
											'<td></td>'+
											'<td><input type="button" class="btn btn-default submitData" value="送出" >'+
											'<input type="button" class="btn btn-default cancel" value="取消" ></td>'));
								$.each(leagueClubName,function(index,leagueClub){
									tr.find('select').append($('<option value='+leagueClub.ClubId+'>'+leagueClub.ClubName+'</option>'));									
									});
			               		tr.appendTo($('#leagueRecordTable'));
			               		tr.find('input.cancel').bind('click',cancel).prev().bind('click',submitData);
			               	});
		});

		function cancel(){
            $(this).parent().parent().remove();
			};

			
		function submitData(){
			  var tr=$(this).parent().parent();
			  var date=tr.find('.date').val();
			  var time=tr.find('.time').val();
			  var clubAName=tr.find('select:first').children(':selected').text();
			  var clubBName=tr.find('select').slice(1).children(':selected').text();
			  var rounds=tr.find('.rounds').val();
			  var data={};
			  data['leagueId']=${leagueId};
			  data['clubIdA']=tr.find('select:first').val();
			  data['clubIdB']=tr.find('select').slice(1).val();
				if(date=="" || time==""){

				}else{
					data['fightDateTime']=date+" "+time+":00";
					};

			  data['rounds']=rounds;
			  $.ajax({
					type: 'POST',
					url:'leagueRecordAdd',
					contentType: "application/json",
					data: JSON.stringify(data),
					dataType: 'json',
					success:function(response){
						
					 if(response.status){
						 BootstrapAlert.success({ title : "Congrat!", message : "成新增一筆聯賽場次資料" });
						 tr.empty().css('background-color','').append($('<td >${leagueName}</td>'+
									'<td >'+clubAName+'</td>'+
									'<td ><input type="text" class="scoreA"   disabled="disabled"></td>'+
									'<td >'+clubBName+'</td>'+
									'<td ><input type="text"  class="scoreB"  disabled="disabled"></td>'+										
									'<td><input type="date" disabled="disabled"  value='+date+'></td>'+
									'<td><input type="time" disabled="disabled"  value='+time+'></td>'+
									'<td><input type="text"  class="rounds" disabled="disabled"  value='+rounds+'></td>'+
									'<td><input type="text" class="totalTime" disabled="disabled"></td>'+
									'<td><a class="btn btn-default forUpdate" href="#" role="button">修改</a> <a class="btn btn-default deleteRecord" href="#" role="button" fightId='+response.leagueRecordVO.fightId+'>刪除</a>' +
									'<input type="button" class="btn btn-default submitIRecord" value="送出" style="display: none" '+
									' clubIdA='+response.leagueRecordVO.clubIdA+' clubIdB='+response.leagueRecordVO.clubIdB+'></td>'));
							tr.find('a.deleteRecord').bind('click',deleteRecord).next().bind('click',submitRecord).prev().prev().bind('click',updateRecord);
						 };
					}
				  });
		    };

		    function deleteRecord(){
				var button = $(this);
				$.ajax({
					type: "GET",
					url: "deleteLeagueRecord",
					data: { fightId: button.attr("fightId") },
					dataType: 'json',
					success: function (message){			
						if(message.status==1){
							BootstrapAlert.success({ title : "Congrat!", message : "成功刪除聯賽場次資料" });
							button.parent().parent().remove();
						}
					}
				});
			    };

				function submitRecord()
				{

					var button=$(this);
					var tr=$(this).parent().parent();
					var date=tr.find('input[type=date]').val();
					var time=tr.find('input[type=time]').val();
					var winner;
					var data={};
					data['fightId']=$(this).prev().attr('fightId');
					data['clubIdA']=$(this).attr('clubIdA');
					data['clubIdB']=$(this).attr('clubIdB');
					if(date=="" || time==""){

						}else{
							data['fightDateTime']=date+" "+time+":00";
							};
					data['rounds']=tr.find('input[class="rounds"]').val();
					data['scoreA']=tr.find('input[class="scoreA"]').val();
					data['scoreB']=tr.find('input[class="scoreB"]').val();
					data['totalTime']=tr.find('input[class="totalTime"]').val();
					if(data['scoreA']>data['scoreB']){
						winner=data['clubIdA'];
					}else{
						winner=data['clubIdB'];
					}
					data['winner']=winner;
					
					$.ajax({
			            type: "POST",
			            contentType: "application/json",
			            url: "updateLeagueRecord",
			            data: JSON.stringify(data),
			            dataType: 'json',
			            success: function (message) {
			             if(message.status==1){
			            	 BootstrapAlert.success({ title : "Congrat!", message : "成功修改聯賽場次資料" });
			            	 tr.css('background-color','').find('input').attr('disabled',true);             	 
			            	 button.css('display','none').next().css('display','inline-block').prev()
			            	 .prev().css('display','inline-block').prev().css('display','inline-block'); 
			             }
			            }
				     });					
				};


				//點選修改按鈕
				function updateRecord(e)
				{		
					e.preventDefault();
					$(this).attr('style','display:none')
					.next().attr('style','display:none')
					.next().attr('style','display:block')
					.parent().parent().css('background-color','#ffff99') 
					.find('input').removeAttr('disabled');
				};
			
	</script>

</body>
</html>
