<style>
.agree, .delete {
	border: 2px solid white;
	padding: 8px 8px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 8px;
	margin: 0px 8px;
	position: relative;
	right: -145px;
	border-radius: 8px;
}

.deleteApply {
	border: 2px solid white;
	padding: 8px 8px;
	text-align: center;
	text-decoration: none;
	display: inline-block;
	font-size: 8px;
	margin: 0px 8px;
	border-radius: 8px;
	width: 60px;
}

.agree {
	background-color: #4CAF50;
	color: white;
	opacity: 0.8;
}

.agree:hover {
	background-color: white;
	color: black;
	border: 2px solid #4CAF50;
	opacity: 0.8;
}

.delete, .deleteApply {
	background-color: #f44336;
	color: white;
	opacity: 0.8;
}

.delete:hover, .deleteApply:hover {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
	opacity: 0.8;
}

.agree:disabled, .delete:disabled, .deleteApply:disabled {
	pointer-events: none;
	cursor: default;
	background-color: gray;
	cursor: not-allowed;
}

.badge {
	background-color: #00cc00;
	padding: 5px 10px;
	margin-left: 80px;
}

.checked {
	background-color: #a6a6a6;
}

.deleteDiv {
	float: right;
	width: 100px;
	text-align: right
}

.clubName {
	padding: 5px 15px;
}

.clubName:hover {
	background-color: gray;
}

#clubNameDiv {
	z-index: 2000;
}
.applyItem{
height: 60px;
}
</style>
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
			<ul class="nav navbar-nav">
				<li class="active"><a href="${pageContext.request.contextPath}/spring/club/login">我的社團 <span class="sr-only">(current)</span></a></li>
				<li id="check-apply" style="display: none"><a id="apply-ajax" href="${pageContext.request.contextPath}/spring/club/applyCheck?clubId=${MyClub.clubID}">社員申請<span class="badge"></span></a></li>
				<li id="club-apply" style="display: none"><a id="applyClubInfo" href="${pageContext.request.contextPath}/spring/club/applyClubInfo?memberId=${LoginOK.memberId}">社團申請</a></li>
			</ul>

			<!-- 搜尋 開始 -->
			<form class="navbar-form navbar-left" role="search" >
				<div class="form-group">
					<input id="searchName" type="text" name="clubname" class="form-control" placeholder="Search" autocomplete="off"/>
					<div id="clubNameDiv" style="display: none">
						<ul class="list-group" id="clubName"></ul>
					</div>
					<span style="display: none" id="chooseClubId"></span>
				</div>
				<button id="searchBtn" type="button" class="btn btn-default">查詢社團</button>
			</form>
			<!-- 搜尋 結束 -->

			<!--     <ul class="nav navbar-nav navbar-left"> -->
			<!--       <li><a href="#">Link</a></li> -->
			<!--       <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a> -->
			<!--         <ul class="dropdown-menu" role="menu"> -->
			<!--           <li><a href="#">Action</a></li> -->
			<!--           <li><a href="#">Another action</a></li> -->
			<!--           <li><a href="#">Something else here</a></li> -->
			<!--           <li class="divider"></li> -->
			<!--           <li><a href="#">Separated link</a></li> -->
			<!--         </ul> -->
			<!--       </li> -->
			<!--     </ul> -->
		</div>
		<!-- /.container-fluid -->

	</nav>

