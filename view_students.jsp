<%-- 
    Document   : view_students
    Created on : Feb 27, 2020, 4:11:19 PM
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
        <title>View Students</title>
        
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
            <p class="page-info">Home | View Students</p>
            
            <div class="extra-info">
                <p class="main-extra-info">Hi Admin, Welcome Back</p>
                <p>Welcome to Akashi's Student Management System</p>
            </div>
        </div>
        
        <%
            if(session.getAttribute("view_students_msg") != null){
                %>
                    <div class="col-md-6 col-md-offset-3 page-session">
                        <div class="alert alert-success alert-dismissible r-alert">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <%
                                out.print(session.getAttribute("view_students_msg").toString());
                            %>
                        </div>
                    </div>
                <%
                session.removeAttribute("view_students_msg");
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
                            <div class="col-md-10 col-sm-10 col-xs-10"><span class="top-panel-info">VIEW STUDENTS</span></div>
                        </div>
                    </div>
                    <div class="content">
                        <div class="table-responsive">
                            <table class="table table-bordered">
                                <thead>
                                    <tr>
                                        <th>ID</th>
                                        <th>First Name</th>
                                        <th>Last Name</th>
                                        <th>Email</th>
                                        <th>Age</th>
                                        <th>Course</th>
                                        <th>Gender</th>
                                        <th>Address</th>
                                        <th></th>
                                    </tr>
                                </thead>             
                              
                                <tbody>
                                    <%
                                        SMSFunctionality smsfunc = new SMSFunctionality();
                                        
                                        ResultSet rs = smsfunc.getStudents();
                                        
                                        while(rs.next()){
                                            int student_id = rs.getInt("STUDENTID");
                                            String first_name = rs.getString("FIRSTNAME");
                                            String last_name = rs.getString("LASTNAME");
                                            String email = rs.getString("EMAIL");
                                            int age = rs.getInt("AGE");
                                            int course_id = rs.getInt("COURSE");
                                            String gender = rs.getString("GENDER");
                                            String address = rs.getString("Address");
                                            //String course_name = smsfunc.getCourseName(course_id);
                                            %>
                                                <tr>
                                                    <td><%= student_id%></td>
                                                    <td><%= first_name%></td>
                                                    <td><%= last_name%></td>
                                                    <td><%= email%></td>
                                                    <td><%= age%></td>
                                                    <td><%= course_id%></td>
                                                    <td><%= gender%></td>
                                                    <td><%= address%></td>
                                                    <td>
                                                        <a href="edit_student.jsp?student_id=<%= student_id%>" class="btn btn-success r-button">EDIT</a>
                                                        <a href="delete_student_db.jsp?student_id=<%= student_id%>" class="btn btn-danger r-button">DELETE</a>
                                                    </td>
                                                </tr>
                                            <%
                                        }
                                    %>
                                    <%
                                        if(rs != null){
                                            rs.close();
                                        }
                                    %>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="round-up"></div>
        
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
    </body>
</html>
