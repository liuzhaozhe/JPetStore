<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp" %>
<div id="body_main">
    <form action="/addBill" method="post" onsubmit="return checkForm(this)">
        <table cellpadding="5">
            <tr>
                <td>
                    收货人：<input type="text" name="consignee" required="required"/>
                </td>
                <td>
                    地址：<input type="text" name="address" required="required"/>
                </td>
                <td>
                    电话号码：<input type="text" name="phone" required="required"/>
                </td>
            </tr>
        </table>
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
            <c:forEach items="${sessionScope.buyList}" var="item">
                <tr id="${item[0].productId}">
                    <td>${item[0].productId}</td>
                    <td>${item[0].productName}</td>
                    <td><em id="${item[0].productId}_price">${item[0].price}</em>￥</td>
                    <td><input type="number" value="${item[0].amount}" min="1" id="${item[0].productId}_amount"
                               onchange="changTotalPrice('${item[0].productId}')"/></td>
                    <td id="${item[0].productId}_stock">${item[1]}</td>
                    <td id="${item[0].productId}_totalPrice"><em class="row-totalPrice">${item[0].totalPrice}</em>￥</td>
                    <td>
                            <%--<button onclick="updateItem('${item[0].productId}')">修改</button>--%>
                        <button onclick="deleteItem('${item[0].productId}')">删除</button>
                    </td>
                </tr>
            </c:forEach>
        </table>
        总金额：<em class="totalPrice"></em>￥
        <hr/>
        <input type="submit" value="确认账单"/>
    </form>
</div>
<script>
    $(document).ready(function(){
        updateTotalPrice();
    });
    function changTotalPrice(productId) {
        var amount = $("#" + productId + "_amount").val();
        var price = $("#" + productId + "_price").text();
        var totalPrice = amount * price;
        $("#" + productId + "_totalPrice").text(totalPrice + "￥");
        updateTotalPrice();
        stockFlush(productId);
        $.post("/updateItem",
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
    //    function updateItem(productId) {
    //        $.post("/updateItem",
    //                {
    //                    productId: productId,
    //                    amount: $("#" + productId + "_amount").val()
    //                },
    //                function (data, status) {
    //                    if (status == "success") {
    //                        if (data == "success") {
    //                            alert("修改成功")
    //                        } else {
    //                            alert("修改失败");
    //                        }
    //                    }
    //                });
    //    }
    function deleteItem(productId) {
        $("#" + productId).remove();
        updateTotalPrice();
        $.post("/deleteItem",
                {
                    productId: productId
                });
    }
    function updateTotalPrice() {
        var price = 0;
        $(".row-totalPrice").each(function () {

            var valString = $(this).text() || 0;

            price += parseInt(valString);

        });
        $(".totalPrice").text(price);
    }
    function checkForm(form){
        if($(".totalPrice").text() == 0){
            alert("您没有选择商品，请返回其它页面选择您想购买的商品");
            return false;
        } else {
            return true;
        }
    }
</script>
<%@include file="WEB-INF/jsp/common/buttom.jsp" %>