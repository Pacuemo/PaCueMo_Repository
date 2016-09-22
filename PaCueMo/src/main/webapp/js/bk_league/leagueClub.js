$(function(){
	
	var contextPath="${pageContext.request.contextPath}";
	
	//點選聯賽社團顯示按鈕
	
	$("#btn-club").click(function(e)
	{
		e.preventDefault();
		$('#leagueClubInfo').css('display','block');
		$('#leagueRecordInfo').css('display','none');
		
	});
	//點選聯賽社團顯示按鈕
	
	$("#btn-record").click(function(e)
	{
		e.preventDefault();
		$('#leagueClubInfo').css('display','none');
		$('#leagueRecordInfo').css('display','block');
		
	});
	
	
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
		var button=$(this); //送出按鈕
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
            	 BootstrapAlert.success({ title : "Congrat!", message : "成功修改聯賽申請資料" });
            	 tds.parent().css('background-color','').find('input').attr('disabled',true);             	 
            	 button.css('display','none')
            	 .prev().css('display','inline-block')//刪除按鈕
            	 .prev().css('display','inline-block');//修改按鈕
            	 
             }
            }
	    });
				
	});
	
	
	$('.delete').click(function(e){
		var button = $(this);
		e.preventDefault();
		$.ajax({
			type: "GET",
			url: "deleteLeagueClub",
			data: { leagueId: button.attr("leagudId"), clubId: button.attr("clubId") },
			dataType: 'json',
			success: function (message){
				
				if(message.status==1){
					
					BootstrapAlert.success({ title : "Congrat!", message : "成功刪除聯賽申請資料" });
					button.parent().parent().remove();
				}
			}
			
		});
	})
	
	
	$('#submitIRecord').click(function()
	{
		console.log($(this).parent().parent().find('input[type=datetime-local]').val());
	});
	
	
});


