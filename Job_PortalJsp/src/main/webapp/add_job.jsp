<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<%
    if (session.getAttribute("userobj") == null || !"admin".equals(((com.entity.User)session.getAttribute("userobj")).getRole())) {
        response.sendRedirect("login.jsp");
        return;
    }
%>
<meta charset="UTF-8">
<title>Add Jobs</title>
<%@ include file="/all_component/all_css.jsp" %>
<style>
    /* Additional custom styling */
    .custom-bg-color { background-color: #f5f5f5; }
    .custom-select, .form-control { border-radius: 5px; }
    .btn-success { transition: 0.3s; }
    .btn-success:hover { background-color: #28a745; color: #fff; transform: scale(1.05); }
    .tooltip-text { color: #6c757d; font-size: 0.85em; }
</style>
</head>
<body>
<%@ include file="/all_component/navbar.jsp" %> <!-- Include the navbar inside the body -->
<div class="container p-4">
    <div class="row justify-content-center align-items-center">
        <div class="col-md-10">
            <div class="card custom-bg-color shadow-sm">
                <div class="card-header text-center">
                    <h5 class="mt-2">Add New Job Position</h5>
                    <%
                        String succMsg = (String) session.getAttribute("succMsg");
                        if (succMsg != null && !succMsg.isEmpty()) {
                    %>
                        <div class="alert alert-success alert-dismissible fade show" role="alert">
                            <%= succMsg %>
                            <button type="button" class="close" data-dismiss="alert" aria-label="Close">
                                <span aria-hidden="true">&times;</span>
                            </button>
                        </div>
                    <%
                            session.removeAttribute("succMsg");
                        }
                    %>
                </div>

                <div class="card-body">
                    <form action="add_job" method="post" onsubmit="showLoading()">
                        <div class="form-group">
                            <label>Enter Title <i class="fa fa-info-circle tooltip-text" style="color: #17a2b8;" title="Provide the job title"></i></label>
                            <input type="text" name="title" required class="form-control" placeholder="E.g., Senior Software Engineer">
                        </div>

                        <!-- Location Dropdown -->
                        <div class="form-row">
                            <div class="form-group col-md-4">
                                <label>Location <i class="fa fa-map-marker" style="color: #28a745;" title="Select the job location"></i></label>
                                <select name="location" class="custom-select">
                                    <option selected disabled>Choose location...</option>
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
                                </select>
                            </div>

                            <!-- Category Dropdown -->
                            <div class="form-group col-md-4">
                                <label>Category <label>Category <i class="fa fa-briefcase" style="color: #17a2b8;" title="Specify the job category"></i></label>
                                <select name="category" class="custom-select">
                                    <option selected disabled>Choose category...</option>
                                    <option value="IT">IT</option>
                                    <option value="Finance">Finance</option>
                                    <option value="Marketing">Marketing</option>
                                       <option value="Professor">Professor</option>
                                      <option value="Banking">Banking</option>
                                    
                                </select>
                            </div>

                            <!-- Status Dropdown -->
                            <div class="form-group col-md-4">
                                <label>Status <i class="fa fa-toggle-on" style="color: #ffc107;" title="Set the job status"></i></label> <select name="status" class="form-control">
                                    <option value="Active">Active</option>
                                    <option value="Inactive">Inactive</option>
                                </select>
                            </div>
                        </div>

                        <!-- Job Description -->
                        <div class="form-group">
                            <label>Enter Description <i class="fa fa-pencil tooltip-text" style="color: #ffc107;" title="Describe the job requirements"></i></label>
                            <textarea name="desc" rows="4" required class="form-control" placeholder="Provide a detailed description of the job role and requirements."></textarea>
                        </div>

                        <!-- Publish Job Button with loading indicator -->
                        <div class="text-center">
                            <button type="submit" class="btn btn-success w-50" id="publishButton">
                                Publish Job
                                <span id="loadingSpinner" class="spinner-border spinner-border-sm ml-2 d-none" role="status" aria-hidden="true"></span>
                            </button>
                        </div>
                    </form>"/Users/abhisheksahani/Downloads/demo"
                </div>
            </div>
        </div>
    </div>
</div>

<script>
    // Show loading spinner on button click
    function showLoading() {
        document.getElementById("publishButton").disabled = true;
        document.getElementById("loadingSpinner").classList.remove("d-none");
    }
</script>
</body>
</html>
