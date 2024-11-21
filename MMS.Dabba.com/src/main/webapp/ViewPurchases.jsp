<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Purchased Plans</title>
    <style>
        .h2 { padding-bottom: 30px; font-size: 25px; }
        .main-frame { background-color: #ed999a; padding: 30px; border: 2px solid gray; border-radius: 8px; border-collapse: collapse; }
        table { margin-top: 30px; background-color: azure; width: 100%; border: 2px solid black; border-radius: 8px; }
        thead { background-color: rgb(108, 108, 108); color: white; border-top-right-radius: 8px; }
        th, td { border: 2px solid black; padding: 10px; font-weight: bold; }
    </style>
</head>
<body>
<h2 class="h2" align="center">All Purchased Meal Plans</h2>
<div class="main-frame">
    <table>
        <thead>
        <tr>
            <th scope="col">ID</th>
            <th scope="col">User Name</th>
            <th scope="col">Plan Name</th>
            <th scope="col">Price</th>
            <th scope="col">Mobile</th>
            <th scope="col">Days</th>
            <th scope="col">Purchase Date</th>
        </tr>
        </thead>
        <tbody>
        <c:forEach items="${purchasedPlans}" var="plan">
            <tr>
                <td align="center">${plan.id}</td>
                <td>${plan.username}</td>
                <td>${plan.planname}</td>
                <td align="center">Rs. ${plan.price}/-</td>
                <td align="center">${plan.mobile}</td>
                <td align="center">${plan.days}</td>
                <td align="center">${plan.purchase_date}</td>
            </tr>
        </c:forEach>
        </tbody>
    </table>
</div>
</body>
</html>
