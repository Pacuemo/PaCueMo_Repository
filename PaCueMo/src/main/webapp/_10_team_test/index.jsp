<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/avgrund.css">
</head>
<body>
<div class="buttons">
<a href="#" id="show" class="button left">Show it</a>
</div>
		<pre>$('element').avgrund();</pre>
		
		<p>Avgrund has several options for you to customize it easily:</p>
		
	<pre>$('element').avgrund({
	width: 380, // max is 640px
	height: 280, // max is 350px
	showClose: false, // switch to 'true' for enabling close button
	showCloseText: '', // type your text for close button
	closeByEscape: true, // enables closing popup by 'Esc'..
	closeByDocument: true, // ..and by clicking document itself
	holderClass: '', // lets you name custom class for popin holder..
	overlayClass: '', // ..and overlay block
	enableStackAnimation: false, // another animation type
	onBlurContainer: '', // enables blur filter for specified block
	openOnEvent: true, // set to 'false' to init on load
	setEvent: 'click', // use your event like 'mouseover', 'touchmove', etc.
	onLoad: function (elem) { ... }, // set custom call before popin is inited..
	onUnload: function (elem) { ... }, // ..and after it was closed
	template: 'String content..' // or function (elem) { }, or $('.content')
});</pre>
	
<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/jquery.avgrund.min.js"></script>
<script>
$(function() {
	$('#show').avgrund({
		width: 640, // max is 640px
		height: 500, // max is 350px
		showClose: true, // switch to 'true' for enabling close button
		showCloseText: 'X', // type your text for close button
		closeByEscape: true, // enables closing popup by 'Esc'..
		closeByDocument: false, // ..and by clicking document itself
		holderClass: 'custom', // lets you name custom class for popin holder..
// 		overlayClass: '', // ..and overlay block
		enableStackAnimation: false, // another animation type
// 		onBlurContainer: '', // enables blur filter for specified block
		openOnEvent: true, // set to 'false' to init on load
		setEvent: 'click', // use your event like 'mouseover', 'touchmove', etc.
// 		onLoad: function (elem) { ... }, // set custom call before popin is inited..
// 		onUnload: function (elem) { ... }, // ..and after it was closed
// 		template: 'String content..' // or function (elem) { }, or $('.content')
		template: '<div> <form id="contact" action="TeamServlet" method="post"> <div class="tm_title"> <h3>建立新隊伍</h3> </div> <fieldset> <input placeholder="隊伍名稱" name="teamName" type="text" tabindex="1" required autofocus> </fieldset> <fieldset> <input placeholder="輸入隊員姓名或電子郵件" name="" type="text" tabindex="2"> </fieldset> <fieldset> <div class="div_pri_tm"> <label class="" for="privacy_1"> <span class=""> <input type="radio" id="privacy_1" name="teamProp" value="0" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="assets/images/public.png" alt="" width="16" height="16"> <span>公開</span> </span> <div class="descrip" id="">所有人都可以自由加入這個隊伍。</div> </label> </div> <div class="div_pri_tm"> <label class="" for="privacy_2"> <span class=""> <input type="radio" id="privacy_2" name="teamProp" value="1" checked="1" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="assets/images/protect.png" alt="" width="16" height="16"> <span>需申請</span> </span> <div class="descrip" id="">所有人都可以申請加入這個隊伍。</div> </label> </div> <div class="div_pri_tm"> <label class="" for="privacy_3"> <span class=""> <input type="radio" id="privacy_3" name="teamProp" value="2" aria-describedby="groupsCreatePrivacy" class=""> <img class="img_tm" src="assets/images/private.png" alt="" width="16" height="16"> <span>私密</span> </span> <div class="descrip" id="">只有被邀請的成員才可以加入這個隊伍。</div> </label> </div> </fieldset> <fieldset> <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button> </fieldset> </form> </div>'

// 		height: 200,
// 		holderClass: 'custom',
// 		showClose: true,
// 		showCloseText: 'close',
// 		onBlurContainer: '.container',
// 		template: '<p>So implement your design and place content here! If you want to close modal, please hit "Esc", click somewhere on the screen or use special button.</p>' +
// 		'<div>' +
// 		'<a href="http://github.com/voronianski/jquery.avgrund.js" target="_blank" class="github">Avgrund on Github</a>' +
// 		'<a href="http://twitter.com/voronianski" target="_blank" class="twitter">Twitter</a>' +
// 		'<a href="http://dribbble.com/voronianski" target="_blank" class="dribble">Dribbble</a>' +
// 		'</div>'
	});
});
</script>
</body>
</html>