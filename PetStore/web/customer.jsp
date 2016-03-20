<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp"%>
    <div id="body_main">
        <div class="sing-panel">
            <form action="" method="post" class="sign" onsubmit="return checkForm(this)">
                <table align="center">
                    <tr>
                        <td>
                            用户名：
                        </td>
                        <td>
                            <input type="text" name="username" disabled="disabled"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            修改密码：
                        </td>
                        <td>
                            <input type="password" name="password" id="password"/>
                        </td>
                    </tr>
                    <tr>
                        <td>
                            确认密码：
                        </td>
                        <td>
                            <input type="password" name="password2" id="password2"/>
                            <span id="checkPassword"></span>
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
                        <td colspan="2" align="center">
                            <input class="button" type="submit" value="修改">
                        </td>
                    </tr>
                    <tr>
                        <td colspan="2" align="center"><a href="#" >查看账单</a></td>
                    </tr>
                </table>
            </form>
        </div>
    </div>
    <script>
        function check_password(){
            var password1 = $("#password").val();
            var passeord2 = $("#password2").val();
            if(password1 != passeord2){
                $("#checkPassword").text("两次密码不相同");
            } else {
                $("#checkPassword").text("<img src=\"../image/right.jpg\" width=\"30px\" height=\"30px\" />");
            }
        }
        function checkForm(form){
            with (form){
                if (password.value != "" && password2.value == ""){
                    alert("请确认密码");
                    password2.focus();
                    return false;
                } else {
                    return true;
                }
            }
        }
    </script>
<%@include file="WEB-INF/jsp/common/buttom.jsp"%>