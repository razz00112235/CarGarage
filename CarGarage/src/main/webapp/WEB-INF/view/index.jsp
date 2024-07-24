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

  
<body>
<%@ include file="TopHead.jsp" %>
<%@ page import="Ecommerce.Confiq_Data" %>
                 <% 
                Connection con=null;
            	try{
            		
            		con=Confiq_Data.confiq();
            		
            	
            	}catch(Exception e){
            		
            	}
            	%>

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
			

		    <%
		    String main_path=request.getContextPath();
		    String select_category = "SELECT DISTINCT product_category FROM product_add";
            PreparedStatement pd_category=con.prepareStatement(select_category);
            ResultSet result_data=pd_category.executeQuery();
            while(result_data.next()) {
            	   String category_name=result_data.getString("product_category");
            	%>
            	     <a class="dropdown-item" href="CarCategory/<%=category_name %>"><%=category_name %></a>
		                  	
            	<%
            
            }
		    
		    %>
		     
		      <!-- Add more subcategories as needed -->
		    </div>
		  </li>
		  <!-- Add more links as needed -->
		</ul>

      </div>
    </div>
  </nav>

  <div class="container mt-4">
    <!-- Main content area -->
   <div class="row mt-4">
      <!-- Item 1 -->
      
                 <% 
               
                String select_item_list="select * from product_add order by id desc ";
                PreparedStatement ps2=con.prepareStatement(select_item_list);
                ResultSet rs1=ps2.executeQuery();
                int count_item=1;
                while(rs1.next()) {
                	
                	String image_name=rs1.getString("product_image");
                	request.setAttribute("path", image_name);
                	
                %>
                <div class="col-md-3 mb-4">
			        <div class="card">
			          <img src='<c:url value="/path/product_image/${path}"></c:url>'" width="30px" height="150px" class="card-img-top" alt="Item 1">
			          <div class="card-body">
			          	<h5 class="card-title">Product Id:-  <%= rs1.getInt("product_id")%></h5>
			            <h5 class="card-title">Product Name:-<%= rs1.getString("product_name")%></h5>
			            <p>Price:- <%= rs1.getDouble("product_Price") %> INR</p>
			            <p class="card-text">Description of Item 1</p>
			            <p>Quantity:- <%= rs1.getInt("product_count") %></p>
			            <%
			            boolean stock=true;
                        if(rs1.getInt("product_count")>0)
                        {
                       	 %>
                       		
				            <a href="productPage/<%= rs1.getInt("product_id") %>" class="btn btn-success">Add2Cart</a>
                       	 
                       	 <%
                        }
                        else{
                       	 out.println(rs1.getInt("product_count")+" <label style='color:red'>Out Stock</label>");
                       	 stock=false;
                        }
                    
                    
                    %>
			          </div>
			        </div>
			      </div>
                
                <%
                count_item++;
                }
                %>
                
     
      
      <!-- Repeat similar structure for other items -->
    </div>
  </div>

  <!-- Bootstrap JS and dependencies -->
  
  <script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.5.3/dist/umd/popper.min.js"></script>
  <script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/js/bootstrap.min.js"></script>
</body>
</html>