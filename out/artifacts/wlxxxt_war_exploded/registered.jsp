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
    <title>用户注册</title>
    <link href = "css/style.css" rel = "stylesheet" type = "text/css"/>
    <script type = "text/javascript" src = "js/tab.js">
    </script>

    <script type = "text/javascript">
        function check() {

            if (document.getElementById("pwds").value.length < 6
                || document.getElementById("pwds").value.length > 12) {
                alert("密码必须是6到12位！");
                return false;
            }
            var age = document.all.age.value;

            if (isNaN(age) || age <= 0) {
                alert("年龄必须是正数！");
                return false;
            }

            var tels = document.getElementById("tel").value;

            if (isNaN(tels) || tels.length != 11) {
                alert("请输入正确手机号码！");
                return false;
            }

            var em = document.getElementById("email").value;

            var szReg = /^([a-zA-Z0-9_\.\-])+\@(([a-zA-Z0-9\-])+\.)+([a-zA-Z0-9]{2,4})+$/;
            var bChk = szReg.test(em);
            if (bChk == false) {
                alert("邮箱格式不正确！");
                return false;
            }

            return true;

        }
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


                    <div class = "m_border">
                        <div class = "m_title2">
                            <h3>
                                <font color = "#0a1450">注册</font>
                            </h3>
                        </div>
                        <div class = "m_content message_con">
                            <form id = "form1" name = "form1" method = "post"
                                  action = "UserRegAction" onSubmit = "return check()">

                                <table width = "100%" border = "0" cellspacing = "0" cellpadding = "0">
                                    <tr>
                                        <td class = "left_name">
                                            账号：
                                        </td>
                                        <td>
                                            <input type = "text" name = "name" id = "name"
                                                   class = "text_input text150"/>
                                            <span class = "red">*</span>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>
                                    <tr>
                                        <td class = "left_name">
                                            密码：
                                        </td>
                                        <td>
                                            <input type = "password" name = "pwd" id = "pwds"
                                                   class = "text_input text150"/>
                                            <span class = "red">*</span>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class = "left_name">
                                            姓名：
                                        </td>
                                        <td>
                                            <input type = "text" name = "rname" id = "rname"
                                                   class = "text_input text150"/>
                                            <span class = "red">*</span>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td class = "left_name">
                                            性别：
                                        </td>
                                        <td>
													<span><input type = "radio" checked = "checked" name = "sex"
                                                                 id = "sex"
                                                                 value = "男"/>男</span><span><input type = "radio"
                                                                                                   name = "sex"
                                                                                                   id = "sex"
                                                                                                   value = "女"/>女</span>
                                        </td>
                                        <td>
                                            &nbsp;
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class = "left_name">
                                            年龄：
                                        </td>
                                        <td>
                                            <input type = "text" name = "age" id = "age"
                                                   class = "text_input text150"/>
                                            <span class = "red">*</span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class = "left_name">
                                            手机：
                                        </td>
                                        <td>
                                            <input type = "text" name = "tel" id = "tel"
                                                   class = "text_input text150"/>
                                            <span class = "red">*</span>
                                        </td>
                                    </tr>


                                    <tr>
                                        <td class = "left_name">
                                            邮箱：
                                        </td>
                                        <td>
                                            <input type = "text" name = "email" id = "email"
                                                   class = "text_input text150"/>
                                            <span class = "red">*</span>

                                        </td>
                                    </tr>


                                    <tr>
                                        <td>
                                            &nbsp;
                                        </td>
                                        <td>
                                            <input type = "image" name = "button" id = "button"
                                                   src = "images/ok.gif"/>
                                        </td>
                                    </tr>
                                </table>
                            </form>
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
