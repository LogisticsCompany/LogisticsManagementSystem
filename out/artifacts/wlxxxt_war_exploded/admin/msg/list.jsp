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
		<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
		<title>留言管理</title>
		<LINK href="css/admin.css" type="text/css" rel="stylesheet">
		
	</head>
	<body leftmargin="8" topmargin="8"'>

		<!--  快速转换位置按钮  -->
		<!--  内容列表   -->
		<form name="form2">
			<div id="printTable">
				<table width="98%" border="0" cellpadding="2" cellspacing="1"
					bgcolor="#3333FF" align="center" style="margin-top: 8px">
					<tr bgcolor="#E7E7E7">
						<td colspan="10"  class="theader">
							留言信息列表
						</td>
					</tr>
					<tr align="center" bgcolor="#FAFAF1" height="22">
					 
					 
						<td width="20%">
						          内容
						</td>
						
						<td width="20%">
						      日期
						</td>
						
						<td width="20%">
						     发布人
						</td>
						
						<td width="20%">
						   回复内容
						</td>
					 
						

						<td width="10%">
							操作
						</td>
					</tr>


					<%
						DBManager dbm = new DBManager();
						Connection conn = dbm.getConnection();
						String queryName = request.getParameter("queryName");
						String sql = "select * from message";
					 
						PreparedStatement pstmt = conn.prepareStatement(sql);
						ResultSet rs = pstmt.executeQuery();

						while (rs.next()) {
							String id = rs.getString("id");
					%>

					<tr align='center' bgcolor="#FFFFFF"
						onMouseMove="javascript:this.bgColor='#FCFDEE';"
						onMouseOut="javascript:this.bgColor='#FFFFFF';" height="22">
						 
					 
						<td align="left">
							<div align="center">
								<%=rs.getString("msg")%>

							</div>
						</td>
						
						 
						
						
						<td align="left">
							<div align="center">
								<%=rs.getString("date")%>

							</div>
						</td>
						
						<td align="left">
							<div align="center">
								<%=rs.getString("appuser")%>

							</div>
						</td>
						
							<td align="left">
							<div align="center">
								<%=rs.getString("reply")%>

							</div>
						</td>
					 
					 
						<td>
							 
							<a href="DelMsgAction?id=<%=id %>">删除</a>|
							<a href="admin/msg/addMsg.jsp?id=<%=id %>">回复</a>
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

					 

				</table>
			</div>
		</form>

		 
	</body>
</html>