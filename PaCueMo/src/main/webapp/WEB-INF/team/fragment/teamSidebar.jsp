<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.springframework.org/tags" prefix="s"%>
<style>
.team-dialog{

}
.badge {
	padding-left:7px;
	background-color: #00cc00;
}
</style>
<%-- <script src="${pageContext.request.contextPath }/js/jquery-3.1.0.min.js"></script> --%>
<!-- <script src="https://netdna.bootstrapcdn.com/bootstrap/3.0.2/js/bootstrap.min.js"></script> -->

<script src="${pageContext.request.contextPath }/js/jquery-ui.min.js"></script>
<script src="${pageContext.request.contextPath }/js/jquery.confirm.min.js"></script>
<div class="container-fluid">
	<nav class="navbar1 navbar-inverse easy-sidebar">
		<div class="container-fluid">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<ul class="nav1 ul1">
					<li><button type="button" class="navbar-toggle easy-sidebar-toggle" aria-expanded="false">
							<span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span>
						</button></li>
				</ul>
			</div>
			<script></script>
			<ul class="nav navbar-nav">
				<c:if test="${not empty requestScope.myList}">
					<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">選擇隊伍 <span class="caret"></span></a>
						<ul class="dropdown-menu" role="menu" style="margin-left: 80px">
						 <c:forEach var="my_list" items="${requestScope.myList }">
						 	<li><a href="${pageContext.request.contextPath }/TeamServlet?teamId=${my_list.teamId}" style="font-size: 23px;font-family: '微軟正黑體';font-weight: bolder;">${my_list.teamName}</a><li>
						 </c:forEach>
						</ul>
					</li>
				</c:if>
				<c:choose>
					<c:when test="${pageForSideBar == 'haveTeamId' && teamExsist == 'Mine'}">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">隊伍設定<span class="caret"></span></a>
							<ul class="dropdown-menu ul_a" role="menu" style="margin-left: 80px;">	
								<li><a href="#">加隊員</a></li>
								<li><a href="#">發送訊息</a></li>
								<li class="divider"></li>
								<li>
									<a id="apply_team" href="#" style="padding-left: 25px;padding-right: 0px;">管理隊伍 <span class="badge"></span></a>
								</li>
								<li>
									<s:url value="/spring/team/settingTeamPage" var="s_settingTeam" scope="request">
										<s:param name="teamId" value="${requestScope.teamVO.teamId }"></s:param>
									</s:url>
									<a id="a_settingTeam" href="${s_settingTeam}">編輯隊伍設定</a>
								</li>
								<li class="divider"></li>
								<li><a id="a_disbandTeam" href="#">解散隊伍</a></li>
								<li><a id="a_createTeam" href="#">建立新隊伍</a></li>
							</ul>
						</li>
					</c:when>
					<c:when test="${pageForSideBar == 'haveTeamId' && teamExsist == 'Exsist'}">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">隊伍設定 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu" style="margin-left: 80px;width: 200px">
								<li><a href="#">加隊員</a></li>
								<li><a href="#">發送訊息</a></li>
								<li class="divider"></li>
								<li><a id="a_createTeam" href="#">建立新隊伍</a></li>
							</ul>
						</li>
					</c:when>
					
				</c:choose>
			</ul>

			<!-- 搜尋 開始 -->
			<form class="navbar-form navbar-left" role="search">
				<div class="form-group">
					<input id="searchName" type="text" class="form-control" placeholder="Search" />
				</div>
				<button id="searchBtn" type="submit" class="btn btn-default">Submit</button>
			</form>
			<!-- 搜尋 結束 -->

			<ul class="nav navbar-nav navbar-left">
				<li><a href="#">Link</a></li>
				<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
					<ul class="dropdown-menu" role="menu">
						<li><a href="#">Action</a></li>
						<li><a href="#">Another action</a></li>
						<li><a href="#">Something else here</a></li>
						<li class="divider"></li>
						<li><a href="#">Separated link</a></li>
					</ul></li>
			</ul>
		</div>
		<!-- /.container-fluid -->
	</nav>
</div>

<div id="dialog" title="申請用戶"></div>
<div id="dialog-apply" title="社團申請"></div>

