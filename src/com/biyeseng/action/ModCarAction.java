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
 * 修改车辆
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class ModCarAction extends HttpServlet {	
	

	private static final long serialVersionUID = 1L;


	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		String id = request.getParameter("id");	
		String pai=request.getParameter("pai");
		String size=request.getParameter("size");
		String type=request.getParameter("type");
		String state=request.getParameter("state");
		String info=request.getParameter("info");	
		DBManager dbm = new DBManager();	
		String sql = "update car set pai='"+pai+"',size='"+size+"',type='"+type+"',state='"+state+"',info='"+info+"' where id="+id;	
		
	
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
		response.sendRedirect("admin/car/list.jsp");	
		out.flush();	
		out.close();	
	}	
	

}	
