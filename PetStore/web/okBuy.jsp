<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp" %>
<div id="body_main">
    <c:if test="${requestScope.msg != null}">
        <span>${requestScope.msg}</span>
    </c:if>
    <table cellpadding="5">
        <tr>
            <td>
                编号：${sessionScope.bill.billId}
            </td>
            <td>
                收货人：${sessionScope.bill.consignee}
            </td>
        </tr>
        <tr>
            <td>
                地址：${sessionScope.bill.consigneeAddress}
            </td>
            <td>
                电话号码：${sessionScope.bill.consigneePhone}
            </td>
        </tr>
    </table>
    <table class="orderItem" align="center">
        <tr>
            <th width="10%">商品编号</th>
            <th width="20%">商品名称</th>
            <th width="10%">商品价格</th>
            <th width="10%">数量</th>
            <th width="10%">总价格</th>
        </tr>
        <c:forEach items="${sessionScope.billItemList}" var="billItem">
            <tr>
                <td>${billItem.productId}</td>
                <td>${billItem.productName}</td>
                <td>${billItem.price}￥</td>
                <td>${billItem.amount}</td>
                <td>${billItem.totalPrice}￥</td>
            </tr>
        </c:forEach>
    </table>
    总金额：${sessionScope.bill.money}￥&nbsp;创建时间：${sessionScope.bill.createTime}
    <hr />
    <button id="confirm">购买</button>
</div>
<script type="text/javascript">
    $(document).ready(function(){
        $("#confirm").click(function(){
            location.href = "/confirmBuy";
        });
    });
</script>
<%@include file="WEB-INF/jsp/common/buttom.jsp" %>