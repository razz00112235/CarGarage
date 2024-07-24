<%@ page import="java.util.UUID" %>
<%@ page import="javax.mail.*" %>
<%@ page import="javax.mail.internet.*" %>
<%@ page import="java.util.Properties" %>
<%@ page import="java.sql.*" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>

<c:if test="${result_pass > 0}">
	<%
  
	String mainUrl = (String) request.getAttribute("main_url");
	out.println("<script type='text/javascript'>");
	out.println("alert('Password has been sent to your email.');");
	out.println("window.location.href = '" + mainUrl + "/home';");
	out.println("</script>");
  %>
</c:if>



</body>
</html>