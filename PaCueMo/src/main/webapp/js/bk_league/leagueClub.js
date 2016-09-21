$(function(){
	
	var contextPath="${pageContext.request.contextPath}";
	
	//點選修改按鈕
	$(".forUpdate").click(function(e){		
		e.preventDefault();
		$(this).attr('style','display:none')
		.next().attr('style','display:none')
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
		data["leagueId"]=tds.slice(0).attr('name');
		data["clubId"]=tds.slice(1).attr('name');
		data["groups"]=tds.slice(2).find('input').val();	
		
		$.ajax({
            type: "POST",
            contentType: "application/json",
            url: "updateLeagueClubVO",
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
	
	
	$('.delete').click(function(e){
		e.preventDefault();
		$.ajax({
			type: "GET",
			url: "deleteLeagueClubVO?",
			data: [],
			dataType: 'json',
			success: function (message){
				
			}
			
		});
	})
	
	
});


