<%-- 
    Document   : add_course_db
    Created on : Feb 27, 2020, 3:24:51 PM
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
            String course_name = request.getParameter("course_name");
            
            SMSFunctionality smsfunc = new SMSFunctionality();
            
            if(smsfunc.courseExists(course_name)){
                String add_course_msg = "Course " + course_name + " already exists";
                session.setAttribute("add_course_msg", add_course_msg);

                String redirect_url = "add_course.jsp";
                response.sendRedirect(redirect_url);
            }else{
                if(smsfunc.addCourse(course_name)){

                    String view_courses_msg = "Course " + course_name + " added successfully";
                    session.setAttribute("view_courses_msg", view_courses_msg);

                    String redirect_url = "view_courses.jsp";
                    response.sendRedirect(redirect_url);

                }else{

                    String add_course_msg = "Course " + course_name + " could not be added";
                    session.setAttribute("add_course_msg", add_course_msg);

                    String redirect_url = "add_course.jsp";
                    response.sendRedirect(redirect_url);

                }
            }
        %>
    </body>
</html>
