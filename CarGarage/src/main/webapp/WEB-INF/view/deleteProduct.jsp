<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ page import="Ecommerce.Confiq_Data" %>
<%

	Integer product_id = (Integer) request.getAttribute("product_id");
	out.println(product_id);

	Connection con=null;
	 
    
    try {
    	con=Confiq_Data.confiq();
		String delet_dataString="delete from product_add where product_id=?";
		PreparedStatement ps=con.prepareStatement(delet_dataString);
		ps.setInt(1, product_id);
		int x=ps.executeUpdate();
		if(x>0)
		{
			String main_path=request.getContextPath();
			response.sendRedirect(main_path+"/AddProduct");
		}
	} catch (Exception e) {
		e.printStackTrace();
	}
%>
</body>
</html>