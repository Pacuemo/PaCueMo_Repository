<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
  <head>
  <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
    <meta charset="UTF-8">
    <title>PACUEMO Club</title>
    <link rel="icon" href="${pageContext.request.contextPath}/image/PACUEMOicon.png" type="image/x-icon" />
      <link rel="stylesheet" href="${pageContext.request.contextPath}/css/AdminLTE.min.css">
        <!-- Font Awesome -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.5.0/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/ionicons/2.0.1/css/ionicons.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/css/skins/_all-skins.min.css">
    <style>

.like{
background-color:#f4f4f4;
color:#444;
border-color:#ddd;
border-radius:3px;
box-shadow:box-shadow;
border:1px solid transparent;
padding:1px 5px;
font-size:12px;
line-height:1.5;
    display: inline-block;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    user-select: none;
    background-image: none;
}
.like:hover{
border:1px solid #b3b3b3;
background-color:  #e6e6e6;
}
.haslike{background-color:#66b3ff;
color:#444;
border-color:#0059b3;
border-radius:3px;
box-shadow:box-shadow;
border:1px solid transparent;
padding:1px 5px;
font-size:12px;
line-height:1.5;
    display: inline-block;
    margin-bottom: 0;
    font-weight: 400;
    text-align: center;
    white-space: nowrap;
    vertical-align: middle;
    touch-action: manipulation;
    cursor: pointer;
    -webkit-user-select: none;
    user-select: none;
    background-image: none;}
