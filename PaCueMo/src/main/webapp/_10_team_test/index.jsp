<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/jquery-ui.min.css" rel="stylesheet">
<link href="css/addteam.css" rel="stylesheet">
<link href="css/addteam.css" rel="stylesheet">


  <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
  <script src="https://code.jquery.com/ui/1.12.0/jquery-ui.js"></script>
  <script>
//  team dialog
  $( function() {
    var dialog, form,
 
      // From http://www.whatwg.org/specs/web-apps/current-work/multipage/states-of-the-type-attribute.html#e-mail-state-%28type=email%29
      emailRegex = /^[a-zA-Z0-9.!#$%&'*+\/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]{0,61}[a-zA-Z0-9])?)*$/,
      name = $( "#name" ),
      email = $( "#email" ),
      password = $( "#password" ),
      allFields = $( [] ).add( name ).add( email ).add( password ),
      tips = $( ".validateTips" );
 
    function updateTips( t ) {
      tips
        .text( t )
        .addClass( "ui-state-highlight" );
      setTimeout(function() {
        tips.removeClass( "ui-state-highlight", 1500 );
      }, 500 );
    }
 
    function checkLength( o, n, min, max ) {
      if ( o.val().length > max || o.val().length < min ) {
        o.addClass( "ui-state-error" );
        updateTips( "Length of " + n + " must be between " +
          min + " and " + max + "." );
        return false;
      } else {
        return true;
      }
    }
 
    function checkRegexp( o, regexp, n ) {
      if ( !( regexp.test( o.val() ) ) ) {
        o.addClass( "ui-state-error" );
        updateTips( n );
        return false;
      } else {
        return true;
      }
    }
 
    function addUser() {
      var valid = true;
      allFields.removeClass( "ui-state-error" );
 
      valid = valid && checkLength( name, "username", 3, 16 );
      valid = valid && checkLength( email, "email", 6, 80 );
      valid = valid && checkLength( password, "password", 5, 16 );
 
      valid = valid && checkRegexp( name, /^[a-z]([0-9a-z_\s])+$/i, "Username may consist of a-z, 0-9, underscores, spaces and must begin with a letter." );
      valid = valid && checkRegexp( email, emailRegex, "eg. ui@jquery.com" );
      valid = valid && checkRegexp( password, /^([0-9a-zA-Z])+$/, "Password field only allow : a-z 0-9" );
 
      if ( valid ) {
        $( "#users tbody" ).append( "<tr>" +
          "<td>" + name.val() + "</td>" +
          "<td>" + email.val() + "</td>" +
          "<td>" + password.val() + "</td>" +
        "</tr>" );
        dialog.dialog( "close" );
      }
      return valid;
    }
 
    dialog = $( "#dialog-form" ).dialog({
      autoOpen: false,
      height: 400,
      width: 350,
      modal: true,
      buttons: {
        "Create an account": addUser,
        X: function() {
          dialog.dialog( "close" );
        }
      },
      close: function() {
        form[ 0 ].reset();
        allFields.removeClass( "ui-state-error" );
      }
    });
 
    form = dialog.find( "form" ).on( "submit", function( event ) {
      event.preventDefault();
      addUser();
    });
 
    $( "#create-user" ).button().on( "click", function() {
      dialog.dialog( "open" );
    });
  } );
  </script>
  
</head>
<body>


<div id="dialog-form">
        <form id="contact" action="TeamServlet" method="post">
            <div class="tm_title">
                <h3>建立新隊伍</h3>
            </div>
            <fieldset>
                <input placeholder="隊伍名稱" name="teamName" type="text" tabindex="1" required autofocus>
            </fieldset>
            <fieldset>
                <input placeholder="輸入隊員姓名或電子郵件" name="" type="text" tabindex="2">
            </fieldset>
            <fieldset>
                <div class="div_pri_tm">
                    <label class="" for="privacy_1">
                        <span class="">
                            <input type="radio" id="privacy_1" name="teamProp" value="0" aria-describedby="groupsCreatePrivacy" class="">
                            <img class="img_tm" src="assets/images/public.png" alt="" width="16" height="16"> <span>公開</span>
                        </span>
                        <div class="descrip" id="">所有人都可以自由加入這個隊伍。</div>
                    </label>
                </div>
                <div class="div_pri_tm">
                    <label class="" for="privacy_2">
                        <span class="">
                            <input type="radio" id="privacy_2" name="teamProp" value="1" checked="1" aria-describedby="groupsCreatePrivacy" class="">
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
    
	<button id="create-user">Create new user</button>
	
</body>
</html>