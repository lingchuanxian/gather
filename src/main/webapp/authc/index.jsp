<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="shiro" uri="http://shiro.apache.org/tags" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>数字办公系统</title>
    <jsp:include page="include_head.jsp"></jsp:include>
</head>
<body class="easyui-layout" data-options="fit:true,scroll:'no'">
<div data-options="region:'north',border:false" style="height: 74px; background: #2596ea;">
    <div class="header-left">
        <img src="static/img/logo.png" />
    </div>
    <div class="header-right">
        <ul class="head-menu">
            <li>
                <shiro:user>
                    欢迎您，<shiro:principal/>
                </shiro:user>
            </li>
            <li>|</li>
            <li>
                角色：
                <shiro:hasRole name="ADMIN">
                    管理员
                </shiro:hasRole>
                <shiro:hasRole name="USER">
                    普通用户
                </shiro:hasRole>
            </li>
            <li>|</li>
            <li><a href="javascript:void(0);" onclick="$('#cpw_dlg').dialog('open')">修改密码</a></li>
            <li>|</li>
            <li><a href="javascript:void(0);" id="exit-system">退出</a></li>
            <li>|</li>
        </ul>
    </div>

    <div id="cpw_dlg" class="easyui-dialog" title="修改密码" closed="true"
         data-options="
				iconCls: 'icon-application_view_detail',
				buttons: '#cpw_dlg_buttons',
				resizable : true
			">
        The dialog content.
    </div>
    <div id="cpw_dlg_buttons">
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:alert('save')">确定</a>
        <a href="javascript:void(0)" class="easyui-linkbutton" onclick="javascript:$('#cpw_dlg').dialog('close')">取消</a>
    </div>

</div>
<div data-options="region:'west',split:true,title:'导航菜单'" style="width: 200px;">
    <div class="easyui-accordion" data-options="fit:true,border:false">
        <div title="用户管理系统" data-options="selected:true,iconCls:'icon-package_go'">
            <div style="margin: 5px">
                <ul class="tree easyui-tree" data-options="animate:true,lines:true">
                    <li data-options="iconCls:'icon-application_view_columns'">
                        <a href="javascript:void(0);" src="/authc/user/list.jsp" class="nav-tab">用户管理</a>
                    </li>
                    <li data-options="iconCls:'icon-application_view_columns'">
                        <a href="javascript:void(0);" src="demo/easyloader.html" class="nav-tab">角色管理</a>
                    </li>
                </ul>
            </div>
        </div>
        <shiro:hasRole name="ADMIN">
        <div title="系统管理" data-options="iconCls:'icon-package_go'">
            <div style="margin: 5px">
                <ul class="tree easyui-tree" data-options="animate:true,lines:true">
                    <li data-options="iconCls:'icon-application_view_columns'">
                        <a href="javascript:void(0);" src="demo/easyloader.html" class="nav-tab">APP版本管理</a>
                    </li>
                    <li data-options="iconCls:'icon-application_view_columns'">
                        <a href="javascript:void(0);" src="WEB-INF/page/auth/actionlog/list.jsp" class="nav-tab">系统操作日志</a>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    </shiro:hasRole>
</div>
<div data-options="region:'south',border:false" style="height: 23px;">
    <div class="footer">@Copyright 2017 ling_cx</div>
</div>
<div data-options="region:'center'">
    <div id="tabs" class="easyui-tabs" data-options="tools:'#tab-tools',fit:true,border:false" >
        <div title="主页" data-options="iconCls:'icon-house',closable:false" style="padding:10px"></div>
    </div>
</div>
</div>
<div id="mm" class="easyui-menu" style="width: 150px;">
    <div id="refresh" data-options="iconCls:'icon-arrow_refresh'">刷新</div>
    <div class="menu-sep"></div>
    <div id="close">关闭</div>
    <div id="closeall">全部关闭</div>
    <div id="closeother">除此之外全部关闭</div>
    <div class="menu-sep"></div>
    <div id="closeright">当前页右侧全部关闭</div>
    <div id="closeleft">当前页左侧全部关闭</div>
    <div class="menu-sep"></div>
</div>
</body>
</html>