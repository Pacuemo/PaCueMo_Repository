<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>courtQuery</title>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
	<div style="margin-left: 100px;margin-right: 100px">
		<div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 30px">
			<h2 class="page-header title-color" style="color: red">
				<span class="text-lgspacing">最新場館</span>
			</h2>
			<ol class="breadcrumb printdisplaynone">
				<!--                 <li> -->
				<!--                     <a class="navbar-brand" href="/">首頁</a> -->
				<!--                 </li> -->
				<li><span style="color: red">查詢結果 : 共有<strong class="text-info" style="font-size: 18px"> XX </strong>筆
				</span></li>
			</ol>
			<div class="btn-group printdisplaynone pull-right" role="group">
				<a class="btn btn-default" href="" id="SearchQueryText"><i class="fa fa-list printdisplaynone"></i>文字版</a>
			</div>
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 printdisplaynone">
			<div class="form-group">
				<select class="form-control" id="aCityID" name="City">
					<option value="">全部縣市</option>
					<option value="2">臺北市</option>
					<option value="3">高雄市</option>
					<option value="4">基隆市</option>
					<option value="5">新北市</option>
					<option value="6">桃園市</option>
					<option value="7">新竹縣</option>
					<option value="8">新竹市</option>
					<option value="9">苗栗縣</option>
					<option value="10">臺中市</option>
					<option value="11">彰化縣</option>
					<option value="12">南投縣</option>
					<option value="13">雲林縣</option>
					<option value="14">嘉義縣</option>
					<option value="15">嘉義市</option>
					<option value="16">臺南市</option>
					<option value="17">屏東縣</option>
					<option value="18">宜蘭縣</option>
					<option value="19">花蓮縣</option>
					<option value="20">臺東縣</option>
					<option value="21">澎湖縣</option>
					<option value="22">金門縣</option>
					<option value="23">連江縣(馬祖)</option>
				</select>
			</div>
			<div class="form-group">
				<select class="form-control" id="aCountryID" name="Country">
					<option value="">全部行政區</option>
				</select>
			</div>
			<div class="form-group">
				<input name="Name" id="Name" type="text" class="form-control" placeholder="請輸入名稱" style="margin-bottom: 10px;">
			</div>
			<input type="hidden" name="SearchType" value="SearchQuery"> <input type="hidden" name="Latitude" id="Latitude" value=""> <input type="hidden" name="Longitude" id="Longitude" value="">
			<div class="form-group">
				<button id="" class="btn btn-danger form-control advancedSubmit" type="submit">
					<i class="fa fa-search"></i> 找設施
				</button>
			</div>
			<div></div>
		</div>
	</div>
</body>
</html>