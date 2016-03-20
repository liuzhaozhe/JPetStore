<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp"%>
    <div id="body_main" style="height: 600px">
        <c:forEach items="${sessionScope.productList}" var="product">
            <div class="show">
                <a href="/getProduct?productId=${product[0]}">
                    <img src="image/${product[2]}" alt="${product[1]}" />
                    <div>${product[1]}</div>
                </a>
            </div>
        </c:forEach>

    </div>
<%@include file="WEB-INF/jsp/common/buttom.jsp"%>