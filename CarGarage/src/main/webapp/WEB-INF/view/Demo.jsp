<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<%@ page import="Ecommerce.Confiq_Data" %>
<%
   Connection con=null;
	try{
		
		con=Confiq_Data.confiq();
		if (con != null) {
		    out.println("Connection Created");
		} else {
			out.println("Connection Not Created");
		}

	}catch(Exception e){
		
	}
    
    out.println("Hello");

%>
</body>
</html>