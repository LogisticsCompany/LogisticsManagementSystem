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
 * 添加运单
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class AddYundanAction extends HttpServlet {


	private static final long serialVersionUID = 1L;

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		//单号
		String danhao=request.getParameter("danhao");
		//出发地地址联系方式
		String chufa=request.getParameter("chufa");
		//目的地地址联系方式
		String mudi=request.getParameter("mudi");
		//日期
		String date=request.getParameter("date");
		//发货人
		String fahuoren=request.getParameter("fahuoren");
		//状态
		String state=request.getParameter("state");	
		//收货人
		String shouhuoren=request.getParameter("shouhuoren");	
		//判断是前台提交还是后台管理提交
		String type=request.getParameter("type");	
		
		DBManager dbm = new DBManager();
		
		String sql="";
		if(type.equals("front")){
			String username=(String) request.getSession().getAttribute("user");
			sql="insert into yundan(danhao,chufa,mudi,date,fahuoren,state,shouhuoren,username)  values('"+danhao+"','"+chufa+"','"+mudi+"','"+CommonUtil.getDate()+"','"+fahuoren+"','已下单','"+shouhuoren+"','"+username+"')";
			
		}else{
			sql = "insert into yundan(danhao,chufa,mudi,date,fahuoren,state,shouhuoren)  values('"+danhao+"','"+chufa+"','"+mudi+"','"+date+"','"+fahuoren+"','"+state+"','"+shouhuoren+"')";
		}

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
		if(type.equals("front")){
			out.println("<script>alert('下单成功，工作人员会尽快和您联系。');window.location.href='newdan.jsp'</script>");
		}else{
			response.sendRedirect("admin/yundan/list.jsp");
		}
		
		out.flush();
		out.close();
	}

	
}
