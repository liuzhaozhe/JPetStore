<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp" %>
<div id="body_main" style="height: 600px">
    <div class="show">
        <img src="image/${sessionScope.product.url}"/>
    </div>
    <div class="introduction">
        <ul>
            <li id="productId">id：${sessionScope.product.productId}</li>
            <li>${sessionScope.product.productName}</li>
            <li>价格：${sessionScope.product.price}￥</li>
            <li>库存：${sessionScope.product.amount}&nbsp;已出售：${sessionScope.product.sellCount}</li>
            <li>类别：<a
                    href="/getCategory?category=${sessionScope.category.fatherId}">${sessionScope.category.fatherName}</a>
                &gt;
                <a href="/getProductList?category2=${sessionScope.category.categoryId}">${sessionScope.category.categoryName}</a>
            </li>
            <li>简介：${sessionScope.product.description}</li>
        </ul>
        <button id="addShoppingCar">加入购物车</button>
        <button id="buy">直接购买</button>
    </div>
</div>
<script type="text/javascript">
    $(document).ready(function () {
        $("#addShoppingCar").click(function () {
            var username = $("#userName").text();
            if (username == ""){
                alert("请先登陆");
                return ;
            }
            var productId = $("#productId").text();
            $.get("/addShoppingCar",
                    function (data, status) {
                        if (status == "success") {
                            alert(data);
                        }
                    });
        });
        $("#buy").click(function(){
            var username = $("#userName").text();
            if (username == ""){
                alert("请先登陆");
                return ;
            }
            location.href = "/addBillByProduct?productId=" + $("#productId").text();
        });
    });

</script>
<%@include file="WEB-INF/jsp/common/buttom.jsp" %>