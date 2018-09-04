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
 * 添加网点信息
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class AddKuAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//网点名称
		String name=request.getParameter("name");
		//网点地址
		String address=request.getParameter("address");
		//负责人
		String fuze=request.getParameter("fuze");
		//联系方式
		String tel=request.getParameter("tel");
		//备注
		String beizhu=request.getParameter("beizhu");
		
		DBManager dbm = new DBManager();
		//添加网点信息
		String sql = "insert into ku(name,address,fuze,tel,beizhu)  values('"+name+"','"+address+"','"+fuze+"','"+tel+"','"+beizhu+"')";

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
