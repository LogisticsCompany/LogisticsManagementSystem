<!DOCTYPE html>
<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>

<script src = "bootstrap/js/jquery/2.0.0/jquery.min.js"></script>
<link href = "bootstrap/css/bootstrap/3.3.6/bootstrap.min.css" rel = "stylesheet">
<script src = "bootstrap/js/bootstrap/3.3.6/bootstrap.min.js"></script>
<link href = "css/bootstrap_extend.css" rel = "stylesheet">

<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
    Object user = session.getAttribute("user");
%>
<div id = "top">
    <!----------------页面头部开始-------------------->
    <div class = "banner">
        <img src = "images/top.jpg"/>
    </div>
    <!----------------页面头部结束-------------------->
    <!----------------主导航菜单开始-------------------->
    <div align = "center">
        <ul class = "nav nav-tabs">
            <li role = "presentation">
                <a href = "index.jsp"><span>首页</span> </a>
            </li>
            <li role = "presentation">
                <a href = "news.jsp"><span>新闻资讯</span> </a>
            </li>
            <li role = "presentation">
                <a href = "wd.jsp"><span>网点信息</span> </a>
            </li>
            <li role = "presentation">
                <a href = "yundan.jsp"><span>运单查询</span> </a>
            </li>
            <li role = "presentation">
                <a href = "yunfei.jsp"><span>运费查询</span> </a>
            </li>
            <li role = "presentation">
                <a href = "message.jsp"><span>留言板</span> </a>
            </li>
            <%
                if (user != null)
                {
            %>
            <li role = "presentation">
                <a href = "newdan.jsp"><span>在线下单</span> </a>
            </li>
            <li role = "presentation">
                <a href = "mydan.jsp"><span>我的订单</span> </a>
            </li>
            <%
                }
            %>
        </ul>
    </div>
    <!----------------主导航菜单结束-------------------->
</div>
<!----------------内容区开始-------------------->
<div align = "right">
    <%
        if (user == null)
        {
    %>
    <form id = "form1" name = "form1" method = "post" action = "UserLogAction">
		<span>账号： <input type = "text" name = "name" id = "name"
                         class = "form-control form-control-inline" style = "width: 150px"/> </span>
        <span>密码： <input type = "password" name = "pwd"
                         id = "pwd" class = "form-control form-control-inline" style = "width: 150px"/> </span>
        <span> <input type = "submit" name = "button" id = "button"
                      value = "登录" class = "btn btn-success" style = "height: auto"/> </span>
        <span>  <input type = "button" name = "button" id = "button"
                       value = "注册" class = "btn btn-primary" style = "height: auto"
                       onclick = "window.location.href='registered.jsp'"/></span>
        <span>  <input type = "button" name = "button" id = "button"
                       value = "后台" class = "btn btn-danger" style = "height: auto"
                       onclick = "javascript:window.open('login.jsp','_blank')"/></span>
    </form>
    <%
    }
    else
    { %>
    <span>欢迎你：<%=user %></span>

    <span><a href = "logout.jsp" class = "zc">注销</a> </span>
    <%
        }
    %>
</div>