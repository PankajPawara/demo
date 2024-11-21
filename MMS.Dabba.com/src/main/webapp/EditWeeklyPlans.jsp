<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit Weekly Plan</title>
    <style>
        body { margin: 0; font-family: Arial, sans-serif; background-color: #e1585a; }
        .container { display: flex; justify-content: center; align-items: center; height: 100vh; padding: 20px; }
        .form-frame { background-color: #ffffff; width: 700px; padding: 50px; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1); }
        h2 { text-align: center; color: #e1585a; margin-bottom: 20px; }
        .form-group { margin-bottom: 15px; }
        .form-group label { font-weight: bold; color: #555; display: block; margin-bottom: 5px; }
        .form-group input { width: 100%; padding: 10px; font-size: 14px; border: 1px solid #ddd; border-radius: 5px; }
        .form-group input:focus { border-color: #e1585a; outline: none; }
        .button-group { display: flex; justify-content: space-between; margin-top: 20px; }
        .btn-primary { background-color: #e1585a; color: white; font-weight: bold; padding: 15px 0; border: none; border-radius: 5px; width: 103%; cursor: pointer; }
        .btn-primary:hover { background-color: #d04c4d; }
        .cancel-btn { background-color: gray; color: white; margin: 15px 0 0 0; font-weight: bold; padding: 15px 0; border: none; border-radius: 5px; width: 103%; cursor: pointer; }
        .cancel-btn:hover { background-color: #757575; }
        .message { padding: 15px; margin-bottom: 15px; border-radius: 5px; }
        .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    </style>
</head>
<body>
    <div class="container">
        <div class="form-frame">
            <h2>Edit Weekly Plan</h2>
            <c:if test="${not empty successMessage}">
		        <div class="message success">${successMessage}</div>
		    </c:if>
		    <c:if test="${not empty errorMessage}">
		        <div class="message error">${errorMessage}</div>
		    </c:if>
		    <!-- WeeklyPlanController.java -->
            <form action="/weeklyplans/UpdateWeeklyPlans" method="post">
                <!-- Hidden input to send the id -->
                <input type="hidden" name="id" value="${mealplan.id}"/>
                
                <div class="form-group">
                    <label>Day:</label>
                    <input type="text" name="day" value="${mealplan.day}" required>
                </div>

                <div class="form-group">
                    <label>Breakfast:</label>
                    <input type="text" name="breakfast" value="${mealplan.breakfast}" required>
                </div>

                <div class="form-group">
                    <label>Lunch:</label>
                    <input type="text" name="lunch" value="${mealplan.lunch}" required>
                </div>

                <div class="form-group">
                    <label>Dinner:</label>
                    <input type="text" name="dinner" value="${mealplan.dinner}" required>
                </div>

                <button type="submit" class="btn-primary">Save Changes</button>
                <button type="button" class="cancel-btn" onclick="window.history.back();">Cancel</button>
            </form>
        </div>
    </div>
</body>
</html>
