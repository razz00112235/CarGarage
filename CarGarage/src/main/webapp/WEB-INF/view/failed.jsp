<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
</head>
<body>
  <%
    String main_path=request.getContextPath();
  	session=request.getSession(false);
    session.invalidate();
    %>
    <script>
				 $(document).ready(function() {
			           alert("Please Fill Correct User Details!...");		
			           window.location.href = "<%=main_path%>";
			        });
		   </script>
    <%
   // response.sendRedirect(main_path);
    
  
  %>
</body>
</html>