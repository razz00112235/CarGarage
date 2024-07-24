<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    <%@ page import="java.util.Map" %>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.util.HashMap" %>
  <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@page import="java.sql.*" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Product Page</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">


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
		    <a class="nav-link dropdown-toggle" href="" id="carsDropdown" role="button" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
		      Cars
		    </a>
		    
		  </li>
		  
		</ul>

      </div>
    </div>
  </nav>
 <div class="container">
     <div class="row">
     	
    
     </div>
    <div class="row">
        
      	<div class="col-md-6 col-md-offset-3">
      
       <c:forEach var="category" items="${carDetails}">
				<h2 class="text-center"><c:out value="${category.getProduct_name()}" /></h2>
        <div class="thumbnail">
          <img style="text-align:center" src='<c:url value="/path/product_image/${category.getProduct_image()}"></c:url>'" width="50%" height="50%" alt="No Image" />
                    
          <div class="caption">
            <h5 style="text-align:justify"><b>Description:-</b> <c:out value="${category.getProduct_description()}" /></h5>
                     <c:set var="productPrice" value="${category.getProduct_price()}" />
			            <p>Price:- <fmt:formatNumber value="${productPrice}" type="number" maxFractionDigits="0" /> INR</p>
            <p><strong>Availability:</strong>
            <c:if test="${cardetails.product_count > 0}">
			           <label>${cardetails.product_count} In Stock</label>  							 
			</c:if>
			<c:if test="${cardetails.product_count == 0}">
			           <label>${cardetails.product_count} Out Stock</label>  	
			           <label >Amount</label><input class="form-control" disabled id="price2" type="text" value="0.0"   />
						<input type="submit" disabled class="btn btn-success" name="Order" value="Order" />
						
						<a href="/home" class="btn btn-success">Home</a>						 
			</c:if>
			<form action="${main_controller}/addToCart" method="post">
				    <input type="hidden" name="product_category" value="<c:out value='${category.getProduct_category()}' />" />
				    <input type="hidden" name="product_name" value="<c:out value='${category.getProduct_name()}' />" />
				    <input type="hidden" name="product_id" value="<c:out value='${category.getProduct_id()}' />" />
				    <input type="hidden" name="product_ac_price" value="<c:out value='${category.getProduct_price()}' />" />
				    <input type="hidden" id="per_item_price" value="<c:out value='${category.getProduct_price()}' />" />
				    <input class="form-control" type="number" min="1" max="<c:out value='${category.getProduct_count()}' />" id="quantity" placeholder="Choose Quantity" name="quantity" /><br>
				    <input class="form-control" id="price" type="hidden" value="0.0" name="product_price" />
				    <label>Amount</label>
				    <input class="form-control" id="price2" type="text" value="0.0" readonly />
				    <input type="submit" class="btn btn-success" name="Order" value="Order" />
				   
				    <a href="${main_controller}/home" class="btn btn-success">Home</a>
				</form>
                     
           
           

            
           
            <!-- Add more product information here -->
          </div>
        </div>
         </c:forEach>
      </div>
       
      
    </div>
 </div>

<script>
$(document).ready(function(){
	<!--$("#quantity").on('blur keypress ', function(event) {-->
	 $("#quantity").on('mouseleave', function(event) {
	        // Check if the key pressed is Enter (key code 13)
	        if (event.type === 'keypress' && event.which !== 13) {
	            return;
	        }

	        var quantity = $(this).val();
	        var price = parseFloat($("#per_item_price").val());
	        quantity = parseInt(quantity);

	        if (!isNaN(quantity) && quantity > 0 && !isNaN(price)) {
	            var totalPrice = price * quantity;
	            $("#price").val(totalPrice.toFixed(2)); // Update input value with the calculated total price
	            $("#price2").val(totalPrice.toFixed(2)); // Update another input value if needed
	        }
	    });
  
   
});
</script>
<%@ include file="footer.jsp" %>
</body>
</html>