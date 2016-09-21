$(function(){
	
	var contextPath="${pageContext.request.contextPath}";
	
	//點選修改按鈕
	$(".forUpdate").click(function(e){		
		e.preventDefault();
		$(this).attr('style','display:none')
		.next().attr('style','display:block')
		.parent().parent().css('background-color','#ffff99') 
		.find('input').removeAttr('disabled');
	
	});
	//點選送出按鈕
	$(".submitInfo").click(function(e)
	{
		e.preventDefault();
		var button=$(this); 
		var tds = $(this).parent().parent().children();
		var data={};
		data["leagueID"]=tds.first().find('span').text();
		data["leagueName"]=tds.first().find('input').val();
		data["clubAmount"]=tds.slice(1).find('input').val();
		data["startDate"]=tds.slice(2).find('input').val();
		data["endDate"]=tds.slice(3).find('input').val();
		data["placeID"]=tds.slice(4).find('input').val();		
		
		
		$.ajax({
            type: "POST",
            contentType: "application/json",
            url: "updateLeague",
            data: JSON.stringify(data),
            dataType: 'json',
            success: function (message) {
             if(message.status==1){
            	 tds.parent().css('background-color','').find('input').attr('disabled',true);             	 
            	 button.css('display','none').prev().css('display','inline-block');
            	 
             }
            }
	});
		
		
	});
	
	$("#addLeague").click(function(e)
	{
		e.preventDefault();
		var tr=$('<tr></tr>');
		
		tr.css('background-color','#ffff99').append($("<td><span style='display:none'></span>"+
		      "<input type='text' name='leagueName' ></td>"+
		      "<td><input type='text' name='clubAmount' ></td>"+
		      "<td><input type='date' name='startDate' ></td>"+
		      "<td class='center'><input type='date' name='endDate'></td>"+
		      "<td class='center'><input type='text' name='placeID' ></td>"+
		      "<td class='center'>"+
		      "<input type='button' class='btn btn-default submitAdd' id='submitadd' value='送出'></td>"));		
		tr.appendTo($('#dataTables-example'));
		var button1=$("#submitadd");
		button1.bind('click',add);
	});		
});


function add()	
{
	$(this).css('background-color','#1a1a00');
	var button=$(this); 
	var tds = $(this).parent().parent().children();
	var data={};
	data["leagueName"]=tds.first().find('input').val();
	data["clubAmount"]=tds.slice(1).find('input').val();
	data["startDate"]=tds.slice(2).find('input').val();
	data["endDate"]=tds.slice(3).find('input').val();
	data["placeID"]=tds.slice(4).find('input').val();		
	alert(tds.first().find('input').val());
	
	$.ajax({
        type: "POST",
        contentType: "application/json",
        url: "addLeague",
        data: JSON.stringify(data),
        dataType: 'json',
        success: function (message) {
         if(message.status==1){
        	 window.location.replace('getLeague');
        	 
         }
        }
});
};