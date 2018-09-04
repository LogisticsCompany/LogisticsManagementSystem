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
 * 添加货物出库信息
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class AddChukuAction extends HttpServlet {	
	

	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)	
			throws ServletException, IOException {	
	
		response.setContentType("text/html");	
		PrintWriter out = response.getWriter();	
		//单号
		String danhao=request.getParameter("danhao");
		//网点
		String kuname=request.getParameter("kuname");	
		//说明
		String info=request.getParameter("info");	
		//经手人
		String appuser=request.getParameter("appuser");
		//日期
		String date=request.getParameter("date");
		//车辆
		String car=request.getParameter("car");
		//发往网点
		String tokuname=request.getParameter("tokuname");
		DBManager dbm = new DBManager();	
		
		//保存出库信息
		String sql = "insert into chuku(danhao,kuname,info,appuser,date,car,tokuname) values('"+danhao+"','"+kuname+"','"+info+"','"+appuser+"','"+date+"','"+car+"','"+tokuname+"')";	
			
		
		//更新物流运输状态信息
		String state= date+"  离开["+kuname+"] 发往 ["+tokuname+"] 操作人："+appuser+"  运输车辆："+car;
		String sql2 = "insert into daninfo(danhao,state,date)  values('"+danhao+"','"+state+"','"+date+"')";
		
		
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
		response.sendRedirect("admin/chuku/list.jsp");	
		out.flush();	
		out.close();	
	}	
	
}	
