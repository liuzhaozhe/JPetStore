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
    <div id="body_main">
        <div class="sing-panel">
            <form action="" method="post" class="sign">
                <table align="center">
                    <tr>
                        <td>
                            <span>*</span>用户名：
                        </td>
                        <td>
                            <input type="text" name="username" required="required"/><span id="checkUsername"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>*</span>密码：
                        </td>
                        <td>
                            <input type="password" name="password" required="required"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <span>*</span>确认密码：
                        </td>
                        <td>
                            <input type="password" name="password" required="required"/><span id="checkPassword"></span>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            地址：
                        </td>
                        <td>
                            <input type="text" name="address">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            邮箱：
                        </td>
                        <td>
                            <input type="email" name="email">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            电话号码：
                        </td>
                        <td>
                            <input type="tel" name="phone">
                        </td>
                    </tr>
                    <tr>
                        <td>
                            <input class="button" type="reset" value="重置">
                        </td>
                        <td>
                            <input class="button" type="submit" value="注册">
                        </td>
                    </tr>
                </table>
            </form>
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
