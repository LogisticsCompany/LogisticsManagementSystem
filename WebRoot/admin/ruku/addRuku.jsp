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

		<title>入库添加</title>

		<META http-equiv=Content-Type content="text/html; charset=UTF-8">
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		<script type="text/javascript"
			src="<%=path%>/My97DatePicker/WdatePicker.js">
</script>
		<style type="text/css">
<!--
.STYLE3 {
	font-size: 16px
}
-->
</style>

		<script type="text/javascript">
function selDan() {

	var getDanhao = window.showModalDialog(
			"<%=path%>/admin/yundan/listseldan.jsp", "",
			"dialogWidth=800px;dialogHeight=300px");
	if (getDanhao != undefined) {
		document.getElementById("danhao").value = getDanhao;
	}
}

function check() {

	if (document.getElementById("danhao").value == "") {
		alert("请输入单号");
		return false;
	}

	if (document.getElementById("date").value == "") {
		alert("请选择日期");
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
		<form action="AddRukuAction" method="post" onsubmit="return check()">
			<table width="39%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							单号：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="danhao" type="text" id="danhao" readonly="readonly">
							<input type="button" value="选择" onclick="selDan()">

						</label>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							车辆：
						</div>
					</td>
					<td bgcolor="#FFFFFF">

						<select name="car" id="car">
							<%
								DBManager dbm2 = new DBManager();
								Connection conn2 = dbm2.getConnection();
								PreparedStatement stat2 = conn2
										.prepareStatement("select * from car ");
								ResultSet rs2 = stat2.executeQuery();
								while (rs2.next()) {
							%>

							<option value="<%=rs2.getString("pai")%>"><%=rs2.getString("pai")%>
							</option>

							<%
								}
								if (rs2 != null)
									rs2.close();
								if (stat2 != null)
									stat2.close();
								if (conn2 != null)
									conn2.close();
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							网点：
						</div>
					</td>
					<td bgcolor="#FFFFFF">

						<select name="kuname" id="kuname">
							<%
								DBManager dbm3 = new DBManager();
								Connection conn3 = dbm3.getConnection();
								PreparedStatement stat3 = conn3
										.prepareStatement("select * from ku ");
								ResultSet rs3 = stat3.executeQuery();
								while (rs3.next()) {
							%>

							<option value="<%=rs3.getString("name")%>"><%=rs3.getString("name")%>
							</option>

							<%
								}
								if (rs3 != null)
									rs3.close();
								if (stat3 != null)
									stat3.close();
								if (conn3 != null)
									conn3.close();
							%>
						</select>
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							说明：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="info" type="text" id="info">
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							经手人：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="appuser" type="text" id="appuser">
					</td>
				</tr>
				<tr>
					<td bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							日期：
						</div>
					</td>
					<td bgcolor="#FFFFFF">
						<input name="date" type="text" id="date" class="Wdate"
							onfocus="WdatePicker({dateFmt:'yyyy-MM-dd  HH:mm:ss',readOnly:true})">
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
		</form>
	</body>
</html>
