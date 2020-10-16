<%-- 
    Document   : index
    Created on : Feb 27, 2020, 3:22:41 PM
    Author     : REHOBOTH
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
        <title>Login</title>
        
        <link type="text/css" rel="stylesheet" href="css/bootstrap.css"/>
        <link type="text/css" rel="stylesheet" href="css/style.css"/>
        
        <style type="text/css">
            
        </style>
    </head>
    <body>
        
        <div class="container-fluid">
            <div class="login jumbotron">
                <div class="text-center">
                    <h1>Login</h1>
                    <p>Login to Akashi's Student Management System</p>
                </div>
                <form method="post" action="login_db.jsp">
                    <div class="form-group">
                        <p>Username</p>
                        <input type="text" name="username" class="form-control r-form" placeholder="Enter Username" autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <p>Password</p>
                        <input type="password" name="password" class="form-control r-form" placeholder="Enter Password" autocomplete="off"/>
                    </div>
                    <div class="form-group">
                        <button type="submit" class="btn btn-md btn-success r-button">SUBMIT</button>
                        <button type="reset" class="btn btn-md btn-danger r-button">RESET</button>
                    </div>
                    <div class="text-center">
                        <%
                            if(session.getAttribute("login_page_msg") != null){
                                %>
                                    <p><%
                                            out.print(session.getAttribute("login_page_msg").toString());
                                        %></p>
                                <%
                                session.removeAttribute("login_page_msg");
                            }
                        %>
                    </div>
                </form>
            </div>
        </div>
        
        <script type="text/javascript" src="js/jquery-3.3.1.js"></script>
        <script type="text/javascript" src="js/bootstrap.js"></script>
    </body>
</html>
