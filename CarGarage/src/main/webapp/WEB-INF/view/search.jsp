<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="java.sql.*" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Search Results</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<select class='form-control' name='product_id' id='result_data'>
	<c:forEach var="data" items="${search_data}">
		<option value='<c:out value="${data.getProduct_id()}" />'><c:out value="${data.getProduct_name()}" /></option>
	</c:forEach>
    
</select>


<%-- <%@ page import="Ecommerce.Confiq_Data" %>
<%
    String searchItem = request.getParameter("search_item");
    
    Connection con=null;
    Statement statement = null;
    ResultSet resultSet = null;
    con=Confiq_Data.confiq();
   
    String select_item_list="select product_name,product_id from product_add where product_name like'"+searchItem+"%'";
    statement=con.createStatement();
    resultSet=statement.executeQuery(select_item_list);
    out.println("<select class='form-control' name='product_id' id='result_data'>");
    while(resultSet.next())
    {
    	int id=resultSet.getInt("product_id");
    	out.println("<option value='"+id+"'>"+resultSet.getString("product_name")+"</option>");
    }
    out.println("</select>");
   // out.println("<option>item1</option><option>item2</option></select>");
%> --%>

</body>
</html>
