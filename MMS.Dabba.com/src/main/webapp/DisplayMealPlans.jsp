<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Meal Plans</title>
    <style>
        .h2 { padding-bottom: 30px; font-size: 25px; }
        .main-frame { background-color: #ed999a; padding: 30px; border: 2px solid gray; border-radius: 8px;}
        table { margin-top: 30px; background-color: azure; width: 100%; border: 2px solid black; border-radius: 8px; }
        thead { background-color: rgb(108, 108, 108); color: white; }
        th, td { border-radius:5px; border: 2px solid black; padding: 10px; font-weight: bold; }
        tbody > tr:nth-of-type(even) { background-color: #ffdac9;}
        .price{width:10%}
        .div{ display:flex;}
        .btn-edit, .btn-delete { margin: 5px; padding: 5px 10px; color: white; font-weight: bold; border-radius: 5px; text-decoration: none; }
        .btn-edit { background-color: #007bff; }
        .btn-delete { background-color: #dc3545; }
        .btn-edit:hover, .btn-delete:hover { opacity: 0.8; }
        .btn-add { background-color: #28a745; color: white; padding: 10px 20px; font-weight: bold; border-radius: 5px; text-decoration: none; display: inline-block; }
        .btn-add:hover { opacity: 0.8; }
        .no-records { color: red; font-size: 18px; text-align: center; }
    </style>
</head>
<body>
    <h2 class="h2" align="center">Meal Plan Details</h2>

    <!-- Flash Messages -->
    <c:if test="${not empty success}">
        <p style="color: green; text-align: center;">${success}</p>
    </c:if>
    <c:if test="${not empty error}">
        <p style="color: red; text-align: center;">${error}</p>
    </c:if>

    <div align="center">
        <a href="/add" class="btn-add">Add New Meal Plan</a>
    </div>

    <h2 align="center" style="padding-top: 30px;">Available Meal Plans</h2>
    <br>
    <!-- Display Available Meal Plans -->
    <c:if test="${empty mealPlans}">
        <p class="no-records">No meal plans available</p>
    </c:if>

    <c:if test="${not empty mealPlans}">
        <div class="main-frame">
            <table>
                <thead>
                    <tr>
                        <th scope="col">Plan ID</th>
                        <th scope="col">Plan Name</th>
                        <th scope="col">Description</th>
                        <th scope="col">Days</th>
                        <th scope="col" class="price">Price</th>
                        <th scope="col">Action</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="mealPlan" items="${mealPlans}">
                        <tr>
                            <td align="center">${mealPlan.id}</td>
                            <td>${mealPlan.planname}</td>
                            <td>${mealPlan.description}</td>
                            <td align="center">${mealPlan.days}</td>
                            <td align="center">Rs. ${mealPlan.price}/-</td>
                            <td align="center"> <!-- MealPlanController.java -->
							    <div class="div">
								    <a href="/edit-mealplan/${mealPlan.id}" class="btn-edit">Edit</a>
								    <a href="/delete-mealplan/${mealPlan.id}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this meal plan?');">Delete</a>
								</div> <!-- MealPlanController.java -->
							</td> 
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </c:if>
</body>
</html>
