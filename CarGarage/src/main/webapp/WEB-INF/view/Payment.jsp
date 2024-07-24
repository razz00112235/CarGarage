   <%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Payment Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<%
  
    String main_path=request.getContextPath();
    out.println(main_path);
  	
    %>
    <script>
				 $(document).ready(function() {
			           alert("Payment Successfully !...")		
			           window.location.href = "<%=main_path%>";
			        });
		   </script>
       
		



</body>
</html>