﻿<div id="sidebar" class="container-fluid"> 
 <nav class="navbar1 navbar-inverse easy-sidebar">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
    <ul class="nav1 ul1">
    <li><button type="button" class="navbar-toggle easy-sidebar-toggle" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button></li>
    </ul>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="#">Link <span class="sr-only">(current)</span></a></li>
      <li><a href="#">Link</a></li>
      <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
          <li><a href="#">Separated link</a></li>
          <li class="divider"></li>
          <li><a href="#">One more separated link</a></li>
        </ul>
      </li>
      <li><a id="buyCoin" style="font-family:微軟正黑體;color:red;">購買代幣</a></li>
    </ul>

    <!-- 搜尋 開始 -->
    <form id="searchForm" class="navbar-form navbar-left" role="search">
      <div class="form-group">
        <input id="searchName" type="text" value="${queryTeamName}" class="form-control" placeholder="Search" autocomplete="off"/>
      </div>
      <button id="searchBtn" type="submit" class="btn btn-default">Submit</button>
    </form>
    <!-- 搜尋 結束 -->
    
    <ul class="nav navbar-nav navbar-left">
      <li><a href="#">Link</a></li>
      <li class="dropdown"> <a href="#" class="dropdown-toggle" data-toggle="dropdown" role="button" aria-expanded="false">Dropdown <span class="caret"></span></a>
        <ul class="dropdown-menu" role="menu">
          <li><a href="#">Action</a></li>
          <li><a href="#">Another action</a></li>
          <li><a href="#">Something else here</a></li>
          <li class="divider"></li>
          <li><a href="#">Separated link</a></li>
        </ul>
      </li>
    </ul>
  </div>
  <!-- /.container-fluid --> 
  <!-- ===【DatePicker 開始】=== -->
	<form id="dateForm" action="javascript:void(0)" method="POST" class="navbar-form navbar-left">
         <div>
             <input id="myDatepicker" value="${queryDate}" type="text" style="margin: 5px 0 0 23px;width:200px;font-weight:400;">
             <div id="dateBox" style="margin: 5px 0 0 23px; height: 250px ; position:relative;"></div>
         </div>
	</form>
  <!-- ===【DatePicker 結束】=== -->
</nav>
</div>
<script>
	$(function(){
		/* -----------【阻止 submit 按鈕跳轉】------------------- */
		$("#searchBtn").click(function(event){
			event.preventDefault();
		})
		
		$('#test,.navbar-toggle.easy-sidebar-toggle').click(function(e) {
		    e.preventDefault();
		    $('body').toggleClass('toggled');
		    $('.navbar1.easy-sidebar').removeClass('toggled');
		});
		$('html').on('swiperight', function(){
		    $('body').addClass('toggled');
		});
		
		$('html').on('swipeleft', function(){
		    $('body').removeClass('toggled');
		});
	})
</script>