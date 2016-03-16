<%--
  Created by IntelliJ IDEA.
  User: hezhujun
  Date: 2016/3/9
  Time: 14:19
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>JPetStore</title>
    <link rel="stylesheet" type="text/css" href="../css/style.css">
    <script src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div id="header">
    <div id="logo">
        <div id="logo_image">
            <a href="index.jsp"><img src="../image/logo-topbar.gif" alt="logo" border="0px"/></a>
        </div>
    </div>
    <div id="header_main">
        <div id="account">
            <a class="account" href="shoppingCar.jsp"><img src="../image/cart.gif" alt="购物车"/></a>
            <img src="../image/separator.gif"/>
            <%--判断是否登陆--%>
            <c:if test="${sessionScope.customer == null}">
                <a class="account" href="login.jsp">登陆</a>
                <img src="../image/separator.gif"/>
                <a class="account" href="sign.jsp">注册</a>
            </c:if>
            <c:if test="${sessionScope.customer != null}">
                <a class="account" href="customer.jsp">${sessionScope.customer.username}</a>
                <img src="../image/separator.gif"/>
                <a class="account" href="unsignServlet">注销</a>
            </c:if>
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
        <a class="outlink" href="categoryServlet?category=BD">鸟</a>
        <img src="../image/separator.gif"/>
        <a class="outlink" href="categoryServlet?category=CA">猫</a>
        <img src="../image/separator.gif"/>
        <a class="outlink" href="categoryServlet?category=DG">狗</a>
        <img src="../image/separator.gif"/>
        <a class="outlink" href="categoryServlet?category=FI">鱼</a>
        <img src="../image/separator.gif"/>
        <a class="outlink" href="categoryServlet?category=RP">爬行动物</a>
    </div>
</div>
<div id="body">
<c:if test="${sessionScope.navigation != null && sessionScope.navigation.toString() != \"\"}">
    <div>
        <nav class="navigation">${sessionScope.navigation.toString()}</nav>
    </div>
</c:if>