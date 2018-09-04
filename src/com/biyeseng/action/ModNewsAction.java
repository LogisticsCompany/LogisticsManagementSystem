package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;
import com.biyeseng.util.CommonUtil;

import java.sql.*;

/**
 * 修改新闻资讯信息
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class ModNewsAction extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String id = request.getParameter("id");
		String title=request.getParameter("title");
		String info=request.getParameter("info");
		DBManager dbm = new DBManager();
		if(info!=null){
			info=CommonUtil.TextToHtml(info);
		}
		String date=CommonUtil.getDate();
		Object user=request.getSession().getAttribute("admin");
		
		String appuser="";
		if(user!=null && appuser.toString()!=null){
			appuser=(String) user;
		}
	 
		
		String sql = "update news set title='"+title+"',info='"+info+"',date='"+date+"',appuser='"+appuser+"' where id="+id;
	

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
		response.sendRedirect("admin/news/list.jsp");
		out.flush();
		out.close();
	}


}
