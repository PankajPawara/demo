<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Forgot Password</title>

  <link rel="shortcut icon" type="image/icon" href="p1.png"/>
  <style>
    * {margin: 0; padding: 0; box-sizing: border-box;} 
	body {display: flex; align-items: center; justify-content: center; height: 100vh; background-color: #e1585a; font-family: Arial, sans-serif;} 
	.forgot-password-frame {background-color: #ffffff; width: 500px; padding: 20px; border-radius: 10px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center;} 
	.forgot-password-frame h2 {font-weight: bold; margin-bottom: 30px; color: #e1585a;} 
	.input-group {margin: 10px 0; text-align: left;} 
	.input-group label {font-weight: bold; color: #555; display: block; margin-bottom: 10px;} 
	.input-group input {width: 100%; padding: 8px; border-radius: 5px; border: 1px solid #ccc; margin-bottom: 20px;} 
	.reset-btn {font-weight: bold; background-color: #e1585a; color: white; padding: 15px 0; border: none; border-radius: 5px; margin-top: 10px; cursor: pointer; width: 100%;} 
	.reset-btn:hover {background-color: #d04546;} 
	.back-to-login {background: transparent; border: none; color: red; margin-top: 15px; font-size: 14px; font-weight: bold;} 
	.back-to-login:hover {text-decoration: underline;} 
	.message {padding: 15px; margin-bottom: 15px; border-radius: 5px;} 
	.success {background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb;} 
	.error {background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb;}
  </style>
</head>
<body>
  <div class="forgot-password-frame">
    <h2>Forgot Password</h2>
    <p>Please enter your registered email or mobile number to reset your password.</p>
    <br>                                <!-- PasswordResetController.java -->
    <form action="${pageContext.request.contextPath}/ResetPassword" method="POST">
     <!-- Displaying error/success message if available -->
	  <c:if test="${not empty error}">
	  	<div class="message error">${error}</div>
	  </c:if>
	  <c:if test="${not empty success}">
	    <div class="message success">${success}</div>
	  </c:if>     
      <div class="input-group">
        <label for="email">User Name</label>
        <input type="text" id="username" name="username" placeholder="Enter Email or Mobile No." required>
        
        <label for="newpassword">New Password</label>
        <input type="password" id="newpassword" name="newpassword" placeholder="Enter Password" required>
        
        <label for="confirmpassword">Confirm Password</label>
        <input type="password" id="confirmpassword" name="confirmpassword" placeholder="Enter Confirm Password" required>
      </div>
      	<button type="submit" class="reset-btn">Reset Password</button>
      <div class="back-to-login">
      	<button class="back-to-login" type="button" onclick='window.history.back();'>Back to Login</button>
      </div>
    </form>
  </div>
</body>
</html>
