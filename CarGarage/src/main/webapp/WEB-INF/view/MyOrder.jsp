<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Previous Orders</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
</head>
<body>
<%@ include file="TopHead.jsp" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <a class="navbar-brand" href="<%=request.getContextPath() %>">CarGerage</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" href="#" id="carsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      Cars
		    </a>
		    <div class="dropdown-menu" aria-labelledby="carsDropdown">
			
				<c:forEach var="category" items="${product_category}">
				<a class="dropdown-item" href="Product_Category_Page/<c:out value="${category.getCar_category_name()}" />"><c:out value="${category.getCar_category_name()}" /></a>
   					 <br>
				</c:forEach>
		    
		     
		   
		    </div>
		  </li>
		  
		</ul>

      </div>
    </div>
  </nav>
<div class="container container-fluid">

    <h1 class="display-4 mt-5 mb-4">Previous Orders</h1>
    <table class="table">
        <thead>
            <tr>
                <th>S.No</th>
                <th>Purchase Date</th>
                <th>User Name</th>
                <th>Order Id</th>
                <th>Payment Mode</th>
                <th>Print Receipt</th>
            </tr>
        </thead>
        <tbody>
        <c:set var="i" value="1" ></c:set>
        <c:forEach var="OrderItem" items="${orderData}">
        		<tr>
        		   <td><c:out value="${i}"></c:out></td>
        		   <td><c:out value="${OrderItem.getPurchase_date()}"></c:out></td>
        		   <td><c:out value="${OrderItem.getUser_name()}"></c:out></td>
        		   <td><c:out value="${OrderItem.getOrder_id()}"></c:out></td>
        		   <td><c:out value="${OrderItem.getPayment_mode()}"></c:out></td>
        		   <td><a href="PrintReceipt/<c:out value="${OrderItem.getOrder_id()}"></c:out>">Click Here</a></td>
        		</tr>
        		<c:set var="i" value="${i+1}" ></c:set>
        </c:forEach>
            
        </tbody>
    </table>
</div>
<%@ include file="footer.jsp" %>
</body>
</html>
