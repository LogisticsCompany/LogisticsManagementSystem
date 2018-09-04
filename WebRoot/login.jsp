<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
	<head>
		<title>物流信息管理系统</title>
		<link rel="stylesheet" type="text/css" href="<%=path %>/Styles/base.css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/Styles/admin-all.css" />
		<link rel="stylesheet" type="text/css" href="<%=path %>/Styles/bootstrap.min.css" />
		<script type="text/javascript" src="<%=path %>/Scripts/jquery-1.7.2.js">
</script>
		<script type="text/javascript" src="<%=path %>/Scripts/jquery.spritely-0.6.js">
</script>
		
		<link rel="stylesheet" type="text/css" href="<%=path %>/Styles/login.css" />
		<script type="text/javascript">
$(function() {
	$('#clouds').pan( {
		fps : 20,
		speed : 0.7,
		dir : 'right',
		depth : 10
	});
 
})

 function check1()
	 {               
	    if ($('#username').val() == "" || $('#userpwd').val() == ""
						) {
					$('.tip').html('用户名或密码不可为空！');
					return false;
				} else {
					return true;;
				}
	    }
</script>
	</head>
	<body>
		<div id="clouds" class="stage"></div>
		<div class="loginmain">
		</div>
		<form action="<%=path %>/LoginAction" name="ThisForm" method="post">

		<div class="row-fluid">
			<h1>
				物流信息管理系统后台管理
			</h1>
			<p>
				<label>
					帐&nbsp;&nbsp;&nbsp;号：
					<input type="text" id="username" name="username"/>
				</label>
			</p>
			<p>
				<label>
					密&nbsp;&nbsp;&nbsp;码：
					<input type="password" id="userpwd" name="userpwd"/>
				</label>
			</p>
			 
			<p class="tip">
				&nbsp;
			</p>
			<hr />
			<input type="submit" value=" 登 录 "
				class="btn btn-primary btn-large login"  onClick="return check1()"/>
			&nbsp;&nbsp;&nbsp;
			<input type="button" value=" 取 消 " class="btn btn-large" />
		</div>
		</FORM>
	</body>
</html>
