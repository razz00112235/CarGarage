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
	<form  method='post' action="<%=request.getContextPath() %>/Update_Product_data">
		<input type='hidden'  text name='product_id' value='<c:out value="${carData.getProduct_id()}"></c:out>'/>
		Product ID:<input type='text' disabled text name='product_id' value='<c:out value="${carData.getProduct_id()}"></c:out>'/>
		Product Name:<input type='text' disabled name='product_name' value='<c:out value="${carData.getProduct_name()}"></c:out>'/>
		Product Price:<input type='text' name='product_price' value='<c:out value="${carData.getProduct_price()}"></c:out>'/>
		Quantity:<input type='number' name='product_count' value='<c:out value="${carData.getProduct_count()}"></c:out>'/>
		<input type='submit' value='Update' />
	</form>
	
	
</body>
</html>