<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" isELIgnored="false" %>
<%@ page import="java.util.Map" %>
<%@ page import="java.util.HashMap" %>
 <%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>


</head>
<body>
<div class="container-fluid ">
<div class="row">
    <div class="col-sm-3">
       <%
           if(session.getAttribute("user_mail")!=null)
           {
        	   String email=(String)session.getAttribute("user_mail");
        	   String homePath=request.getContextPath();
               out.println("Welcome "+email);
               %>
               <a class='btn btn-danger' href='<%=request.getContextPath() %>/MyOrder2'>MyOrder</a>
               <%
           }
       %>
    </div>
    <div class="col-sm-6">
		
    </div>
    <div class="col-sm-3">
        
        <%
	        if(session.getAttribute("user_mail")!=null)
	        {
	        	final String main_path=request.getContextPath();
	        	%>
	        		 <a class='btn btn-default' href='<%=request.getContextPath() %>/Logout'>Logout</a>
       				 
	        	<%
	        
	        }else{
	        	%>
	        	<a href="#" class="btn btn-success" data-toggle="modal" data-target="#loginModal">Login</a>
        		<a href="#" class="btn btn-success" data-toggle="modal" data-target="#signupModal">Signup</a>
	        	<%
	        	
	        }
            // Retrieve cart from session
            Map<String, Integer> cart3 = (Map<String, Integer>) session.getAttribute("cart");
            if(cart3 != null && !cart3.isEmpty()) {
                int itemCount = cart3.size();
        %>
                <a href="<%=request.getContextPath() %>/cart"><img src='<c:url value="/path/cart.png"></c:url>'  width="15%" height="" alt="cart" />
                <label style="cursor:pointer">Item <%= itemCount %></label></a>
        <%
            }else{
            	%><br>
            	<a href="#"><img src='<c:url value="/path/cart.png"></c:url>'  width="15%" height="" alt="cart" />
                <label style="cursor:pointer">Empty Cart</label></a>
                <%
            }
        %>
    </div>
 </div>
</div>

<!-- Flipkart Style Login Modal -->


<div class="modal fade flipkart-modal" id="loginModal" tabindex="-1" role="dialog" aria-labelledby="loginModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="loginModalLabel">Login to Flipkart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="Login" method="post">
                    <div class="form-group">
                        <label for="email">Email address</label>
                        <input type="email" class="form-control" name="email" id="email" placeholder="Enter email">
                    </div>
                    <div class="form-group">
                        <label for="password">Password</label>
                        <input type="password" class="form-control" name="pass" id="password" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Login</button>
                </form>
            </div>
            <div class="modal-footer">
                <a href="forgot_password" class="btn btn-secondary">Forgot Password</a>
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>

<!-- Flipkart Style Signup Modal -->
<div class="modal fade flipkart-modal" id="signupModal" tabindex="-1" role="dialog" aria-labelledby="signupModalLabel" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title" id="signupModalLabel">Sign Up for Flipkart</h5>
                <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="modal-body">
                <form action="SignUp" method="post">
                	<div class="form-group">
                        <label for="signupPassword">User Name</label>
                        <input type="text" class="form-control" name="user" id="signupName" placeholder="UserName">
                    </div>
                    <div class="form-group">
                        <label for="signupEmail">Email address</label>
                        <input type="email" class="form-control" name="mail" id="signupEmail" placeholder="Enter email">
                    </div>
                    
                    <div class="form-group">
                        <label for="confirmPassword">Password</label>
                        <input type="password" class="form-control" name="pass" id="userPassword" placeholder="Password">
                    </div>
                    <button type="submit" class="btn btn-primary btn-block">Sign Up</button>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
            </div>
        </div>
    </div>
</div>




</body>
</html>
