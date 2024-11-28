<%@page import="com.entity.User"%>

<nav class="navbar navbar-expand-lg navbar-dark bg-dark"> <!-- Changed to a darker navbar -->
    <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarSupportedContent" aria-controls="navbarSupportedContent" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
    </button>

    <div class="collapse navbar-collapse" id="navbarSupportedContent">
        <ul class="navbar-nav mr-auto align-items-center"> <!-- Flexbox for alignment -->
            <li class="nav-item">
                <a class="nav-link" href="index.jsp">
                    <img src="img/pic4.png" style="width: 80px; height: 60px; vertical-align: middle;"> YugKaryA
                </a>
            </li>
            <li class="nav-item">
                <a class="nav-link contact-link" href="#">Contact Us</a>
            </li>


		
	<% 
    // Check if 'userobj' exists in session and has 'admin' role
    Object userObj = session.getAttribute("userobj");
    if (userObj != null && ((com.entity.User) userObj).getRole().equals("admin")) {
%>
    <li class="nav-item">
        <a class="nav-link" href="add_job.jsp"><i class="fa fa-plus-circle"></i> Post Job</a>
    </li>
    <li class="nav-item">
        <a class="nav-link" href="view_job.jsp"><i class="fas fa-eye"></i> View Jobs</a>
    </li>
<% 
    } 
%>

      
       
      <!-- <li class="nav-item dropdown">
        <a class="nav-link dropdown-toggle" href="#" id="navbarDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
          Dropdown
        </a>
        <div class="dropdown-menu" aria-labelledby="navbarDropdown">
          <a class="dropdown-item" href="#">Action</a>
          <a class="dropdown-item" href="#">Another action</a>
          <div class="dropdown-divider"></div>
          <a class="dropdown-item" href="#">Something else here</a>
        </div>
      </li> -->
    
    </ul>
    <form class="form-inline my-2 my-lg-0">
   
      <input class="form-control mr-sm-2" type="search" placeholder="Search" aria-label="Search">
      <button class="btn btn-outline-success my-2 my-sm-0 mr-1" type="submit">Search</button>
      
      
<%
    User userobj = (User) session.getAttribute("userobj"); // Retrieve user object from session
    if (userobj != null) { // User is logged in
        if ("admin".equals(userobj.getRole())) { // Check if the user is an admin
%>
            <a href="#" class="btn btn-light mr-1"><i class="fas fa-user"></i>Admin</a>
            <a href="logout" class="btn btn-light"><i class="fas fa-sign-in-alt"></i>Logout</a>
<%
        } else if ("user".equals(userobj.getRole())) { // Check if the user is a regular user
%>
            <a href="#" class="btn btn-light mr-1" data-toggle="modal" data-target="#exampleModal">
                <i class="fas fa-user"></i><%= userobj.getName() %>
            </a>
            <a href="logout" class="btn btn-light" style="margin-right: 10px;">
                <i class="fas fa-sign-in-alt"></i>Logout
            </a>
<%
        }
    } else { // User is not logged in
%>
        <a href="login.jsp" class="btn btn-light mr-1"><i class="fa-solid fa-right-to-bracket"></i>Login</a>
        <a href="signup.jsp" class="btn btn-light"><i class="fas fa-user"></i>SignUp</a>
<%
    }
%>
    </form>
  </div>
</nav>

<!-- Modal -->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Profile</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        	
        	<div class="card">
        	<div class="text-center text-primary">
        	<i class="fas fa-user-circle fa-3x"></i>
        	</div>
        	<table class="table">
        	<tbody>
        		<tr>
        			<th scope="row">Name</th>
        			<th><%= userobj != null ? userobj.getName() : "N/A" %></th>
        			</tr>
        		<tr>
        			<th scope="row">Qualification</th>
        			<th><%= userobj != null ? userobj.getQualification() : "N/A" %></th>
        			</tr>
        			
        		<tr>
        			<th scope="row">Email</th>
        			<th><%= userobj != null ? userobj.getEmail() : "N/A" %></th>
        			</tr>	
        		<tr>
        			<th scope="row">Contact</th>
        			<th><%= userobj != null ? userobj.getContact() : "N/A" %></th>
        			</tr>	
        	</tbody>
        	</table>
        	</div>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
         <a href="edit_profile.jsp" class="btn btn-primary" >Edit </a>
      </div>
    </div>
  </div>
</div>