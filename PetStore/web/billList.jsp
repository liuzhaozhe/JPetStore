<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp" %>
<div id="body_main">
    <table class="orderItem" align="center">
        <tr>
            <th width="10%">编号</th>
            <th width="10%">收货人</th>
            <th width="20%">地址</th>
            <th width="10%">电话号码</th>
            <th width="10%">总价格</th>
            <th width="15%">创建时间</th>
            <th width="5%">操作</th>
        </tr>
        <c:forEach items="${sessionScope.billList}" var="bill">
            <tr>
                <td>${bill.billId}</td>
                <td>${bill.consignee}</td>
                <td>${bill.consigneeAddress}</td>
                <td>${bill.consigneePhone}</td>
                <td>${bill.money}￥</td>
                <td>${bill.createTime}</td>
                <td>
                    <button onclick="gotoDetail('${bill.billId}')">查看详情</button>
                </td>
            </tr>
        </c:forEach>
    </table>
</div>
<script type="text/javascript">
    function gotoDetail(billId) {
        window.location.href = "/getBillDetail?billId=" + billId;
    }
</script>
<%@include file="WEB-INF/jsp/common/buttom.jsp" %>