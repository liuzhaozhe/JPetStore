<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp" %>
<div id="body_main">
    <table class="orderItem" align="center">
        <tr>
            <th width="10%">商品编号</th>
            <th width="20%">商品名称</th>
            <th width="10%">商品价格</th>
            <th width="10%">数量</th>
            <th width="10%">库存</th>
            <th width="10%">总价格</th>
            <th width="10%">操作</th>
        </tr>
        <c:forEach items="${sessionScope.itemList}" var="item">
            <tr id="${item[0].productId}">
                <td>${item[0].productId}</td>
                <td>${item[0].productName}</td>
                <td><em id="${item[0].productId}_price">${item[0].price}</em>￥</td>
                <td><input type="number" value="${item[0].amount}" min="1" id="${item[0].productId}_amount"
                           onchange="changTotalPrice('${item[0].productId}')"/></td>
                <td id="${item[0].productId}_stock">${item[1]}</td>
                <td id="${item[0].productId}_totalPrice">${item[0].totalPrice}￥</td>
                <td>
                    <%--<button onclick="updateShoppingCar('${item[0].productId}')">修改</button>--%>
                    <button onclick="deleteShoppingCar('${item[0].productId}')">删除</button>
                    <button onclick="buy('${item[0].productId}')">购买</button>
                </td>
            </tr>
        </c:forEach>
    </table>
    <button onclick="buyAll()">购买所有商品</button>
</div>
<script>
    function changTotalPrice(productId) {
        var amount = $("#" + productId + "_amount").val();
        var price = $("#" + productId + "_price").text();
        var totalPrice = amount * price;
        $("#" + productId + "_totalPrice").text(totalPrice + "￥");
        stockFlush(productId);
        $.post("/updateShoppingCar",
                {
                    productId: productId,
                    amount: $("#" + productId + "_amount").val()
                });
    }
    function stockFlush(productId) {
        $.post("/getStock",
                {
                    productId: productId
                },
                function (data, status) {
                    if (status == "success") {
                        $("#" + productId + "_stock").text(data);
                        $("#" + productId + "_amount").attr("max", data);
                    }
                });
    }
    function updateShoppingCar(productId) {
        $.post("/updateShoppingCar",
                {
                    productId: productId,
                    amount: $("#" + productId + "_amount").val()
                },
                function (data, status) {
                    if (status == "success") {
                        if (data == "success") {
                            alert("修改成功")
                        } else {
                            alert("修改失败");
                        }
                    }
                });
    }
    function deleteShoppingCar(productId) {
        $.post("/deleteShoppingCar",
                {
                    productId: productId
                },
                function (data, status) {
                    if (status == "success") {
                        if (data == "success") {
                            alert("删除成功");
                            $("#" + productId).remove();
                        } else {
                            alert("删除失败");
                        }
                    }
                });
    }
    function buy(productId){
        location.href = "/addBillByCar?productId=" + productId;
    }
    function buyAll(){
        location.href = "/addBillByCar";
    }
</script>
<%@include file="WEB-INF/jsp/common/buttom.jsp" %>