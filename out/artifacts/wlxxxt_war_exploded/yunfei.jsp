<%@ page language = "java" import = "java.util.*" pageEncoding = "UTF-8" %>
<%
    String path = request.getContextPath();
    String basePath = request.getScheme() + "://"
            + request.getServerName() + ":" + request.getServerPort()
            + path + "/";
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns = "http://www.w3.org/1999/xhtml">
<head>
    <base href = "<%=basePath%>">
    <meta http-equiv = "Content-Type" content = "text/html; charset=utf-8"/>
    <title>运费查询</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js">
    </script>

    <STYLE type = "text/css">
        p {
            line-height: 18px;
        }

        .yd_div_1 {
            clear: both;
            float: none;
            margin: 15px;
        }

        .list {
            margin: 10px auto 0;
            overflow: hidden;
            padding-bottom: 10px;
            background-color: #D7F1FE;
        }

        .blue {

            overflow: hidden;
        }

        .white {

            height: 8px;
        }
    </STYLE>

</head>

<body>

<div class = "page">
    <div class = "page_con">
        <jsp:include flush = "true" page = "/inc/top.jsp"></jsp:include>
        <!----------------内容区开始-------------------->
        <div class = "sub_main">
            <div class = "sub_maincon">
                <div class = "sub_mainbox clearfix">


                    <div class = "m_border">
                        <div class = "m_title2">
                            <h3>
                                <font color = "#0a1450">运费查询</font>
                            </h3>
                        </div>
                        <div class = "m_content message_con">


                            <DIV>
                                <!--主要内容开始-->

                                <FORM name = "frm" action = "" method = "post">
                                    <DIV class = "list">


                                        <DIV class = "white"></DIV>
                                        <DIV class = "bule">
                                            <SPAN class = "width"><FONT size = "2">始 发 地</FONT>：</SPAN>
                                            <SPAN class = "text"><SELECT name = "sfd" id = "sfd">
															<OPTION selected = "selected" value = "0">
																--请选择--
															</OPTION>
															<OPTION value = "1">
																上海
															</OPTION>
															<OPTION value = "2">
																浙江
															</OPTION>
															<OPTION value = "3">
																江苏
															</OPTION>
															<OPTION value = "4">
																安徽
															</OPTION>
															<OPTION value = "5">
																广东
															</OPTION>
															<OPTION value = "6">
																广西
															</OPTION>
															<OPTION value = "7">
																福建
															</OPTION>
															<OPTION value = "8">
																海南
															</OPTION>
															<OPTION value = "9">
																江西
															</OPTION>
															<OPTION value = "10">
																湖北
															</OPTION>
															<OPTION value = "11">
																湖南
															</OPTION>
															<OPTION value = "12">
																河南
															</OPTION>
															<OPTION value = "13">
																北京
															</OPTION>
															<OPTION value = "14">
																天津
															</OPTION>
															<OPTION value = "15">
																河北
															</OPTION>
															<OPTION value = "16">
																黑龙江
															</OPTION>
															<OPTION value = "17">
																吉林
															</OPTION>
															<OPTION value = "18">
																辽宁
															</OPTION>
															<OPTION value = "19">
																山东
															</OPTION>
															<OPTION value = "20">
																山西
															</OPTION>
															<OPTION value = "21">
																四川
															</OPTION>
															<OPTION value = "22">
																重庆
															</OPTION>
															<OPTION value = "23">
																云南
															</OPTION>
															<OPTION value = "24">
																贵州
															</OPTION>
															<OPTION value = "25">
																陕西
															</OPTION>
															<OPTION value = "26">
																甘肃
															</OPTION>
															<OPTION value = "27">
																宁夏
															</OPTION>
															<OPTION value = "28">
																青海
															</OPTION>
															<OPTION value = "29">
																内蒙古
															</OPTION>
															<OPTION value = "30">
																新疆
															</OPTION>
															<OPTION value = "31">
																西藏
															</OPTION>
														</SELECT> </SPAN>
                                        </DIV>
                                        <DIV class = "white"></DIV>
                                        <DIV class = "bule">
                                            <SPAN class = "width"><FONT size = "2">目 的 地</FONT>：</SPAN>
                                            <SPAN class = "text"><SELECT name = "mdd" id = "mdd">
															<OPTION selected = "selected" value = "0">
																--请选择--
															</OPTION>
															<OPTION value = "1">
																上海
															</OPTION>
															<OPTION value = "2">
																浙江
															</OPTION>
															<OPTION value = "3">
																江苏
															</OPTION>
															<OPTION value = "4">
																安徽
															</OPTION>
															<OPTION value = "5">
																广东
															</OPTION>
															<OPTION value = "6">
																广西
															</OPTION>
															<OPTION value = "7">
																福建
															</OPTION>
															<OPTION value = "8">
																海南
															</OPTION>
															<OPTION value = "9">
																江西
															</OPTION>
															<OPTION value = "10">
																湖北
															</OPTION>
															<OPTION value = "11">
																湖南
															</OPTION>
															<OPTION value = "12">
																河南
															</OPTION>
															<OPTION value = "13">
																北京
															</OPTION>
															<OPTION value = "14">
																天津
															</OPTION>
															<OPTION value = "15">
																河北
															</OPTION>
															<OPTION value = "16">
																黑龙江
															</OPTION>
															<OPTION value = "17">
																吉林
															</OPTION>
															<OPTION value = "18">
																辽宁
															</OPTION>
															<OPTION value = "19">
																山东
															</OPTION>
															<OPTION value = "20">
																山西
															</OPTION>
															<OPTION value = "21">
																四川
															</OPTION>
															<OPTION value = "22">
																重庆
															</OPTION>
															<OPTION value = "23">
																云南
															</OPTION>
															<OPTION value = "24">
																贵州
															</OPTION>
															<OPTION value = "25">
																陕西
															</OPTION>
															<OPTION value = "26">
																甘肃
															</OPTION>
															<OPTION value = "27">
																宁夏
															</OPTION>
															<OPTION value = "28">
																青海
															</OPTION>
															<OPTION value = "29">
																内蒙古
															</OPTION>
															<OPTION value = "30">
																新疆
															</OPTION>
															<OPTION value = "31">
																西藏
															</OPTION>
														</SELECT> </SPAN>
                                        </DIV>
                                        <DIV class = "white"></DIV>
                                        <DIV class = "bule">
                                            <SPAN class = "width"><FONT size = "2">快件重量</FONT>：</SPAN>
                                            <SPAN class = "text"><LABEL>
															<INPUT name = "zl" id = "zl" type = "text">
														</LABEL>(kg) </SPAN>
                                        </DIV>
                                        <DIV class = "white"></DIV>
                                        <DIV class = "bule">
                                            <SPAN class = "width"><FONT size = "2">运费金额</FONT>：</SPAN>
                                            <SPAN class = "text"><LABEL id = "fy"
                                                                        style = "color: red; font-size: 16px; font-weight: 800;"></LABEL>
													</SPAN>
                                        </DIV>
                                        <DIV class = "white"></DIV>
                                        <DIV align = "center" class = "bule">
                                            <INPUT onclick = "check()" type = "button" value = "查 询">
                                        </DIV>
                                        <DIV class = "white"></DIV>
                                    </DIV>
                                </FORM>
                                <!--主要内容结束-->
                            </DIV>


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
