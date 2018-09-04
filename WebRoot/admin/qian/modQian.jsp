<%@ page language="java" import="java.util.*,java.sql.*,com.biyeseng.db.*"
	pageEncoding="UTF-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
	<head>
		<base href="<%=basePath%>">

		<title>签收信息修改</title>

		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<script type="text/javascript"
			src="<%=path%>/My97DatePicker/WdatePicker.js">
</script>
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		<style type="text/css">
<!--
.STYLE3 {
	font-size: 16px
}
-->
</style>
		<script type="text/javascript">
function check() {
	var name = document.getElementById("name").value;
	if (name == "") {
		alert("工号不能为空");
		return false;
	}

	return true;

}
</script>
	</head>

	<body>
		<p>
			&nbsp;
		</p>
		<p>
			&nbsp;
		</p>
		<form action="ModQianAction" method="post" onsubmit="return check()">
			<%
				DBManager dbm = new DBManager();
				Connection conn = dbm.getConnection();
				String id = request.getParameter("id");
				String sql = "select * from qian where id='" + id + "'";
				PreparedStatement stat = conn.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();
				rs.next();
			%>
			<table width="39%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
				<input name="id" type="hidden" id="name" value='<%=id%>'>

				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							单号：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="danhao" size="30" type="text" id="danhao"
							value='<%=rs.getString("danhao")%>'>
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							签收人：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="qname" type="text" id="qname"
							value='<%=rs.getString("qname")%>'>
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							签收时间：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="qdate" type="text" id="qdate"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})"
							value='<%=rs.getString("qdate")%>'>
					</td>
				</tr>

				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							经手人：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="jsr" type="text" id="jsr"
							value='<%=rs.getString("jsr")%>'>
					</td>
				</tr>
				<tr>
					<td colspan="2" bgcolor="#FFFFFF">
						<label>
							<div align="center">
								<input type="submit" name="Submit" value="提交">
								<input type="reset" name="Submit2" value="重置">
							</div>
						</label>
					</td>
				</tr>
			</table>
			<%
				if (rs != null)
					rs.close();
				if (stat != null)
					stat.close();
				if (conn != null)
					conn.close();
			%>
		</form>
	</body>
</html>
