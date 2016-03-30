<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>用户注册</title>
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8"/>
    <meta name="keywords"
          content="Play-Offs Responsive web template, Bootstrap Web Templates, Flat Web Templates, Andriod Compatible web template, Smartphone Compatible web template, free webdesigns for Nokia, Samsung, LG, SonyErricsson, Motorola web design"/>
    <script type="application/x-javascript"> addEventListener("load", function () {
        setTimeout(hideURLbar, 0);
    }, false);
    function hideURLbar() {
        window.scrollTo(0, 1);
    } </script>
    <!meta charset utf="8">
    <!--bootstrap-->
    <link href="./../../css/bootstrap.min.css" rel="stylesheet" type="text/css">
    <!--coustom css-->
    <link href="./../../css/style.css" rel="stylesheet" type="text/css"/>
    <link href="./../../css/myStyle.css" rel="stylesheet" type="text/css"/>
    <link rel="stylesheet" href="//apps.bdimg.com/libs/jqueryui/1.10.4/css/jquery-ui.min.css">
    <!--script-->
    <script src="./../../js/jquery-1.12.1.min.js"></script>
    <script src="./../../js/bootstrap.min.js"></script>
    <script type="text/javascript" src="./../../js/move-top.js"></script>
    <script type="text/javascript" src="./../../js/easing.js"></script>
    <script type="text/javascript" src="./../../js/jquery-ui.min.js"></script>
    <!--fonts-->
    <link href='http://fonts.googleapis.com/css?family=Quicksand:300,400,700' rel='stylesheet' type='text/css'>
    <link href='http://fonts.googleapis.com/css?family=Open+Sans:400,300,600,700,800' rel='stylesheet' type='text/css'>
    <!--script-->
    <script type="text/javascript">
        jQuery(document).ready(function ($) {
            $(".scroll").click(function (event) {
                event.preventDefault();
                $('html,body').animate({scrollTop: $(this.hash).offset().top}, 900);
            });
        });
    </script>
</head>
<body>
<!--header-part-->
<div class="banner-background" id="to-top">
    <div class="container">
        <div class="nav-back">
            <div class="navigation">
                <nav class="navbar navbar-default">
                    <!-- Brand and toggle get grouped for better mobile display -->
                    <div class="navbar-header">
                        <button type="button" class="navbar-toggle collapsed" data-toggle="collapse"
                                data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
                            <span class="sr-only">Toggle navigation</span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                            <span class="icon-bar"></span>
                        </button>
                    </div>
                    <!-- Collect the nav links, forms, and other content for toggling -->
                    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
                        <ul class="nav navbar-nav">
                            <li><a href="./../../index.jsp">&nbsp;&nbsp;主页&nbsp;&nbsp;<span
                                    class="sr-only">(current)</span></a>
                            </li>
                            <li><a href="/getCategory?category=BD">&nbsp;鸟&nbsp;</a></li>
                            <li><a href="/getCategory?category=CA">&nbsp;猫&nbsp;</a></li>
                            <li><a href="/getCategory?category=DG">&nbsp;狗&nbsp;</a></li>
                            <li><a href="/getCategory?category=FI">&nbsp;鱼&nbsp;</a></li>
                            <li><a href="/getCategory?category=RP">爬行动物</a></li>
                        </ul>
                    </div><!-- /.navbar-collapse -->
                    <div class="clearfix"></div>
                    <div class="clearfix"></div>
                </nav>
                <div class="clearfix"></div>
            </div>
            <div class="logo">
                <h1><a href="./../../index.jsp">PET<span class="hlf"> STORE</span></a></h1>
            </div>
            <div class="account">
                <span>
                    <a class="account" href="/getShoppingCar"><img src="../../images/car.png" alt="购物车"/></a>
                <%--判断是否登陆--%>
                <c:if test="${sessionScope.user == null}">
                    <a href="./../../jsp/user/login.jsp">登录</a>
                    <a href="./../../jsp/user/sign.jsp">注册</a>
                </c:if>
                <c:if test="${sessionScope.user != null}">
                    <a href="./../../jsp/user/user.jsp">${sessionScope.user.username}</a>
                </c:if>
                </span>
            </div>
            <div class="ui-widget search">
                <form action="/search" method="post">
                    <input type="text" name="search" id="autocomplete" autocomplete="off" placeholder="商品名称"
                           required="required"/>
                    <input type="submit" value="查询"/>
                    <script>
                        $(document).ready(function () {
                            $("#autocomplete").autocomplete({
                                source: function (request, response) {
                                    $.ajax({
                                        type: "POST",
                                        url: "/matchName",
                                        data: "search=" + $("#autocomplete").val(),
                                        dataType: "json",
                                        success: function (jsonObj) {
                                            response(jsonObj);
                                        }
                                    });
                                },
                                minLength: 1,
                                select: function (event, ui) {
                                    $("#autocomplete").val(ui.item.value);
                                    $(":submit:first").click();
                                }
                            });
                        });
                    </script>
                </form>
            </div>
        </div>
    </div>