.myButton {
	-moz-box-shadow:inset 0px 0px 25px 0px #7a8eb9;
	-webkit-box-shadow:inset 0px 0px 25px 0px #7a8eb9;
	box-shadow:inset 0px 0px 25px 0px #7a8eb9;
	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #637aad), color-stop(1, #5972a7));
	background:-moz-linear-gradient(top, #637aad 5%, #5972a7 100%);
	background:-webkit-linear-gradient(top, #637aad 5%, #5972a7 100%);
	background:-o-linear-gradient(top, #637aad 5%, #5972a7 100%);
	background:-ms-linear-gradient(top, #637aad 5%, #5972a7 100%);
	background:linear-gradient(to bottom, #637aad 5%, #5972a7 100%);
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#637aad', endColorstr='#5972a7',GradientType=0);
	background-color:#637aad;
	-moz-border-radius:10px;
	-webkit-border-radius:10px;
	border-radius:10px;
	border:1px solid #314179;
	display:inline-block;
	cursor:pointer;
	color:#ffffff;
	font-family:Arial;
	font-size:14px;
	font-weight:bold;
	padding:10px 10px;
	text-decoration:none;
}
.myButton:hover {
 	background:-webkit-gradient(linear, left top, left bottom, color-stop(0.05, #5972a7), color-stop(1, #637aad)); 
 	background:-moz-linear-gradient(top, #5972a7 5%, #637aad 100%); 
	background:-webkit-linear-gradient(top, #5972a7 5%, #637aad 100%); 
	background:-o-linear-gradient(top, #5972a7 5%, #637aad 100%);
	background:-ms-linear-gradient(top, #5972a7 5%, #637aad 100%); 
 	background:linear-gradient(to bottom, #5972a7 5%, #637aad 100%); 
	filter:progid:DXImageTransform.Microsoft.gradient(startColorstr='#5972a7', endColorstr='#637aad',GradientType=0); 
	background-color: #e6f0ff;
	color:#ffffff;
}
.myButton:active {
	position:relative;
	top:1px;
}
.messageText{
font-size: 90%;
margin:0px;
}
.likeName{
width:80px;
position:relative;
right:-3%;
top:7%;
z-index: 2000;
background-color: black;
border-radius:5px;
}
.likeName>span{
padding-left:10px;
color:#e6e6e6;
font-size: 90%;
}


	</style>

	<script>
	</script>
  </head>
  <body>
    
  	<jsp:include page="/fragment/top.jsp" />
	<jsp:include page="sidebar.jsp" />
	<jsp:include page="MessageNavBar.jsp" />	
<style>
body{
background-image: url('${pageContext.request.contextPath}/image/background/Kobe.png');
 background-size:100%;


}
</style>	
	 <div class="backGround">
        <div class="col-md-6 col-md-offset-3" style="margin-top:100px;">

		<div class="form-group">
			<textarea class="form-control" rows="5" id="comment" placeholder="在想什麼..."></textarea>
		</div>
		<div style="text-align: right">
         <a class="myButton" href="#" role="button">發佈</a>
         </div>
	   </div>
         
        <!-- /.col -->
        <div class="col-md-6 col-md-offset-3"  id="chatHere" style="margin-top:40px;margin-bottom:100px ">
<!-- 		--------------------------------BOX IN HERE -------------------------------------------------------------- -->
<!-- ---------------------------------------------------------------------------------------------------------------------------- -->
<c:forEach items="${clubChats}" var="ClubChatVO">
	     <!-- Box Comment -->
          <div class="box box-widget chatboxUp" >
            <div class="box-header with-border">
              <div class="user-block">
              <c:if  test="${not empty ClubChatVO.memberFBId}">
                <img class="img-circle"  src="https://graph.facebook.com/${ClubChatVO.memberFBId}/picture?width=40&amp;height=40"  alt="User Image">
                </c:if>
                  <c:if  test="${empty ClubChatVO.memberFBId}">
                <img class="img-circle"  src="${pageContext.request.contextPath}/image/member/${ClubChatVO.memberUrl}"  alt="User Image">
                </c:if>
                <span class="username">${ClubChatVO.memberName}</span>
				<c:set var="DateTime"  value="${ClubChatVO.chatDateTime.time}"/>
                <span class="description time">${DateTime}</span>
              </div>
              <!-- /.user-block -->
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- post text -->
              <p>${ClubChatVO.content}</p>                         
              <!-- Social sharing buttons -->
             <c:choose>
              <c:when test="${ClubChatVO.hasClick eq 0}">
              <button type="button" class="like"  chatId="${ClubChatVO.chatId}"><i class="fa fa-thumbs-o-up"></i> Like</button>
              </c:when>
              <c:otherwise>
              <button type="button" class="haslike" ><i class="fa fa-thumbs-o-up"></i> has Like</button>
              </c:otherwise>
              </c:choose>
<%--               <div><div class="likeName"><c:forEach items="${ClubChatVO.chatLikeVOs}" var="chatLikeVO"><span>${chatLikeVO.memberName}</span></c:forEach></div> --%>
              <span class="pull-right text-muted">
              <span class="chatLikeCount">${ClubChatVO.like}</span> likes - <span class="messageCount">${ClubChatVO.messageCount}</span> comments</span>
        
            </div>
            <!-- /.box-body -->  
            <div style="width:100%;height:5px" class="likeBox"> <div class="likeName"  style="display:none"><c:forEach items="${ClubChatVO.chatLikeVOs}" var="chatLikeVO"><span>${chatLikeVO.memberName}</span><br/></c:forEach></div></div>
            <!-- 評論在這    -->
            <div class="box-footer box-comments"  id="${ClubChatVO.chatId}">
            
            <c:forEach items="${ClubChatVO.messageVOs}" var="messageVO">
                       <div class="box-comment replyBoxUP" >
	                         <c:if  test="${not empty messageVO.memberFBId}">
	               			 <img class="img-circle img-sm"  src="https://graph.facebook.com/${messageVO.memberFBId}/picture?width=40&amp;height=40"  alt="User Image">
	                		 </c:if>
	                          <c:if  test="${empty messageVO.memberFBId}">
	                		 <img class="img-circle img-sm"  src="${pageContext.request.contextPath}/image/member/${messageVO.memberUrl}"  alt="User Image">
	                		 </c:if>
                       <div class="comment-text">
                       <span class="username">${messageVO.memberName}
                       <c:set var="MessageTime"  value="${messageVO.chatDateTime.time}"/>
                       <span class="text-muted pull-right time">${MessageTime}</span>
                       </span>
                       ${messageVO.content}
                </div>
              </div>
            </c:forEach>
            </div>
            <!-- /.box-footer -->
            <div class="box-footer">
              <form action="#" method="post">
                <c:if  test="${not empty LoginOK.memberFBId}">
                <img class="img-responsive img-circle img-sm"  src="https://graph.facebook.com/${LoginOK.memberFBId}/picture?width=40&amp;height=40"  alt="Alt Text">
                </c:if>
                  <c:if  test="${empty LoginOK.memberFBId}">
                <img class="img-responsive img-circle img-sm"   src="${pageContext.request.contextPath}/image/member/${LoginOK.memberImgUrl}"  alt="Alt Text">
                </c:if>
                <!-- .img-push is used to add margin to elements next to floating images -->
                <div class="img-push">
                  <input type="text" class="form-control input-sm reply" placeholder="Press enter to post comment"  chatId="${ClubChatVO.chatId}">
                </div>
              </form>
            </div>
            <!-- /.box-footer -->
          </div>
          <!-- /.box -->
            </c:forEach>	 	

        </div>
        <!-- /.col -->
      </div>  
<script src="${pageContext.request.contextPath}/dist/js/app.min.js"></script>
<script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script> 
 <script src="${pageContext.request.contextPath}/js/stomp.min.js"></script> 
<script>
var url = 'http://' + window.location.host + '/PaCueMo/spring/ws/';
var sock = new SockJS(url);
var stomp = Stomp.over(sock);
var clubId='${MyClub.clubID}';
var memberFBId='${LoginOK.memberFBId}';
stomp.connect("guest","guest",function(){   //建立連線
//  --------------------------------------------------------------------------------------------------------------------
             //訂閱得到留言版訊息
	         stomp.subscribe("/user/"+clubId+"/queue/chatBoard",function(incoming){
						var clubChatVOBacK = JSON.parse(incoming.body);	
						var chatBoxDiv = $('.chatbox').clone(true).css('display','block').removeClass('chatbox');	
					     var img=chatBoxDiv.find('img:first');
					     var imgLast=chatBoxDiv.find('img:last');
					  	 if(clubChatVOBacK.memberFBId ==null){                //留言板圖片	  	 
					  		img.attr('src','${pageContext.request.contextPath}/image/member/'+clubChatVOBacK.memberUrl);					  
						 }
						 else{							 
								img.attr('src','https://graph.facebook.com/'+clubChatVOBacK.memberFBId+'/picture?width=40&amp;height=40');						  					  		
					  	 }
					  	 if($.trim(memberFBId).length==0){                                                //留言圖片
					  		imgLast.attr('src','${pageContext.request.contextPath}/image/member/${LoginOK.memberImgUrl}');
						  	 }
					  	 else{
					  		imgLast.attr('src','https://graph.facebook.com/${LoginOK.memberFBId}/picture?width=40&amp;height=40');		
						  	 }
					  img.next().text(clubChatVOBacK.memberName)   //姓名
					         .next().text(new Date(clubChatVOBacK.chatDateTime).customFormat( "#hh#:#mm# #AMPM#  - #DD#  #MMM#" ));//時間
					        
					  chatBoxDiv.find('.box-body').prepend($('<P>'+ clubChatVOBacK.content.replace(/(?:\r\n|\r|\n)/g, '<br />')+'</P>'))//內容
					                      .find('.like').attr('chatId',clubChatVOBacK.chatId)             //chatId
					                      .parent().next().next().attr('id',clubChatVOBacK.chatId.toString());  //chatId放在divcommet
					  imgLast.next().find('.reply').attr('chatId',clubChatVOBacK.chatId); 

					  $( "#chatHere" ).prepend( chatBoxDiv ); //附加到chatBox
						  chatBoxDiv.find('.btn-box-tool').click();	
               })
 //  --------------------------------------------------------------------------------------------------------------------
             //  訂閱message
               stomp.subscribe("/user/"+clubId+"/queue/message",function(incoming){
            	   var messageVOBacK = JSON.parse(incoming.body);	

                	var replyBox = $('.replyBox').clone(true).css('display','block').removeClass('replyBox');
                 	var img=replyBox.find('img:first');
	                 	 if(messageVOBacK.memberFBId ==null){
	                 		img.attr('src','${pageContext.request.contextPath}/image/member/'+messageVOBacK.memberUrl);
                 	 }
                 	 else{
                 		    img.attr('src','https://graph.facebook.com/'+messageVOBacK.memberFBId+'/picture?width=40&amp;height=40');
	                 	 }
	                 img.next().children('.username').prepend(messageVOBacK.memberName)   //姓名
	                        .children('.text-muted').text(new Date(messageVOBacK.chatDateTime).customFormat( "#hh#:#mm# #AMPM#  - #DD#  #MMM#" ))//時間
	                        .parent().after($('<p class="messageText">'+messageVOBacK.content+'</p>'));
                      var chatId=messageVOBacK.chatId.toString();
                      var messageCountSpan= $('#'+chatId+'').append(replyBox).prev().prev().find('.messageCount');	//找到commetDIV 把留言附加上去					              
                      var  messageCountN=messageCountSpan.text();
	                 messageCountSpan.text(parseInt(messageCountN)+1);
                   });
//  --------------------------------------------------------------------------------------------------------------------  
                   //  訂閱chatLike
                   stomp.subscribe("/user/"+clubId+"/queue/chatLike",function(incoming){
                	   var chatLikeVOBacK = JSON.parse(incoming.body);	
        	               
        	                var chatLikeCountSpan= $('#'+chatLikeVOBacK.chatId+'').prev().prev().find('.chatLikeCount');
        	                var chatLikeCountN=chatLikeCountSpan.text();
        	                chatLikeCountSpan.text(parseInt(chatLikeCountN)+1)
        	                                                   .parent().parent().next().find('.likeName').prepend('<span>'+chatLikeVOBacK.memberName+'</span><br/>');//把名子放進去
        	              
        	                if(chatLikeVOBacK.memberId=='${LoginOK.memberId}'){
        	                	 var hasLikeButton=$('.likeClone').clone(true).css("display","inline-block").removeClass('likeClone');
        	                	 chatLikeCountSpan.parent().prev().replaceWith(hasLikeButton);	   
            	                }
                       });

 //  --------------------------------------------------------------------------------------------------------------------                         
});

$(function(){
             
            $('.btn-box-tool').click();
			$('.time').each(function(index,time){
				var getTime=parseInt($(this).text());
               $(this).text(new Date(getTime).customFormat( "#hh#:#mm# #AMPM#  - #DD#  #MMM#" ));
				})


			$('.box-body').each(function(index,divBox){
				var textContent = $(this).find('p').text().replace(/(?:\r\n|\r|\n)/g, '<br />');
				$(this).find('p').remove();
				$(this).prepend($('<P>'+textContent.replace(/(?:\r\n|\r|\n)/g, '<br />')+'</P>')); 
				})
	//---------------------------留言板----------------------------------------			
	$('.myButton').click(function(e){
			e.preventDefault();
			
             var data={};
          	data['clubId']=${MyClub.clubID};
        	data[ 'memberId']='${LoginOK.memberId}';
        	data['memberName']='${LoginOK.memberLastName}${LoginOK.memberFirstName}';
           if($.trim(memberFBId)!=0){
        	   data['memberFBId']='${LoginOK.memberFBId}';
               }
           else{
        	data['memberUrl']='${LoginOK.memberImgUrl}';
        	}
	        data['content'] = $('#comment').val();
            data['chatDateTime']=$.now();

           var clubChatVOJson=JSON.stringify(data);

            stomp.send("/app/chatBoard",{},clubChatVOJson);
           $('#comment').val('');
           $(this).css('color','#ffffff');

    });


			//---------------------------送出訊息----------------------------------------	

			$('.reply').keypress(function(e) {				
			    if(e.which == 13) {
					        e.preventDefault();
					        var input=$(this);
				             var data={};
				             data['clubId']=clubId;
				           	data['chatId']=$(this).attr('chatId');
				         	data[ 'memberId']='${LoginOK.memberId}';
				         	data['memberName']='${LoginOK.memberLastName}${LoginOK.memberFirstName}';
				            if($.trim(memberFBId)!=0){
				         	   data['memberFBId']='${LoginOK.memberFBId}';
				                }
				            else{
				         	data['memberUrl']='${LoginOK.memberImgUrl}';}
				 	        data['content'] = $(this).val();
				            data['chatDateTime']=$.now();

				            var MessageVOJson=JSON.stringify(data);
				            stomp.send("/app/message",{},MessageVOJson);
				            input.val('');
			       };
			});
			
			//---------------------------喜歡----------------------------------------	

			$('.like').click(function(e){
				  e.preventDefault();
				  var data={};
				  var button=$(this);
				  data['chatId']=$(this).attr('chatId');
				  data['memberName']='${LoginOK.memberLastName}${LoginOK.memberFirstName}';
				  data['memberId']='${LoginOK.memberId}';
				  data['clubId']=clubId;
				  var chatLikeJson=JSON.stringify(data);
		           stomp.send("/app/chatLike",{},chatLikeJson);
		           
				});



			//---------------提示案喜歡--------------------------------
			$('.haslike').mouseover(function(){
              $(this).parent().next().find('.likeName').css("display","block");
				});
			$('.like').mouseover(function(){		
              $(this).parent().next().find('.likeName').css("display","block");
				});
			$('.haslike').mouseout(function(){
	              $(this).parent().next().find('.likeName').css("display","none");
					});
				$('.like').mouseout(function(){		
	              $(this).parent().next().find('.likeName').css("display","none");
					});
})

//*** This code is copyright 2002-2016 by Gavin Kistner, !@phrogz.net
//*** It is covered under the license viewable at http://phrogz.net/JS/_ReuseLicense.txt
Date.prototype.customFormat = function(formatString){
  var YYYY,YY,MMMM,MMM,MM,M,DDDD,DDD,DD,D,hhhh,hhh,hh,h,mm,m,ss,s,ampm,AMPM,dMod,th;
  YY = ((YYYY=this.getFullYear())+"").slice(-2);
  MM = (M=this.getMonth()+1)<10?('0'+M):M;
  MMM = (MMMM=["January","February","March","April","May","June","July","August","September","October","November","December"][M-1]).substring(0,3);
  DD = (D=this.getDate())<10?('0'+D):D;
  DDD = (DDDD=["Sunday","Monday","Tuesday","Wednesday","Thursday","Friday","Saturday"][this.getDay()]).substring(0,3);
  th=(D>=10&&D<=20)?'th':((dMod=D%10)==1)?'st':(dMod==2)?'nd':(dMod==3)?'rd':'th';
  formatString = formatString.replace("#YYYY#",YYYY).replace("#YY#",YY).replace("#MMMM#",MMMM).replace("#MMM#",MMM).replace("#MM#",MM).replace("#M#",M).replace("#DDDD#",DDDD).replace("#DDD#",DDD).replace("#DD#",DD).replace("#D#",D).replace("#th#",th);
  h=(hhh=this.getHours());
  if (h==0) h=24;
  if (h>12) h-=12;
  hh = h<10?('0'+h):h;
  hhhh = hhh<10?('0'+hhh):hhh;
  AMPM=(ampm=hhh<12?'am':'pm').toUpperCase();
  mm=(m=this.getMinutes())<10?('0'+m):m;
  ss=(s=this.getSeconds())<10?('0'+s):s;
  return formatString.replace("#hhhh#",hhhh).replace("#hhh#",hhh).replace("#hh#",hh).replace("#h#",h).replace("#mm#",mm).replace("#m#",m).replace("#ss#",ss).replace("#s#",s).replace("#ampm#",ampm).replace("#AMPM#",AMPM);
};

</script>
  </body>
<!--   -------------------  chatBox ------------------- -->
        <!-- Box Comment -->
          <div class="box box-widget chatbox"  style="display: none">
            <div class="box-header with-border">
              <div class="user-block">
                <img class="img-circle"  alt="User Image">
                <span class="username"></span>
                <span class="description"></span>
              </div>
              <!-- /.user-block -->
              <div class="box-tools">
                <button type="button" class="btn btn-box-tool" data-widget="collapse"><i class="fa fa-minus"></i>
                </button>
              </div>
              <!-- /.box-tools -->
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <!-- post text -->
              <!-- Social sharing buttons -->
              <button type="button" class="like"><i class="fa fa-thumbs-o-up"></i> Like</button>
              <span class="pull-right text-muted">
               <span class="chatLikeCount">0</span> likes - <span class="messageCount">0</span> comments</span>
            </div>
            <!-- /.box-body -->   
            <div style="width:100%;height:5px"> <div class="likeName" style="display:none"></div></div>  
            <div class="box-footer box-comments">            
            </div>
            <!-- /.box-footer -->
            <div class="box-footer">
              <form action="#" method="post">
                <img class="img-responsive img-circle img-sm"  alt="Alt Text">
                <!-- .img-push is used to add margin to elements next to floating images -->
                <div class="img-push">
                  <input type="text" class="form-control input-sm reply" placeholder="Press enter to post comment">
                </div>
              </form>
            </div>
            <!-- /.box-footer -->
          </div>
<!--   ------------------- END  chatBox ------------------- -->
<!--   ------------------- replyBox ------------------- -->
           <div class="box-comment replyBox"  style="display: none">
                <img class="img-circle img-sm"  alt="User Image">
                <div class="comment-text">
                      <span class="username">
                        <span class="text-muted pull-right"></span>
                      </span>
                </div>
              </div>

<!--   ------------------- replyBox ------------------- -->


<!-- ---LikeBotton -->
<button type="button" class="haslike likeClone"  style="display: none" ><i class="fa fa-thumbs-o-up"></i> has Like</button>
<!-- ---LikeBotton -->
</html>
