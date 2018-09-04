package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * 员工操作
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class AddAdminAction extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		//账号
		String name=request.getParameter("name");
		//密码
		String pwd=request.getParameter("pwd");
		//姓名
		String rname=request.getParameter("rname");
		//职务
		String zhi=request.getParameter("zhi");
		//电话
		String tel=request.getParameter("tel");
		//年龄
		String age=request.getParameter("age");
		
		DBManager dbm = new DBManager();
		//保存管理员信息
		String sql = "insert into admin(userName,userPw,rname,zhi,tel,age)  values('"+name+"','"+pwd+"','"+rname+"','"+zhi+"','"+tel+"','"+age+"')";

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
