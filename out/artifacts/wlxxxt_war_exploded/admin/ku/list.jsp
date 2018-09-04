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
		<title>网点管理</title>
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">

	</head>
	<body leftmargin="8" topmargin="8"'>
		<!--  搜索表单  -->
		<form action="admin/ku/list.jsp" method="post">

			<table width='98%' border='0' cellpadding='1' cellspacing='1'
				bgcolor='#CBD8AC' align="center" style="margin-top: 8px">
				<tr bgcolor='#EEF4EA'>
					<td align='center'>

						<table width="469" border='0' cellpadding='0' cellspacing='0'>
							<tr>
								<td width='129'>
									请输入名称：
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
						<td colspan="10" class="theader">
							网点信息列表
						</td>
					</tr>
					<tr align="center" bgcolor="#FAFAF1" height="22">

						<td width="15%">
							网点名
						</td>
						<td width="30%">
							地址
						</td>
						<td width="10%">
							负责人
						</td>
						<td width="20%">
							电话
						</td>
						<td width="10%">
							备注
						</td>


						<td width="10%">
							操作
						</td>
					</tr>


					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select * from ku";
						if (queryName != null) {
							sql = "select * from ku where name like '%" + queryName + "%'";
						}
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
					%>

					<tr align='center' bgcolor="#FFFFFF"
						onMouseMove="javascript:this.bgColor='#FCFDEE';"
						onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">

						<td><%=rs.getString("name")%>

						</td>
						<td align="left">
							<div align="center">
								<%=rs.getString("address")%>

							</div>
						</td>
						<td align="left">
							<div align="center">
								<%=rs.getString("fuze")%>

							</div>
						</td>
						<td align="left">
							<div align="center">
								<%=rs.getString("tel")%>

							</div>
						</td>
						<td align="left">
							<div align="center">
								<%=rs.getString("beizhu")%>

							</div>
						</td>

						<td>
							<a href="admin/ku/modKu.jsp?id=<%=id%>">编辑</a> |
							<a href="DelKuAction?id=<%=id%>">删除</a>
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

					<tr>
						<td colspan="10" class="theader">

							<a href="admin/ku/addKu.jsp"><strong>添加网点</strong>
							</a>
						</td>
					</tr>

				</table>
			</div>
		</form>


	</body>
</html>