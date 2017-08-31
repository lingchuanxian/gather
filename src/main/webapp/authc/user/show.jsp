<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../public/include.inc.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户详情</title>
    <jsp:include page="../include_head.jsp"></jsp:include>
</head>
<body>
<script type="text/javascript">
    $(function () {
//省市区三级联动
        $.citySelect({ $province: $('#province'), $city: $('#city'), $County: $('#county') });
        $('#ff').form('load', { 'province': '广东省', 'city': '深圳市', 'county': '罗湖区' });
    });
</script>
<form id="ff" method="post">
    <table>
        <tbody>
        <tr>
            <td>
                <label for="province">省：</label>
            </td>
            <td>
                <input id="province" name="province" type="text" class="easyui-combobox" />
            </td>
        </tr>
        <tr>
            <td>
                <label for="city">市：</label>
            </td>
            <td>
                <input id="city" name="city" type="text" class="easyui-combobox" />
            </td>
        </tr>
        <tr>
            <td>
                <label for="county">区：</label>
            </td>
            <td>
                <input id="county" name="county" type="text" class="easyui-combobox" />
            </td>
        </tr>
        </tbody>
    </table>
</form>
</body>
</html>