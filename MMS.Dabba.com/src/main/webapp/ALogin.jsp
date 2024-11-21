<!-- ALogin.jsp -->
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Admin Login</title>
  <link rel="shortcut icon" type="image/icon" href="p1.png"/>
  <link rel="stylesheet" href="assets/css/responsive.css">      
  <style>
    * { margin: 0; padding: 0; box-sizing: border-box; }
	body { display: flex; align-items: center; justify-content: center; height: 100vh; background-color: #e1585a; font-family: Arial, sans-serif; }
	.login-frame { background-color: #ffffff; width: 400px; padding: 20px; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center; }
	.login-frame h2 { font-weight: bold; margin-bottom: 40px; color: #e1585a; }
	.input-group { margin: 10px 0; text-align: left; }
	.input-group label { font-weight: bold; color: #555; display: block; margin-bottom: 10px; }
	.input-group input { width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; margin-bottom: 20px; }
	.loginbtn { font-weight: bold; background-color: #e1585a; color: white; padding: 15px 0; border: none; border-radius: 5px; margin-top: 15px; cursor: pointer; width: 100%; }
	.loginbtn:hover { background-color: #e1585a; }
	.error-message { padding: 15px; margin-bottom: 15px; border-radius: 5px; background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb; }
  </style>
</head>
<body>
    <div class="login-frame">
        <h2>Admin Login</h2>
        <!-- ALoginController.java -->
        <form action="${pageContext.request.contextPath}/Alogin" method="post">
            <!-- Display error message if login fails -->
	        <c:if test="${not empty error}">
	            <div class="error-message">
	                ${error}
	            </div>
	        </c:if>
            <div class="input-group">
                <label for="username">Mobile or Email</label>
                <input type="text" id="username" name="username" placeholder="Enter Mobile or Email" required>
            </div>
            <div class="input-group">
                <label for="password">Password</label>
                <input type="password" id="password" name="password" placeholder="Enter Password" required>
            </div>
            <input type="submit" class="loginbtn" value="Login">
		</form>
		
    </div>
</body>
</html>
