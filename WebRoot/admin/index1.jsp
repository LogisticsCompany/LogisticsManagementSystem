<%--
  Created by IntelliJ IDEA.
  User: dell-pc
  Date: 2018/9/4
  Time: 17:01
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType = "text/html;charset=UTF-8" language = "java" %>
<%
    String path = request.getContextPath();
%>
<html>
<head>
    <title>Title</title>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/admin-all.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/base.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/bootstrap.min.css"/>
    <link rel = "stylesheet" type = "text/css" href = "<%=path %>/Styles/ui-lightness/jquery-ui-1.8.22.custom.css"/>
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-1.7.2.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type = "text/javascript" src = "<%=path %>/Scripts/index.js"></script>

    <script src = "<%=path %>/bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
    <link href = "<%=path %>/bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
    <script src = "<%=path %>/bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
    <link href = "<%=path %>/css/bootstrap_extend.css" rel = "stylesheet">

    <script>
        var changeTitle = function (arg) {
            document.getElementById('frame_title').innerHTML = arg.text;
        }
    </script>
</head>
<body>
<div class = "warp">
    <!--头部开始-->
    <div class = "top_c">
        <div class = "top-menu">
        </div>
        <div class = "top-nav">欢迎您:${admin}&nbsp;&nbsp;<a href = "<%=path %>/admin/loginout.jsp">安全退出</a></div>
    </div>
    <!--头部结束-->

    <div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-primary dropdown-toggle " data-toggle = "dropdown">
                仓库管理
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/ku/list.jsp" target = "Conframe" onclick = "changeTitle(this)">网点管理</a>
                </li>
                <li role = "presentation">
                    <a href = "<%=path %>/admin/ruku/list.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">货物入库</a>
                </li>
                <li role = "presentation">
                    <a href = "<%=path %>/admin/chuku/list.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">货物出库</a>
                </li>
            </ul>
        </div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-success dropdown-toggle " data-toggle = "dropdown">
                员工维护
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/admin/list.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">员工维护</a>
                </li>
            </ul>
        </div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-info dropdown-toggle " data-toggle = "dropdown">
                会员管理
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/user/list.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">会员信息维护</a>
                </li>
            </ul>
        </div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-warning dropdown-toggle " data-toggle = "dropdown">
                车辆管理
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/car/list.jsp" target = "Conframe" onclick = "changeTitle(this)">车辆管理</a>
                </li>
            </ul>
        </div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-warning dropdown-toggle " data-toggle = "dropdown">
                运单管理
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/yundan/list.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">运单管理</a>
                </li>
            </ul>
        </div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-info dropdown-toggle " data-toggle = "dropdown">
                用户签收
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/qian/list.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">用户签收</a>
                </li>
            </ul>
        </div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-success dropdown-toggle " data-toggle = "dropdown">
                新闻资讯管理
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/news/list.jsp" target = "Conframe"
                       onclick = "changeTitle(this)">新闻资讯管理</a>
                </li>
            </ul>
        </div>
        <div class = "btn-group">
            <button type = "button" class = "btn btn-primary dropdown-toggle " data-toggle = "dropdown">
                留言管理
                <span class = "caret"></span>
            </button>

            <ul class = "dropdown-menu" role = "menu">
                <li>
                    <a href = "<%=path %>/admin/msg/list.jsp" target = "Conframe" onclick = "changeTitle(this)">留言管理</a>
                </li>
            </ul>
        </div>
    </div>

    <div class = "panel panel-info">
        <div class = "panel-heading" id = "frame_title">基本信息</div>
        <div class = "panel-body">
            <iframe name = "Conframe" id = "Conframe" src = "<%=path %>/admin/sysPro.jsp"
                    style = "height: 410px"></iframe>
        </div>
    </div>

    <!--底部开始-->
    <div class = "bottom_c">联系我们：
        <a href = "https://github.com/LogisticsCompany/LogisticsManagementSystem" target = "_blank"
           style = "color: white">LogisticsCompany</a></div>
    <!--底部结束-->
</div>
</body>
</html>
