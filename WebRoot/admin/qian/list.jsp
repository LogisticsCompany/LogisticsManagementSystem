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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>签收信息管理</title>
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">

		<script type="text/javascript"
			src="<%=path%>/My97DatePicker/WdatePicker.js">
</script>


	</head>
	<body leftmargin="8" topmargin="8"'>
	
		<!--  搜索表单  -->
		<form action="admin/qian/list.jsp" method="post">

			<table width='98%' border='0' cellpadding='1' cellspacing='1'
				bgcolor='#CBD8AC' align="center" style="margin-top: 8px">
				<tr bgcolor='#EEF4EA'>
					<td align='center'>

						<table width="469" border='0' cellpadding='0' cellspacing='0'>
							<tr>
								<td width='129'>
									请输入签收信息名称：
								</td>
								<td width='170'>
									<input type='text' name='queryName' value=''
										style='width: 150px' />
								</td>
								<td width='86'>
									<input name="imageField" type="submit" border="0" class="np"
										value='查询' />
								</td>
								<td width="84">
									&nbsp;

								</td>
							</tr>
						</table>

					</td>
				</tr>
			</table>
		</form>

		<!--  快速转换位置按钮  -->
		<!--  内容列表   -->
		<form name="form2">
			<div id="printTable">
				<table width="98%" border="0" cellpadding="2" cellspacing="1"
					bgcolor="#3333FF" align="center" style="margin-top: 8px">
					<tr bgcolor="#E7E7E7">
						<td colspan="10"  class="theader">
							签收信息列表
						</td>
					</tr>
					<tr align="center" bgcolor="#FAFAF1" height="22">
						<td width="10%">
							单号
						</td>

						<td width="10%">
							签收人
						</td>

						<td width="10%">
							签收时间
						</td>

						<td width="10%">
							经手人
						</td>
						

						<td width="10%">
							操作
						</td>
					</tr>


					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select * from qian";
						if (queryName != null) {
							sql = "select * from qian where danhao like '%" + queryName
									+ "%'";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
					%>

					<tr align='center' bgcolor="#FFFFFF"
						onMouseMove="javascript:this.bgColor='#FCFDEE';"
						onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						<td>
							<%=rs.getString("danhao")%>
						</td>

						<td>
							<%=rs.getString("qname")%>
						</td>

						<td>
							<%=rs.getString("qdate")%>
						</td>

						<td>
							<%=rs.getString("jsr")%>
						</td>

						<td>
							<a href="admin/qian/modQian.jsp?id=<%=id%>">编辑</a> |
							<a href="DelQianAction?id=<%=id%>">删除</a>
						</td>
					</tr>

					<%
						}
						if (rs != null)
							rs.close();
						if (pstmt != null)
							pstmt.close();
						if (conn != null)
							conn.close();
					%>

					<tr bgcolor="#FAFAF1">
						<td  class="theader" colspan="10">
							<a href="admin/qian/addQian.jsp"><strong>添加签收信息</strong>
							</a>
						</td>
					</tr>

				</table>
			</div>
		</form>

	
	</body>
</html>
