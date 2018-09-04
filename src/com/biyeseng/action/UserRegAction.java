package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * 会员注册
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class UserRegAction extends HttpServlet {


	private static final long serialVersionUID = 1L;

 
	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

 
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String name = request.getParameter("name");
		String pwd = request.getParameter("pwd");
		String rname = request.getParameter("rname");
		String sex = request.getParameter("sex");
		String age = request.getParameter("age");
		String tel = request.getParameter("tel");
		String email = request.getParameter("email");

		DBManager dbm = new DBManager();
		if (dbm.haveUser(name)) {
			out
					.println("<script>alert('该账号已存在！');window.history.back();</script>");
		} else {
			String sql = "insert into userinfo(name,pwd,rname,sex,age,tel,email)  values('"
					+ name
					+ "','"
					+ pwd
					+ "','"
					+ rname
					+ "','"
					+ sex
					+ "','"
					+ age + "','" + tel + "','" + email + "')";

			Statement stat = null;
			Connection conn = null;
			try {
				conn = dbm.getConnection();
				stat = conn.createStatement();
				stat.execute(sql);
			} catch (SQLException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} finally {
				try {
					if (stat != null)
						stat.close();
					if (conn != null)
						conn.close();
				} catch (SQLException e) {
					// TODO Auto-generated catch block
					e.printStackTrace();
				}
			}
			out
					.println("<script>alert('用户注册成功！');window.location.href='index.jsp'</script>");
		}

		out.flush();
		out.close();
	}

 
}
