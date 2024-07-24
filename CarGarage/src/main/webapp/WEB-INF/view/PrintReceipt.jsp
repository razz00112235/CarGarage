<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" isELIgnored="false" %>
<%@ taglib prefix = "c" uri = "http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Payment Receipt</title>
    <link href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" rel="stylesheet">
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f7f7f7;
        }
        .receipt-container {
            max-width: 600px;
            margin: 20px auto;
            background-color: #fff;
            padding: 20px;
            border-radius: 8px;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        .header {
            text-align: center;
            margin-bottom: 20px;
        }
        .header h1 {
            margin: 0;
            font-size: 24px;
        }
        .header p {
            margin: 5px 0;
            color: #888;
        }
        .details, .items {
            margin-bottom: 20px;
        }
        .details table, .items table {
            width: 100%;
            border-collapse: collapse;
        }
        .details th, .details td, .items th, .items td {
            padding: 10px;
            text-align: left;
            border-bottom: 1px solid #ddd;
        }
        .details th {
            background-color: #f2f2f2;
        }
        .items th {
            background-color: #f9f9f9;
        }
        .total {
            text-align: right;
            margin-top: 20px;
        }
        .total h2 {
            margin: 0;
        }
    </style>
    <script>
        function printReceipt() {
            window.print();
        }

        window.onload = function() {
            printReceipt();
        }
    </script>
</head>
<body>
<a href="<%=request.getContextPath() %>/home" class="btn btn-success">Home</a>

   <div class="receipt-container">
        <div class="header">
            <h1>Payment Receipt</h1>
            <p>Thank you for your purchase!</p>
        </div>
        <div class="details">
            <h2>Receipt Details</h2>
            <table>
        <c:set var="count" value="0"/>
        <c:forEach var="receipt_data" items="${fetch_receipt_data}">
            <c:if test="${count == 0}">
                <tr>
                    <th>Receipt Number:</th>
                    <td><c:out value="${receipt_data.order_id}"></c:out></td>
                </tr>
                <tr>
                    <th>Date:</th>
                    <td><c:out value="${receipt_data.purchase_date}"></c:out></td>
                </tr>
                <tr>
                    <th>Customer Name:</th>
                    <td><c:out value="${receipt_data.user_name}"></c:out></td>
                </tr>
                <tr>
                    <th>Email:</th>
                    <td><c:out value="${receipt_data.user_mail}"></c:out></td>
                </tr>
                <c:set var="count" value="${count + 1}"/>
            </c:if>
        </c:forEach>
    </table>
        </div>
        <div class="items">
            <h2>Purchased Items</h2>
            <table>
                <tr>
                    <th>Item</th>
                    <th>Quantity</th>
                    <th>Price</th>
                </tr>
                <c:set var="total_price" value="0"></c:set>
                <c:forEach var="receipt_data" items="${fetch_receipt_data}">
                  
                         <tr>
		                    <td><c:out value="${receipt_data.getProduct_name()}"></c:out></td>
		                    <td><c:out value="${receipt_data.getProduct_quantity()}"></c:out></td>
		                    <td><c:out value="${receipt_data.getProduct_price()}"></c:out> INR</td>
		                 </tr>
                   <c:set var="total_price" value="${total_price=total_price+receipt_data.getProduct_price()}"></c:set>
                </c:forEach>               
                
            </table>
        </div>
        <div class="total">
            <h2>Total: <c:out value="${total_price}"></c:out> INR</h2>
            
        </div>
    </div> 
</body>
</html>
