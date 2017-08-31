<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ include file="../../public/include.inc.jsp"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>用户列表</title>
    <jsp:include page="../include_head.jsp"></jsp:include>
    <script type="text/javascript">
        $(function () {
            $('#roleList').datagrid({
                url: '/admin/oauser/list.shtml',   //指向后台的Action来获取当前菜单的信息的Json格式的数据
                title: '用户列表',
                iconCls: 'icon-application_view_list',
                height:$(this).height()-16,
                width: function () { return document.body.clientWidth * 0.9 },
                nowrap: true,
                autoRowHeight: false,
                striped: true,
                collapsible: false,
                pagination: true,
                pageSize: 20,
                pageList: [10,20,50,80,100],
                rownumbers: true,
                sortName: 'usId',    //根据某个字段给easyUI排序
                sortOrder: 'desc',
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
                    { field: 'role', title: '角色', width: 100, align: 'center', sortable: false ,
                        formatter:
                            function(value, row, index) {
                                if(value == "ADMIN"){
                                    return "管理员";
                                }else{
                                    return "普通用户";
                                }
                            }},
                    { field: 'usName', title: '姓名', width: 100, align: 'center', sortable: false },
                    { field: 'usSex', title: '性别', width: 80, align: 'center', sortable: false ,
                        formatter:
                            function(value, row, index) {
                                if(value == 0){
                                    return "男";
                                }else if(value == 1){
                                    return "女";
                                }else{
                                    return "保密";
                                }
                            }
                    },
                    { field: 'usPhone', title: '联系方式', width: 150, align: 'center', sortable: false },
                    { field: 'usMail', title: '邮箱', width: 150, align: 'center', sortable: false },
                    { field: 'usAddress', title: '联系地址', width: 150, align: 'center', sortable: false },
                    { field: 'usLastlogindate', title: '用户上一次登录时间', width: 150, align: 'center', sortable: true ,
                        formatter:function (value, row, index) {
                            return jsonTimeStamp(value);
                        }
                    },
                    { field: 'usRegistdate', title: '用户添加时间', width: 150, align: 'center', sortable: true ,
                        formatter:function (value, row, index) {
                            return jsonTimeStamp(value);
                        }
                    }
                ]],
                toolbar:"#tb",
                onDblClickRow: function (rowIndex, rowData) {
                    $('#grid').datagrid('uncheckAll');
                    $('#grid').datagrid('checkRow', rowIndex);
                }
            })

            var pg = $("#roleList").datagrid("getPager");
            $(pg).pagination({
                onSelectPage:function(pageNumber,pageSize){
                    $('#roleList').datagrid('reload', {
                        pageNo:pageNumber,
                        limit:pageSize
                    });
                }
            });

        });

        //删除用户数据
        function doDelete() {
            var selectRows = $('#roleList').datagrid("getSelections");
            if (selectRows.length < 1) {
                $.messager.alert("提示消息", "请选择要删除的数据!");
                return;
            }
            //提醒用户是否是真的删除数据
            $.messager.confirm("确认消息", "您确定要删除信息吗？", function (r) {
                if (r) {
                    var strIds = "";
                    for (var i = 0; i < selectRows.length; i++) {
                        strIds += selectRows[i].usId + ",";
                    }
                    strIds = strIds.substr(0, strIds.length - 1);
                    $.ajax({
                        url: "/admin/oauser/delete.shtml",
                        type: "post",
                        dataType: "json",
                        data:{ids: strIds},
                        success: function (data) {
                            var json = eval(data);
                            console.log(json);
                            if(json.code == 200){
                                $('#roleList').datagrid("reload");
                                $('#roleList').datagrid("clearSelections");
                            }else{
                                $.messager.alert("删除提示", json.message);
                            }
                        }
                    });
                }
            });
        }

        function doShow() {
            var selectRows = $('#roleList').datagrid("getSelections");
            if (selectRows.length < 1) {
                $.messager.alert("提示消息", "请选择要查看的数据!");
                return;
            }

        }

        function doAdd() {
            $("#addUser").dialog("open");
            $.citySelect({ $province: $('#province'), $city: $('#city'), $County: $('#county') });
            $('#adduser_form').form('load', { 'province': '广东省', 'city': '深圳市', 'county': '罗湖区' });
        }

    </script>
