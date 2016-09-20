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
      <li><a href="${pageContext.request.contextPath}/spring/playercard/Myplayercard">我的球員卡<span class="sr-only"></span></a></li>
      <li><a href="${pageContext.request.contextPath}/_03_member/friendsList.do">我的好友列表<span class="sr-only"></span></a></li>
    </ul>

    <!-- 搜尋 開始 -->
    <form class="navbar-form navbar-left" role="search">
      <div class="form-group" id="search">
        <input id="searchName" type="text" class="form-control" placeholder="搜尋好友" autocomplete="off"/>
      </div>
      <button id="searchBtn" type="submit" class="btn btn-default">搜尋</button>
    </form>
    <!-- 搜尋 結束 -->
  </div>
  <!-- /.container-fluid --> 
</nav>
</div>
<div id="dialog-search" title="更多搜尋結果" style="display:none">

</div>
<script>
	$(function(){
		/* -----------【阻止 submit 按鈕跳轉】------------------- */
		$("#searchBtn").click(function(event){
			event.preventDefault();
			var keyword = $("#searchName").val();
			if(keyword != null && keyword.trim().length >0){
			$.ajax({
				"type":"get",
				"url": "Playercard/search",
				"dataType": "json",
				"data":{"keyword": keyword},
				"success":function(data){
					$("button.outcome").remove();
					$("button.more").remove();
					jQuery.each( data, function( i, member ) {
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
								$("#dialog-search").append(button);
							}
						}
					});
				}
			});
			dialogSearch.dialog( "open" );
			}else{
				alert("請輸入關鍵字")
			}
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
		/* -----------【阻止 submit END!!!】------------------- */

		
		$("#searchName").bind("keyup",function(){
			
			var keyword = $(this).val();
				$.ajax({
					"type":"get",
					"url": "Playercard/search",
					"dataType": "json",
					"data":{"keyword": keyword},
					"success":function(data){
						$("button.outcome").remove();
						$("button.more").remove();
						jQuery.each( data, function( i, member ) {
							if(i == 5){
								var button=$("<button class='more'></div>");
								button.html("尋找更多  <font class='test'>" +keyword+"</font> 的結果");
								$("#search").append(button);
								return false;
							}
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
			location.href = "Playercard?guid="+guid;
		})
		
		$(document.body).on("click",".more",function(e){
			e.preventDefault();
			var keyword = $("#searchName").val();
			$.ajax({
				"type":"get",
				"url": "Playercard/search",
				"dataType": "json",
				"data":{"keyword": keyword},
				"success":function(data){
					$("button.outcome").remove();
					$("button.more").remove();
					jQuery.each( data, function( i, member ) {
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
								$("#dialog-search").append(button);
							}
						}
					});
				}
			});
			dialogSearch.dialog( "open" );
		})
		
		 dialogSearch = $( "#dialog-search" ).dialog({
		      autoOpen: false,
		      height: 500,
		      width: 400,
		      modal: true,
		      buttons: {
		        "關閉": function() {
					$("button.outcome").remove();
					$('#dialog-search').dialog('close');
		        }
		      },
		      close: function() {
					$("button.outcome").remove();
					$('#dialog-search').dialog('close');
		      }
		    });
		
	})
</script>