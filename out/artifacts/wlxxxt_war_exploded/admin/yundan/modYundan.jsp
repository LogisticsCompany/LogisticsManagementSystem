<%@ page language="java"
	import="java.util.*,java.sql.*,com.biyeseng.db.*"
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

		<title>运单修改</title>

		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		<script type="text/javascript" src="<%=path%>/My97DatePicker/WdatePicker.js"></script>
		<style type="text/css">
<!--
.STYLE3 {
	font-size: 16px
}
-->
</style>
<script type="text/javascript">
function check() {
	if (document.getElementById("chufa").value == "") {
		alert("请输入出发地地址联系方式");
		return false;
	}
	if (document.getElementById("mudi").value == "") {
		alert("请输入目的地地址联系方式");
		return false;
	}
	if (document.getElementById("date").value == "") {
		alert("请输入日期");
		return false;
	}
	if (document.getElementById("fahuoren").value == "") {
		alert("请输入发货人");
		return false;
	}
	if (document.getElementById("shouhuoren").value == "") {
		alert("请输入收货人");
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
		<form action="ModYundanAction" method="post" onsubmit="return check()">
			<%
				DBManager dbm = new DBManager();
				Connection conn = dbm.getConnection();
				String id = request.getParameter("id");
				String sql = "select * from yundan where id='" + id + "'";
				PreparedStatement stat = conn.prepareStatement(sql);
				ResultSet rs = stat.executeQuery();
				rs.next();
			%>
			<table width="80%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
			 
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							单号：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
						    <input name="id" type="hidden" id="name" value='<%=id%>'>
							<input name="danhao" size="30" type="text" readonly="readonly" value='<%=rs.getString("danhao")%>' id="danhao">
						</label>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
					                  出发地地址联系方式：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="chufa" size="40" type="text" value='<%=rs.getString("chufa")%>' id="chufa">(格式：地址,姓名,电话)
					</td>
				</tr>
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							  目的地地址联系方式：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="mudi" size="40" type="text" value='<%=rs.getString("mudi")%>' id="mudi">(格式：地址,姓名,电话)
						</label>
					</td>
				</tr>
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							日期：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="date" class="Wdate"  value='<%=rs.getString("date")%>' onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" id="date">
						</label>
					</td>
				</tr>
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							发货人：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="fahuoren" type="text" value='<%=rs.getString("fahuoren")%>' id="fahuoren">
						</label>
					</td>
				</tr>
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							收货人：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="shouhuoren" type="text" id="shouhuoren" value='<%=rs.getString("shouhuoren")%>'>
						</label>
					</td>
				</tr>
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							状态：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<select name="state"  id="state">
							  <option>运输</option>
							   <option>派送</option>
							   <option>签收</option>
							</select>
						</label>
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
