<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp"%>
<div id="body_main">
    购买成功，5秒后<a href="index.jsp">返回</a> 主页面...
</div>
<script type="text/javascript">
    $(document).ready(function(){
        setTimeout(function(){
            location.href = "index.jsp";
        }, 5000);
    });
</script>
<%@include file="WEB-INF/jsp/common/buttom.jsp"%>