<%@page import="com.DB.DBConnect"%>
<%@page import="com.entity.Jobs"%>
<%@page import="com.dao.JobDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Edit Job</title>
    <%@ include file="/all_component/all_css.jsp" %>
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
    <%@ include file="/all_component/navbar.jsp" %> <!-- Include the navbar inside the body -->
    
    <div class="container p-2">
        <div class="row justify-content-center align-items-center">
            <div class="col-md-10">
                <div class="card custom-bg-color shadow-sm">
                    <div class="card-header text-center">
                        <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                        
    <%
    // Fetch job ID from request parameter
    int id = Integer.parseInt(request.getParameter("id"));
    JobDAO dao = new JobDAO(DBConnect.getConn());
    Jobs j = dao.getJobById(id); // Get job details using ID
    %>
                        
                        <h5 class="mt-2">Edit Job</h5>
                    </div>
                    
                    <div class="card-body">
                        <!-- Job Editing Form -->
                        <form action="update" method="post"> <!-- Ensure form action is correct -->
                            <!-- Hidden field to pass job ID -->
                            <input type="hidden" name="id" value="<%= j.getId() %>">

                            <div class="form-group">
                                <label>Enter Title</label>
                                <input type="text" name="title" required class="form-control" value="<%= j.getTitle() %>">
                            </div>

                            <!-- Location Dropdown -->
                            <div class="form-row">
                                <div class="form-group col-md-4">
                                    <label>Location</label>
                                    <select name="location" class="custom-select" id="inlineFormCustomSelectPref">
                                        <option value="<%= j.getLocation() %>" selected><%= j.getLocation() %></option>
                                        <option value="delhi">Delhi</option>
                                        <option value="mumbai">Mumbai</option>
                                        <option value="bengaluru">Bengaluru</option>
                                        <option value="kolkata">Kolkata</option>
                                        <option value="chennai">Chennai</option>
                                        <option value="hyderabad">Hyderabad</option>
                                        <option value="ahmedabad">Ahmedabad</option>
                                        <option value="pune">Pune</option>
                                        <option value="jaipur">Jaipur</option>
                                        <option value="lucknow">Lucknow</option>
                                        <option value="bhopal">Bhopal</option>
                                        <option value="surat">Surat</option>
                                    </select>
                                </div>

                                <!-- Category Dropdown -->
                                <div class="form-group col-md-4">
                                    <label>Category</label>
                                    <select class="custom-select" id="inlineFormCustomSelectPref" name="category">
                                        <option value="<%= j.getCategory() %>" selected><%= j.getCategory() %></option>
                                        <option value="IT">IT</option>
                                        <option value="Finance">Finance</option>
                                        <option value="Marketing">Marketing</option>
                                    </select>
                                </div>

                                <!-- Status Dropdown -->
                                <div class="form-group col-md-4">
                                    <label>Status</label>
                                    <select class="form-control" name="status">
                                        <option value="<%= j.getStatus() %>" selected><%= j.getStatus() %></option>
                                        <option value="Active">Active</option>
                                        <option value="Inactive">Inactive</option>
                                    </select>
                                </div>
                            </div>

                            <!-- Job Description -->
                            <div class="form-group">
                                <label>Enter Description</label>
                                <textarea required rows="6" name="desc" class="form-control"><%= j.getDescription() %></textarea>
                            </div>

                            <!-- Submit Button -->
                            <div class="row justify-content-center align-items-center mt-5">
                                <div class="col-md-10">
                                    <div class="card-header text-center">
                                        <button type="submit" class="btn btn-success w-50">Update Job</button>
                                    </div>
                                </div>
                            </div>
                        </form>
                    </div>
                </div>
            </div>
        </div>
    </div>   
</body>
</html>
