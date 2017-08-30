<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../public/include.inc.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Basic DataGrid - jQuery EasyUI Demo</title>
    <jsp:include page="../include_head.jsp"></jsp:include>
    <script type="text/javascript">
        $(function () {
            $('#roleList').datagrid({
                url: '/admin/oauser/list.shtml',   //指向后台的Action来获取当前菜单的信息的Json格式的数据
                title: '用户列表',
                iconCls: 'icon-application_view_list',
                height:500,
                width: function () { return document.body.clientWidth * 0.9 },
                nowrap: true,
                autoRowHeight: false,
                striped: true,
                collapsible: false,
                pagination: true,
                pageSize: 20,
                pageList: [20,50,80,100],
                rownumbers: true,
                sortName: 'usId',    //根据某个字段给easyUI排序
                sortOrder: 'asc',
                fitColumns:true,
                singleSelect:true,
                remoteSort: false,
                idField: 'usId',
                onLoadSuccess:function(data){
                    console.log("onLoadSuccess:"+data);
                },
                queryParams: {
                    pageNo : 1,
                    limit :20
                },  //异步查询的参数
                columns: [[
                    { field: 'usId', title: 'ID',  width: 80, align: 'center', sortable: true },
                    { field: 'usLoginname', title: '登录名', width: 120, align: 'center', sortable: false },
                    { field: 'role', title: '角色', width: 100, align: 'center', sortable: false },
                    { field: 'usName', title: '姓名', width: 100, align: 'center', sortable: false },
                    { field: 'usSex', title: '性别', width: 80, align: 'center', sortable: false },
                    { field: 'usPhone', title: '联系方式', width: 150, align: 'center', sortable: false },
                    { field: 'usMail', title: '邮箱', width: 150, align: 'center', sortable: false },
                    { field: 'usAddress', title: '联系地址', width: 150, align: 'center', sortable: false },
                    { field: 'usLastlogindate', title: '用户上一次登录时间', width: 150, align: 'center', sortable: true },
                    { field: 'usRegistdate', title: '用户添加时间', width: 150, align: 'center', sortable: true }
                ]],
                toolbar: [{
                    id: 'btnAdd',
                    text: '添加',
                    iconCls: 'icon-page_add',
                    handler: function () {
                    }
                }, '-', {
                    id: 'btnEdit',
                    text: '修改',
                    iconCls: 'icon-page_edit',
                    handler: function () {
                    }
                }, '-', {
                    id: 'btnDelete',
                    text: '删除',
                    iconCls: 'icon-page_delete',
                    handler: function () {
                    }
                }, '-', {
                    id: 'btnView',
                    text: '查看',
                    iconCls: 'icon-page_find',
                    handler: function () {
                    }
                }],
                onDblClickRow: function (rowIndex, rowData) {
                    $('#grid').datagrid('uncheckAll');
                    $('#grid').datagrid('checkRow', rowIndex);
                }
            })
        });

        $.ajax({
            url: "/admin/oauser/list.shtml",
            type: "post",
            dataType: "json",
            success: function (data) {
                var json = eval(data);
                console.log(json);
                $("#dg").datagrid("loadData", json.rows);  //动态取数据
            }
        });
    </script>
</head>
<body>
<table id="roleList">
</table>
<div id="processWindow" class="easyui-window" closed="true" modal="true" title="提示消息"
     style="width: 300px; height: 60px;">
    <div id="windowContent" class="general-font">
        <img src="/static/easyui/themes/default/images/loading.gif" />
        操作进行中，请稍后...
    </div>
</div>
<input type="text" id="txtSearch" title="请输入角色名称" style="display: none;" />
</body>
</html>