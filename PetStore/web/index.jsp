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
    <div id="body_main" style="height: 600px">
        <div class="bar">
            <p>
                <a class="common" href="#">鸟</a>
            <ul>
                <li>雀</li>
                <li>鹦鹉</li>
            </ul>
            </p>
            <p>
                <a class="common" href="#">猫</a>
            <ul>
                <li>曼岛猫</li>
                <li>波斯猫</li>
            </ul>
            </p>
            <p>
                <a class="common" href="#">狗</a>
            <ul>
                <li>达尔马西亚狗</li>
                <li>恶犬</li>
                <li>金毛猎犬</li>
                <li>吉娃娃</li>
                <li>拉布拉多寻回犬</li>
                <li>狮子狗</li>
            </ul>
            </p>
            <p>
                <a class="common" href="#">鱼</a>
            <ul>
                <li>神仙鱼</li>
                <li>金鱼</li>
                <li>锦鲤</li>
                <li>鼬鲨</li>
            </ul>
            </p>
            <p>
                <a class="common" href="#">爬行动物</a>
            <ul>
                <li>蜥蜴</li>
                <li>蛇</li>
            </ul>
            </p>
        </div>
        <div class="bigImage">
            <img src="image/1.png" alt="1"/>
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
