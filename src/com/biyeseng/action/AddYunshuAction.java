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
 * 
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class AddYunshuAction extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//单号
		String danhao=request.getParameter("danhao");
		//编号
		String yunid=request.getParameter("id");
		//日期
		String date=request.getParameter("date");
		//状态
		String state=request.getParameter("state");
		
		
		DBManager dbm = new DBManager();
		//保存运输信息
		String sql = "insert into daninfo(yunid,danhao,state,date)  values("+yunid+",'"+danhao+"','"+state+"','"+date+"')";

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
		response.sendRedirect("admin/yundan/listdan.jsp?id="+yunid+"&danhao="+danhao);
		out.flush();
		out.close();
	}

	
}
