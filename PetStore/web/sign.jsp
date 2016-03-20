<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp"%>
<div id="body_main">
    <div class="sing-panel">
        <c:if test="${requestScope.msg == null}">
            <span id="msg"></span>
        </c:if>
        <form action="/sign" method="post" class="sign">
            <table align="center">
                <tr>
                    <td>
                        <span>*</span>用户名：
                    </td>
                    <td>
                        <input type="text" name="username" required="required" onblur="check_username()" id="username"/>
                        <span id="checkUsername"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>*</span>密码：
                    </td>
                    <td>
                        <input type="password" name="password" required="required" id="password" onblur="check_password()"/>
                        <span id="passwordValue"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        <span>*</span>确认密码：
                    </td>
                    <td>
                        <input type="password" name="password2" required="required" id="password2" onblur="check_password()"/>
                        <span id="checkPassword"></span>
                    </td>
                </tr>
                <tr>
                    <td>
                        地址：
                    </td>
                    <td>
                        <input type="text" name="address" />
                    </td>
                </tr>
                <tr>
                    <td>
                        邮箱：
                    </td>
                    <td>
                        <input type="email" name="email" />
                    </td>
                </tr>
                <tr>
                    <td>
                        电话号码：
                    </td>
                    <td>
                        <input type="tel" name="phone" />
                    </td>
                </tr>
                <tr>
                    <td>
                        <input class="button" type="reset" value="重置" />
                    </td>
                    <td>
                        <input class="button" type="submit" value="注册" />
                    </td>
                </tr>
            </table>
        </form>
    </div>
</div>
<script type="text/javascript">
    function check_username(){
        var username = $("#username").val();
        if(username != ""){
            $.post("/checkUsername",
                    {
                        username:username
                    },
                    function(data,status){
                        if(status == "success"){
                            if(data == "exist") {
                                $("#checkUsername").text("该用户已存在");
                            }else {
                                var img = document.createElement("img");
                                img.setAttribute("src", "../image/right.jpg");
                                img.setAttribute("width","30px");
                                img.setAttribute("height","30px");
                                $("#checkUsername").text("");
                                $("#checkUsername").append(img);
                            }
                        }
                    });
        }
    }
    function check_password(){
        var password1 = $("#password").val();
        var passeord2 = $("#password2").val();
        if(password1 != passeord2){
            $("#checkPassword").text("两次密码不相同");
        } else {
            var img = document.createElement("img");
            img.setAttribute("src", "../image/right.jpg");
            img.setAttribute("width","30px");
            img.setAttribute("height","30px");
            $("#checkPassword").text("");
            $("#checkPassword").append(img);
        }
    }
</script>
<%@include file="WEB-INF/jsp/common/buttom.jsp"%>