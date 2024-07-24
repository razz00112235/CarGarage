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
</head>
<body>
<% 

	String user_email=null;
    String main_path=request.getContextPath();
   if(session.getAttribute("user_mail")!=null)
	{
		String productId = request.getParameter("product_id");
		String product_name=request.getParameter("product_name");
		String product_act_price=request.getParameter("product_ac_price");
		String product_quantity=request.getParameter("quantity");
		String product_price=request.getParameter("product_price");
		String product_category=request.getParameter("product_category");
		
		Map<String, HashMap<String, String>> cart = (Map<String, HashMap<String, String>>) session.getAttribute("cart");

		// Check if the cart exists in the session; if not, create a new one
		if (cart == null) {
		    cart = new HashMap<>();
		    session.setAttribute("cart", cart);
		}

		// Create a new map to store product details
		HashMap<String, String> productDetails = new HashMap<>();
		
		out.println(productId);
		if(!cart.containsKey(productId))
		{
			out.println("Not Key");
			productDetails.put("product_name", product_name);
    		productDetails.put("product_act_price", product_act_price);
    		productDetails.put("product_quantity", product_quantity);
    		productDetails.put("product_price", product_price);
    		productDetails.put("product_category", product_category);
    		
		}else{
			HashMap<String,String> data=cart.get(productId);
			
			productDetails.put("product_name", product_name);
			productDetails.put("product_act_price", product_act_price);
			int old_quantity=Integer.parseInt(data.get("product_quantity"));
			
			int new_quantity=old_quantity+Integer.parseInt(product_quantity);
			
			Double old_price=Double.parseDouble(data.get("product_price"));
			
			Double new_price=old_price+Double.parseDouble(product_price);
			productDetails.put("product_quantity", String.valueOf(new_quantity));
    		productDetails.put("product_price", String.valueOf(new_price));
			productDetails.put("product_category", product_category);
			
			
		}
		cart.put(productId, productDetails);
		
	    response.sendRedirect(main_path+"/home");
		
	}else{
		
		%>
 	   <script>
				 $(document).ready(function() {
			           alert("Please Login Firstly!...")
			           window.location.href = "<%= main_path %>/home";
			        });
		   </script>
		   <%
		   
		  
	}
    
%>
</body>
</html>