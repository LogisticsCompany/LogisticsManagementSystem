<%@ page language="java" import="java.util.*" pageEncoding="UTF-8"%>
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

		<title>签收信息添加</title>

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
function check() {
	if (document.getElementById("danhao").value == "") {
		alert("请输入单号");
		return false;
	}
	
	if (document.getElementById("qname").value == "") {
		alert("请输入签收人");
		return false;
	}
	
	if (document.getElementById("qdate").value == "") {
		alert("请输入签收时间");
		return false;
	}
	
	if (document.getElementById("jsr").value == "") {
		alert("请输入经手人");
		return false;
	}

	return true;

}

function selDan() {

	var getDanhao = window.showModalDialog(
			"<%=path%>/admin/yundan/listseldan.jsp", "",
			"dialogWidth=800px;dialogHeight=300px");
	if (getDanhao != undefined) {
		document.getElementById("danhao").value = getDanhao;
	}
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
		<form action="AddQianAction" method="post" onsubmit="return check()">
			<table width="50%" border="0" align="center" cellspacing="1"
				bordercolor="#000000" bgcolor="#0000CC">
				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							单号：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="danhao" size="30" type="text" id="danhao" readonly="readonly">
							<input type="button" value="选择" onclick="selDan()">
						</label>
					</td>
				</tr>

				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							签收人：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="qname" type="text" id="qname">
						</label>
					</td>
				</tr>

				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							签收时间：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="qdate" onfocus="WdatePicker({dateFmt:'yyyy-MM-dd HH:mm:ss',readOnly:true})" type="text" id="qdate">
						</label>
					</td>
				</tr>

				<tr>
					<td width="28%" bgcolor="#FFFFFF">
						<div align="right" class="STYLE3">
							经手人：
						</div>
					</td>
					<td width="72%" bgcolor="#FFFFFF">
						<label>
							<input name="jsr" type="text" id="jsr">
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
		</form>
	</body>
</html>
