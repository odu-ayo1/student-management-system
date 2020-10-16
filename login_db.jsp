<%-- 
    Document   : login_db
    Created on : Feb 27, 2020, 3:23:58 PM
    Author     : REHOBOTH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            String username = request.getParameter("username");
            String password = request.getParameter("password");
            
            if("admin".equals(username) && "admin".equals(password)){
                response.sendRedirect("dashboard.jsp");
            }else{
                session.setAttribute("login_page_msg", "Invalid username or password");
                response.sendRedirect("index.jsp");
            }
        %>
    </body>
</html>