</head>
<body>
<table id="roleList">
</table>
<div id="tb" style="padding:5px">
    <div style="margin-bottom:5px">
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-page_find" plain="true" onclick="doShow()">查看</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-page_add" plain="true" onclick="doAdd()">添加</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-page_edit" plain="true">修改</a>
        <a href="javascript:void(0);" class="easyui-linkbutton" iconCls="icon-page_delete" plain="true" onclick="doDelete()">删除</a>
    </div>
    <div>
        搜索条件：
        <select id="order" class="easyui-combobox" panelHeight="auto" editable="false">
            <option value="asc">登录名</option>
            <option value="desc">姓名</option>
            <option value="desc">联系地址</option>
        </select>
        <input type="text" class="easyui-textbox" name="Eq" style="width:150px"/>
        <a href="#" class="easyui-linkbutton" iconCls="icon-zoom">查询</a>
    </div>
</div>
<div id="addUser" class="easyui-dialog" style="padding:5px;width:600px;height:500px;align-content: center;" closed="true"
     title="添加用户" iconCls="icon-page_add" buttons="#add-buttons">
    <form id="adduser_form" method="post">
        <table id="mytable" bordercolordark="#FFFFFF" bordercolorlight="#45b97c" border="1px" cellpadding="0" cellspacing="0">
            <tr>
                <th class="panel-header">登&nbsp;录&nbsp;名:</th>
                <td><input class="easyui-validatebox textbox" type="text" name="name" data-options="required:true,validType:'isExist'" ></input></td>
                <th class="panel-header">角&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;色:</th>
                <td>
                    <select class="easyui-combobox" name="language" panelHeight="auto" editable="false">
                        <option value="0">管理员</option>
                        <option value="1">普通用户</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th class="panel-header">密&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;码:</th>
                <td><input class="easyui-validatebox textbox" type="password" id="fpwd" name="email" data-options="required:true,validType:'length[6,20]'"></input></td>
                <th class="panel-header">重复密码:</th>
                <td><input class="easyui-validatebox textbox" type="password" name="subject" data-options="required:true" validType="equals['#fpwd']"></input></td>
            </tr>
            <tr>
                <th class="panel-header">姓&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;名:</th>
                <td><input class="easyui-validatebox textbox" type="text" name="message" data-options="required:true"></input></td>
                <th class="panel-header">性&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;别:</th>
                <td>
                    <select class="easyui-combobox" name="language" panelHeight="auto" editable="false">
                        <option value="0">男</option>
                        <option value="1">女</option>
                        <option value="2">保密</option>
                    </select>
                </td>
            </tr>
            <tr>
                <th class="panel-header">联系方式:</th>
                <td><input class="easyui-validatebox textbox" type="text" name="name" data-options="required:true,validType:'phoneAndMobile'"></input></td>
                <th class="panel-header">邮&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;箱:</th>
                <td><input class="easyui-validatebox textbox" type="text" name="name" data-options="required:true,validType:'email'"></input></td>
            </tr>
            <tr>
                <th class="panel-header">联系地址:</th>
                <td  colspan="3">
                    <input id="province" name="province" type="text" class="easyui-combobox" />
                    <input id="city" name="city" type="text" class="easyui-combobox" />
                    <input id="county" name="county" type="text" class="easyui-combobox" />
                </td>
            </tr>
        </table>
    </form>
</div>
<div id="add-buttons">
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="javascript:alert('Ok')">提交</a>
    <a href="javascript:void(0);" class="easyui-linkbutton" onclick="javascript:$('#addUser').dialog('close')">取消</a>
</div>
</body>
</html>