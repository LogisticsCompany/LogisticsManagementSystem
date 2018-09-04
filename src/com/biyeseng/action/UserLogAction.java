package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * 会员登录
 * @author biyeseng
 * @company www.biyeseng.cn
 *
 */
public class UserLogAction extends HttpServlet {


	private static final long serialVersionUID = 1L;


	public void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		this.doPost(request, response);
	}

	
	public void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {

		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		String username=request.getParameter("name");
		String userpwd=request.getParameter("pwd");
		
		DBManager dbm=new DBManager();
		boolean login=dbm.loginUser(username, userpwd);
		if(login){
		   
		   request.getSession().setAttribute("user", username);
		   out.println("<script>alert('登陆成功！');window.location.href='index.jsp'</script>");
			
		}else{
			 
			out.println("<script>alert('用户名或密码有误！');window.location.href='index.jsp'</script>");
		 
		}
		
		
		out.flush();
		out.close();
	}



}
