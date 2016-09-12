<%@ page language="java" contentType="text/html; charset=UTF8"
    pageEncoding="UTF8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/test02-test.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/test01.css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/css/easy-sidebar.css">


<!-- jQuery (necessary for Bootstrap's JavaScript plugins) --> 
<script src="${pageContext.request.contextPath}/js/jquery-1.11.2.min.js"></script> 

<!-- Include all compiled plugins (below), or include individual files as needed --> 
<script src="${pageContext.request.contextPath}/js/bootstrap.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery.detect_swipe.js"></script> 
<script src="${pageContext.request.contextPath}/js/jquery-ui.min.js"></script> 

</head>
<body>
<svg xmlns="http://www.w3.org/2000/svg" style="display:none">
  <symbol id="user-icon" viewBox="0 0 1024 1024">
    <path d="m730.06 679.64q-45.377 53.444-101.84 83.443t-120 29.999q-64.032 0-120.75-30.503t-102.6-84.451q-40.335 13.109-77.645 29.747t-53.948 26.722l-17.142 10.084q-29.747 19.159-51.175 57.729t-21.428 73.107 25.461 59.242 60.754 24.705h716.95q35.293 0 60.754-24.705t25.461-59.242-21.428-72.603-51.679-57.225q-6.554-4.033-18.907-10.84t-51.427-24.453-79.409-30.755zm-221.84 25.72q-34.285 0-67.561-14.873t-60.754-40.335-51.175-60.502-40.083-75.124-25.461-84.451-9.075-87.728q0-64.032 19.915-116.22t54.452-85.964 80.67-51.931 99.072-18.151 99.072 18.151 80.67 51.931 54.452 85.964 19.915 116.22q0 65.04-20.167 130.58t-53.948 116.72-81.426 83.443-98.568 32.268z"></path>
  </symbol>
  <symbol id="chevron-down" viewBox="0 0 1024 1024">
    <path class="path1" d="M476.455 806.696l-381.164-381.164q-14.621-14.621-14.621-35.293t14.621-34.789 35.293-14.117 34.789 14.117l342.846 343.35 349.4-349.4q14.621-14.117 35.293-14.117t34.789 14.117 14.117 34.789-14.117 34.789l-381.164 381.164q-19.159 19.159-38.318 19.159t-31.764-12.605z"></path>
  </symbol>
  <symbol id="scroll-down" viewBox="643.5 386 22.1 21.9">
    <path d="M665.6,396.3c0,0.3-0.1,0.7-0.4,0.9l-9.8,10.4c-0.5,0.5-1.3,0.5-1.7,0l-9.8-10.4c-0.5-0.5-0.5-1.3,0-1.8
    s1.3-0.5,1.7,0l8.9,9.5l8.9-9.5c0.5-0.5,1.3-0.5,1.7,0C665.5,395.6,665.6,396,665.6,396.3z">
      <path d="M665.6,387.3c0,0.3-0.1,0.7-0.4,0.9l-9.8,10.4c-0.5,0.5-1.3,0.5-1.7,0l-9.8-10.4c-0.5-0.5-0.5-1.3,0-1.8
    s1.3-0.5,1.7,0l8.9,9.5l8.9-9.5c0.5-0.5,1.3-0.5,1.7,0C665.5,386.6,665.6,387,665.6,387.3z"> </path>
    </path>
  </symbol>
</svg>
<header id="js-navbar" class="navbar navbar-default navbar-static-top " role="banner">
  <div class="container-fluid">
    <div class="navbar-header">
    <ul class="nav1 ul1">
    <li><button type="button" class="navbar-toggle1 collapsed" id="test"><span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button></li>
    </ul>
      <button type="button" class="navbar-toggle collapsed" data-toggle="sidepanel" data-target="#navbar-nav"> <span class="sr-only">Toggle navigation</span> <span class="icon-bar"></span> <span class="icon-bar"></span> <span class="icon-bar"></span> </button>
      <c:if test="${not empty LoginOK }">
      <ul class="nav">
      <c:choose>
        <c:when test="${not empty LoginOK.memberFBId }">
        <li><a href="${pageContext.request.contextPath}/_03_member/overview.do" class="user-link hidden-md hidden-lg"> <img class="user-img img-circle navbar-user-img" src="https://graph.facebook.com/${LoginOK.memberFBId }/picture?width=64&amp;height=64" alt="${LoginOK.memberFirstName}"> </a> </li>
        </c:when>
        <c:when test="${not empty LoginOK.memberImgUrl }">
        <li><a href="${pageContext.request.contextPath}/_03_member/overview.do" class="user-link hidden-md hidden-lg"> <img class="user-img img-circle navbar-user-img" src="${pageContext.request.contextPath}/image/member/${LoginOK.memberImgUrl}" alt="${LoginOK.memberFirstName}"></a></li>
        </c:when>
        <c:otherwise>
        <li><a href="${pageContext.request.contextPath}/_03_member/overview.do" class="user-link hidden-md hidden-lg"> <div class="user-icon-container img-circle navbar-user-img"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"> </use> </svg></div></a></li>
        </c:otherwise>
      </c:choose>
      </ul>


      </c:if>
      <a class="navbar-brand" href=""> <span class="navbar-logo">PACHEMO</span> </a> </div>
    <nav class="collapse navbar-collapse" id="navbar-nav" role="navigation">
      <ul class="nav navbar-nav navbar-right nav-main">

        <li> <a href="" id="nav-link-playercard" > 球員卡</a> </li>
        <li> <a href="#" id="nav-link-battle" > 約戰 </a> </li>
        <li> <a href="${pageContext.request.contextPath}/spring/team/createTeamPage" id="nav-link-team" > 隊伍</a> </li>
        <li> <a href="${pageContext.request.contextPath}/spring/league/introduce" id="nav-link-league" > 聯賽 </a> </li>
        <li> <a href="${pageContext.request.contextPath}/spring/club/introduce" id="nav-link-club">社團 </a> </li>
        <li> <a href="${pageContext.request.contextPath}/_5_gambling/BattleSet_Servlet.do?action=queryByDate" id="nav-link-lottery">運彩 </a> </li>
        <li> <a href="" id="nav-link-court">場地 </a> </li>
        <li> <a href="" id="nav-link-report" > 問題回報 </a> </li>       
        <li role="separator" class="divider"></li>
        <c:if test="${empty LoginOK }">
        <li class="alternate sidepanel-item-small"> <a href="${pageContext.request.contextPath}/spring/register/Signup" id="nav-link-sign_up" id="nav-link-sign_up" style="animation-delay: 85ms;"> 註冊 </a> </li>
        <li class="alternate sidepanel-item-small"> <a href="${pageContext.request.contextPath}/spring/login/Signin" id="header-login-link" class="user-link " style="animation-delay: 102ms;"> <span class="user-text navbar-user-text">登入</span> </a> </li>
        </c:if>
        <c:if test="${not empty LoginOK }">
        <li class="alternate sidepanel-item-small hidden-md hidden-lg "> <a href="">點數餘額：${LoginOK.memberPoint}點</a></li>
        <li class="alternate sidepanel-item-small hidden-md hidden-lg "> <a href="${pageContext.request.contextPath}/_03_member/overview.do" id="nav-link-account" > 帳戶 </a> </li>
        <li class="alternate sidepanel-item-small hidden-md hidden-lg "> <a href="${pageContext.request.contextPath}/_41_login_controller/logout.do" id="nav-link-log out" > 登出 </a> </li>
        <li class="hidden-xs hidden-sm dropdown"> <a href="" class="user-link dropdown-toggle" data-toggle="dropdown">
        <c:choose>
        <c:when test="${not empty LoginOK.memberFBId }">
        <img class="user-img img-circle navbar-user-img" src="https://graph.facebook.com/${LoginOK.memberFBId }/picture?width=64&amp;height=64" alt="${LoginOK.memberFirstName}">
        </c:when>
        <c:when test="${not empty LoginOK.memberImgUrl }">
        <img class="user-img img-circle navbar-user-img" src="${pageContext.request.contextPath}/image/member/${LoginOK.memberImgUrl}" alt="${LoginOK.memberFirstName}">
        </c:when>
        <c:otherwise>
        <div class="user-icon-container img-circle navbar-user-img"> <svg class="user-icon"><use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#user-icon"></use></svg></div> 
        </c:otherwise>
        </c:choose>
        <span class="user-text">${LoginOK.memberFirstName}</span>
          <svg class="svg-chevron-down">
            <use xmlns:xlink="http://www.w3.org/1999/xlink" xlink:href="#chevron-down"></use>
          </svg>
          </a>
          <ul class="dropdown-menu dropdown-menu-right">
          	<li> <a class="point" href="">點數餘額：${LoginOK.memberPoint}點</a></li>
            <li> <a href="${pageContext.request.contextPath}/_03_member/overview.do">帳戶</a> </li>
            <li> <a href="${pageContext.request.contextPath}/_41_login_controller/logout.do">登出</a> </li>
          </ul>
        </li>
        </c:if>
      </ul>
    </nav>
  </div>
</header>



