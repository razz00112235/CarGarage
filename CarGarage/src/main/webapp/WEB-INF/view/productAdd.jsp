<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false"%>
    
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
product page!.....
 <%@ page import="Ecommerce.Confiq_Data" %>
	<%
	
	/*Connection con=null;
	ServletContext sc=request.getServletContext();
	
	
	try {
		 con=Confiq_Data.confiq();
	} catch (Exception e1) {
		// TODO Auto-generated catch block
		e1.printStackTrace();
	}
	
	
	response.setContentType("text/html");
	PrintWriter wr=response.getWriter();
	String product_id,product_name,product_value,product_image,product_count,product_category,product_description;
	product_id=request.getParameter("product_id");
	product_category=request.getParameter("product_category");
	product_name=request.getParameter("product_name");
	product_value=request.getParameter("product_value");
	product_count=request.getParameter("product_count");
	product_description=request.getParameter("product_description");
	System.out.println("kjjh");
	Part image=request.getPart("product_image");
	product_image=image.getSubmittedFileName(); 
	System.out.println(product_image);
	
	if(product_id !=null && product_name!=null && product_value!=null &&  product_count!=null && product_image!=null) {
	   
	    try {
	      
	   	
	   	String add_query="insert into product_add(product_id,product_name,product_price,product_image,product_count,product_category,product_description) values(?,?,?,?,?,?,?)";
	       PreparedStatement ps1=con.prepareStatement(add_query);
	       ps1.setInt(1,Integer.parseInt(product_id));
	       ps1.setString(2, product_name);
	       ps1.setFloat(3,Long.parseLong(product_value));
	       ps1.setString(4, product_image);
	       ps1.setInt(5, Integer.parseInt(product_count));
	       ps1.setString(6, product_category);
	       ps1.setString(7, product_description);
	       int count=ps1.executeUpdate();
	       
	       
	       String upload_file_path="C:/Users/DELL/eclipse-workspace/Flipcart/src/main/webapp/product_image/"+product_image;
			
			FileOutputStream fout=new FileOutputStream(upload_file_path);
			InputStream is=image.getInputStream();
	   	byte []data=new byte[is.available()];
	   	is.read(data);
	   	fout.write(data);
	   	fout.flush();
	   	fout.close();
	   	
	       if(count>0) {
	       	response.sendRedirect("AddProduct");
	       	
	       	
	       }
	   } catch(Exception e) {
	       e.printStackTrace();
	   }
	}*/
	
	%>
</body>
</html>