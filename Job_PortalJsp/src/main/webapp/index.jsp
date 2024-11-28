<%@page import="com.DB.DBConnect" %>
<%@ page import="java.sql.Connection" %>

<%@ page language="java" contentType="text/html; charset=UTF-8"

    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Home</title>

<%@ include file="all_component/all_css.jsp" %>

<style type="text/css">
.back-img{
		background:url("img/pic6.jpg");
		width:100%;
		height:120vh;
		background-repeat:repeat;
		background-size:cover}
</style>


</head>
<body>
<%@include file ="all_component/navbar.jsp" %>


<div class="container-fluid back-img">
	<div class="text-center">
		<h1 class ="text-white p-4" >Welcome to YugKaryA</h1>
	</div>
</div>

<%@include file="all_component/footer.jsp"  %>
</body>
</html>