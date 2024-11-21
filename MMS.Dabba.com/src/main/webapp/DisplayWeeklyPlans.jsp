<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Weekly Meal Plan</title>
    <style>
        .h2 { padding-bottom: 30px; font-size: 25px; }
        .main-frame { background-color: #ed999a; padding: 30px; border: 2px solid gray; border-radius: 8px; }
        table { margin-top: 30px; background-color: azure; width: 100%; border: 2px solid black; border-radius: 8px; }
        thead { background-color: rgb(108, 108, 108); color: white; }
        th, td { border-radius:5px; border: 2px solid black; padding: 10px; font-weight: bold; }
        tbody > tr:nth-of-type(even) { background-color: #ffdac9;}
        .btn-edit { padding: 5px 10px; color: white; font-weight: bold; background-color: #007bff; border-radius: 5px; text-decoration: none; }
        .btn-edit:hover { opacity: 0.8; }
    </style>
</head>
<body>
    <h2 class="h2" align="center">Weekly Meal Plan</h2>
    <c:if test="${not empty errorMessage}">
        <p style="color: red;">${errorMessage}</p>
    </c:if>
    <c:if test="${not empty successMessage}">
        <p style="color: green;">${successMessage}</p>
    </c:if>
    <div class="main-frame">
        <table>
            <thead>
                <tr>
                <th>ID</th>
                <th>Day</th>
                <th>Breakfast</th>
                <th>Lunch</th>
                <th>Dinner</th>
                <th>Action</th>
	            </tr>
	        </thead>
	        <tbody>
	            <c:forEach var="plan" items="${weeklyPlans}">
	                <tr>
	                    <td align="center">${plan.id}</td>
	                    <td align="center">${plan.day}</td>
	                    <td>${plan.breakfast}</td>
	                    <td>${plan.lunch}</td>
	                    <td>${plan.dinner}</td>
	                    <td align="center"><a class="btn-edit" href="/weeklyplans/editWeeklyPlan/${plan.id}">Edit</a></td>
	                </tr>                         <!-- WeeklyPlanController.java -->
	            </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
