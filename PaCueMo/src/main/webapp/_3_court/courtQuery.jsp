<%@ page language="java" contentType="text/html; charset=UTF8" pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<title>courtQuery</title>
<style>
</style>
</head>
<body>
	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="/fragment/sidebar.jsp" />
	<div style="margin-left: 100px; margin-right: 100px">
		<div class="col-lg-12 col-md-12 col-sm-12" style="margin-bottom: 30px">
			<h2 class="page-header title-color" style="color: red">
				<span class="text-lgspacing">最新場館</span>
			</h2>
			<!-- 			<ol class="breadcrumb printdisplaynone"> -->
			<!-- 				<li><span style="color: red">查詢結果 : 共有<strong class="text-info" style="font-size: 18px"> XX </strong>筆 -->
			<!-- 				</span></li> -->
			<!-- 			</ol> -->
			<!-- 			<div class="btn-group printdisplaynone pull-right" role="group"> -->
			<!-- 				<a class="btn btn-default" href="" id="SearchQueryText"><i class="fa fa-list printdisplaynone"></i>文字版</a> -->
			<!-- 			</div> -->
		</div>
		<div class="col-lg-3 col-md-3 col-sm-4 printdisplaynone">
			<div class="form-group">
				<select class="form-control" onchange="renew(this.selectedIndex);">
					<option disabled="disabled" selected="selected">全部縣市</option>
					<option value="2">臺北市</option>
					<option value="3">新北市</option>
					<option value="4">高雄市</option>
					<option value="5">基隆市</option>
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
				<select class="form-control" id="blocks">
					<option disabled="disabled" selected="selected">全部行政區</option>
				</select>
			</div>
			<div class="form-group">
				<input type="text" class="form-control" placeholder="請輸入名稱" style="margin-bottom: 10px;">
			</div>
			<div class="form-group">
				<button class="btn btn-danger form-control advancedSubmit" type="submit">
					<i class="fa fa-search"></i> 找球場
				</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
		manyBlocks = new Array();
		manyBlocks[1] = [ "中正區", "大同區", "中山區","松山區","大安區","萬華區","信義區","士林區","北投區","內湖區","南港區","文山區" ];
		manyBlocks[2] = [ "八里區", "三芝區", "三重區","三峽區","土城區","中和區","五股區","平溪區","永和區","石門區","石碇區","汐止區","坪林區","林口區","板橋區","金山區","泰山區","烏來區","貢寮區","淡水區","深坑區","新店區","新莊區","瑞芳區","萬里區","樹林區","雙溪區","蘆洲區","鶯歌區" ];

		function renew(index)
		{
			for (var i = 0; i < manyBlocks[index].length; i++)
				blocks.options[i] = new Option(manyBlocks[index][i]);
			blocks.length = manyBlocks[index].length;
		}
	</script>
</body>
</html>