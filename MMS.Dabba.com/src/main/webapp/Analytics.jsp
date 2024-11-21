<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Dashboard</title>
    <link rel="shortcut icon" type="image/icon" href="images/p1.png"/>
    <style>
        h2 { margin-bottom: 20px; margin-right: 10px; }
        .main-frame { margin-left: 10%; width: 80%; background-color: #ed999a; border: 2px solid rgb(57, 57, 57); border-radius: 6px; }
        .blue-frame { padding: 5px; font-weight: bold; font-size: larger; background-color: rgb(57, 57, 57); color: white; max-height: fit-content; border-top: 8px; border-top-left-radius: 4px; border-top-right-radius: 4px; }
        .frames { display: flex; flex-wrap: wrap; padding-left: 50px; padding-bottom: 30px; }
        .child-frame { margin: 20px; padding: 20px; align-content: center; text-align: center; height: 100px; max-width: fit-content; background-color: azure; border: 1px solid black; border-radius: 8px; box-shadow: grey 2; }
    </style>
</head>
<body>
    <h2 align='center'>Dashboard</h2>
    <div class='main-frame'>
        <legend class='blue-frame'>Analytics</legend>
        <div class='frames' align='center'>

            <div class='child-frame'>
                <h3>Total Users</h3>
                <hr>
                <h1>${userCount}</h1>
            </div>

            <div class='child-frame'>
                <h3>All Plans</h3>
                <hr>
                <h1>${mealPlanCount}</h1>
            </div>

            <div class='child-frame'>
                <h3>Sold Plans</h3>
                <hr>
                <h1>${purchasedPlanCount}</h1>
            </div>

            <div class='child-frame'>
                <h3>Weekly Plans</h3>
                <hr>
                <h1>${weeklyPlanCount}</h1>
            </div>

        </div>
    </div>
</body>
</html>
