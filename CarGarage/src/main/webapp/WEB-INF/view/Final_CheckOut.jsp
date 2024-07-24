<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
    <%@ page import="java.sql.*" %>
    <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
    <%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>

<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Checkout Page</title>
  <link href="https://maxcdn.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
  
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
  <style>
    .container {
      margin-top: 50px;
    }
  </style>
</head>
<body>
<%@ include file="TopHead2.jsp" %>
<nav class="navbar navbar-expand-lg navbar-light bg-light">
    <div class="container">
      <a class="navbar-brand" href="<%=request.getContextPath() %>">CarGerage</a>
      <button class="navbar-toggler" type="button" data-toggle="collapse" data-target="#navbarNav" aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarNav">
        <ul class="navbar-nav ml-auto">
		  <li class="nav-item dropdown">
		  
		    
		  </li>
		  
		</ul>

      </div>
    </div>
  </nav>
  <div class="container">
  
    <h2>Checkout</h2>
    <div class="row">
      <div class="col-md-6">
        <h4>Billing Details</h4>
        <form action="<%=request.getContextPath() %>/payment_final" method="post">
          <div class="form-group">
            <label for="fullname">Full Name</label>
            <input type="text" class="form-control" id="fullname" name="order_user" placeholder="Enter Full Name">
          </div>
          <div class="form-group">
            <label for="email">Email Address</label>
            <input type="email" class="form-control" id="email" readonly name="order_email" value='<c:out value="${user_mail}"></c:out>'>
          </div>
          <div class="form-group">
            <label for="address">Address</label>
            <textarea class="form-control" id="address" rows="3" name="order_place" placeholder="Enter Address"></textarea>
          </div>
          <div class="form-group">
            <label for="payment">Payment Method</label>
            <select class="form-control" id="payment" name="payment_type">
              <option>Cash On Delivery</option>
              <option>Credit Card</option>
              <option>PayPal</option>
              <option>Bank Transfer</option>
              
            </select>
          </div>
          <button type="submit" id="submit_payment" class="btn btn-primary">Place Order</button>
          <a href="<%=request.getContextPath() %>/home" class="btn btn-success">Home</a>
        </form>
      </div>
      <div class="col-md-6">
        <div class="container mt-5">
    <h5 class="mb-4">Order Summery</h5>
    <table class="table">
        <thead class="thead-dark">
            <tr>
                <th scope="col">Product</th>
                <th scope="col">Category</th>
                <th scope="col">Actual Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total Price</th>
            </tr>
        </thead>
        <tbody>
            <% 
              long final_price=0;
            		
                // Retrieve cart from session
                Map<String, HashMap<String, String>> cart2 = (Map<String, HashMap<String, String>>) session.getAttribute("cart");
                if (cart2 != null) {
                    for (Map.Entry<String, HashMap<String, String>> entry : cart2.entrySet()) {
                        String productId = entry.getKey();
                        HashMap<String, String> productDetails = entry.getValue();
                        // Now you can work with productDetails HashMap
                        // For example, if you want to retrieve quantity from productDetails:
                        String Product_name = productDetails.get("product_name");
                        String Product_act_price = productDetails.get("product_act_price");
                        String Product_quantity = productDetails.get("product_quantity");
                        String Product_price = productDetails.get("product_price");
                        String product_category = productDetails.get("product_category");
                        double doubleValue = Double.parseDouble(Product_price);
                       
                        final_price=final_price+(long)doubleValue;
            %>
            <tr>
                <td> <%= Product_name %></td>
                <td> <%= product_category %></td>
                <td> <%= Product_act_price %> INR</td>
                <td> <%= Product_quantity %></td>
                <td> <%= Product_price %> INR</td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
      <h5>Total amount: <%=final_price %> INR</h5>
      </div>
      </div>
    </div>
  </div>
 <%@ include file="footer.jsp" %>
  
</body>
</html>
