<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
String path = request.getContextPath();
%>

<!DOCTYPE html>
<html>
<head>
    <title>物流信息管理系统</title>
    <link rel="stylesheet" type="text/css" href="<%=path %>/Styles/admin-all.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/Styles/base.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/Styles/bootstrap.min.css" />
    <link rel="stylesheet" type="text/css" href="<%=path %>/Styles/ui-lightness/jquery-ui-1.8.22.custom.css" />
    <script type="text/javascript" src="<%=path %>/Scripts/jquery-1.7.2.js"></script>
    <script type="text/javascript" src="<%=path %>/Scripts/jquery-ui-1.8.22.custom.min.js"></script>
    <script type="text/javascript" src="<%=path %>/Scripts/index.js"></script>
</head>
<body>
    <div class="warp">
        <!--头部开始-->
        <div class="top_c">
            <div class="top-menu">
              
            </div>
            <div class="top-nav">欢迎您:${admin}&nbsp;&nbsp;<a href="<%=path %>/admin/loginout.jsp">安全退出</a></div>
        </div>
        <!--头部结束-->
        <!--左边菜单开始-->
        <div class="left_c left">
            <h1>系统操作菜单</h1>
            <div class="acc">
                <div>
                    <a class="one">仓储管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/ku/list.jsp">网点管理</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/ruku/list.jsp">货物入库</a></li>
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/chuku/list.jsp">货物出库</a></li>
                    </ul>
                </div>
                <div>
                    <a class="one">员工维护</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/admin/list.jsp">员工维护</a></li>

                    </ul>
                </div>
                <div>
                    <a class="one">会员管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/user/list.jsp">会员信息维护</a></li>
                        
                    </ul>
                </div>
                <div>
                    <a class="one">车辆管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/car/list.jsp">车辆管理</a></li>
                    </ul>
                </div>
                <div>
                    <a class="one">运单管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/yundan/list.jsp">运单管理</a></li>
 
                    </ul>
                </div>
                 <div>
                    <a class="one">用户签收</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/qian/list.jsp">用户签收</a></li>
                       
                    </ul>
                </div>
                 <div>
                    <a class="one">新闻资讯管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/news/list.jsp">新闻资讯管理</a></li>
 
                    </ul>
                </div>
                <div>
                    <a class="one">留言管理</a>
                    <ul class="kid">
                        <li><b class="tip"></b><a target="Conframe" href="<%=path %>/admin/msg/list.jsp">留言管理</a></li>
 
                    </ul>
                </div>
               
            </div>

        </div>
        <!--左边菜单结束-->
        <!--右边框架开始-->
        <div class="right_c">
            <div class="nav-tip" onclick="javascript:void(0)">&nbsp;</div>

        </div>
        <div class="Conframe" >
            <iframe name="Conframe" id="Conframe" src="<%=path %>/admin/sysPro.jsp"></iframe>
        </div>
        <!--右边框架结束-->

        <!--底部开始-->
        <div class="bottom_c">联系我们：
		<a href="http://www.biyeseng.cn" target="_blank" style="color: white">毕业就找毕业僧(biyeseng.cn)</a></div>
        <!--底部结束-->
    </div>
</body>
</html>
