<div class="container-fluid"> 
 <nav class="navbar1 navbar-inverse easy-sidebar">
  <div class="container-fluid"> 
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      </div>
  </div>
  <!-- /.container-fluid --> 
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
		/* -----------【阻止 submit END!!!】------------------- */

		
		$
		

		
	})
</script>