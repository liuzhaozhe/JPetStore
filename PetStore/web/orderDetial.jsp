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
        <form action="" method="post">
            <table cellpadding="5">
                <tr>
                    <td>
                        编号：<input type="text" name="name" disabled="disabled"/>
                    </td>
                    <td>
                        收货人：<input type="text" name="consignee"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        地址：<input type="text" name="address"/>
                    </td>
                    <td>
                        电话号码：<input type="text" name="phone">
                    </td>
                </tr>
            </table>
            <table class="orderItem" align="center">
                <tr>
                    <th width="10%">商品编号</th>
                    <th width="20%">商品名称</th>
                    <th width="10%">商品价格</th>
                    <th width="10%">数量</th>
                    <th width="10%">总价格</th>
                    <th width="10%">操作</th>
                </tr>
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="number" name=""></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            总金额：<input type="number" name="totalPrice" disabled="disabled" />
            支付方式：
            <select>
                <option value="支付宝">支付宝</option>
                <option value="微信">微信</option>
            </select>
        </form>
    </div>
</div>
<div id="foot">
    <div id="foot_main">
        <a class="outlink" href="#">www.mybatis.org</a>
    </div>
</div>
</body>
</html>
