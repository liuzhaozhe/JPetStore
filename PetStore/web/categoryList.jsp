<%@ page import="java.util.Map" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp" %>
<div id="body_main" style="height: 600px">
    <c:forEach items="${sessionScope.category2.keySet()}" var="category2">
        <div class="show">
            <a href="/getProductList?category2=${category2}">
                <img src="image/${category2}.gif" alt="${sessionScope.category2.get(category2)}"/>
                <div>${sessionScope.category2.get(category2)}</div>
            </a>
        </div>
    </c:forEach>
</div>
<%@include file="WEB-INF/jsp/common/buttom.jsp" %>