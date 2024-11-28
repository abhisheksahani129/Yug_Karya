<%@ page import="com.entity.Jobs" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User: Single Job</title>
    <%@include file="all_component/all_css.jsp" %>
    <style>
        .job-details-container {
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .job-details-container h2 {
            color: #007bff;
        }
        .job-info {
            font-size: 0.9em;
            color: #555;
        }
        .btn-back {
            margin-top: 20px;
            background-color: #007bff;
            color: white;
        }
        .btn-back:hover {
            background-color: #0056b3;
            color: white;
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">

<% 
    // Redirect to login page if the user is not logged in
    if (session.getAttribute("userobj") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%@include file="all_component/navbar.jsp" %>

<div class="container my-5">
    <div class="row justify-content-center">
        <div class="col-md-8">
            <div class="job-details-container">
                <% 
                    // Retrieve and validate the 'id' parameter
                    String idParam = request.getParameter("id");
                    if (idParam != null) {
                        try {
                            int id = Integer.parseInt(idParam);  // Parse the 'id' as an integer
                            JobDAO dao = new JobDAO(DBConnect.getConn());
                            Jobs j = dao.getJobById(id);

                            if (j != null) { 
                %>

                <!-- Job Title -->
                <h2><%= j.getTitle() %></h2>

                <!-- Job Meta Information -->
                <p class="job-info">
                    <strong>Category:</strong> <%= j.getCategory() %> |
                    <strong>Location:</strong> <%= j.getLocation() %> |
                    <strong>Publish Date:</strong> <%= j.getPdate() %>
                </p>

                <!-- Job Description -->
                <div class="form-group">
                    <label><strong>Description:</strong></label>
                    <p><%= j.getDescription() %></p>
                </div>

                <!-- Back Button -->
                <div class="text-center">
                    <a href="home.jsp" class="btn btn-back">Back to Jobs</a>
                </div>

                <% 
                            } else { 
                                out.println("<h4>Job not found.</h4>");
                            }
                        } catch (NumberFormatException e) {
                            out.println("<h4>Invalid job ID format.</h4>");
                        }
                    } else {
                        out.println("<h4>Job ID is missing.</h4>");
                    }
                %>
            </div>
        </div>
    </div>
</div>

</body>
</html>
