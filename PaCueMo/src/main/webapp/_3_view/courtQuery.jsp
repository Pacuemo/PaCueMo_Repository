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
			<h2 class="page-header title-color" style="color: #2ebd59">
				<span class="text-lgspacing">找球場嗎?</span>
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
				<select class="form-control" onchange="changeBlocks(this.selectedIndex);">
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
					<option value="23">連江縣</option>
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
				<button class="btn btn-danger form-control " type="submit" style="color: #2ebd59">
					<i class="fa fa-search">搜尋</i>
				</button>
			</div>
		</div>
	</div>
	<script type="text/javascript">
// 		--------------------二階段選擇器
		manyBlocks = new Array();
		manyBlocks[1] = [ "中正區", "大同區", "中山區", "松山區", "大安區", "萬華區", "信義區", "士林區", "北投區", "內湖區", "南港區", "文山區" ];
		manyBlocks[2] = [ "八里區", "三芝區", "三重區", "三峽區", "土城區", "中和區", "五股區", "平溪區", "永和區", "石門區", "石碇區", "汐止區", "坪林區", "林口區", "板橋區", "金山區", "泰山區", "烏來區", "貢寮區", "淡水區", "深坑區", "新店區", "新莊區", "瑞芳區", "萬里區", "樹林區", "雙溪區", "蘆洲區", "鶯歌區" ];
		manyBlocks[3] = [ "桃園區", "龜山區", "八德區", "大溪區", "蘆竹區", "大園區", "中壢區", "龍潭區", "平鎮區", "楊梅區", "新屋區", "觀音區", "復興區", ];
		manyBlocks[4] = [ "仁愛區", "中正區", "中山區", "信義區", "安樂區", "暖暖區", "七堵區" ];
		manyBlocks[5] = [ "東區", "北區", "香山區" ];
		manyBlocks[6] = [ "竹北市", "竹東鎮", "新埔鎮", "關西鎮", "湖口鄉", "新豐鄉", "峨眉鄉", "寶山鄉", "北埔鄉", "芎林鄉", "橫山鄉", "尖石鄉", "五峰鄉" ];

		function changeBlocks(index)
		{
			for (var i = 0; i < manyBlocks[index].length; i++)
				blocks.options[i] = new Option(manyBlocks[index][i]);
			blocks.length = manyBlocks[index].length;
		}
		
// 		-------------------------查詢場地
		$("search").click(function(){
			funFlag = 'byCourtName';
			var searchName = $("#searchName").val(); // 搜尋textBox的值(隊名)
			$('#searchForm').attr({ 'ACTION':"<%=request.getContextPath()%>" + '/_3_view/' +
									'CourtServlet.do?'+
									'action=queryByName'+'&courtName='+ searchName +'&funFlag='+ funFlag , 
			  'METHOD':'POST'}).submit();
		})
// 		-------------------------分頁
		$("#slicePage").paginate({
		                count: "${battleSetList_len}",/* 分頁的總筆數 = 查到的資料/每頁顯示筆數 */
		                start: 1,
		                display: 10,
		                border: true,
		                text_color: 'rgb(93, 213, 83)',
		                background_color: 'rgb(40, 46, 67)',
		                text_hover_color: 'rgb(234, 57, 57)',
		                background_hover_color: '#00BBFF',
		                onChange: function (pageNo) {  /* pageNo → 當前頁數 */   //alert(pageNo); 
		               
			                //alert(funFlag); // 判斷使用者按下哪個按鈕
			                //alert(totalCount);
			                //===﹝ 根據 funFlag 決定 呼叫哪支 controller 的 action ﹞===
			                var actionName = "";       
			                var ajaxUrl    = "";
			                var searchName = "";
			                switch ( funFlag ) {
								case "byCourtName":
									actionName = "queryByNameAndPage";
									ajaxUrl    = "CourtServlet.do";
									searchName = $("#searchName").val();   // 查詢的隊伍名稱;
									break;								
							}	
			        		myAjaxFunction( ajaxUrl , actionName , searchName , "" , pageNo );// 呼叫﹝撈分頁資料 $.ajax function﹞
		                }
		        });       			
       		})
       		
       		//======================================================================================
       		//=========================【 撈分頁資料 $.ajax function 開始】=========================
       		//======================================================================================
       		function myAjaxFunction( var_ajaxUrl , var_actionName , var_searchName , var_pageNo) {

	            	$.ajax({
	            		"type": "POST" ,  //傳遞方式				
	            		"url" :  "<%=request.getContextPath()%>" + "/_3_view/" + var_ajaxUrl , 
	            		"dataType":"json",//Servlet回傳格式
	            		"data":{ "action": var_actionName , "pageNo":var_pageNo , "searchName": var_searchName },
	            		"success":function(data){
	            			//console.log(data[0]);
	            			var tableDiv = $("#tableDiv");
	            			tableDiv.children('.table').remove();// 每次按下換頁，先移除舊資料
	            			var mytable =  $('<table></table>').addClass("table");
	    					var mybody  =  $('<tbody></tbody>');
	    					mytable.append(mybody);
	    				
							$.each(data , function( index , obj ){
								
<%-- 								var img1    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + obj.away.teamLogoURL , 'width':150});										 --%>
<%-- 								var img2    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + '/image/VS4.gif',      'width':70 });										 --%>
<%-- 								var img3    =  $('<img></img>').attr({'src': '<%=request.getContextPath()%>/_5_gambling' + obj.home.teamLogoURL , 'width':150});										 --%>
// 								var cell11  =  $('<td></td>');
// 								var cell12  =  $('<td></td>');
// 								var cell13  =  $('<td></td>');
// 								img1.appendTo(cell11);
// 								img2.appendTo(cell12);
// 								img3.appendTo(cell13);
							
								var myrow1  =  $('<tr></tr>').attr({'align':'center','valign':'middle'});
								var myrow2  =  $('<tr></tr>').attr({'align':'center','valign':'middle'});
// 								var cell21  =  $('<td></td>').html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + obj.away.teamName + "</h4>");
// 								var cell22  =  $('<td></td>').append("<Strong class='glyphicon glyphicon-time' style='padding-right:5px;color:white;'>&nbsp;" + obj.battleTime + "</Strong><p/>");
// /*hidden 欄位 紀錄 battleSetId*/    cell22.append("<input  type='hidden' "+" value='"+ obj.battleId +"'/>") 
// 				/* 下注按鈕 */	    cell22.append("<button type='button' class='btn btn-warning' style='width:35px;height:35px;color:orange;font-size:14px;font-family:微軟正黑體;font-weight:800;vertical-align:baseline;'>下 注</button>");
								var cell23  =  $('<td></td>').html("<h4 style='font-family:微軟正黑體;font-weight:bolder;color:white;'>" + obj.home.teamName + "</h4>");
								myrow1.append([ cell11 , cell12 , cell13 ]);
								myrow2.append([ cell21 , cell22 , cell23 ]);
								
								myrow1.appendTo(mybody);
								myrow2.appendTo(mybody);
							})	
							tableDiv.append(mytable);// ！--表格建立完成--！
	</script>
</body>
</html>