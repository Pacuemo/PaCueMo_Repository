<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<!DOCTYPE >
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF8">
<link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
<title>帳戶 - Pacuemo</title>
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/_03_member/css/member.css">
<style type="text/css">
<style>
.test{

}

table.good , table.gamble {
    width: 100%;
}

table.good td {
	font-family:Consolas;
    padding-top: 10px;
}

table.gamble td {
	font-family:Consolas;
    padding-top: 10px;
    padding-right: 10px;
}
a.good{
	color:blue
}

td.number{
	text-align:center
}

table.good th{
	text-align:center
}


div.container.detail{
	width:80%
}

@media (max-width: 991px){
	div.container.detail {
	    width: 100% !important;
	    margin-left: 0;
	    margin-right: 0;
	}
}

</style>
</head>
<body>
<jsp:include page="/fragment/top.jsp" />
<jsp:include page="/_03_member/fragment/sidebar.jsp" />
<div class="container container-content detail">
	<div class="row">
		<div class="col-sm-12">
			<div class="content">
				<div class="page-header">
    				<h1>帳戶明細</h1>
  				</div>
				<div class="row">
   					<div class="col-sm-12 col-md-12">
	   					<div class="well card friendlist" id="">
		   				<h3 class="text-primary1"><a class="good">訂購明細表</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a class="gamble">下注明細表</a></h3>
		   				<table class="good">
		   				<thead>
		   				<tr>
		   				<th>訂單編號</th><th>購買時間</th><th>商品名稱</th><th>商品價格</th><th>購買數量(單位：點)</th><th>總額(單位：新台幣)</th>
		   				</tr>
		   				</thead>
		   				<tbody>
		   				<tr class="page">
		   				</tr>
		   				</tbody>
		   				</table>
		   				<table class="gamble">
		   				<thead>
		   				<tr>
		   				<th>下注編號</th><th>下注時間</th><th></th><th>下注場次</th><th></th><th>比賽時間</th><th>主隊(單位：點)</th><th>客隊(單位：點)</th>
		   				</tr>
		   				</thead>
		   				<tbody></tbody>
		   				</table>
	   				    </div>							
					 </div>
<!-- 					 <div class="col-sm-12 col-md-3"> -->
<!-- 					 	<div class="well card profile" id=""> -->
<!-- 							<h3 class="text-primary1">帳戶餘額</h3> -->
<%-- 							<h5 style="padding-button:10px;">餘額：${LoginOK.memberPoint} 點</h5> --%>
<!-- 							<a href="" class="btn btn-secondary btn-sm btn-block center-block" id="btn-store">儲值</a> -->
<!-- 						</div>	 -->
<!-- 					 </div> -->
   				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-sm-12">
		</div>
	</div>
</div>
<script type="text/javascript">
$(function(){
	  $.ajax({
			"type":"get",
			"url": "details.do",
			"dataType": "json",
			"success":function(data){
				console.log(data);
				$("table.gamble").hide();
				
				$.each(data.goods,function(i,detail){
					var date = new Date(detail.orderDateTime);
					console.log(date.toLocaleString());
					var tr = $("<tr></tr>");
					tr.append("<td class='number'>"+detail.orderId+"</td>")
					tr.append("<td class='number'>"+date.toLocaleString()+"</td>")
					tr.append("<td class='number'>點數</td>")
					tr.append("<td class='number'>1:100</td>")
					tr.append("<td class='number'>"+detail.coinQty+"</td>")
					tr.append("<td class='number'>"+detail.ntdQty+"</td>")
					$("table.good > tbody").append(tr)
				})
				
				$.each(data.gamble,function(i,detail){
					var date = new Date(detail.betTime);//下注時間
					var date1 = new Date(data.battle[i].battleTime);//比賽時間
					console.log(date.toLocaleString());
					var tr = $("<tr></tr>");
					tr.append("<td class='number'>"+detail.gambleId+"</td>")
					tr.append("<td>"+date.toLocaleString()+"</td>")
					tr.append("<td>(主)"+data.battle[i].home.teamName+"</td><td style='text-align:center'>VS</td><td>(客)"+data.battle[i].away.teamName+"</td>")
					tr.append("<td>"+date1.toLocaleString()+"</td>")
					tr.append("<td class='number'>"+detail.betHome+"</td>")
					tr.append("<td class='number'>"+detail.betAway+"</td>")
					$("table.gamble > tbody").append(tr)
				})
			}
		});
	  
	  $("a.good").bind("click",function(event){
		  event.preventDefault();
		  $(this).removeAttr("style");
		  $("a.gamble").removeAttr("style");
		  $("table.good").show();
		  $("table.gamble").hide();
	  })
	  $("a.gamble").bind("click",function(event){
		  event.preventDefault();
		  $(this).attr("style","color:blue");
		  $("a.good").attr("style","color:#2ebd59");
		  $("table.gamble").show();
		  $("table.good").hide();
	  })
})
</script>
</body>
</html>