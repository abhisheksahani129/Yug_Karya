<%@page import="com.dao.JobDAO"%>
<%@ page import="java.util.ArrayList" %>
<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="ISO-8859-1"> 
    <title>User: More Jobs</title>
    <%@ include file="all_component/all_css.jsp" %>
    <style>
        .job-card {
            margin-top: 1em;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }
        .job-title {
            color: #007bff;
            font-size: 1.25em;
            font-weight: bold;
        }
        .job-info {
            font-size: 0.9em;
            color: #555;
        }
        .btn-details {
            margin-top: 10px;
            background-color: #28a745;
            color: white;
            transition: 0.3s;
        }
        .btn-details:hover {
            background-color: #218838;
        }
        .no-jobs {
            color: #dc3545;
            font-size: 1.1em;
            margin-top: 20px;
        }
    </style>
</head>
<body style="background-color: #f0f1f2;">

<%-- <% 
    // Redirect to login page if user is not logged in
    if (session.getAttribute("userobj") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%> --%>

<%@ include file="all_component/navbar.jsp" %>

<div class="container">
    <div class="row">
        <div class="col-md-12">
            <h5 class="text-center text-primary mt-4">All Jobs</h5>

            <%
                String loc = request.getParameter("loc");
                String cat = request.getParameter("cat");
                String msg = "";

                JobDAO dao = new JobDAO(DBConnect.getConn());
                List<Jobs> list= null;

                if ("lo".equals(loc) && "ca".equals(cat)) {
                    list = new ArrayList<Jobs>(); // Initialize to an empty list
                    msg="Job is not available 2";
                
                } else if ("lo".equals(loc) || "ca".equals(cat)) {
                	
                    list = dao.getJobsORLocationAndCate(cat, loc);
                } else {
                	
                    list = dao.getJobsAndLocationAndCate(cat, loc);
                }

                if (list.isEmpty()) {
            %>
                <p class="text-center no-jobs"> Job is not available 3</p>
            <%
                } 
                
               if(list!=null){
                    for (Jobs j : list) {
            %>
            <div class="card job-card">
                <div class="card-body">
                    <div class="text-center text-primary">
                        <i class="fas fa-clipboard-list fa-2x"></i>
                    </div>
                    <h5 class="job-title text-center mt-2"><%= j.getTitle() %></h5>
                    <p class="text-muted"><%= j.getDescription().length() > 100 ? j.getDescription().substring(0, 100) + "..." : j.getDescription() %></p>

                    <div class="form-row job-info">
                        <div class="form-group col-md-4">
                            <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                        </div>
                        <div class="form-group col-md-4">
                            <input type="text" class="form-control form-control-sm" value="Publish Date: <%= j.getPdate() %>" readonly>
                        </div>
                    </div>

                    <div class="text-center mt-3">
                        <a href="one_view.jsp?id=<%= j.getId() %>" class="btn btn-details">
                            <i class="fas fa-info-circle"></i> View Details
                        </a>
                    </div>
                </div>
            </div>
            <%
                    }
                } else {
            %>
                <h4 class="text-center text-danger">No Jobs Found3</h4>
            <%
                }
            %>
</div>
        </div>
    </div>


</body>
</html>
