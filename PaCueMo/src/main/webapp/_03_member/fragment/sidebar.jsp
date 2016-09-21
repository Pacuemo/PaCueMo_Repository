<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/playercardsidebar.css">
<div class="container-fluid"> 
 <nav class="navbar1 navbar-inverse easy-sidebar">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
    <ul class="nav1 ul1">
    <li><button type="button" class="navbar-toggle easy-sidebar-toggle" aria-expanded="false"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button></li>
    </ul>
    </div>
    <ul class="nav navbar-nav">
      <li class="active"><a href="${pageContext.request.contextPath}/_03_member/overview.do">帳戶概覽<span class="sr-only">(current)</span></a></li>
      <li><a href="${pageContext.request.contextPath}/_03_member/security.do">安全性</a></li>
      <li><a href="${pageContext.request.contextPath}/_03_member/accountdetails.jsp">帳戶餘額明細</a></li>
      <li><a href="${pageContext.request.contextPath}/_03_member/friendsList.do">好友列表</a></li>
    </ul>
    <form class="navbar-form navbar-left" role="search">
      <div class="form-group" id="search">
        <input id="searchName" type="text" class="form-control" placeholder="搜尋好友" autocomplete="off"/>
      </div>
      <button id="searchBtn" type="submit" class="btn btn-default">Submit</button>
    </form>
  </div>
  <!-- /.container-fluid --> 
</nav>
</div>
<script>
	$(function(){
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
		
		$("#searchName").bind("keyup",function(){
			
			var keyword = $(this).val();
			$.ajax({
				"type":"get",
				"url": "../spring/playercard/Playercard/search",
				"dataType": "json",
				"data":{"keyword": keyword},
				"success":function(data){
					$("button.outcome").remove();
					jQuery.each( data, function( i, member ) {
						console.log("data   "+data);
						if(data != null){
							if(data.length > 0){
								var name = member.memberLastName+member.memberFirstName;
								var button=$("<button class='outcome'></div>");
								button.text(name);
								button.val(member.memberId)
								if(member.memberFBId != null){
									button.prepend(' <img class="user-img img-thumbnail" src="https://graph.facebook.com/'+member.memberFBId+'/picture?width=36&amp;height=36" style="height:45px;width:45px">')
								}else if(member.memberImgUrl != null){
									button.prepend(' <img class="user-img img-thumbnail" src="${pageContext.request.contextPath}/image/member/'+member.memberImgUrl+'" style="height:45px;width:45px">')
								}else{
									button.prepend(' <img class="user-img img-thumbnail" src="${pageContext.request.contextPath}/image/member/user.jpg" style="height:45px;width:45px">')
								}
								$("#search").append(button);
							}
						}
					});
				}
			});
		})
		
		$(document.body).on("click",".outcome",function(e){
			e.preventDefault();
			var guid = $(this).val();
			location.href = "../spring/playercard/Playercard?guid="+guid;
		})
		
	})
</script>