</div>
<!--header-ends-->
<!--pages-->
<div class="typography">
    <h3>用户注册</h3>
    <div class="container">
        <div class="user-box">
            <c:if test="${requestScope.msg != null}">
                <div class="user-error">${requestScope.msg}</div>
            </c:if>
            <form action="/sign" method="post">
                <input class="name" type="text" name="name" required="required"
                       placeholder="用户名(只能是字母和数字的组合)"/><span id="checkUsername"></span><br>
                <br>
                <input class="name" type="password" name="password" required="required"
                       placeholder="密码"/><br>
                <br>
                <input class="name" type="password" name="password2" required="required"
                       placeholder="确认密码"/><span id="checkPassword"></span><br>
                <br>
                <input class="name" type="text" name="address" placeholder="地址"/><br>
                <br>
                <input class="name" type="text" name="address" placeholder="电话号码"/><br>
                <br>
                <input class="mail" type="text" name="email" placeholder="邮箱"/><br>
                <br>
                <button type="reset" class="btn btn-danger">重置</button>
                <button type="submit" class="btn btn-danger">注册</button>
            </form>
            <script>
                $(document).ready(function () {
                    var form = $("form:last");
                    var usernameInput = form.children().first();
                    // 判断用户名
                    usernameInput.blur(function () {
                        var username = $(this).val();
                        if (username != "") {
                            // 判断用户名格式是否正确
                            var isRight = /^(?=.*[a-z])[a-z0-9]+/ig.test(username);
                            if (!isRight) {
                                alert("用户名格式不正确！\n只能是字母和数字的组合!");
                                usernameInput.focus();
                                $("#checkUsername").empty();
                                $("#checkUsername").append("<img src=\"/images/error.png\">");
                                return;
                            }
                            // 判断用户名是否存在
                            $.post(
                                    "/checkUsername",
                                    {
                                        username: username
                                    },
                                    function (data, status) {
                                        if (status == "success") {
                                            if (data == "exist") {
                                                alert("用户名已存在！请更换用户名！");
                                                usernameInput.focus();
                                                $("#checkUsername").empty();
                                                $("#checkUsername").append("<img src=\"/images/error.png\">");
                                            } else {
                                                $("#checkUsername").empty();
                                                $("#checkUsername").append("<img src=\"/images/success.png\">");
                                            }
                                        }
                                    }
                            );
                        }
                    });
                    var passwordInput = $(":password");
                    var password1Input = passwordInput.first();
                    var password2Input = passwordInput.last();
                    password2Input.change(function () {
                        var password1 = password1Input.val();
                        var password2 = password2Input.val();
                        if (password1 == "") {
                            return;
                        } else {
                            if (password1 != password2) {
                                alert("两次输入的密码不相等");
                                $("#checkPassword").empty();
                                $("#checkPassword").append("<img src=\"/images/error.png\">");
                            } else {
                                $("#checkPassword").empty();
                                $("#checkPassword").append("<img src=\"/images/success.png\">");
                            }
                        }
                    });
                });
            </script>
        </div>
    </div>
    <!--container-->
</div>
<!--pages-->
<!--footer-->
<div class="footer">
    <div class="container">
        <div class="col-md-6 mrg1">
            <div class="col-md-4 brk4">
                <div class="about">
                    <h4>ABOUT</h4>
                    <ul>
                        <li><a href="https://github.com/hezhujun/JPetStore">github.com</a></li>
                    </ul>
                </div>
            </div>
            <div class="clearfix"></div>
        </div>
        <div class="clearfix"></div>
    </div>
</div>
<!--footer-->
<!---->
<script type="text/javascript">
    $(document).ready(function () {
        /*
         var defaults = {
         containerID: 'toTop', // fading element id
         containerHoverID: 'toTopHover', // fading element hover id
         scrollSpeed: 1200,
         easingType: 'linear'
         };
         */
        $().UItoTop({easingType: 'easeOutQuart'});
    });
</script>
<a href="#to-top" id="toTop" style="display: block;"> <span id="toTopHover" style="opacity: 1;"> </span></a>
<!---->
</body>
</html>