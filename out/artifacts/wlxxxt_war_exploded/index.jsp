<%@ page language = "java" import = "java.util.*,java.sql.*,com.biyeseng.db.*"
         pageEncoding = "UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>"/>
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>物流信息管理系统</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js">
    </script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>

        <div class = "main">
            <div class = "main_con">
                <div class = "main_box clearfix">

                    <div class = "main_center">


                        <div class = "m_border">
                            <div class = "m_title2">
                                <h3>
                                    <font color = "#0a1450">新闻资讯</font>
                                </h3>
                            </div>
                            <div class = "m_content">
                                <div class = "article_listbox ">
                                    <ul>
                                        <%
                                            DBManager dbm = new DBManager();
                                            Connection conn = dbm.getConnection();

                                            String sql = "select * from news";

                                            PreparedStatement pstmt = conn.prepareStatement(sql);
                                            ResultSet rs = pstmt.executeQuery();

                                            while (rs.next())
                                            {
                                                String id = rs.getString("id");
                                        %>
                                        <li>
                                            <span class = "time"><%=rs.getString("date") %></span><a
                                                href = "news_detail.jsp?id=<%=id %>"
                                        ><%=rs.getString("title") %>
                                        </a>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>


                        <div class = "m_border">
                            <div class = "m_title2">
                                <h3>
                                    <font color = "#0a1450">网点信息</font>
                                </h3>
                            </div>
                            <div class = "m_content">
                                <div class = "article_listbox ">
                                    <ul>
                                        <%
                                            sql = "select * from ku";

                                            pstmt = conn.prepareStatement(sql);
                                            rs = pstmt.executeQuery();

                                            while (rs.next())
                                            {
                                                String id = rs.getString("id");
                                        %>
                                        <li>
                                            <span class = "time"><%=rs.getString("address") %></span><a
                                                href = "wd_detail.jsp?id=<%=id %>"
                                        ><%=rs.getString("name") %>
                                        </a>
                                        </li>
                                        <%
                                            }
                                        %>
                                    </ul>
                                </div>
                            </div>
                        </div>


                    </div>
                </div>
            </div>
        </div>
        <!----------------内容区结束-------------------->
        <!---------------页脚开始---------------->
        <jsp:include flush = "true" page = "/inc/foot.jsp"></jsp:include>
        <!---------------页脚结束---------------->
    </div>
</div>
</body>
</html>
