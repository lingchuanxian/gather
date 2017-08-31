<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<base href="${pageContext.request.contextPath}/">
<link rel="stylesheet" id="easyuiTheme" type="text/css" href="static/easyui/themes/default/easyui.css">
<link rel="stylesheet" type="text/css" href="static/easyui/themes/icon.css">
<link rel="stylesheet" type="text/css" href="static/css/style.css">
<script type="text/javascript" src="static/easyui/jquery.min.js"></script>
<script type="text/javascript" src="static/js/jquery.cookie.js"></script>
<script type="text/javascript" src="static/easyui/jquery.easyui.min.js"></script>
<script type="text/javascript" src="static/easyui/easyui-lang-zh_CN.js"></script>
<script type="text/javascript" src="static/easyui/validateExtend.js"></script>
<script type="text/javascript" src="static/js/easyui-common.js"></script>
<script type="text/javascript" src="static/js/global.js"></script>
<script type="text/javascript" src="/static/easyui/conboxExtend.js"></script>
<script type="text/javascript" src="/static/js/citiselect.js"></script>
<script type="text/javascript">

    function jsonTimeStamp(milliseconds) {
        if (milliseconds != "" && milliseconds != null
            && milliseconds != "null") {
            var datetime = new Date();
            datetime.setTime(milliseconds);
            var year = datetime.getFullYear();
            var month = datetime.getMonth() + 1 < 10 ? "0"
                + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
            var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
                : datetime.getDate();
            var hour = datetime.getHours() < 10 ? "0" + datetime.getHours()
                : datetime.getHours();
            var minute = datetime.getMinutes() < 10 ? "0"
                + datetime.getMinutes() : datetime.getMinutes();
            var second = datetime.getSeconds() < 10 ? "0"
                + datetime.getSeconds() : datetime.getSeconds();
            return year + "-" + month + "-" + date + " " + hour + ":" + minute
                + ":" + second;
        } else {
            return "";
        }
    }

    function jsonYearMonthDay(milliseconds) {
        var datetime = new Date();
        datetime.setTime(milliseconds);
        var year = datetime.getFullYear();
        var month = datetime.getMonth() + 1 < 10 ? "0"
            + (datetime.getMonth() + 1) : datetime.getMonth() + 1;
        var date = datetime.getDate() < 10 ? "0" + datetime.getDate()
            : datetime.getDate();
        return year + "-" + month + "-" + date;
    }
</script>