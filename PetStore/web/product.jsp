<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp"%>
    <div id="body_main" style="height: 600px">
        <div class="show">
            <img src="image/${sessionScope.product.url}"/>
        </div>
        <div class="introduction">
            <ul>
                <li>id：${sessionScope.product.productId}</li>
                <li>${sessionScope.product.productName}</li>
                <li>价格：${sessionScope.product.price}￥</li>
                <li>库存：${sessionScope.product.amount}&nbsp;已出售：${sessionScope.product.sellCount}</li>
                <li>类别：<a href="/getCategory?category=${sessionScope.category.fatherId}">${sessionScope.category.fatherName}</a>
                    &gt;
                    <a href="/getProductList?category2=${sessionScope.category.categoryId}">${sessionScope.category.categoryName}</a>
                </li>
                <li>简介：${sessionScope.product.description}</li>
            </ul>
            <a href="#">加入购物车</a>
            <a href="#">直接购买</a>
        </div>
    </div>
<%@include file="WEB-INF/jsp/common/buttom.jsp"%>