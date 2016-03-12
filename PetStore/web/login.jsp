<%--
  Created by IntelliJ IDEA.
  User: hezhujun
  Date: 2016/3/9
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>JPetStore</title>
    <link rel="stylesheet" type="text/css" href="css/style.css">
</head>
<body>
<div id="header">
    <div id="logo">
        <div id="logo_image">
            <a href="#"><img src="image/logo-topbar.gif" alt="logo" border="0px"/></a>
        </div>
    </div>
    <div id="header_main">
        <div id="account">
            <a class="account" href="#">
                <img src="image/cart.gif" alt="购物车"/>
            </a>
            <img src="image/separator.gif"/>
            <a class="account" href="#">登陆</a>
            <img src="image/separator.gif"/>
            <a class="account" href="#">?</a>
        </div>
    </div>
    <div id="header_search">
        <div id="search">
            <form action="" method="post">
                <input type="text" name="search"/>
                <input type="submit" value="查询"/>
            </form>
        </div>
    </div>
</div>
<div id="quicklinks">
    <div id="link">
        <a class="outlink" href="#">鸟</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="#">猫</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="#">狗</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="#">鱼</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="#">爬行动物</a>
    </div>
</div>
<div id="body">
    <div id="body_main" style="height: 500px">
        <div class="bigImage">
            <img src="image/login.png" alt="登陆图片" style="margin-top: 50px"/>
        </div>
        <div class="login-panel">
            <div class="login">
                <h1>欢迎来到宠物商店</h1>
                <form action="" method="post">
                    <span id="msg"></span>
                    <br/>
                    <input type="text" name="usernaem" placeholder="账号名" />
                    <br/>
                    <span id="checkUsername"></span>
                    <br/>
                    <input type="password" name="password" placeholder="密码" />
                    <br/>
                    <input class="button" type="submit" value="登陆">
                </form>
                <a href="#">注册新用户</a>
            </div>
        </div>
    </div>
</div>
<div id="foot">
    <div id="foot_main">
        <a class="outlink" href="#">www.mybatis.org</a>
    </div>
</div>
</body>
</html>
