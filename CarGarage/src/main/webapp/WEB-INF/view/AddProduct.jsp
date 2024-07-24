<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
     <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ page import="java.sql.*,javax.servlet.http.Part" %>
<%@ page import="java.io.*" %>
<%@ page import="java.io.*, java.util.*" %>
<%@ page import="javax.servlet.http.*" %>
<%@ page import="javax.servlet.annotation.MultipartConfig" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>FlipCart</title>
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>

</head>
<body>
<div class="container container-fluid">
<div class="row">
    <div class="col-sm-9">     
     <div class="container">
         <div class="row">
         <h3 style="text-align:center">Add Vehicle Details</h3></br>
         	<div class="col-sm-6">
		         		<form action="Product_Add" method="post" enctype="multipart/form-data">
		         
				            <div class="form-group">
				                <label>Enter Product ID</label><input type="text" class="form-control" name="product_id"  />
				            </div>
				            <div class="form-group">
				                <label>Enter Product Category</label>
				                <select class="form-control" name="product_category">		
				                     <option >--Select Vehicle Category--</option>		                     
				                	 <option value="Audi">Audi</option>
				                	 <option value="Hyundai">Hyundai</option>
				                	 <option value="Kia">Kia Cars</option>				                	 
				                	 <option value="Mahendra">Mahendra</option>
				                	 <option value="Mercedes-Benz">Mercedes-Benz Cars</option>
				                	 <option value="Maruti Suzuki">Maruti Suzuki</option>
				                	 <option value="Tata">Tata</option>				                	 
				                </select>
				            </div>
				            <div class="form-group">
				                <label>Enter Product Name</label><input type="text" class="form-control" name="product_name"  />
				            </div>
				            <div class="form-group">
				                <label>Enter Product Value</label><input type="text" class="form-control" name="product_value"  />
				            </div>
				            
				             
         	
         	</div>
         	<div class="col-sm-6">
         					
         	             	<div class="form-group">
				                <label>Enter Product Image</label><input type="file" class="form-control" name="product_image"  />
				            </div>
				            <div class="form-group">
				                <label>Description</label><textarea class="form-control" rows="5" cols="30" name="product_description" ></textarea>
				            </div>
         			        <div class="form-group">
				                <label>Enter Product Quantity</label><input type="number" min="1" class="form-control" name="product_count"  /><br>
				                <input type="submit" id="submit_tb" class="btn submit_data btn-default" name="Submit" />
				                <a href="<%=request.getContextPath() %>/home" class="btn btn-success">Home</a>
				            </div>
				        </form>  
         	
         	</div>
          
         </div>
     
     </div>
        
        
        
    </div>
    <div class="col-sm-3"></div>
</div>
<div class="row">
  <table id="first_data" class="table  table-bordered">
            <thead>
                <tr>
                    <th>S.no</th>
                    <th>Item ID</th>
                    <th>Car Category</th>
                    <th>Car Name</th>
                    <th>Price(INR)</th>
                    <th>Image</th>
                    <th>Quantity</th>
                    <th>Delete Item</th>
                    <th>update Item</th>
                    <th>Stock</th>
                </tr>
            </thead>
            <tbody>
            <c:set var="i" value="1"></c:set>
            <c:forEach var="category" items="${carData}">
				 <tr>
                    <td><c:out value="${i}" /></td>
                    <td><c:out value="${category.getProduct_id()}" /></td>
                    <td><c:out value="${category.getProduct_category()}" /></td>
                    <td><c:out value="${category.getProduct_name()}" /></td>
                    <td>
                        <c:set var="productPrice" value="${category.getProduct_price()}" />
			            <p>Price:- <fmt:formatNumber value="${productPrice}" type="number" maxFractionDigits="0" /> INR</p></td>
                    <td><img src='<c:url value="/path/product_image/${category.getProduct_image()}"></c:url>'" width="30%" height="30%" alt="No Image" /> </td>
                    <td><c:out value="${category.getProduct_count()}" /></td>
                    <td><a href="Delete_Product/<c:out value="${category.getProduct_id()}" />" class="btn btn-danger">Delete</a></td>
                    <td><a href="Update_Product/<c:out value="${category.getProduct_id()}" />" class="btn btn-primary">Update</a></td>
                    <c:if test="${category.getProduct_count() > 0}">
			            	 <td><input type="button" class="btn btn-success" value="InStock" /></td>						 
					</c:if>
                    
					<c:if test="${category.getProduct_count() == 0}">
			            	 <td><input type="button" class="btn btn-danger" value="OutStock" /></td>							 
					</c:if>
					</tr>	
					<c:set var="i" value="${i+1}" />
			</c:forEach>
				
				
                
                
               
            </tbody>
        </table>
        

</div>
</div>
</body>
</html>
