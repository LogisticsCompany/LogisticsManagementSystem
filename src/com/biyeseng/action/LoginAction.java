package com.biyeseng.action;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.biyeseng.db.DBManager;

/**
 * 后台登录操作
 *
 * @author biyeseng
 * @company www.biyeseng.cn
 */
public class LoginAction extends HttpServlet
{


    private static final long serialVersionUID = 1L;


    public void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        this.doPost(request, response);
        out.close();
    }


    public void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException
    {

        response.setContentType("text/html");
        PrintWriter out = response.getWriter();
        String username = request.getParameter("username");
        String userpwd = request.getParameter("userpwd");

        DBManager dbm = new DBManager();
        boolean login = dbm.login(username, userpwd);
        if (login)
        {

            request.getSession().setAttribute("admin", username);
            response.sendRedirect("admin/index1.jsp");

        }
        else
        {

            out.println("<script>alert('账号或密码有误');window.location.href='admin/login.jsp'</script>");

        }


        out.flush();
        out.close();
    }


}
