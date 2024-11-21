<%@ page contentType="text/html; charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Meal Plan</title>
</head>
<body>
    <h2>Update Meal Plan</h2>
    
    <form action="UpdateMealPlanServlet" method="post">
        <input type="hidden" name="id" value="${param.id}" />
        
        <label for="planname">Plan Name:</label>
        <input type="text" id="planname" name="planname" value="${param.planname}" required /><br>
        
        <label for="description">Description:</label>
        <textarea id="description" name="description" required>${param.description}</textarea><br>
        
        <label for="days">Days:</label>
        <input type="number" id="days" name="days" value="${param.days}" required /><br>
        
        <label for="price">Price:</label>
        <input type="number" id="price" name="price" value="${param.price}" required /><br>
        
        <button type="submit">Save Changes</button>
        <button type="button" onclick="window.location.href='DisplayMealPlanServlet'">Cancel</button>
    </form>
    
    <c:if test="${param.message != null}">
        <div style="color: green;">
            <c:choose>
                <c:when test="${param.message == 'update_success'}">Meal plan updated successfully!</c:when>
                <c:otherwise>Error updating meal plan.</c:otherwise>
            </c:choose>
        </div>
    </c:if>
</body>
</html>
