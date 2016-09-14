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
	padding: 8px 8px;
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

.delete {
	background-color: #f44336;
	color: white;
	opacity: 0.8;
}

.delete:hover {
	background-color: white;
	color: black;
	border: 2px solid #f44336;
	opacity: 0.8;
}

.agree:disabled,.delete:disabled {
	pointer-events: none;
	cursor: default;
	background-color: gray;
	cursor: not-allowed;
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
				<li id="check-apply" style="display: none"><a id="apply-ajax" href="${pageContext.request.contextPath}/spring/club/applyCheck?clubId=${MyClub.clubID}">社員申請</a></li>
			</ul>

			<!-- 搜尋 開始 -->
			<form class="navbar-form navbar-left" role="search" action="${pageContext.request.contextPath}/spring/club/searchName" method="get">
				<div class="form-group">
					<input id="searchName" type="text" name="name" class="form-control" placeholder="Search" />
				</div>
				<button id="searchBtn" type="submit" class="btn btn-default">查詢社團</button>
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

<link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/themes/smoothness/jquery-ui.css">
<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.0/jquery-ui.min.js"></script>
<script src="<%=request.getContextPath()%>/js/bootstrapAlert.js"></script>
<script>
	$(function()
	{
		/* -----------【阻止 submit 按鈕跳轉】------------------- */
		// 		$("#searchBtn").click(function(event){
		// 			event.preventDefault();
		// 		})
		var memberId = "${LoginOK.memberId}";
		var clubHead = "${MyClub.clubHead}";
		var clubIda;
		var deleteBtn;
		if (memberId == clubHead)
		{
			$("#check-apply").attr("style", "display: block");
		}

		// ---------------------------------------------------------------------------------

		$("#dialog").dialog({ autoOpen : false, height : 400, width : 400, modal : true, close : function(event, ui)
		{
			$('#apply-ajax').attr("href", "${pageContext.request.contextPath}/spring/club/applyCheck?clubId=${MyClub.clubID}");
			$('#dialog').html("");
		}, position : { my : "center", at : "center", of : window } });

		// ---------------------------------------------------------------------------------
		// ------------------搜尋會員Ajax--------------------------------------------

		$("#apply-ajax").click(function(event)
		{
			event.preventDefault();

			$.ajax({ "type" : "GET", //傳遞方式				
			"url" : $(this).attr("href"), "dataType" : "json",//Servlet回傳格式
			"success" : function(data)
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
									alert($(this).val());
									$(this).prop("disabled", true);
									break;
							}
						} })
					});
				});
			} });
			$("#dialog").dialog("open");

		});

		// ---------------------------------------------------------------------------------

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