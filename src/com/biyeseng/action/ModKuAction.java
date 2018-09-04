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
 * 修改网点信息
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class ModKuAction extends HttpServlet {

	private static final long serialVersionUID = 1L;


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String name=request.getParameter("name");
		String address=request.getParameter("address");
		String fuze=request.getParameter("fuze");
		String tel=request.getParameter("tel");
		String beizhu=request.getParameter("beizhu");
	 
		DBManager dbm = new DBManager();
		String sql = "update ku set name='"+name+"',address='"+address+"' ,fuze='"+fuze+"',tel='"+tel+"',beizhu='"+beizhu+"' where id="+id;
		

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
		response.sendRedirect("admin/ku/list.jsp");
		out.flush();
		out.close();
	}


}
