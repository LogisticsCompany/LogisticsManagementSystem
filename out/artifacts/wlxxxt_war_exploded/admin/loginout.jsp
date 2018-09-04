<%
  session.removeAttribute("admin");
  response.sendRedirect(request.getContextPath() + "/admin/login.jsp");
%>