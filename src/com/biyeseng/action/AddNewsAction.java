package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import com.biyeseng.db.DBManager;
import com.biyeseng.util.CommonUtil;

/**
 * 添加新闻资讯
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class AddNewsAction extends HttpServlet {

	
	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		
		DBManager dbm = new DBManager();
		
		//标题
		String title=request.getParameter("title");
		//新闻内容
		String info=request.getParameter("info");
		if(info!=null){
			info=CommonUtil.TextToHtml(info);
		}
		//发布日期
		String date=CommonUtil.getDate();
		//发布人
		Object user=request.getSession().getAttribute("admin");
		
		String appuser="";
		if(user!=null && appuser.toString()!=null){
			appuser=(String) user;
		}
		

		String sql = "insert into news(title,date,info,appuser)  values('"+title+"','"+date+"','"+info+"','"+appuser+"')";

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
