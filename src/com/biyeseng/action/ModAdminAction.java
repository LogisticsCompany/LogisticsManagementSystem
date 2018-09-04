package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;
import java.sql.*;

/**
 * 修改员工
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class ModAdminAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		String id = request.getParameter("id");
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String rname=request.getParameter("rname");
		String zhi=request.getParameter("zhi");
		String tel=request.getParameter("tel");
		String age=request.getParameter("age");
	 
		DBManager dbm = new DBManager();
		String sql = "update admin set userName='"+name+"',userPw='"+pwd+"' ,rname='"+rname+"',zhi='"+zhi+"',tel='"+tel+"',age='"+age+"' where id="+id;
		

		Statement stat = null;
		Connection conn=null;
		try {
			conn=dbm.getConnection();
			stat = conn.createStatement();
			stat.execute(sql);
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		} finally {
			try {
				if(stat!=null)
					stat.close();
				if(conn!=null)
					conn.close();
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		response.sendRedirect("admin/admin/list.jsp");
		out.flush();
		out.close();
	}



}
