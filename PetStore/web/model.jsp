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
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    <link rel="stylesheet" type="text/css" href="css/mystyle.css">
    <script src="js/jquery-1.8.3.min.js"></script>
</head>
<body>
<div id="header">
    <div id="logo">
        <div id="logo_image">
            <a href="index.jsp" class="logoa"><img src="image/logo-topbar.gif" alt="logo" border="0px"/></a>
        </div>
    </div>
    <div id="header_main">
        <div id="account">
            <a class="account" href="/getShoppingCar"><img src="image/cart.gif" alt="购物车"/></a>
            <img src="image/separator.gif"/>
            <%--判断是否登陆--%>
            <c:if test="${sessionScope.user == null}">
                <a class="account" href="login.jsp">登陆</a>
                <img src="image/separator.gif"/>
                <a class="account" href="/sign.jsp">注册</a>
            </c:if>
            <c:if test="${sessionScope.user != null}">
                <a class="account" href="user.jsp" id="userName">${sessionScope.user.username}</a>
                <img src="image/separator.gif"/>
                <a class="account" href="/unsign">注销</a>
            </c:if>
        </div>
    </div>
    <div id="header_search">
        <div id="search">
            <form action="/search" method="post" onsubmit="return check(this)">
                <input type="text" name="search" onchange="getName()" id="searchInput" list="name_list"/>
                <datalist id="name_list">
                </datalist>
                <input type="submit" value="查询"/>
            </form>
            <script type="text/javascript">
                function getName() {
                    var data_list = document.getElementById("name_list");
                    var search = $("#searchInput").val();
                    if (search == "") {
                        return;
                    }
                    while (data_list.hasChildNodes()) //当div下还存在子节点时 循环继续
                    {
                        data_list.removeChild(data_list.firstChild);
                    }
                    $.post("/matchName",
                            {
                                search: search
                            },
                            function (data, status) {
                                if (status == "success") {
                                    var obj = eval("(" + data + ")");
                                    for (var i = 0; i < obj.length; i++) {
                                        var option = document.createElement("option");
                                        option.setAttribute("value", obj[i].name);
                                        data_list.appendChild(option);
                                    }
                                }
                            });
                }
                function check(form) {
                    with (form) {
                        if (search.value == "") {
                            return false;
                        } else {
                            return true;
                        }
                    }
                }
            </script>
        </div>
    </div>
</div>
<div id="quicklinks">
    <div id="link">
        <a class="outlink" href="/getCategory?category=BD">鸟</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="/getCategory?category=CA">猫</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="/getCategory?category=DG">狗</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="/getCategory?category=FI">鱼</a>
        <img src="image/separator.gif"/>
        <a class="outlink" href="/getCategory?category=RP">爬行动物</a>
    </div>
</div>
<div id="body">
    <c:if test="${sessionScope.navigation != null && sessionScope.navigation.toString() != \"\"}">
        <div>
            <nav class="navigation">${sessionScope.navigation.toString()}</nav>
        </div>
    </c:if>
</div>
<div id="foot">
    <div id="foot_main">
        <a class="outlink" href="https://github.com/hezhujun/JPetStore">@github.com</a>
    </div>
</div>
</body>
</html>
