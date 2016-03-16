<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="../WEB-INF/jsp/common/top.jsp"%>
    <div id="body_main" style="height: 500px">
        <div class="bigImage">
            <img src="../image/login.png" alt="登陆图片" style="margin-top: 50px"/>
        </div>
        <div class="login-panel">
            <div class="login">
                <h1>欢迎来到宠物商店</h1>
                <form action="loginServlet" method="post" onsubmit="return checkForm(this)">
                    <c:if test="${requestScope.msg != null}">
                        <span id="msg">${requestScope.msg}</span>
                        <br/>
                    </c:if>
                    <input type="text" name="username" placeholder="账号名" onblur="check_user()" id="username"/>
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
    <script type="text/javascript">
        function check_user(){
            var username = $("#username").val();
            if(username != ""){
                $.post("checkUsernameServlet",
                        {
                            name:username
                        },
                        function(data,status){
                            if(status == "success"){
                                if(data == "exist")
                                $("#checkUsername").text("");
                            } else {
                                $("#checkUsername").text("该用户不存在");
                            }
                        });
            }
        }
        function checkForm(form){
            with (form) {
                if (username.value == "") {
                    alert("请输入用户名");
                    return false;
                }
                if (password.value == "") {
                    alert("请输入密码");
                    return false;
                }
            }
        }
    </script>
<%@include file="../WEB-INF/jsp/common/buttom.jsp"%>