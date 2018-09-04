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
 * 修改运单信息
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class ModYundanAction extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String danhao=request.getParameter("danhao");
		String chufa=request.getParameter("chufa");
		String mudi=request.getParameter("mudi");
		String date=request.getParameter("date");
		String fahuoren=request.getParameter("fahuoren");
		String state=request.getParameter("state");	
	 
		DBManager dbm = new DBManager();
		String sql = "update yundan set danhao='"+danhao+"',chufa='"+chufa+"' ,mudi='"+mudi+"',date='"+date+"',fahuoren='"+fahuoren+"',state='"+state+"' where id="+id;
		

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
		response.sendRedirect("admin/yundan/list.jsp");
		out.flush();
		out.close();
	}


}
