<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Edit User</title>
    <link rel="shortcut icon" type="image/icon" href="p1.png"/>
    <style>
        *, body { margin: 0; padding: 0; box-sizing: border-box; }
        body { margin-top: 150px; margin-bottom: 150px; display: flex; align-items: center; justify-content: center; height: 100vh; background-color: #e1585a; font-family: Arial, sans-serif; }
        .reg-frame { background-color: #ffffff; width: 700px; padding: 20px; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; }
        legend { font-size: 18px; font-weight: bold; color: #e1585a; padding: 0 5px; text-align: left; }
        h2 { font-weight: bold; margin-bottom: 20px; color: #e1585a; }
        .input-group { display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-top: 15px; }
        .input-group label, .input-group input { width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 5px; }
        .input-group label { text-align: left; font-weight: bold; background-color: #f9f9f9; border: none; padding: 0; }
        .section-box { background-color: #f9f9f9; padding: 15px; border: 1px solid #ddd; border-radius: 8px; margin-bottom: 20px; }
        .reg-btn { font-weight: bold; background-color: #e1585a; color: white; padding: 15px 0; border: none; border-radius: 5px; margin-top: 15px; cursor: pointer; width: 100%; }
        .reg-btn:hover { background-color: #d04c4d; }
        .cancel-btn { font-weight: bold; background-color: gray; color: white; padding: 15px 0; border: none; border-radius: 5px; cursor: pointer; width: 100%; margin-top: 15px; }
        .cancel-btn:hover { background-color: #757575; }
        .message { padding: 15px; margin-bottom: 15px; border-radius: 5px; }
        .success { background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb; }
        .error { background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
    </style>
</head>
<body>
    <div class="reg-frame">
        <h2>Edit User Information</h2>

        <!-- Display Success or Error Messages -->
        <c:if test="${not empty successMessage}">
            <div class="message success">
                ${successMessage}
            </div>
        </c:if>
        <c:if test="${not empty errorMessage}">
            <div class="message error">
                ${errorMessage}
            </div>
        </c:if>
		<!-- UserController.java -->
        <form action="/user/update" method="post">
            <!-- Hidden ID Field -->
            <input type="hidden" name="id" value="${user.id}"/>
    		<!-- Hidden Password Field -->
            <input type="hidden" name="password" value="${user.password}"/>

            <!-- Personal Information Section -->
            <fieldset class="section-box">
                <legend>Personal Information</legend>
                <div class="input-group">
                    <label for="name">*Name:</label>
                    <input type="text" name="name" id="name" value="${user.name}" required>
                </div>
            </fieldset>

            <!-- User Information Section -->
            <fieldset class="section-box">
                <legend>Contact Details</legend>
                <div class="input-group">
                    <label for="mobile">*Mobile No:</label>
                    <label for="email">Email Address:</label>
                    <input type="text" name="mobile" id="mobile" value="${user.mobile}" required>
                    <input type="email" name="email" id="email" value="${user.email}" required>
                </div>
            </fieldset>

            <!-- Address Details Section -->
            <fieldset class="section-box">
                <legend>Address Details</legend>
                <div class="input-group">
                    <label for="city">*City/Village:</label>
                    <label for="district">*District:</label>
                    <input type="text" name="city" id="city" value="${user.city}" required>
                    <input type="text" name="district" id="district" value="${user.district}" required>
                </div>
                <div class="input-group">
                    <label for="state">*State:</label>
                    <label for="pincode">*Pincode:</label>
                    <input type="text" name="state" id="state" value="${user.state}" required>
                    <input type="text" name="pincode" id="pincode" value="${user.pincode}" required>
                </div>
            </fieldset>

            <!-- Submit and Cancel Buttons -->
            <button type="submit" class="reg-btn">Save Changes</button>
            <button type="button" class="cancel-btn" onclick="window.history.back();">Cancel</button>
        </form>
    </div>
</body>
</html>
