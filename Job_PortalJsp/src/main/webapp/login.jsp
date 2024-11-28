<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Login Page</title>
    <%@ include file="/all_component/all_css.jsp" %>
</head>
<body>
    <%@ include file="/all_component/navbar.jsp" %>
    <br><br>

    <div class="container">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-6">
                <div class="card custom-bg-color shadow-sm">
                    <div class="card-header text-center">
                        <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                        <h5 class="mt-2 ">Login Page</h5>
                    </div>

                    <div class="card-body">
                    
                    <%
    String succMsg = (String) request.getAttribute("succMsg"); // Get the success message from request scope
    if (succMsg != null && !succMsg.isEmpty()) { // Check if the message is not null or empty
%>
        <h4 class="text-center text-danger"><%= succMsg %></h4>
<%
        request.removeAttribute("succMsg"); // Remove the attribute after displaying
    }
%>
                    
                    
                        <form action="login" method="post" class="form-custom-border">
                            <div class="mb-3">
                                <label for="email" class="form-label text-white">Enter Email</label>
                                <input type="email" required="required" class="form-control" id="exampleInputemail1" name="email">
                            </div>
                            
                            <div class="mb-3">
                                <label for="password" class="form-label text-white">Enter Password</label>
                                <input type="password" required="required" class="form-control" id="exampleInputPassword1" name="password">
                            </div>
                            <br></br>
                            <button type="submit" class="btn btn-primary w-100">Login</button>
                        </form>
                    </div>
                    

                   <div class="card-footer text-center">
    <i class="fa-brands fa-google fa-2x" aria-hidden="true" onclick="openGoogle()" style="margin-right: 20px; color: #DB4437;"></i> <!-- Google Red -->
    <i class="fa-brands fa-facebook fa-2x" aria-hidden="true" onclick="openFacebook()" style="margin-right: 20px; color: #4267B2;"></i> <!-- Facebook Blue -->
    <i class="fa-brands fa-linkedin fa-2x" aria-hidden="true" onclick="openLinkedIn()" style="margin-right: 20px; color: #0077B5;"></i> <!-- LinkedIn Blue -->
</div>

                </div>
            </div>
        </div>

        <div class="row justify-content-center align-items-center mt-4">
            <div class="col-md-6">
                <div class="card custom-bg-color shadow-sm">
                    <div class="card-header text-center">
                        <h5 class="mt-2">Register Here</h5>
                    </div>

                    <div class="card-body">
                        <form>
                            <div class="mb-3">
                                <button type="button" onclick="window.location.href='signup.jsp'" class="btn btn-primary w-100">Register</button>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>

    <script>
        function openGoogle() {
            window.open('https://accounts.google.com', '_blank');
        }

        function openFacebook() {
            window.open('https://www.facebook.com', '_blank');
        }

        function openLinkedIn() {
            window.open('https://www.linkedin.com', '_blank');
        }
    </script>
</body>
</html>
