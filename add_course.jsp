<%-- 
    Document   : add_course
    Created on : Feb 27, 2020, 3:25:01 PM
    Author     : REHOBOTH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Add Course</title>
        
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
            <p class="page-info">Home | Add Course</p>
            
            <div class="extra-info">
                <p class="main-extra-info">Hi Admin, Welcome Back</p>
                <p>Welcome to Akashi's Student Management System</p>
            </div>
        </div>
        
        <%
            if(session.getAttribute("add_course_msg") != null){
                %>
                    <div class="col-md-6 col-md-offset-3 page-session">
                        <div class="alert alert-success alert-dismissible r-alert">
                            <a href="#" class="close" data-dismiss="alert" aria-label="close">&times;</a>
                            <%
                                out.print(session.getAttribute("add_course_msg").toString());
                            %>
                        </div>
                    </div>
                <%
                session.removeAttribute("add_course_msg");
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
                            <div class="col-md-10 col-sm-10 col-xs-10"><span class="top-panel-info">ADD COURSE</span></div>
                        </div>
                    </div>
                    <div class="content">
                        <form method="post" action="add_course_db.jsp">
                            <div class="form-group">
                                <p class="text-large">Course Name</p>
                                <input type="text" name="course_name" placeholder="Enter Course Name" class="form-control 
                                       r-form"/>
                            </div>
                            <input type="submit" value="ADD" class="btn btn-success r-button btn-block"/>
                        </form>
                    </div>
                </div>
            </div>
        </div>
        
        <div class="round-up"></div>
        
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
    </body>
</html>
