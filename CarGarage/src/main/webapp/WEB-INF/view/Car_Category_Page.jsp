<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Flipcart Services</title>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<%@ include file="TopHead.jsp" %>

<%-- ${product_data} --%>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <a class="navbar-brand" href="<%=request.getContextPath() %>">CarGerage</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
		  <li class="nav-item dropdown">
		    <a class="nav-link dropdown-toggle" href="" id="carsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      Cars
		    </a>
		    <div class="dropdown-menu" aria-labelledby="carsDropdown">
			
				<c:forEach var="category" items="${product_category}">
				<a class="dropdown-item" href="<%=request.getContextPath() %>/Product_Category_Page/<c:out value="${category.getCar_category_name()}" />"><c:out value="${category.getCar_category_name()}" /></a>
   					 <br>
				</c:forEach>
		    
		     
		   
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
      
      <c:forEach var="cardetails" items="${product_data}">
				<div class="col-md-3 mb-4">
			        <div class="card">
			          <img src='<c:url value="/path/product_image/${cardetails.getProduct_image()}"></c:url>'" width="30px" height="100%" class="card-img-top" alt="Item 1">
			          <div class="card-body">
			          	<h5 class="card-title">Product Id:-  <c:out value="${cardetails.getProduct_id()}" /> </h5>
			            <h5 class="card-title">Product Name:-<c:out value="${cardetails.getProduct_name()}" /></h5>
			            <p>Price:- <c:out value="${cardetails.getProduct_price()}" /> INR</p>
			            <p class="card-text">Description of Item 1</p>
			            <p>Quantity:- <c:out value="${cardetails.getProduct_count()}" /></p>
			            <c:if test="${cardetails.product_count > 0}">
			            	 <a href="<%=request.getContextPath() %>/productPage/<c:out value="${cardetails.getProduct_id()}" />" class="btn btn-success">Add2Cart</a>   							 
						</c:if>
						<c:if test="${cardetails.product_count == 0}">
			            	 <label class="btn btn-info disabled" > Out Stock</label>							 
						</c:if>
			           
			          </div>
			        </div>
			      </div>
       	
       	
       	
		</c:forEach>
               
                
                
                
     
      
      <!-- Repeat similar structure for other items -->
    </div>
  </div>
<%@ include file="footer.jsp" %>


</body>
</html>