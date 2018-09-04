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
 * 添加留言信息
 * 
 * @author biyeseng
 * @company www.biyeseng.cn
 * 
 */
public class AddMsgAction extends HttpServlet {


	private static final long serialVersionUID = 1L;

	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();

		DBManager dbm = new DBManager();

		//留言内容
		String msg = request.getParameter("msg");
		if (msg != null) {
			msg = CommonUtil.TextToHtml(msg);
		}
		String date = CommonUtil.getDate();
		//发布人
		Object user = request.getSession().getAttribute("user");

		String appuser = "";
		if (user != null && appuser.toString() != null) {
			appuser = (String) user;
		}

		

		String sql = "insert into message(msg,appuser,date,reply)  values('"
				+ msg + "','" + appuser + "','" + date + "','')";

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
		
		out.println("<script>alert('留言发布成功,我们会尽快给您回复！');window.location.href='message.jsp'</script>");

	 

		out.flush();
		out.close();
	}

}
