	<nav class="navbar navbar-default" style="height: 70px;background-color: #000d1a">
		<div class="container" style="height: 100%; text-align: center;">
			<ul class="nav nav-pills" style="margin-top: 1.5%;">
				<li role="presentation"  style="margin-left: 35%;"><a href="${pageContext.request.contextPath}/spring/club/login" id="btn-home" >Home</a></li>
				<li role="presentation" ><a href="${pageContext.request.contextPath}/spring/club/login" id="btn-profile" >Profile</a></li>
				<li role="presentation" ><a href="${pageContext.request.contextPath}/spring/clubChat/getAll?clubId=${MyClub.clubID}&memberId=${LoginOK.memberId}">Messages</a></li>
			</ul>
		</div>
	</nav>