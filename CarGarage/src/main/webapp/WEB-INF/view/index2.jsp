<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flipcart Services</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

  
<body>
<%@ include file="TopHead.jsp" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <a class="navbar-brand" href="#">CarGerage</a>
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
		    
		     
		   <a href="">click<</a>
		    </div>
		  </li>
		  
		</ul>

      </div>
    </div>
  </nav>
  
<div class="container mt-4">
    <!-- Main content area -->
   <div class="row mt-4">
      <!-- Item 1 -->
      
      <c:forEach var="cardetails" items="${carDetails}">
      
             
      
				<div class="col-md-3 mb-4">
			        <div class="card">
			          <img src='<c:url value="/path/product_image/${cardetails.getProduct_image()}"></c:url>'" width="30px" height="150px" class="card-img-top" alt="Item 1">
			          <div class="card-body">
			          	<h5 class="card-title">Product Id:-  <c:out value="${cardetails.getProduct_id()}" /> </h5>
			            <h5 class="card-title">Product Name:-<c:out value="${cardetails.getProduct_name()}" /></h5>
			            <c:set var="productPrice" value="${cardetails.getProduct_price()}" />
			            <p>Price:- <fmt:formatNumber value="${productPrice}" type="number" maxFractionDigits="0" /> INR</p>
			            <p class="card-text">Description of Item 1</p>
			            <p>Quantity:- <c:out value="${cardetails.getProduct_count()}" /></p>
			            <c:if test="${cardetails.product_count > 0}">
			            	 <a href="productPage/<c:out value="${cardetails.getProduct_id()}" />" class="btn btn-success">Add2Cart</a>   							 
						</c:if>
						<c:if test="${cardetails.product_count == 0}">
			            	 <label class="btn btn-info disabled" >Out Stock</label>							 
						</c:if>
			           
			          </div>
			        </div>
			      </div>
       	
       	
       	
		</c:forEach>
               
                
                
                
     
      
      <!-- Repeat similar structure for other items -->
    </div>
  </div>
<%@ include file="footer.jsp" %>
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>