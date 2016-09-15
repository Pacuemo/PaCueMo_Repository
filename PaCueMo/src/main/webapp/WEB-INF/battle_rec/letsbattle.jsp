<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>
<%-- for Struts2 --%>

<!DOCTYPE html>
<html>
<head>
<c:url var="home" value="/" scope="request" />
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
.color_w {
	color: white;
}

.teamName {
	font-size: 32px;
	margin: 0px;
}

.margin_form {
	margin: 15px;
}
</style>
<script>
	
</script>
</head>
<body>

	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/WEB-INF/team/fragment/teamSidebar.jsp" />

	<div class="row">
		<div class="col-md-2">
			<form style="margin: 0px auto;" name="myData" action="Index.jsp" method="get">
				<div class="form-group">
					<input type="text" class="form-control" id="txtSearch" name="keyword" autocomplete="off">
					<!-- 				    <input type="submit" -->
					<!-- 						value="送出" class="btn btn-default btn-xs"> -->
				</div>
			</form>
			<div id="div1"></div>
		</div>
		<div class="col-md-8">
			<div class="content" style="padding-top: 30px">

				<div class="page-header">
					<h1 style="font-size: 36px">隊伍約戰</h1>
				</div>

				<form name="profile" method="post" action="" id="profile" role="form" novalidate="novalidate">

					<div class="form-group">
						<div class="col-sm-12 col-md-12" style="padding-left: 0px; padding-bottom: 10px;">
							<h2 class="col-sm-3 col-md-2 control-label teamName" style="padding-left: 0px;">約戰方：</h2>
							<div class="col-sm-3 col-md-4">
								<select id="select_teamB" class="form-control">
									<option>老師說的隊</option>
								</select>
							</div>

							<c:choose>
								<c:when test="">
									<label class="col-sm-3 col-md-2 control-label teamName">挑戰方：</label>
									<div class="col-md-3">
										<select id="select_teamB" class="form-control" style="margin: 7px;"></select>
									</div>
								</c:when>
								<c:when test="">
									<label class="col-sm-3 col-md-2 control-label teamName">地點：</label>
									<div class="col-sm-3 col-md-4">
										<h2>11</h2>
									</div>
								</c:when>
								<c:otherwise>
									<h2 class="col-sm-3 col-md-2 control-label teamName">挑戰方：</h2>
									<div class="col-sm-3 col-md-4">
										<select id="select_teamB" class="form-control">
											<option>老師說的隊</option>
										</select>
									</div>
								</c:otherwise>
							</c:choose>

						</div>
					</div>

					<div class="form-group">
						<label class="control-label" for="profile_gender">對戰模式</label> <select id="profile_gender" name="battleMode" required="" class="form-control">
							<option value="3">3 vs 3</option>
							<option value="5" selected="selected">5 vs 5</option>
						</select>
					</div>

					<div class="form-group">
						<label class="control-label" for="profile_postalCode">賭注</label> <input type="text" id="profile_postalCode" name="battleBet" maxlength="8" class="form-control">
					</div>

					<div class="form-group">
						<div id="profile_birthdate" class="bootstrap-date row">
							<div class="col-xs-4">
								<label class="control-label">場地名稱</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">縣、市</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">鄉、鎮、區</label>
							</div>
						</div>
						<div id="profile_birthdate" class="bootstrap-date row">
							<div class="col-xs-4">
								<select id="courtName" name="courtName" required="" class="form-control valid">
									<option value="2015">場地名稱</option>
									<option value="2014">用ajax抓資料</option>
								</select>
							</div>
							<div class="col-xs-4">
								<select id="courtCity" name="courtCity" required="" class="form-control valid">
									<option disabled="disabled" selected="selected">全部縣市</option>
									<option value="2">臺北市</option>
									<option value="3">新北市</option>
									<option value="4">桃園市</option>
									<option value="5">基隆市</option>
									<option value="6">新竹市</option>
									<option value="7">新竹縣</option>
									<option value="8">宜蘭縣</option>
									<option value="9">苗栗縣</option>
									<option value="10">臺中市</option>
									<option value="11">彰化縣</option>
									<option value="12">南投縣</option>
									<option value="13">雲林縣</option>
									<option value="14">嘉義縣</option>
									<option value="15">嘉義市</option>
									<option value="16">臺南市</option>
									<option value="17">屏東縣</option>
									<option value="18">高雄市</option>
									<option value="19">花蓮縣</option>
									<option value="20">臺東縣</option>
									<option value="21">澎湖縣</option>
									<option value="22">金門縣</option>
									<option value="23">連江縣</option></select>
							</div>
							<div class="col-xs-4">
							
								<select id="profile_birthdate_day" name="profile[birthdate][day]" required="" class="form-control">
									<option value="1">1</option>
									<option value="2">2</option>
								</select>
							</div>
						</div>
					</div>

					<div class="form-group">
						<div id="profile_birthdate" class="bootstrap-date row">
							<div class="col-xs-4">
								<label class="control-label">對戰日期</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">時</label>
							</div>
							<div class="col-xs-4">
								<label class="control-label">分</label>
							</div>
						</div>
						<div id="battleDateTime" class="bootstrap-date row">
							<div class="col-xs-4">
