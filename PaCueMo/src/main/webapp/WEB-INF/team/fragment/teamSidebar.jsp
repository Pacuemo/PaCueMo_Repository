<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<style>

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
			<script></script>
			<ul class="nav navbar-nav">
				<c:choose>
					<c:when test="${pageForSideBar == 'teampage' && teamExsist == 'Mine'}">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">隊伍設定<span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu" style="margin-left: 80px">	
								<li><a href="#">加隊員</a></li>
								<li><a href="#">發送訊息</a></li>
								<li class="divider"></li>
								<li><a href="#">管理隊伍</a></li>
								<li><a href="#">編輯隊伍設定</a></li>
								<li class="divider"></li>
								<li><a href="#">解散隊伍</a></li>
								<li><a id="a_createTeam" href="#">建立新隊伍</a></li>
							</ul>
						</li>
					</c:when>
					<c:when test="${pageForSideBar == 'teampage' && teamExsist == 'Exsist'}">
						<li class="dropdown"><a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">隊伍設定 <span class="caret"></span></a>
							<ul class="dropdown-menu" role="menu" style="margin-left: 80px">
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
		});
		$('html').on('swiperight', function()
		{
			$('body').addClass('toggled');
		});

		$('html').on('swipeleft', function()
		{
			$('body').removeClass('toggled');
		});

		
		
// init End
	})
</script>