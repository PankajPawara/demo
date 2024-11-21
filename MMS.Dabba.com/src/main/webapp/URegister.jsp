<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Registration</title>
    <link rel="shortcut icon" type="image/icon" href="${pageContext.request.contextPath}/assets/images/p1.png"/>
    <style>
       * {margin: 0; padding: 0; box-sizing: border-box;} 
		body {margin: 150px 0; display: flex; align-items: center; justify-content: center; height: 100vh; background-color: #e1585a; font-family: Arial, sans-serif;} 
		.reg-frame {background-color: #ffffff; width: 700px; padding: 20px; border-radius: 12px; box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); text-align: center;} 
		legend {font-size: 18px; font-weight: bold; color: #e1585a; padding: 0 5px; text-align: left;} 
		h2 {font-weight: bold; margin-bottom: 20px; color: #e1585a;} 
		.input-group {display: grid; grid-template-columns: 1fr 1fr; gap: 10px; margin-top: 15px;} 
		.input-group label, .input-group input {width: 100%; padding: 8px; border: 1px solid #ccc; border-radius: 5px;} 
		.input-group label {text-align: left; font-weight: bold; background-color: #f9f9f9; border: none; padding: 0;} 
		.input-group input {margin-bottom: 5px;} 
		.section-box {background-color: #f9f9f9; padding: 15px; border: 1px solid #ddd; border-radius: 8px; margin-bottom: 20px;} 
		.reg-btn {font-weight: bold; background-color: #e1585a; color: white; padding: 15px 0; border: none; border-radius: 5px; margin: 15px 0 20px; cursor: pointer; width: 100%;} 
		.reg-btn:hover {background-color: #e1585a;} 
		.back-to-login {background: transparent; border: none; color: red; margin-top: 15px; font-size: 14px; font-weight: bold;} 
		.back-to-login:hover {text-decoration: underline;} 
		.message {padding: 15px; margin-bottom: 15px; border-radius: 5px;} 
		.success {background-color: #d4edda; color: #155724; border: 1px solid #c3e6cb;} 
		.error {background-color: #f8d7da; color: #721c24; border: 1px solid #f5c6cb;}

    </style>
</head>
<body>
    <div class="reg-frame">
        <h2>User Registration</h2>           <!-- UserRegisterController.java -->
        <form action="${pageContext.request.contextPath}/User/Register" method="post">
	         <!-- Displaying error/success message if available -->
	        <c:if test="${not empty success}">
		        <div class="message success">${success}</div>
		    </c:if>
		    <c:if test="${not empty error}">
		        <div class="message error">${error}</div>
		    </c:if>
            <fieldset class="section-box">
                <legend>Personal Information</legend>
                <div class="input-group">
                    <label for="fullname">*Name:</label>
                    <br>
                    <input type="text" name="fullname" id="fullname" placeholder="Full Name" required>
                </div>
            </fieldset>

            <fieldset class="section-box">
                <legend>User Name</legend>
                <div class="input-group">
                    <label for="mobileno">*Mobile No:</label>
                    <label for="emailaddress">Email Address:</label>

                    <input type="text" name="mobileno" id="mobileno" placeholder="+91 xxxxxxxxxx" required>
                    <input type="email" name="emailaddress" id="emailaddress" placeholder="Enter Email Address" required>
                </div>
            </fieldset>

            <fieldset class="section-box">
                <legend>Password</legend>
                <div class="input-group">
                    <label for="pass">*Password:</label>
                    <label for="cpass">*Confirm Password:</label>

                    <input type="password" name="pass" id="pass" placeholder="Enter Password" required>
                    <input type="password" name="cpass" id="cpass" placeholder="Enter Confirm Password" required>
                </div>
            </fieldset>

            <fieldset class="section-box">
                <legend>Address Details</legend>
                <div class="input-group">
                    <label for="city">*City/Village:</label>
                    <label for="district">*District:</label>

                    <input type="text" name="city" id="city" placeholder="City/Village" required>
                    <input type="text" name="district" id="district" placeholder="District" required>
                </div>

                <div class="input-group">
                    <label for="state">*State:</label>
                    <label for="pincode">*Pincode:</label>

                    <input type="text" name="state" id="state" placeholder="State" required>
                    <input type="text" name="pincode" id="pincode" placeholder="Pincode" required>
                </div>
            </fieldset>

            <button type="submit" class="reg-btn">Register</button>
            <button class="back-to-login" type="button" onclick='window.history.back();'>Back to Login</button>
       
        </form>
    </div>
</body>
</html>
