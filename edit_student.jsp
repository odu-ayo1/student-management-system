<%-- 
    Document   : edit_student
    Created on : Feb 27, 2020, 3:23:23 PM
    Author     : REHOBOTH
--%>

<%@page import="java.sql.ResultSet"%>
<%@page import="com.smssystm.func.SMSFunctionality"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Edit Student</title>
        
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        
        <style type="text/css">
            
        </style>
    </head>
    <body>
        <div class="container-fluid ak-navbar navbar-default">
            <div class="row">
                <div class="col-md-6"><span class="site-name">Akashi's SMS System</span></div>
            </div>
        </div>
        
        <div class="container-fluid quick-info">
            <p class="page-info">Home | Add Student</p>
            
            <div class="extra-info">
                <p class="main-extra-info">Hi Admin, Welcome Back</p>
                <p>Welcome to Akashi's Student Management System</p>
            </div>
        </div>
        
        <%
            if(session.getAttribute("edit_student_msg") != null){
                %>
                    <div class="col-md-6 col-md-offset-3 page-session">
                        <div class="alert alert-success alert-dismissible r-alert">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <%
                                out.print(session.getAttribute("edit_student_msg").toString());
                            %>
                        </div>
                    </div>
                <%
                session.removeAttribute("edit_student_msg");
            }
        %>
        
        <div class="container top-margin">
            <div class="col-md-3 col-sm-4">
                <div class="sidebar">
                    <p class="nav-link-header">DASHBOARD</p>
                    
                    <div class="nav-link">
                        <a href="dashboard.jsp" class="nav-link-link">Dashboard</a>
                    </div>
                    
                    <p class="nav-link-header">STUDENT</p>
                    
                    <div class="nav-link">
                        <a href="add_student.jsp" class="nav-link-link">Add Student</a>
                    </div>
                    
                    <div class="nav-link">
                        <a href="view_students.jsp" class="nav-link-link">View Students</a>
                    </div>
                    
                    <p class="nav-link-header">COURSES</p>
                    
                    <div class="nav-link">
                        <a href="add_course.jsp" class="nav-link-link">Add Course</a>
                    </div>
                    
                    <div class="nav-link">
                        <a href="view_courses.jsp" class="nav-link-link">View Courses</a>
                    </div>
                    
                    <p class="nav-link-header">ACCOUNT</p>
                    <div class="nav-link">
                        <a href="logout.jsp" class="nav-link-link">Logout</a>
                    </div>
                </div>
            </div>
            <div class="col-md-9 col-sm-8">
                <div class="main-content">
                    <div class="top-panel">
                        <div class="row">
                            <div class="col-md-2 col-sm-2 col-xs-2"><span class="glyphicon glyphicon-briefcase top-panel-icon"></span></div>
                            <div class="col-md-10 col-sm-10 col-xs-10"><span class="top-panel-info">EDIT STUDENT</span></div>
                        </div>
                    </div>
                    <%
                        int student_id = Integer.parseInt(request.getParameter("student_id"));
                        
                        SMSFunctionality smsfunc = new SMSFunctionality();
                        
                        ResultSet student_details = smsfunc.getStudentDetails(student_id);
                        
                        String first_name = student_details.getString("FIRSTNAME");
                        String last_name = student_details.getString("LASTNAME");
                        String email = student_details.getString("EMAIL");
                        int age = Integer.parseInt(student_details.getString("AGE"));
                        int course = Integer.parseInt(student_details.getString("COURSE"));
                        String gender = student_details.getString("GENDER");
                        String address = student_details.getString("ADDRESS");
                        int id = student_details.getInt("STUDENTID");
                    %>
                    <div class="content">
                        <form method="post" action="edit_student_db.jsp">
                            <input type="hidden" name="student_id" value="<%= id%>"/>
                            <div class="form-group">
                                <p class="text-large">First Name</p>
                                <input type="text" name="first_name" placeholder="Enter First Name" class="form-control 
                                       r-form" value="<%= first_name%>"/>
                            </div>
                            <div class="form-group">
                                <p class="text-large">Last Name</p>
                                <input type="text" name="last_name" placeholder="Enter Last Name" class="form-control 
                                       r-form" value="<%= last_name%>"/>
                            </div>
                            <div class="form-group">
                                <p class="text-large">Email</p>
                                <input type="email" name="email" placeholder="Enter Email Address" class="form-control 
                                       r-form" value="<%= email%>"/>
                            </div>
                            <div class="form-group">
                                <p class="text-large">Age</p>
                                <input type="number" name="age" value="<%= age%>" class="form-control 
                                       r-form"/>
                            </div>
                            <div class="form-group">
                                <p class="text-large">Course</p>
                                <select name="course" class="form-control r-form">
                                    <option>--Select Course--</option>
                                    <%                                        
                                        ResultSet rs = smsfunc.getCourses();
                                        
                                        while(rs.next()){
                                            int course_id = rs.getInt("COURSEID");
                                            String course_name = rs.getString("COURSENAME");
                                            %>
                                                <option value="<%= course_id%>" <%
                                                            if(course == course_id){out.print("selected");}
                                                        %>><%= course_name%></option>
                                            <%
                                        }
                                    %>
                                    <%
                                        if(rs != null){
                                            rs.close();
                                        }
                                    %>
                                </select>
                            </div>
                            <div class="form-group">
                                <p class="text-large">Gender</p>
                                <select name="gender" class="form-control r-form">
                                    <option value="Male" <%
                                                            if("Male".equals(gender)){out.print("selected");}
                                                        %>>Male</option>
                                    <option value="Female" <%
                                                            if("Female".equals(gender)){out.print("selected");}
                                                        %>>Female</option>
                                </select>
                            </div>
                            <div class="form-group">
                                <p class="text-large">Address</p>
                                <input type="text" name="address" placeholder="Enter Address" value="<%= address%>" class="form-control 
                                       r-form"/>
                            </div>
                            <input type="submit" value="UPDATE" class="btn btn-success r-button btn-block"/>
                        </form>
                    </div>
                    <%
                        if(student_details != null){
                            student_details.close();
                        }
                    %>
                </div>
            </div>
        </div>
        
        <div class="round-up"></div>
        
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
    </body>
</html>
