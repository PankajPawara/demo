<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Purchased Plans</title>
    <style>
        .h2 { padding-bottom: 30px; font-size: 25px; }
        .main-frame { background-color: #ed999a; padding: 30px; border: 2px solid gray; border-radius: 8px; }
        table { margin-top: 30px; background-color: azure; width: 100%; border: 2px solid black; border-radius: 8px; }
        thead { background-color: rgb(108, 108, 108); color: white; }
        th, td { border-radius:5px; border: 2px solid black; padding: 10px; font-weight: bold; }
        tbody > tr:nth-of-type(even) { background-color: #ffdac9;}
        .no-records { color: red; font-size: 18px; text-align: center; }
    </style>
</head>
<body>
    <h2 class="h2" align="center">Purchased Meal Plans</h2>
    
    <div class="main-frame">
        <!-- Check if there are no records -->
        <c:if test="${empty purchases}">
            <p class="no-records">No records found</p>
        </c:if>

        <!-- If there are purchased plans, display them in a table -->
        <c:if test="${not empty purchases}">
            <table>
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>User Name</th>
                        <th>Plan Name</th>
                        <th>Price</th>
                        <th>Mobile</th>
                        <th>Days</th>
                        <th>Purchase Date</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="purchase" items="${purchases}">
                        <tr>
                            <td align="center">${purchase['id']}</td>
                            <td>${purchase['username']}</td>
                            <td>${purchase['planname']}</td>
                            <td align="center">Rs. ${purchase['price']}/-</td>
                            <td align="center">+91 ${purchase['mobile']}</td>
                            <td align="center">${purchase['days']}</td>
                            <td align="center">${purchase['purchase_date']}</td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </c:if>
    </div>
</body>
</html>
