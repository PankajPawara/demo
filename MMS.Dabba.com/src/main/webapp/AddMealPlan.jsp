<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <title>Add Meal Plan</title>
    <style>
        body { background-color: #e1585a; font-family: Arial, sans-serif; }
        .container { display: flex; justify-content: center; align-items: center; height: 100vh; }
        .form-frame { background-color: #ffffff; width: 500px; padding: 30px; border-radius: 8px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        h2 { text-align: center; color: #e1585a; }
        .input-group { margin-bottom: 15px; }
        .input-group label { display: block; margin-bottom: 5px; color: #555; font-weight: bold; }
        .input-group input { width: 100%; padding: 10px; border: 1px solid #ddd; border-radius: 5px; }
        .btn-submit { width: 100%; padding: 10px; background-color: #e1585a; color: white; border: none; border-radius: 5px; font-weight: bold; cursor: pointer; }
        .btn-submit:hover { background-color: #d04c4d; }
        .message {padding: 15px; margin-bottom: 15px; border-radius: 5px;} 
		.success {background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb;} 
		.error {background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb;}
        
    </style>
</head>
<body>
    <div class="container">
        <div class="form-frame">
            <h2>Add New Meal Plan</h2>
            <!-- MealPlanController.java -->
            <form action="/add" method="post">
            	<c:if test="${not empty success}">
			        <div class="message success">${success}</div>
			    </c:if>
			    <c:if test="${not empty error}">
			        <div class="message error">${error}</div>
			    </c:if>
                <div class="input-group">
                    <label for="planname">Plan Name:</label>
                    <input type="text" name="planname" required>
                </div>
                <div class="input-group">
                    <label for="description">Description:</label>
                    <input type="text" name="description" required>
                </div>
                <div class="input-group">
                    <label for="days">Days:</label>
                    <input type="number" name="days" required>
                </div>
                <div class="input-group">
                    <label for="price">Price:</label>
                    <input type="number" name="price" required>
                </div>
                <button type="submit" class="btn-submit">Add Meal Plan</button>
            </form>
        </div>
    </div>
</body>
</html>
