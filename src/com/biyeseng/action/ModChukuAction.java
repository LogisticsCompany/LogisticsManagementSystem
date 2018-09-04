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
 * 修改出库信息
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class ModChukuAction extends HttpServlet {	
	

	private static final long serialVersionUID = 1L;


	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		String id = request.getParameter("id");	
		String danhao=request.getParameter("danhao");	
		String kuname=request.getParameter("kuname");	
		String info=request.getParameter("info");	
		String appuser=request.getParameter("appuser");
		String date=request.getParameter("date");
		String car=request.getParameter("car");
		String tokuname=request.getParameter("tokuname");
		DBManager dbm = new DBManager();	
		String sql = "update chuku set danhao='"+danhao+"',car='"+car+"',tokuname='"+tokuname+"',kuname='"+kuname+"',info='"+info+"',appuser='"+appuser+"',date='"+date+"' where id="+id;	
			
	
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
		response.sendRedirect("admin/chuku/list.jsp");	
		out.flush();	
		out.close();	
	}	
	

}	
