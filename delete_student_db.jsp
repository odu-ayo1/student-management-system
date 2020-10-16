<%-- 
    Document   : delete_student_db
    Created on : Feb 27, 2020, 3:24:12 PM
    Author     : REHOBOTH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.smssystm.func.SMSFunctionality"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <%
            int student_id = Integer.parseInt(request.getParameter("student_id"));
            
            SMSFunctionality smsfunc = new SMSFunctionality();
            
            ResultSet rs = smsfunc.getStudentDetails(student_id);
            
            String first_name = rs.getString("FIRSTNAME");
            String last_name = rs.getString("LASTNAME");
            
            out.println(first_name);
            out.println(last_name);
            
            boolean delete = smsfunc.deleteStudent(student_id);
            
            String redirect_url = "view_students.jsp";
            response.sendRedirect(redirect_url);
            
            /*
            
            if(smsfunc.deleteStudent(student_id)){
                String view_students_msg = "Student " + first_name + " " + last_name + " deleted successfully";
                session.setAttribute("view_students_msg", view_students_msg);

                String redirect_url = "view_students.jsp";
                response.sendRedirect(redirect_url);
            }else{
                String view_students_msg = "Student " + first_name + " " + last_name + " could not be deleted";
                session.setAttribute("view_students_msg", view_students_msg);

                String redirect_url = "view_students.jsp";
                response.sendRedirect(redirect_url);
            }
            */
        %>
        <%
            if(rs != null){
                rs.close();
            }
        %>
    </body>
</html>
