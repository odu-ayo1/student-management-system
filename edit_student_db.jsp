<%-- 
    Document   : edit_student_db
    Created on : Feb 27, 2020, 3:23:47 PM
    Author     : REHOBOTH
--%>

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
            String first_name = request.getParameter("first_name");
            String last_name = request.getParameter("last_name");
            String email = request.getParameter("email");
            int age = Integer.parseInt(request.getParameter("age"));
            int course = Integer.parseInt(request.getParameter("course"));
            String gender = request.getParameter("gender");
            String address = request.getParameter("address");
            int student_id = Integer.parseInt(request.getParameter("student_id"));
            
            SMSFunctionality smsfunc = new SMSFunctionality();
            
            if(smsfunc.updateStudent(first_name, last_name, email, age, course, gender, address, student_id)){
                String view_students_msg = "Student " + first_name + " " + last_name + " updated successfully";
                session.setAttribute("view_students_msg", view_students_msg);

                String redirect_url = "view_students.jsp";
                response.sendRedirect(redirect_url);
            }else{
                String edit_student_msg = "Student " + first_name + " " + last_name + " could not be updated";
                session.setAttribute("edit_student_msg", edit_student_msg);

                String redirect_url = "edit_student.jsp?student_id="+student_id;
                response.sendRedirect(redirect_url);
            }
        %>
    </body>
</html>
