<%@page import="java.util.List"%>
<%@page import="com.DB.DBConnect"%>
<%@page import="com.dao.JobDAO"%>
<%@page import="com.entity.Jobs"%> 
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Admin: View Jobs</title>
    <%@ include file="/all_component/all_css.jsp" %>

    <!-- Add some styling for spacing and visuals -->
    <style>
        body {
            background-color: #f8f9fa;
        }
        .job-card {
            border-radius: 10px;
            background-color: #a0a0a5;
            border: 1px solid #dee2e6;
        }
        .job-card .card-body {
            padding: 30px;
        }
        .job-card h6 {
            font-weight: bold;
            color: #343a40;
        }
        .job-details {
            font-size: 14px;
            color: #6c757d;
        }
        .btn-custom {
            width: 140px;
        }
    </style>
</head>
<body>
<%
    // Check if the session already contains 'userobj' and verify if the user is an admin
    if (session.getAttribute("userobj") == null || !"admin".equals(((com.entity.User)session.getAttribute("userobj")).getRole())) {
        // Redirect to login if not an admin
        response.sendRedirect("login.jsp");
        return;
    }
%>
    <%@ include file="/all_component/navbar.jsp" %>

    <br><br>

    <!-- Container for Job Cards -->
    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary">All Jobs</h5>

   <!-- Display Success Message Without Using EL -->
                        <%
                            String succMsg = (String) session.getAttribute("succMsg");
                            if (succMsg != null && !succMsg.isEmpty()) {
                        %>
                            <div class="alert alert-success" role="alert">
                                <%= succMsg %>
                            </div>
                        <%
                                session.removeAttribute("succMsg");
                            }
                        %>
               
   <%   
      JobDAO dao = new JobDAO(DBConnect.getConn());
      List<Jobs> list = dao.getAllJobs();
      for(Jobs j : list) { %>
                             
                       <!-- Example Job Card -->
                <div class="card job-card mt-4 shadow-sm">
                    <div class="card-body">
                        <div class="text-center text-primary mb-3">
                            <i class="fa fa-clipboard fa-2x"></i>
                        </div>
                        
                         <!-- Job Title -->
                        <h6 class="text-center"><%= j.getTitle()%></h6>

                        <!-- Job Description -->
                        <p class="text-center text-black"><%= j.getDescription() %></p>
							<br>
                        <!-- Job Details -->
                        <div class="form-row text-center">
                            <div class="form-group col-md-4">
                                <input type="text" class="form-control form-control-sm" value="Location:<%= j.getLocation() %>" readonly>
                            </div>
                            <div class="form-group col-md-4">
                                <input type="text" class="form-control form-control-sm" value="Category:<%= j.getCategory() %>" readonly>
                            </div>
                            <div class="form-group col-md-4">
                                <input type="text" class="form-control form-control-sm" value="Status:<%= j.getStatus() %> " readonly>
                            </div>
                        </div>

                        <!-- Publish Date -->
                        <h6 class="text-center job-details">Publish Date:<%=j.getPdate() %></h6>

                        <!-- Buttons (Edit & Delete) -->
                        <div class="text-center mt-3">
                            <a href="edit_job.jsp?id=<%= j.getId() %>"  class="btn btn-sm bg-success text-white btn-custom">Edit</a>
                            
                            <a href="delete?id=<%= j.getId() %>" class="btn btn-sm bg-danger text-white btn-custom">Delete</a>
                        </div>
                    </div>
                </div>
                          
           <%}
    	
    	%>            
            </div>
        </div>
    </div>

</body>
</html>
