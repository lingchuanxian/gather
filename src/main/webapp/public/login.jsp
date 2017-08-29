<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <base href="${pageContext.request.contextPath}/"/>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta http-equiv="X-UA-Compatible" content="IE=emulateIE7" />
    <link rel="stylesheet" type="text/css" href="static/css/loginmain.css" />
    <script type="text/javascript" src="static/js/jquery-1.11.3.min.js"></script>
    <script type="text/javascript" src="static/layer/layer.js"></script>
    <script type="text/javascript" src="static/js/global.js"></script>
    <title>数字办公后台管理系统_用户登录</title>
</head>
<body>
<div id="container">
    <div id="bd">
        <div id="main">
            <div class="login-box">
                <div id="logo"></div>
                <h1></h1>
                <div class="input username" id="username">
                    <label for="account">用户名</label>
                    <span></span>
                    <input type="text" id="account"/>
                </div>
                <div class="input psw" id="psw">
                    <label for="pwd">密&nbsp;&nbsp;&nbsp;&nbsp;码</label>
                    <span></span>
                    <input type="password" id="pwd"/>
                </div>
                <div class="input validate" id="validate">
                    <label for="code">验证码</label>
                    <input type="text" id="code"/>
                    <img src="imageCode.shtml" id="kaptchaImage" title="看不清，点击换一张"  style="float: right;"/>
                </div>

                <div id="btn" class="loginButton">
                    <input type="button" class="button" value="登录"  />
                </div>
            </div>
        </div>
        <div id="ft">CopyRight&nbsp;2017&nbsp;&nbsp;版权所有&nbsp;&nbsp;<a href="javascript:;" target="_blank">fjlcx</a> &nbsp;&nbsp;</div>
    </div>

</div>

</body>
<script type="text/javascript">
    var height = $(window).height() > 445 ? $(window).height() : 445;
    $("#container").height(height);
    var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
    $('#bd').css('padding-top', bdheight);
    $(window).resize(function(e) {
        var height = $(window).height() > 445 ? $(window).height() : 445;
        $("#container").height(height);
        var bdheight = ($(window).height() - $('#bd').height()) / 2 - 20;
        $('#bd').css('padding-top', bdheight);
    });
    $('select').select();
</script>

</html>
