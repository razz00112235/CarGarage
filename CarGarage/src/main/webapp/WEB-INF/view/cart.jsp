<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Add2Cart Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
<style>
   .cart-item {
  margin-bottom: 10px;
}

.quantity {
  display: flex;
  align-items: center;
}

.quantity span {
  margin-right: 5px;
}

.quantity-value {
  margin: 0 5px;
  width: 30px;
  text-align: center;
}

.decrease-btn,
.increase-btn {
  width: 30px;
  height: 30px;
  background-color: #ccc;
  border: none;
  cursor: pointer;
}

.decrease-btn:hover,
.increase-btn:hover {
  background-color: #aaa;
}

</style>
</head>
<body>
<%@ include file="TopHead.jsp" %>
<div class="container mt-5">
    <h5 class="mb-4">Shopping Cart</h5>
    <table class="table">
        <thead class="thead-dark">
            <tr>
            	<th scope="col">Product ID</th>
                <th scope="col">Product</th>
                <th scope="col">Category</th>
                <th scope="col">Actual Price</th>
                <th scope="col">Quantity</th>
                <th scope="col">Total Price</th>
                
            </tr>
        </thead>
        <tbody>
            <% 
                // Retrieve cart from session
                Map<String, HashMap<String, String>> cart2 = (Map<String, HashMap<String, String>>) session.getAttribute("cart");
                if (cart2 != null) {
                    for (Map.Entry<String, HashMap<String, String>> entry : cart2.entrySet()) {
                        String productId = entry.getKey();
                        HashMap<String, String> productDetails = entry.getValue();
                        String Product_name = productDetails.get("product_name");
                        String Product_act_price = productDetails.get("product_act_price");
                        String Product_quantity = productDetails.get("product_quantity");
                        String Product_price = productDetails.get("product_price");
                        String product_category = productDetails.get("product_category");
            %>
            <tr>
           	    <td id="product_id"> <%= entry.getKey() %></td>
            	<td> <%= Product_name %></td>
            	
                <td> <%= product_category %></td>
                <td id="product_actual_price_<%= entry.getKey() %>"> <%= Product_act_price %> INR</td>
                <td >
						<div class="cart-item">
						  <span>Item Name</span>
						  <div class="quantity">
						    <span>Quantity: </span>
						    <button id="<%= entry.getKey() %>" class="decrease-btn">-</button>
						    <span id="span_<%= entry.getKey() %>" class="quantity-value">
						    
						    <% 
						       String quantity=Product_quantity;
						    %>
						     <%= Product_quantity %>
						       
						    
						    </span>
						    <button id="<%= entry.getKey() %>" class="increase-btn">+</button>
						  </div>
						</div>
						

				</td>
                <td id="product_price_<%= entry.getKey() %>"> <%= Product_price %> INR</td>
            </tr>
            <%
                    }
                }
            %>
        </tbody>
    </table>
    
    <%
    String main_path=request.getContextPath();
       if(cart2.size()==0)
       {
    	   %>
    	   	 <a href="Final_CheckOut" class="btn btn-success btn-checkout" style="pointer-events: none;opacity: 0.6;cursor: not-allowed;">CheckOut Here</a>
    	   <%
       }else
       {
    	   %>
    	   <a href="Final_CheckOut" class="btn btn-success btn-checkout">CheckOut Here</a>
    	   <%
       }
       
    
    %>
    <a href="<%=main_path %>/home" class="btn btn-success">Home</a>
    
    <script>
    		$(document).ready(function(){
    			
    			$(".increase-btn").click(function(){
    				var buttonId = $(this).attr("id");    				
    				var currentValue = parseInt($("#span_" + buttonId).text());    				
    		        var newValue = currentValue + 1;
    		        $("#span_" + buttonId).text(newValue);   
    		        
    		        
    		        var product_price = parseInt($("#product_actual_price_" + buttonId).text());  
    		        var actual_price=parseInt($("#product_price_"+ buttonId).text());
    		        var currentPrice=product_price*newValue;
    		        $("#product_price_"+ buttonId).text(currentPrice+" INR");    		        
    		        var product_id=buttonId;
    		         
    		        $.ajax({
                        type: "POST",
                        url: "UpdateCart", // Replace with the actual servlet URL
                        data: {
                        	id:product_id,
    		                key:"product_quantity",
    		                value:newValue,
    		                product_price:currentPrice
                        },
                        success: function (response) {
                            
                        }
                    });
    		            
    		        
    				
    			});
    			
    			$(".decrease-btn").click(function(){ 
    				var buttonId = $(this).attr("id");    
    				var currentValue = parseInt($("#span_" + buttonId).text());  
    				if(currentValue>0)
					{
    					
    					var newValue = currentValue - 1;    		        
        		        $("#span_" + buttonId).text(newValue);
        		        var product_price=parseInt($("#product_actual_price_" + buttonId).text());
        		        var final_price=product_price*newValue;
        		        $("#product_price_"+ buttonId).text(final_price+" INR");
        		        var product_id=buttonId;
        		        
        		       
        		       $.ajax({
                            type: "POST",
                            url: "UpdateCart", // Replace with the actual servlet URL
                            data: {
                            	id:product_id,
        		                key:"product_quantity",
        		                value:newValue,
        		                product_price:final_price
                            },
                            success: function (response) {
                                
                            }
                        });
        		            
        		        
					}
    				else if(currentValue==0)
    					{
    					  var buttonId = $(this).attr("id"); 
    					  var product_id=buttonId;
    					  var newValue=0;
    					  var final_price=0;
	    					$.ajax({
	                            type: "POST",
	                            url: "UpdateCart", // Replace with the actual servlet URL
	                            data: {
	                            	id:product_id,
	        		                key:"product_quantity",
	        		                value:newValue,
	        		                product_price:final_price
	                            },
	                            success: function (response) {
	                                
	                            }
	                        });
    					}
    				
    				
    		        
    				
    			});
    		});
    		
    
    </script>
</div>

</body>
</html>
