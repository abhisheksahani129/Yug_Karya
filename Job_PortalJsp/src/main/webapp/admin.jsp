<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Admin</title>
 <%@ include file="/all_component/all_css.jsp" %>
 <style type="text/css">
 .back-img{
 background: url("img/pic1.png");
 height:90vh;
 width:100%;
 background-repeat:no repeat;
 background-size:cover;
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

<div class="container-fluid back-img">
    <div class="text-center">
        <h1 class="text-white p-4">Welcome Admin</h1>
    </div>
</div>
<%@ include file="all_component/footer.jsp" %>

</body>
</html>
