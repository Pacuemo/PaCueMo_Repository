<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 

<%--     <script src="${pageContext.request.contextPath}/js/jquery-3.1.0.min.js"></script>  --%>
    <script src="${pageContext.request.contextPath}/js/sockjs.min.js"></script> 
    <script src="${pageContext.request.contextPath}/js/stomp.min.js"></script> 
	<script>
		var url = 'http://' + window.location.host + '/PaCueMo/spring/ws/';
		var sock = new SockJS(url);
		var stomp = Stomp.over(sock);
		
		stomp.connect("guest","guest",function(){
// 			stomp.subscribe("/app/marco",function(incoming){
// 				var test = JSON.parse(incoming.body);
// 				console.log(test);
// 			});

// 			stomp.send("/app/marco",{},payload);
			stomp.send("/app/friendslist",{},'${LoginOK.memberId}');
// 			stomp.subscribe("/topic/friendslist",function(incoming){
// 				var test = JSON.parse(incoming.body);
// 				console.log(test);
// 			});
			stomp.subscribe("/user/${LoginOK.memberId}/queue/fd",function(incoming){
				var test = JSON.parse(incoming.body);
				console.log(test);
				
				$.each(test.ids,function(i,data){
					console.log(data)
					var box;
					if(test.fbIds[i] != null){
						box = $("<div class='chatpopup'></div>");
						box.append("<img class='user-img img-thumbnail' src='https://graph.facebook.com/"+test.fbIds[i]+"/picture?width=36&amp;height=36' style='height:45px;width:45px'>");
						box.append("<font>"+ test.names[i] +"</font>");
						box.append("<input class='id' type='hidden' value='"+ data +"'/>")
						box.append("<input class='name' type='hidden' value='"+ test.names[i] +"'/>")
					}else if(test.imgs[i] != null){
						box = $("<div class='chatpopup'></div>");
						box.append("<img class='user-img img-thumbnail' src='${pageContext.request.contextPath}/image/member/"+test.imgs[i]+"'style='height:45px;width:45px'>");
						box.append("<font>"+ test.names[i] +"</font>");
						box.append("<input class='id' type='hidden' value='"+ data +"'/>")
						box.append("<input class='name' type='hidden' value='"+ test.names[i] +"'/>")
					}else{
						box = $("<div class='chatpopup'></div>");
						box.append("<img class='user-img img-thumbnail' src='${pageContext.request.contextPath}/image/member/user.jpg'style='height:45px;width:45px'>");
						box.append("<font>"+ test.names[i] +"</font>");
						box.append("<input class='id' type='hidden' value='"+ data +"'/>")
						box.append("<input class='name' type='hidden' value='"+ test.names[i] +"'/>")
					}
					$("div.message_list").append(box);
					
				})
			});
			
			
			stomp.subscribe("/user/${LoginOK.memberId}/queue/chat",function(incoming){
			var test = JSON.parse(incoming.body);
			var id = test.memberId;
			var name = test.memberName;
			var message = test.message;
			register_popup(id, name);
			var chatbox = $(document.body).find("#"+id);
			chatbox.find(".popup-messages").append("<div class='received'><p>"+message+"</p></div>")
			
			})
			
			stomp.subscribe("/user/${LoginOK.memberId}/queue/updateStatus",function(incoming){
				if(incoming.body.trim() == "reload"){
					window.location.reload(true);
				}
			})
		})
		
	</script>
	<style type="text/css">
			.message {
			    position: fixed;
			    right: 20px;
			    bottom: 0;
			    height: 25px;
			    width: 250px;
			    background-color: #fff;
			    z-index: 300;
			    border: 1px solid black;
    			text-align: center;
   				padding-top: 5px;
			}
			.message_list {
				position: fixed;
                display: none;
                bottom: 0px;
                right: 20px;
                height: 285px;
                background-color: rgb(237, 239, 244);
                width: 250px;
                border: 1px solid rgba(29, 49, 91, .3);
                z-index: 300;
                overflow-y: scroll;
			}
			.message_title {
				display: none;
				position: fixed;
			    right: 20px;
			    height: 25px;
                background-color: #6d84b4;
                color: white;
                font-weight: bold;
                font-size: 14px;
                clear: both;
                z-index: 300;
                bottom: 285px;
                width: 250px;
                border: 1px solid rgba(29, 49, 91, .3);
                padding-top: 2px;
                padding-bottom: 2px;
		    }
		    
		    .popup-head-left1 {
			    padding-left: 10px;
			    padding-top: 3px;
			}
    
            @media only screen and (max-width : 540px) 
            {
                .chat-popup
                {
                    display: none !important;
                }
            }
            
            body
            {
                background-color: #e9eaed;
            }
            
            
            .popup-box
            {
                display: none;
                position: fixed;
                bottom: 0px;
                right: 290px;
                height: 400px;
                background-color: rgb(237, 239, 244);
                width: 300px;
                border: 1px solid rgba(29, 49, 91, .3);
            }
            
            .popup-box .popup-head
            {
                background-color: #6d84b4;
                padding: 5px;
                color: white;
                font-weight: bold;
                font-size: 14px;
                clear: both;
            }
            
            .popup-box .popup-head .popup-head-left
            {
                float: left;
            }
            
            .popup-box .popup-head .popup-head-right
            {
                float: right;
                opacity: 0.5;
            }
            
            .popup-box .popup-head .popup-head-right a
            {
                text-decoration: none;
                color: inherit;
            }
            
            .popup-box .popup-messages
            {
                height: 100%;
                overflow-y: scroll;
            }
            
            div.chatpopup font{
			    position: relative;
			    padding-left: 10px;
            }
            
            div.input{
            	height: 25px;
			    position: fixed;
			    bottom: 0px;
            }
            
            .received {
			    background-color: #d8d8d8;
			    max-width: 40%;
			    padding: 2px;
			    margin: 5px;
			    border-radius: 5px;
			    word-break:break-all
				
			}
			
			.send {
			    background-color: #4080ff;
			    max-width: 40%;
			    padding: 2px;
			    margin: 5px;
			    margin-left: 55%;
			    border-radius: 5px;
			    word-break:break-all

			}
			
			.received p ,.send p {
			    margin: 0 5px;
				
			}
	</style>
     <div class="message">聊天室
     </div> 
     <div class="message_title">
     	<div class="popup-head-left1">聊天室</div>
    </div>
     <div class="message_list">

     </div>
  <script type="text/javascript">
  $(function(){
	  	 $("div.message").click(function(){
	  		 $("div.message_list").show();
	  		 $("div.message_title").show();
	  	 })
	  	 $("div.message_title").click(function(){
	  		 $("div.message_list").hide();
	  		 $("div.message_title").hide();
	  	 })  	
	  	 
	  	$("div.message_list").on('click','.chatpopup', function () {
	  		var id = $(this).find("input.id").val();
	  		var name = $(this).find("input.name").val();
	  		register_popup(id, name);
	  		});
	  	 
	  	$(document.body).on("keyup","input.message_input",function(e){
	  		var message = $(this).val();
	  		if(message.trim().length > 0)
	  		if(e.keyCode == 13)
	  		{
		  		var friendId = $(this).parent().parent().attr("id");
		  		var friendName = $(this).parent().prev().prev().find(".popup-head-left").text();
		  		var messageTime = $.now();
		  		var payload = JSON.stringify({"memberId":'${LoginOK.memberId}',"memberName":'${LoginOK.memberLastName}${LoginOK.memberFirstName}',"friendId":friendId,"friendName":friendName,"message":message,"messageTime":messageTime});
		  		stomp.send("/app/chat",{},payload);
		  		$(this).val("");
		  		var messagebox = "<div class='send'><p>"+message+"</p></div>";
		  		$(this).parent().prev().append(messagebox);
	  		}
	  	})
  })
  
    //this function can remove a array element.
         Array.remove = function(array, from, to) {
             var rest = array.slice((to || from) + 1 || array.length);
             array.length = from < 0 ? array.length + from : from;
             return array.push.apply(array, rest);
         };
     
         //this variable represents the total number of popups can be displayed according to the viewport width
         var total_popups = 0;
         
         //arrays of popups ids
         var popups = [];
     
         //this is used to close a popup
         function close_popup(id)
         {
             for(var iii = 0; iii < popups.length; iii++)
             {
                 if(id == popups[iii])
                 {
                     Array.remove(popups, iii);
                     
                     document.getElementById(id).style.display = "none";
                     
                     calculate_popups();
                     
                     return;
                 }
             }   
         }
     
         //displays the popups. Displays based on the maximum number of popups that can be displayed on the current viewport width
         function display_popups()
         {
             var right = 290;
             
             var iii = 0;
             for(iii; iii < total_popups; iii++)
             {
                 if(popups[iii] != undefined)
                 {
                     var element = document.getElementById(popups[iii]);
                     element.style.right = right + "px";
                     right = right + 320;
                     element.style.display = "block";
                 }
             }
             
             for(var jjj = iii; jjj < popups.length; jjj++)
             {
                 var element = document.getElementById(popups[jjj]);
                 element.style.display = "none";
             }
         }
         
         //creates markup for a new popup. Adds the id to popups array.
         function register_popup(id, name)
         {
             
             for(var iii = 0; iii < popups.length; iii++)
             {   
                 //already registered. Bring it to front.
                 if(id == popups[iii])
                 {
                     Array.remove(popups, iii);
                 
                     popups.unshift(id);
                     
                     calculate_popups();
                     
                     
                     return;
                 }
             }               
             
             var element = '<div class="popup-box chat-popup" id="'+ id +'">';
             element = element + '<div class="popup-head">';
             element = element + '<div class="popup-head-left">'+ name +'</div>';
             element = element + '<div class="popup-head-right"><a href="javascript:close_popup(\''+ id +'\');">&#10005;</a></div>';
             element = element + '<div style="clear: both"></div></div><div class="popup-messages"></div><div class="input"><input type="text" style="width:296px; height:25px" class="message_input"></div></div>';
             
//              document.getElementsByTagName("body")[0].innerHTML = document.getElementsByTagName("body")[0].innerHTML + element; 
             $("body").append(element);
     
             popups.unshift(id);
                     
             calculate_popups();
             
         }
         
         //calculate the total number of popups suitable and then populate the toatal_popups variable.
         function calculate_popups()
         {
             var width = window.innerWidth;
             if(width < 540)
             {
                 total_popups = 0;
             }
             else
             {
                 width = width - 200;
                 //320 is width of a single popup box
                 total_popups = parseInt(width/320);
             }
             
             display_popups();
             
         }
         
         //recalculate when window is loaded and also when window is resized.
         window.addEventListener("resize", calculate_popups);
         window.addEventListener("load", calculate_popups);
  </script>
