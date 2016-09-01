<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%--<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>--%> <%--use JSTL Standard Syntax--%>
<%--<%@ taglib prefix="s" uri="/struts-tags"%>--%>  <%-- for Struts2 --%> 
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>

<link href="css/addteam.css" rel="stylesheet">
<link href="css/jquery-ui.min.css" rel="stylesheet">

<script src="js/jquery-3.1.0.min.js"></script>
<script src="js/jquery-ui.min.js"></script>

<script>
// initial start
$( function() {
// team dialog
    var dialog;
 
    dialog = $( "#contact" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      draggable: false,
      resizable: false,
    });
 
    $( "#create-team" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
    
    function chkName() {
        checkName = false;
        var name = document.getElementById(" ").value;
        rs = /%{1}u{1}\S{4}$/;

        for (var i = 0; i < name.length; i++) {
            var code = escape(name.charAt(i));
            if (code == "%uu02CA" || code == "%uu02C7" || code == "%u02CB" || code == "%u02D9") { //注音符號
                checkName = false;
                break;
            }
            if (rs.test(code)) {
                checkName = true;
            } else {
                checkName = false;
                break;
            }
        }

        if (checkName) {
        	
        } else {
            document.getElementById("teamName").customValidity = "(不可空白，且必須為中文字)";
            if (name == "") {
                document.getElementById("namespan").innerHTML = "不可空白";
            } else {
                document.getElementById("namespan").innerHTML = "輸入錯誤";
            }
        }
    }
    document.getElementById("teamName").onblur = chkName;

// team dialog end    
    
// initial end
  } );
  
</script>
  
</head>
<body>


<div>
        <form id="contact" title="建立新隊伍" action="${pageContext.request.contextPath}/TeamServlet" method="post">
<!--             <div class="tm_title"> -->
<!--                 <h3>建立新隊伍</h3> -->
<!--             </div>  oninvalid="setCustomValidity('不能为空')" oninput="setCustomValidity('')"-->
            <fieldset>
                <input placeholder="隊伍名稱" id="teamName" name="teamName" type="text" tabindex="1" required  oninvalid="setCustomValidity('GG')"  maxlength="10" autofocus pattern=".{2,}">
            </fieldset>
            <fieldset>
                <input placeholder="輸入隊員姓名或電子郵件" name="" type="text" tabindex="2">
            </fieldset>
            <fieldset>
                <div class="div_pri_tm">
                    <label class="" for="privacy_1">
                        <span class="">
                            <input type="radio" id="privacy_1" name="teamProp" value="0" aria-describedby="groupsCreatePrivacy" class="" >
                            <img class="img_tm" src="assets/images/public.png" alt="" width="16" height="16"> <span>公開</span>
                        </span>
                        <div class="descrip" id="">所有人都可以自由加入這個隊伍。</div>
                    </label>
                </div>
                <div class="div_pri_tm">
                    <label class="" for="privacy_2">
                        <span class="">
                            <input type="radio" id="privacy_2" name="teamProp" value="1" checked="checked" aria-describedby="groupsCreatePrivacy" class="">
                            <img class="img_tm" src="assets/images/protect.png" alt="" width="16" height="16"> <span>需申請</span>
                        </span>
                        <div class="descrip" id="">所有人都可以申請加入這個隊伍。</div>
                    </label>
                </div>
                <div class="div_pri_tm">
                    <label class="" for="privacy_3">
                        <span class="">
                            <input type="radio" id="privacy_3" name="teamProp" value="2" aria-describedby="groupsCreatePrivacy" class="">
                            <img class="img_tm" src="assets/images/private.png" alt="" width="16" height="16"> <span>私密</span>
                        </span>
                        <div class="descrip" id="">只有被邀請的成員才可以加入這個隊伍。</div>
                    </label>
                </div>
            </fieldset>
            <fieldset>
                <button name="submit" type="submit" id="contact-submit" data-submit="...Sending">Submit</button>
            </fieldset>
        </form>
    </div>
    
	<button id="create-team">Create new user</button>
	
</body>
</html>