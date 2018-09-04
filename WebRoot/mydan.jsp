<!DOCTYPE html>
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
    <title>新闻资讯</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js">
    </script>
</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>
        <!----------------内容区开始-------------------->
        <div class = "sub_main">
            <div class = "sub_maincon">
                <div class = "sub_mainbox clearfix">
                    <div class = "m_title2">
                        <h3>
                            <font color = "#0a1450">我的订单</font>
                        </h3>
                    </div>
                    <div class = "article_listbox">
                        <ul>
                            <%
                                DBManager dbm = new DBManager();
                                Connection conn = dbm.getConnection();
                                String queryName = request.getParameter("queryName");
                                String sql = "select * from yundan";

                                PreparedStatement pstmt = conn.prepareStatement(sql);
                                ResultSet rs = pstmt.executeQuery();

                                while (rs.next())
                                {
                                    String id = rs.getString("id");
                            %>
                            <li>
                                <span class = "time"><font color = "red"><%=rs.getString("state")%></font>&nbsp;&nbsp;&nbsp;&nbsp;<%=rs.getString("date")%></span><a
                                    href = "yundanq.jsp?dh=<%=rs.getString("danhao")%>"><%=rs.getString("danhao")%>
                            </a>
                            </li>
                            <%
                                }
                                if (rs != null)
                                    rs.close();
                                if (pstmt != null)
                                    pstmt.close();
                                if (conn != null)
                                    conn.close();
                            %>
                        </ul>
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
