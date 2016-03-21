<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@include file="WEB-INF/jsp/common/top.jsp"%>
    <div id="body_main">
        <form action="" method="post">
            <table cellpadding="5">
                <tr>
                    <td>
                        编号：<input type="text" name="name" disabled="disabled"/>
                    </td>
                    <td>
                        收货人：<input type="text" name="consignee"/>
                    </td>
                </tr>
                <tr>
                    <td>
                        地址：<input type="text" name="address"/>
                    </td>
                    <td>
                        电话号码：<input type="text" name="phone">
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
                <tr>
                    <td></td>
                    <td></td>
                    <td></td>
                    <td><input type="number" name=""></td>
                    <td></td>
                    <td></td>
                </tr>
            </table>
            总金额：<input type="number" name="totalPrice" disabled="disabled" />
            <hr />
            <input type="submit" value="确认账单" />
        </form>
    </div>
<%@include file="WEB-INF/jsp/common/buttom.jsp"%>