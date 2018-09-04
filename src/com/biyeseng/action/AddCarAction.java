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
 * 添加车辆信息
 * 
 * @author biyeseng
 * @company www.biyeseng.cn
 * 
 */
public class AddCarAction extends HttpServlet {

	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//车牌信息
		String pai = request.getParameter("pai");
		//车型
		String size = request.getParameter("size");
		//长短途
		String type = request.getParameter("type");
		//状态
		String state = request.getParameter("state");
		//备注
		String info = request.getParameter("info");
		DBManager dbm = new DBManager();
		// 添加车辆信息
		String sql = "insert into car(pai,size,type,state,info) values('" + pai
				+ "','" + size + "','" + type + "','" + state + "','" + info
				+ "')";

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
		response.sendRedirect("admin/car/list.jsp");
		out.flush();
		out.close();
	}

}
