<%-- 
    Document   : delete_course_db
    Created on : Feb 27, 2020, 3:25:14 PM
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
            int course_id = Integer.parseInt(request.getParameter("course_id"));
            
            SMSFunctionality smsfunc = new SMSFunctionality();
            
            String course_name = smsfunc.getCourseName(course_id);
            
            if(smsfunc.deleteCourse(course_id)){
                String view_courses_msg = "Course " + course_name + " deleted successfully";
                session.setAttribute("view_courses_msg", view_courses_msg);

                String redirect_url = "view_courses.jsp";
                response.sendRedirect(redirect_url);
            }else{
                String view_courses_msg = "Course " + course_name + " could not be deleted";
                session.setAttribute("view_courses_msg", view_courses_msg);

                String redirect_url = "view_courses.jsp";
                response.sendRedirect(redirect_url);
            }
        %>
    </body>
</html>