</div>
<!-- <div id="dialog-modal" title="基本的模态对话框"> -->
<!--   <p>添加模态覆盖屏幕，让对话框看起来更突出，因为它让页面上其他内容变暗。</p> -->
<!-- </div> -->
<div id="dialog" title="申請用戶"></div>
<div id="dialog-apply" title="社團申請"></div>

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrapAlert.js"></script>
<script>
	$(function()
	{

		var memberId = "${LoginOK.memberId}";
		var clubHead = "${MyClub.clubHead}";
		var contextPath = "${pageContext.request.contextPath}";
		// 		-----------------團長打開查看申請按鈕------------
		if (memberId == clubHead && $.trim(memberId).length != 0)
		{
			$("#check-apply").attr("style", "display: block");
			check_count();
			//	 		-----------------社員打開查看申請按鈕------------		
		}
		else if (memberId != clubHead)
		{
			$("#club-apply").attr("style", "display: block");

		}

		// ---------------------拿到未讀數目------------------
		function check_count()
		{
			$.ajax({ url : "${pageContext.request.contextPath}/spring/club/countChecked?clubId=${MyClub.clubID}", dataType : "json", success : function(message)
			{
				if (message != 0)
				{
					$(".badge").text(message);
				}
				else
				{
					$(".badge").empty();
				}
			} });

		}
		// ---------------------拿到未讀數目------------------

		//---------------------改變未讀狀態為已讀---------------

		function check_chage()
		{
			$.ajax({ url : "${pageContext.request.contextPath}/spring/club/countChange?clubId=${MyClub.clubID}", dataType : "json", success : function(message)
			{
				$(".badge").empty();
			} })
		}
		;

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

		// --dialog-apply設定---------------------------------------------------------------------

		$("#dialog-apply").dialog({ autoOpen : false, height : 400, width : 400, modal : true, close : function(event, ui)
		{
			$('#applyClubInfo').attr("href", "${pageContext.request.contextPath}/spring/club/applyClubInfo?memberId=${LoginOK.memberId}");
			$('#dialog-apply').html("");
		}, position : { my : "center", at : "center", of : window } });

		// ---------------------------------------------------------------------------------
		// ------------------搜尋申請社團--------------------------------------------

		$("#applyClubInfo").click(function(event)
		{
			event.preventDefault();

			$.ajax({ "type" : "GET", //傳遞方式				
			url : $(this).attr("href"), "dataType" : "json",//Servlet回傳格式
			success : function(data)
			{

				$('#applyClubInfo').attr("href", "#");
				var applyDiv = $('<div></div>').appendTo("#dialog-apply");
				var ul = $('<ul></ul>').addClass("list-group").appendTo(applyDiv);
				$.each(data, function(index, object)
				{
					//--------------將社團名子放入(未來可以放超連結到社團頁面)-------------------
					if (object.checked == 1)
					{
						var li = $('<li></li>').addClass("list-group-item checked applyItem").appendTo(ul);
						var a = $('<a></a>').attr('href', contextPath + '/spring/club/getClubById?clubId=' + object.clubId).attr('style', 'color:#004080').text(object.clubVO.clubName).appendTo(li);
					}
					else
					{
						var li = $('<li></li>').addClass("list-group-item applyItem").appendTo(ul);
						var a = $('<a></a>').attr('href', contextPath + '/spring/club/getClubById?clubId=' + object.clubId).attr('style', 'color:#004080').text(object.clubVO.clubName).appendTo(li);
					}

					//--------------刪除按鈕----------------------------------------------------

					var deleteA = $('<input/>').addClass("deleteApply").val("刪除").attr("type", "button").bind("click", function()
					{
						$(this).prop("disabled", true);
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
					var deleteDiv = $('<div></div>').appendTo(li).append(deleteA).addClass("deleteDiv");
				});
			} });
			$("#dialog-apply").dialog("open");
		});

		// --------文字提示------------------------------------------------------------

		$("#searchName").on("input", function()
		{
			$("#clubName").html("");
			var name = $(this).val();
			if ($.trim(name) != "")
			{

				$.ajax({ type : "GET", url : "${pageContext.request.contextPath}/spring/club/searchName?name=" + name, dataType : "json", success : function(data)
				{
					$.each(data, function(index, object)
					{
						var li = $("<li>" + object.clubName + "</li>").addClass("list-group-item clubName").appendTo($("#clubName")).
						bind("click",function(){
                          $("#searchName").val(object.clubName);
                          $("#chooseClubId").val(object.clubID);
                          $("#clubNameDiv").attr("style", "display:none");
							});
					})
				}

				})
				$("#clubNameDiv").attr("style", "display:block");
			}
		});


//---------搜尋社團--------------

$("#searchBtn").click(function(e){
 e.preventDefault();
 location.href ="getClubById?clubId="+$("#chooseClubId").val();
	
})


		
		//----------------------------------------------------------------------------------------
		$('#test,.navbar-toggle.easy-sidebar-toggle').click(function(e)
		{
			e.preventDefault();
			$('body').toggleClass('toggled');
			$('.navbar1.easy-sidebar').removeClass('toggled');
		});
		$('html').on('swiperight', function()
		{
			$('body').addClass('toggled');
		});

		$('html').on('swipeleft', function()
		{
			$('body').removeClass('toggled');
		});
	})
</script>