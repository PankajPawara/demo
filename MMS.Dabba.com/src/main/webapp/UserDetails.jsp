<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Details</title>
    <style>
        .h2 { padding-bottom: 30px; font-size: 25px; }
        .main-frame { background-color: #ed999a; padding: 30px; border: 2px solid gray; border-radius: 8px; }
        table { margin-top: 30px; background-color: azure; width: 100%; border: 2px solid black; border-radius: 8px; }
        thead { background-color: rgb(108, 108, 108); color: white; }
        th, td { border-radius:5px; border: 2px solid black; padding: 10px; font-weight: bold; }
        .btn-edit { padding: 5px 10px; color: white; font-weight: bold; background-color: #007bff; border-radius: 5px; text-decoration: none; }
        .btn-edit:hover { opacity: 0.8; }
    </style>
</head>
<body>
    <h2 class="h2" align="center">User Details</h2>
    
    <div class="main-frame">
        <c:if test="${not empty message}">
            <p align="center">${message}</p>
        </c:if>
        <table>
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Name</th>
                    <th>Mobile No</th>
                    <th>Email</th>
                    <th>Address</th>
                    <th>Action</th>
                </tr>
            </thead>
            <tbody>
                <c:choose>
                    <c:when test="${not empty userDetails}">
                        <tr>
                            <td align="center">${userDetails['id']}</td>
                            <td>${userDetails['name']}</td>
                            <td align="center">+91 ${userDetails['mobile']}</td>
                            <td>${userDetails['email']}</td>
                            <td>${userDetails['address']}</td>
                            <td align="center">
                            	<a href="/user/edit/${userDetails['id']}" class="btn-edit">Edit</a>
                            </td>     <!-- UserDetailsController.java -->
                        </tr>      
                    </c:when>
                    <c:otherwise>
                        <tr>
                            <td colspan="6" align="center">User data not found.</td>
                        </tr>
                    </c:otherwise>
                </c:choose>
            </tbody>
        </table>
    </div>
</body>
</html>
