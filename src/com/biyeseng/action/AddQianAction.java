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
 * 添加签收
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class AddQianAction extends HttpServlet {	
	

	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		//单号
		String danhao=request.getParameter("danhao");
		//签收人
		String qname=request.getParameter("qname");
		//签收时间
		String qdate=request.getParameter("qdate");
		//经手人
		String jsr=request.getParameter("jsr");	
		
		DBManager dbm = new DBManager();	
		String sql = "insert into qian(danhao,qname,qdate,jsr) values('"+danhao+"','"+qname+"','"+qdate+"','"+jsr+"')";	
		String state=qdate+" 客户已签收  签收人是："+qname+"  操作人："+jsr;
		String sql2 = "insert into daninfo(danhao,state,date)  values('"+danhao+"','"+state+"','"+qdate+"')";

	
		Statement stat = null;	
		Connection conn=null;	
		try {	
			conn=dbm.getConnection();	
			stat = conn.createStatement();	
			stat.execute(sql);	
			stat.execute(sql2);	
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
