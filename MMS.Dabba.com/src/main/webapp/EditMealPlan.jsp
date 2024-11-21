<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Meal Plan</title>
    <link rel="shortcut icon" type="image/icon" href="p1.png"/>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background-color: #e1585a; }
        .container { display: flex; justify-content: center; align-items: center; height: 100vh; padding: 20px; }
        .form-frame { background-color: #fff; width: 700px; padding: 50px; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        h2 { text-align: center; color: #e1585a; margin-bottom: 20px; }
        .section-box { padding: 20px; margin-bottom: 20px; background-color: #f9f9f9; border-radius: 8px; border: 1px solid #ddd; }
        .section-box legend { font-size: 18px; font-weight: bold; color: #e1585a; }
        .input-group { margin-bottom: 15px; padding: 0 30px; }
        .input-group label { font-weight: bold; color: #555; margin-bottom: 5px; display: block; }
        .input-group input { width: 100%; padding: 10px; font-size: 14px; border: 1px solid #ddd; border-radius: 5px; }
        .input-group input:focus { border-color: #e1585a; outline: none; }
        .btn { width:103%; padding: 15px 0; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; }
        .btn-primary { background-color: #e1585a; color: white; }
        .btn-primary:hover { background-color: #d04c4d; }
        .cancel-btn { font-weight: bold; background-color: gray; color: white; padding: 15px 0; border: none; border-radius: 5px; cursor: pointer; margin-top: 15px; }
        .cancel-btn:hover { background-color: #757575; }
        .message {padding: 15px; margin-bottom: 15px; border-radius: 5px;} 
		.success {background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb;} 
		.error {background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb;}
        
    </style>
</head>
<body>
    <div class="container">
        <div class="form-frame">
            <h2>Edit Meal Plan</h2>
            <!-- MealPlanController.java -->
            <form action="/update-mealplan" method="post">
	            <!-- Displaying error/success message if available -->
		        <c:if test="${not empty success}">
			        <div class="message success">${success}</div>
			    </c:if>
			    <c:if test="${not empty error}">
			        <div class="message error">${error}</div>
			    </c:if>
			    <input type="hidden" name="id" value="${mealplan.id}">
			    <div class="input-group">
			        <label for="planname">Plan Name:</label>
			        <input type="text" name="planname" id="planname" value="${mealplan.planname}" required>
			    </div>
			    <div class="input-group">
			        <label for="description">Description:</label>
			        <input type="text" name="description" id="description" value="${mealplan.description}" required>
			    </div>
			    <div class="input-group">
			        <label for="days">Days:</label>
			        <input type="number" name="days" id="days" value="${mealplan.days}" required>
			    </div>
			    <div class="input-group">
			        <label for="price">Price:</label>
			        <input type="number" name="price" id="price" value="${mealplan.price}" required>
			    </div>
			    <div class="input-group">
			        <button type="submit" class="btn btn-primary">Save Changes</button>
			        <button type="button" class="btn cancel-btn" onclick="window.history.back();">Cancel</button>
			    </div>
			</form>
        </div>
    </div>
</body>
</html>