<!-- 								點擊後彈出日期選擇器 -->
								<input type="text" id="battleDate" name="battleDate" readonly="readonly" value="2016-09-15" class="form-control" style="color: black;">
							</div>
							<div class="col-xs-4">
								<select id="battleHr" name="battleHr" required="" class="form-control valid">
									<option value="1" selected="selected">1</option>
									<option value="2">2</option>
									<option value="3">3</option>
									<option value="4">4</option>
									<option value="5">5</option>
									<option value="6">6</option>
									<option value="7">7</option>
									<option value="8">8</option>
									<option value="9">9</option>
									<option value="10">10</option>
									<option value="11">11</option>
									<option value="12">要改成用script寫</option></select>
							</div>
							<div class="col-xs-4">
								<select id="battleMin" name="battleMin" required="" class="form-control">
										<option value="00" selected="selected">00</option>
										<option value="05">05</option>
										<option value="10">10</option>
										<option value="15">15</option>
										<option value="20">20</option>
										<option value="25">25</option>
										<option value="30">30</option>
										<option value="35">35</option>
										<option value="40">40</option>
										<option value="45">45</option>
										<option value="50">50</option>
										<option value="55">55</option>
								</select>
							</div>
						</div>
					</div>



					<!-- 					<div class="form-group"> -->
					<!-- 						<label class="control-label" for="profile_country">所在國家</label>  -->
					<!-- 						<select id="profile_country" name="profile[country]" disabled="disabled" required="" class="form-control"> -->
					<!-- 							<option value="tw">台灣</option> -->
					<!-- 						</select> <span class="help-block">瀏覽更多<a href="https://support.spotify.com/learn-more/faq/#!/article/How-can-I-change-my-country-setting">更改國家。</a></span> -->
					<!-- 					</div> -->

					<div class="form-group" style="margin-bottom: 5px;">
						<span class="help-block" style="text-align: right;margin-bottom: 5px">一旦點擊約戰，即表示你同意 <a href="#">Pacuemo 的條款及細則 </a> 與 <a href="#" target="_blank"> 隱私政策</a></span>
					</div>

					<div class="row-buttons-bordered" style="margin-top: 20px;">
						<button type="submit" id="submit" name="submit" class="btn-sm js-gtm-event btn btn-primary">約戰</button>
						<a id="profile_cancel" name="profile[cancel]" class="btn btn-tertiary btn-sm btn-cancel" onclick="history.back()">取消</a>
					</div>
					<input type="hidden" id="profile__token" name="profile[_token]" class="form-control" value="7ToZqqdkScbZNNOmX_N7FmDr8k4gwgD584FfdSjC-0A">
				</form>

			</div>



		</div>
		<div class="col-md-2">
			<div class="col-md-2"></div>
			<div class="col-md-10">
				<div id="cont_ca9ddef90f63f255a3e37230d88fb6e7">
					<script type="text/javascript" async src="https://www.theweather.com/wid_loader/ca9ddef90f63f255a3e37230d88fb6e7"></script>
				</div>
			</div>
		</div>
	</div>



	<script type="text/javascript">
		$(function()
		{
			var datas;
			var availableTags = [ "ActionScript", "AppleScript", "Asp", "BASIC", "C", "C++", "Clojure", "COBOL", "ColdFusion", "Erlang", "Fortran", "Groovy", "Haskell", "Java", "JavaScript", "Lisp", "Perl", "PHP", "Python", "Ruby", "Scala", "Scheme" ];
			$("#address").keyup(function()
			{
				$.ajax({ "type" : "get", "url" : "${home}spring/battle_rec/getCourtVOs", "data" : { "address" : $(this).val() }, "dataType" : "json", "success" : function(data)
				{
					console.log(data[0].name)
					$("#address").autocomplete("option", "source", availableTags);
				} });

			});

			$("#address").autocomplete({ source : availableTags });

		});
	</script>
</body>
</html>
