<%@ page import="com.entity.Jobs" %>
<%@ page import="java.util.List" %>
<%@ page import="com.DB.DBConnect" %>
<%@ page import="com.dao.JobDAO" %>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>User: View Jobs</title>
    <%@ include file="/all_component/all_css.jsp" %>
    <style>
        /* Additional Styling */
        .job-card {
            border: 1px solid #dee2e6;
            padding: 1em;
            border-radius: 5px;
        }
        .form-inline .form-group {
            margin-right: 1em;
        }
        .btn-submit {
            background-color: #28a745;
            color: white;
            transition: 0.3s;
        }
        .btn-submit:hover {
            background-color: #218838;
            color: white;
        }
        .icon-primary {
            color: #007bff;
        }
        .view-more-btn {
            background-color: #007bff;
            color: white;
        }
        .view-more-btn:hover {
            background-color: #0056b3;
        }
    </style>
</head>
<body>
    <%@ include file="/all_component/navbar.jsp" %>

    <div class="container">
        <div class="row">
            <div class="col-md-12">
                <h5 class="text-center text-primary mt-4">All Jobs</h5>
                
                	 <%
    String succMsg = (String) session.getAttribute("succMsg");
    if (succMsg != null) {
%>
        <h4 class="text-center text-success"><%= succMsg %></h4>
<%
        session.removeAttribute("succMsg");  // This removes the attribute after displaying it
    }
%>

                <!-- Search Form -->
                <div class="card job-card mt-4 shadow-sm">
                    <div class="card-body">
                        <form class="form-inline" action="more_view.jsp" method="get" onsubmit="showLoading()">
                            <div class="form-group">
                                <label for="location">Location</label>
                                <select name="location" class="custom-select ml-2" id="inlineFormCustomSelectPref">
                                    <option value="lo" selected>Choose...</option>
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

                            <div class="form-group">
                                <label for="category">Category</label>
                                <select name="category" class="custom-select ml-2" id="inlineFormCustomSelectPref">
                                    <option value="lo" selected>Choose..</option>
                                    <option value="IT">IT</option>
                                    <option value="Finance">Finance</option>
                                    <option value="Marketing">Marketing</option>
                                    <option value="Professor">Professor</option>
                                    <option value="Banking">Banking</option>
                                </select>
                            </div>

                            <button type="submit" class="btn btn-submit ml-5">Search</button>
                            <span id="loadingSpinner" class="spinner-border spinner-border-sm ml-2 d-none" role="status" aria-hidden="true"></span>
                        </form>
                    </div>
                </div>

                <!-- Job Listings -->
                <%
                    JobDAO dao = new JobDAO(DBConnect.getConn());
                    List<Jobs> list = dao.getAllJobsForUser();
                    for (Jobs j : list) {
                %>
                <div class="card job-card mt-2 shadow-sm">
                    <div class="card-body">
                        <div class="text-center text-primary">
                            <i class="fas fa-clipboard-list fa-2x"></i>
                        </div>
                        <h5 class="mt-2"><%= j.getTitle() %></h5>

                        <% if (j.getDescription().length() > 120) { %>
                        <p><%= j.getDescription().substring(0, 120) %>...</p>
                        <% } else { %>
                        <p><%= j.getDescription() %></p>
                        <% } %>

                        <div class="form-row mt-3">
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Location: <%= j.getLocation() %>" readonly>
                            </div>
                            <div class="form-group col-md-3">
                                <input type="text" class="form-control form-control-sm" value="Category: <%= j.getCategory() %>" readonly>
                            </div>
                        </div>

                        <h6>Publish Date: <%= j.getPdate().toString() %></h6>

                        <div class="text-center mt-3">
                            <a href="one_view.jsp?id=<%= j.getId() %>" class="btn view-more-btn">View More</a>
                        </div>
                    </div>
                </div>
                <% } %>
            </div>
        </div>
    </div>

    <script>
        // Display loading spinner on form submit
        function showLoading() {
            document.getElementById("loadingSpinner").classList.remove("d-none");
        }
    </script>
    <%@ include file="all_component/footer.jsp" %>
</body>
</html>
