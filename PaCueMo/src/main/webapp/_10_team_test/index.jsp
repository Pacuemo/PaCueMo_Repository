<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<link href="css/jquery-ui.css" rel="stylesheet">
<link href="css/addteam.css" rel="stylesheet">
</head>
<body>


<div>
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