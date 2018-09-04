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
 * 修改签收信息
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class ModQianAction extends HttpServlet {	
	

	private static final long serialVersionUID = 1L;

		
	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		String id = request.getParameter("id");	
		String danhao=request.getParameter("danhao");
		String qname=request.getParameter("qname");
		String qdate=request.getParameter("qdate");
		String jsr=request.getParameter("jsr");
		DBManager dbm = new DBManager();	
		String sql = "update qian set danhao='"+danhao+"',qname='"+qname+"',qdate='"+qdate+"',jsr='"+jsr+"' where id="+id;	
			
	
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
		response.sendRedirect("admin/qian/list.jsp");	
		out.flush();	
		out.close();	
	}	
	

}	
