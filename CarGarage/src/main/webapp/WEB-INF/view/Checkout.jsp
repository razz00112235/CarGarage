<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ page import="java.sql.*" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>CheckOut Page</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
<%@ page import="Ecommerce.Confiq_Data" %>
<%
           String user_email=null;
           if(session.getAttribute("user_mail")!=null)
           {
        	   user_email=(String)session.getAttribute("user_mail");
               out.println("Welcome "+user_email);
               out.println("<a class='btn btn-default' href='Logout'>Logout</a>");
               out.println("<a class='btn btn-success' href='index.jsp'>Home</a>");
               Connection con=null;
           	try{
           		
           		con=Confiq_Data.confiq();
           		
           	
           	}catch(Exception e){
           		
           	}
           	
	           	long price_product=Long.parseLong(request.getParameter("product_price"));
	            
	           	int product_id=Integer.parseInt(request.getParameter("product_id"));
	           	int quantity=Integer.parseInt(request.getParameter("quantity"));
	           	String product_name=request.getParameter("product_name");
	           	
	           	String select_item_list="select * from product_add where product_id=?";
	           	PreparedStatement ps=con.prepareStatement(select_item_list);
	           	ps.setInt(1, product_id);
	           	ResultSet rs=ps.executeQuery();
	           	int total_product=0;
	           	while(rs.next())
	           	{
	           		total_product=rs.getInt("product_count");
	           	}
	           	out.println("Total Order "+quantity);
	           	total_product-=quantity;
	           	out.println("Remain Available "+total_product);
	           	
	           	String insert_product="insert into user_order (user_name,user_mail,product_id,product_name,product_quantity,product_price)values(?,?,?,?,?,?)";
	           	PreparedStatement ps2=con.prepareStatement(insert_product);
	           	ps2.setString(1, "meghraj");
	           	ps2.setString(2, "meghrajyadav.yadav20@gmail.com");
	           	ps2.setInt(3, product_id);
	           	ps2.setString(4, product_name);
	           	ps2.setInt(5, quantity);
	           	ps2.setLong(6, price_product);
	           	int insert_check=ps2.executeUpdate();
	           	if(insert_check>0)
	           	{
	           		String update_product="update product_add set product_count=? where product_id=?";
	           		PreparedStatement ps3=con.prepareStatement(update_product);
	           		ps3.setInt(1, total_product);
	           		ps3.setInt(2, product_id);
	           		 insert_check=ps3.executeUpdate();
	           		 if(insert_check>0)
	           		 {
	           			%>
	           			  <script>
	           					 $(document).ready(function() {
	           				           alert("Payment Received!...")
	           						   window.location.href = "index.jsp";
	           				        });
	           			   </script>
	           			<%
	           			
	           		 }else{
	           			 out.println("Something Wrong!...");
	           		 }
	           		
	           	}
           }else{
        	   %>
        	   <script>
					 $(document).ready(function() {
				           alert("Please Login Firstly!...")
						   window.location.href = "index.jsp";
				        });
			   </script>
			   <%
           }
       		
       %>
<%
	
	
%>

</body>
</html>