<script>
	$(function()
	{
		/* -----------【阻止 submit 按鈕跳轉】------------------- */
		$("#searchBtn").click(function(event)
		{
			event.preventDefault();
		})

		$('#test,.navbar-toggle.easy-sidebar-toggle').click(function(e)
		{
			e.preventDefault();
			$('body').toggleClass('toggled');
			$('.navbar1.easy-sidebar').removeClass('toggled');
			
			// 查詢未讀申請
			check_count()
		});
		$('html').on('swiperight', function()
		{
			$('body').addClass('toggled');
		});

		$('html').on('swipeleft', function()
		{
			$('body').removeClass('toggled');
		});

		//setting confirm 
		$("#a_disbandTeam").confirm({
		    title:"解散隊伍",
		    text:"一旦解散隊伍，就無法再回復!   確定要解散嗎?",
		    confirm: function(button) {
		    	$.ajax({ 
					"type" : "get", 
					"url" : "${home}spring/team/disbandTeam", // home 在 head
					"data" : { 
							"memberId" : "${sessionScope.LoginOK.memberId}", 
							"btn_disband" : "${requestScope.teamVO.teamId}" 
						}, 
					"dataType" : "text",
					"success" : function(data)
					{
						window.location.href= "${home}spring/team/createTeamPage";
					}, 
					"error" : function(Error)
					{
						alert("fuck");
						console.log(Error);
					} 
				})
		    },
		    cancel: function(button) {
		    },
		    confirmButton: "Yes",
		    cancelButton: "No"
		});
		
		var dialog;
		dialog = $("#contact").dialog({ autoOpen : false, height : 400, width : 350, modal : true, draggable : false, resizable : false, });
		$("#a_createTeam").on("click", function()	             		
		{
			dialog.dialog("open"); 			
		}); // sidebar dialog end  
		
		
		var memberId = "${LoginOK.memberId}";
		var teamHead = "${teamVO.teamHead}";
		var contextPath="${pageContext.request.contextPath}";
// // 		-----------------團長打開查看申請按鈕------------
// 		if (memberId == teamHead && $.trim(memberId).length !=0)
// 		{
// 			$("#check-apply").attr("style", "display: block");
// 			check_count();
// //	 		-----------------社員打開查看申請按鈕------------		
// 		}else if(memberId!=clubHead){
// 			$("#club-apply").attr("style", "display: block");

// 			}

		// ---------------------拿到未讀數目------------------
		function check_count()
		{
			$.ajax({ url : "${pageContext.request.contextPath}/spring/tm_apply/countChecked?clubId=${MyClub.clubID}",
// 					type : "get",
					data : {"teamId" : "${requestScope.teamVO.teamId}"},
					dataType : "json", 
					success : function(message)
					{
						if (message != 0)
						{
							$(".badge").text(message);
						}
						else
						{
							$(".badge").empty();
						}
					}
			});

		}
		// ---------------------拿到未讀數目------------------
		
		//---------------------改變未讀狀態為已讀---------------
		
    function check_chage()
		{
			$.ajax({ url : "${pageContext.request.contextPath}/spring/club/countChange?clubId=${MyClub.clubID}", dataType : "json", success : function(message)
			{		
					$(".badge").empty();
				}
			}) };
		
			//---------------------改變未讀狀態為已讀---------------	
		// --dialog設定---------------------------------------------------------------------

		$("#dialog").dialog({ autoOpen : false, height : 400, width : 400, modal : true, close : function(event, ui)
		{
			$('#apply-ajax').attr("href", "${pageContext.request.contextPath}/spring/club/applyCheck?clubId=${MyClub.clubID}");
			$('#dialog').html("");
			check_count();
		}, position : { my : "center", at : "center", of : window } });

		// ---------------------------------------------------------------------------------
		
		// ------------------搜尋會員Ajax--------------------------------------------

		$("#apply-ajax").click(function(event)
		{
			event.preventDefault();

			$.ajax({ "type" : "GET", //傳遞方式				
			url : $(this).attr("href"), "dataType" : "json",//Servlet回傳格式
			success : function(data)
			{
				$('#apply-ajax').attr("href", "#");
				var applyDiv = $('<div></div>').appendTo("#dialog");
				var ul = $('<ul></ul>').addClass("list-group").appendTo(applyDiv);
				$.each(data, function(index, object)
				{

					//--------------將名子放入(未來可以放超連結到個人頁面)-------------------
					var li = $('<li></li>').addClass("list-group-item").text(object.memberVO.memberLastName + object.memberVO.memberFirstName).appendTo(ul);

					//--------------同意按鈕----------------------------------------------------
					var agreeA = $('<input/>').addClass("agree").val("同意").attr("type", "button").appendTo(li).bind("click", function()
					{
						$(this).prop("disabled", true).siblings().prop("disabled", true);
						$.ajax({ type : "POST", url : "${pageContext.request.contextPath}/spring/club/agreeApply", dataType : "json",//Servlet回傳格式
						data : { "clubId" : object.clubId, "memberId" : object.memberId }, success : function(message)
						{

							switch ($.trim(message.status)) {
								case "success":
									BootstrapAlert.success({ title : "Congrat!", message : "成功新增一名社團成員!!!!" });
									break;
								case "already":
									BootstrapAlert.alert({ title : "Sorry!", message : "該會員已有社團，新增失敗" });
									break;
							}
						} })
					});
					//--------------同意按鈕----------------------------------------------------
					//--------------刪除按鈕----------------------------------------------------
					var deleteA = $('<input/>').addClass("delete").val("刪除").attr("type", "button").appendTo(li).bind("click", function()
					{
						$(this).prop("disabled", true).siblings().prop("disabled", true);
						$.ajax({ type : "POST", url : "${pageContext.request.contextPath}/spring/club/deleteApply", dataType : "json",//Servlet回傳格式
						data : { "clubId" : object.clubId, "memberId" : object.memberId }, success : function(message)
						{
							switch ($.trim(message.status)) {
								case "success":
									BootstrapAlert.success({ title : "Congrat!", message : "成功刪除申請資料" });
									break;
							}
						} })
					});
				});
			} });
			check_chage();
			$("#dialog").dialog("open");
		});
		
// init End
	})
</script>