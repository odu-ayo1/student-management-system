<%-- 
    Document   : edit_course_db
    Created on : Feb 27, 2020, 3:25:36 PM
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
            String course_name = request.getParameter("course_name");
            
            SMSFunctionality smsfunc = new SMSFunctionality();
            
            if(smsfunc.updateCourse(course_id, course_name)){
                String view_courses_msg = "Course " + course_name + " updated successfully";
                session.setAttribute("view_courses_msg", view_courses_msg);

                String redirect_url = "view_courses.jsp";
                response.sendRedirect(redirect_url);
            }else{
                String edit_course_msg = "Course " + course_name + " could not be updated";
                session.setAttribute("edit_course_msg", edit_course_msg);

                String redirect_url = "edit_course.jsp?course_id="+course_id;
                response.sendRedirect(redirect_url);
            }
        %>
    </body>
</html>
