<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 

 
<!DOCTYPE html>
<html>
  <head> 
	 <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
	 <meta name="viewport" content="width=device-width, initial-scale=1">
	 <title>NBA 運彩專區</title>
     
     <link rel="shortcut icon" href="../favicon.ico">
     <link rel="stylesheet" type="text/css" href="advertisment/css/demo.css" />
     <link rel="stylesheet" type="text/css" href="advertisment/css/slicebox.css" />
     <link rel="stylesheet" type="text/css" href="advertisment/css/custom.css" />
     
     <link rel="stylesheet" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/themes/smoothness/jquery-ui.css">
	 <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css" integrity="sha384-BVYiiSIFeK1dGmJRAkycuHAHRg32OmUcww7on3RYdg4Va+PmSTsz/K68vbdEjh4u" crossorigin="anonymous"><!-- BOOTSTRAP -->
  	
  	 <script type="text/javascript" src="advertisment/js/modernizr.custom.46884.js"></script>
  </head>
  <body>
  
	<jsp:include page="/fragment/top.jsp"/>
	
	<!-- ---------------------------------- 【Begin 廣告輪播】 ---------------------------------- -->
	<div class="container">

        <div class="wrapper">

            <ul id="sb-slider" class="sb-slider">
                <li>
                    <a href="http://sports.ltn.com.tw/news/breakingnews/1810875" target="_blank"><img class="test" src="advertisment/images/pic1.jpg" alt="image1" /></a>
                    <div class="sb-description">
                        <h3 style="color:yellow;font-family:微軟正黑體;font-weight:700;">NBA》林書豪變籃網一哥 美媒：裁判會吹犯規了吧？</h3>
                    </div>
                </li>
                <li>
                    <a href="http://nba.udn.com/nba/story/6780/1932790" target="_blank"><img class="test" src="advertisment/images/pic2.jpg" alt="image2" /></a>
                    <div class="sb-description">
                        <h3 style="color:blue;font-family:微軟正黑體;font-weight:700;">被柯瑞守住？麥凱倫：不可能</h3>
                    </div>
                </li>
                <li>
                    <a href="http://nba.udn.com/nba/story/6780/1784243" target="_blank"><img  src="advertisment/images/pic3.jpg" alt="image1"/></a>
                    <div class="sb-description">
                        <h3 style="color:orange;font-family:微軟正黑體;font-weight:700;">2016選秀會交易總匯</h3>
                    </div>
                </li>
                <li>
                    <a href="https://tw.news.yahoo.com/%E5%A5%A7%E9%81%8B%E6%89%93%E5%87%BA%E8%BA%AB%E5%83%B9-%E6%98%93%E5%BB%BA%E8%81%AF%E9%87%8D%E8%BF%94nba%E5%8A%A0%E7%9B%9F%E6%B9%96%E4%BA%BA-094528478--nba.html" target="_blank"><img src="advertisment/images/pic4.jpg" alt="image1" /></a>
                    <div class="sb-description">
                        <h3 style="color:blue;font-family:微軟正黑體;font-weight:700;">奧運打出身價 易建聯重返NBA加盟湖人</h3>
                    </div>
                </li>
                <li>
                    <a href="http://www.storm.mg/article/157222" target="_blank"><img src="advertisment/images/pic5.jpg" alt="image1" /></a>
                    <div class="sb-description">
                        <h3 style="color:blue;font-family:微軟正黑體;font-weight:700;">里約奧運》男籃決賽壓軸 美國夢幻隊擊敗塞爾維亞完成三連霸</h3>
                    </div>
                </li>
                <li>
                    <a href="http://www.dongtw.com/nba-news/20160623/000311754.html" target="_blank"><img src="advertisment/images/pic6.jpg" alt="image1" /></a>
                    <div class="sb-description">
                        <h3 style="color:red;font-family:微軟正黑體;font-weight:700;">重磅！公牛尼克5人交易，Rose赴紐約聯手甜瓜</h3>
                    </div>
                </li>
            </ul>

            <div id="shadow" class="shadow"></div>

            <div id="nav-arrows" class="nav-arrows">
                <a href="#">Next</a>
                <a href="#">Previous</a>
            </div>

        </div>
        <!-- ---------------------------------- 【end 廣告輪播】 ---------------------------------- -->
        
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.1.0/jquery.min.js"></script>
	<script src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.11.4/jquery-ui.min.js"></script>
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js" integrity="sha384-Tc5IQib027qvyjSMfHjOMaLkfuWVxZxUPnCJA7l2mCWNIpG9mGCD8wGNIcPD7Txa" crossorigin="anonymous"></script>
	<script type="text/javascript" src="advertisment/js/jquery.slicebox.js"></script>  
	<script type="text/javascript">
	
	/* ========================================【Begin 廣告輪播】============================================= */
		$(function () {
	
	        var Page = (function () {
	
	            var $navArrows = $('#nav-arrows').hide(),
	                $shadow = $('#shadow').hide(),
	                slicebox = $('#sb-slider').slicebox({
	                    onReady: function () {
	
	                        $navArrows.show();
	                        $shadow.show();
	
	                    },
	                    orientation: 'r',
	                    cuboidsRandom: true
	                }),
	
	                init = function () {
	
	                    initEvents();
	
	                },
	                initEvents = function () {
	
	                    // add navigation events
	                    $navArrows.children(':first').on('click', function () {
	
	                        slicebox.next();
	                        return false;
	
	                    });
	
	                    $navArrows.children(':last').on('click', function () {
	
	                        slicebox.previous();
	                        return false;
	
	                    });
	
	                };
	
	            return { init: init };
	
	        })();
	
	        Page.init();
	
	    });
	
	    $.Slicebox.defaults = {
	        // (v)ertical, (h)orizontal or (r)andom
	        orientation: 'r',
	
	        // perspective value
	        perspective: 1200,
	
	        // number of slices / cuboids
	        // needs to be an odd number 15 => number > 0 (if you want the limit higher,
	        // change the _validate function).
	        cuboidsCount: 5,
	
	        // if true then the number of slices / cuboids is going to be random (cuboidsCount is overwitten)
	        cuboidsRandom: false,
	
	        // the range of possible number of cuboids if cuboidsRandom is true
	        // it is strongly recommended that you do not set a very large number :)
	        maxCuboidsCount: 6,
	
	        // each cuboid will move x pixels left / top (depending on orientation).
	        // The middle cuboid doesn't move. the middle cuboid's neighbors will
	        // move disperseFactor pixels
	        disperseFactor: 0,
	
	        // color of the hidden sides
	        colorHiddenSides: '#222',
	
	        // the animation will start from left to right. The left most
	        // cuboid will be the first one to rotate
	        // this is the interval between each rotation in ms
	        sequentialFactor: 150,
	
	        // animation speed
	        // this is the speed that takes "1" cuboid to rotate
	        speed: 500,
	
	        // transition easing
	        easing: 'ease',
	
	        // if true the slicebox will start the animation automatically
	        autoplay: true,
	
	        // time (ms) between each rotation, if autoplay is true
	        interval: 2300,
	
	        // the fallback will just fade out / fade in the items
	        // this is the time fr the fade effect
	        fallbackFadeSpeed: 300,
	
	        // callbacks
	        onBeforeChange: function (position) { return false; },
	        onAfterChange: function (position) { return false; }
	    };
    /* ========================================【end 廣告輪播】============================================= */
	</script>
  </body>
</html>



