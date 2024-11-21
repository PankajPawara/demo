<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User List</title>
    <style>
        .h2 { padding-bottom: 30px; font-size: 25px; }
        .main-frame { background-color: #ed999a; padding: 30px; border: 2px solid gray; border-radius: 8px; border-collapse: collapse; }
        table { margin-top: 30px; background-color: azure; width: 100%; border: 2px solid black; border-radius: 8px; }
        thead { background-color: rgb(108, 108, 108); color: white; border-top-right-radius: 8px; }
        th, td { border-radius:5px; border: 2px solid black; padding: 10px; font-weight: bold; }
        tbody > tr:nth-of-type(even) { background-color: #ffdac9;}
        .btn-edit, .btn-delete { padding: 5px 10px; color: white; font-weight: bold; border-radius: 5px; text-decoration: none; }
        .btn-edit { background-color: #007bff; }
        .btn-delete { background-color: #dc3545; }
        .btn-edit:hover, .btn-delete:hover { opacity: 0.8; }
        .message { padding: 10px; margin: 20px 0; border-radius: 5px; text-align: center; }
        .success { background-color: #d4edda; color: #155724; }
        .error { background-color: #f8d7da; color: #721c24; }
    </style>
</head>
<body>
    <h2 class="h2" align="center">All Users</h2>
    
    <!-- Success/Error message display -->
    <c:if test="${not empty message}">
        <div class="${messageType == 'success' ? 'alert-success' : 'alert-error'}">
            ${message}
        </div>
    </c:if>
    
    <div class="main-frame">
        <table>
            <thead>
                <tr>
                    <th scope="col">ID</th>
                    <th scope="col">Name</th>
                    <th scope="col">Mobile No</th>
                    <th scope="col">Email</th>
                    <th scope="col">Password</th>
                    <th scope="col">City</th>
                    <th scope="col">District</th>
                    <th scope="col">State</th>
                    <th scope="col">Pincode</th>
                    <th scope="col">Action</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="user" items="${users}">
                    <tr>
                        <td align="center">${user['id']}</td>
                        <td>${user['name']}</td>
                        <td align="center">+91 ${user['mobile']}</td>
                        <td>${user['email']}</td>
                        <td>${user['password']}</td>
                        <td>${user['city']}</td>
                        <td>${user['district']}</td>
                        <td>${user['state']}</td>
                        <td align="center">${user['pincode']}</td>
                        <td align="center">
                            <a href="${pageContext.request.contextPath}/user/Delete-user?id=${user['id']}" class="btn-delete" onclick="return confirm('Are you sure you want to delete this user?');">Delete</a>
                        </td>                              <!-- UserController.java -->
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>
