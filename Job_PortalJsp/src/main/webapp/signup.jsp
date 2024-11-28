<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Signup page</title>
<%@ include file="/all_component/all_css.jsp" %>
<style>
   
</style>
</head>
<body style="bacground-color:#a0a0a0">

<%@include file ="/all_component/navbar.jsp" %>
<br></br>
 <div class="container">
<div class="row justify-content-center align-items-center h-100">
    <div class="col-md-6">
       <div class="card custom-bg-color shadow-sm">
            <div class="card-header text-center">
                <i class="fa fa-user-plus fa-2x" aria-hidden="true"></i>
                <h5 class="mt-2">Registration Page</h5>
            </div>
			<%-- <c:if test="${not empty succMsg}">
			<h4 class="text-center text-success">${succMsg }</h4>
			<c:remove var="succMsg"/>
			</c:if>
			 --%>
			 <%
    String succMsg = (String) session.getAttribute("succMsg");
    if (succMsg != null) {
%>
        <h4 class="text-center text-success"><%= succMsg %></h4>
<%
        session.removeAttribute("succMsg");  // This removes the attribute after displaying it
    }
%>
			 
			 <div class="card-body">
			<form action= "add_user" method="post">
				<div class="form-group text-white">
					<label for="name">Enter Full Name</label>
					<input type="text" required="required" class="form-control" id="name" name="name">
				</div>
				
				<div class="form-group text-white">
					<label for="qua">Enter Qualification</label>
					<input type="text" required="required" class="form-control" id="qua" name="qua">
				</div>
				<div class="form-group text-white">
    <label for="con">Contact number</label>
    <input type="text" required="required" class="form-control" id="con" name="con" placeholder="contact number"
        maxlength="10" pattern="\d{10}" title="Please enter a 10-digit contact number">
</div>
				
				<div class="form-group text-white">
					<label for="email">Enter Email</label>
					<input type="email" required="required" class="form-control" id="email" name="email">
				</div>
				
				

				
				
				<div class="form-group text-white">
					<label for="ps">Enter Password</label>
					<input type="password" required="required" class="form-control" id="ps" name="ps">
				</div>
				<br></br>
				
				<button type="submit" class="btn btn-primary w-100">Register</button>
			</form>
		</div>
		</div>
			</div>
	</div>
</div>
</body>
</html>
