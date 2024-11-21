<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>User Panel</title>
  
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
    <link rel="shortcut icon" type="image/icon" href="${pageContext.request.contextPath}/images/p1.png"/>
</head> 
<style>
	* { margin: 0; padding: 0; box-sizing: border-box; } 
	.heading { display: grid; background-color: #e1585a; grid-template-columns: 80px 1.25fr 1fr; gap: 0; border: 1px solid grey; border-left: 0; border-right: 0; position: fixed; width: 100%; height: 60px; top: 0; z-index: 1000; } 
	.hamburger { color: white; background-color: rgba(0, 0, 0, 0.721); border: none; font-size: 40px; width: 80px; height: 60px; cursor: pointer; } 
	.head-title { display:flex; justify-content: end; color:white; padding:10px; }
	.img-dabbaa{ padding-right:5px; height:40px;}
	.logout-btn { color: white; background-color: transparent; border: none; font-size: large; font-weight: bold; cursor: pointer; padding: 20px; } 
	.logout-btn:hover { transform: scale(1.1, 1.1); } 
	.image-list { color: white; font-weight: bold; font-size: medium; list-style-type: none; padding: 0; width: 80px; height: 100vh; position: fixed; left: 0; top: 60px; overflow-y: auto; z-index: 1000; background-color: rgba(0, 0, 0, 0.721); box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2); } 
	.image-list.active { width: 200px; display: block; } 
	.image-list img { width: 40px; height: 40px; margin-left: 10px; margin-right: 15px; } 
	.image-list li { display: flex; align-items: center; padding: 10px; font-weight: bold; } 
	.image-list .text { display: none; } 
	.image-list.active .text { display: inline; } 
	.image-list a { color: white; text-decoration: none; display: flex; align-items: center; width: 100%; } 
	.image-list li:hover, a:hover { transform: scale(1.1); user-select: none; background-color: #e1585a; color: black; } 
	.image-list .selected { background-color: #e1585a; color: black; } 
	.image-list .selected a { color: black; } 
	.main-content { margin-top: 60px; margin-left: 90px; margin-right: 10px; padding: 20px; } 
	@media (max-width: 768px) { 
	.heading { grid-template-columns: 50px 1fr; } 
	.hamburger { font-size: 30px; width: 60px; } 
	.image-list { width: 60px; font-size: small; } 
	.image-list.active { width: 150px; } 
	.image-list img { width: 30px; height: 30px; } 
	.main-content { margin-left: 70px; padding: 10px; font-size: smaller; } } 
	@media (max-width: 480px) { 
	.heading { grid-template-columns: 1fr; text-align: center; } 
	.image-list { width: 50px; } 
	.image-list.active { width: 120px; } 
	.main-content { margin-left: 60px; padding: 8px; font-size: small; } }

</style>
<body>
    <header>
        <div class="heading">
            <button class="hamburger" onclick="toggleMenu()">☰</button>
            <div class="head-title">
            	<img class="img-dabbaa" alt="" src="/white-dabba.png">
            	<h1>Dabba.com</h1>
            </div>
            <div align="right">
				<button class="logout-btn" type="button" onclick='window.location.href="${pageContext.request.contextPath}/ULogin.jsp";'>LOGOUT</button>
            </div>
        </div>
        <div class="image-list" id="menu">
            <ul>
                <li class="selected">
                    <a href="#" onclick="loadPageAndSelectItem('${pageContext.request.contextPath}/user-details', this)">
                        <img src="${pageContext.request.contextPath}/images/user.png" alt=""><!-- UserDetails.jsp, UserDetailsController.java -->
                        <span class="text">My Details</span>
                    </a>
                </li>
                <li>
                    <a href="#" onclick="loadPageAndSelectItem('${pageContext.request.contextPath}/display-weekly-plans-only', this)">
                        <img src="${pageContext.request.contextPath}/images/calendar.png" alt=""><!-- ViewMyWeeklyPlan.jsp, DisplayWeeklyPlanController.java -->
                        <span class="text">My Weekly Plan</span>
                    </a>
                </li>
                <li>
                    <a href="#" onclick="loadPageAndSelectItem('${pageContext.request.contextPath}/buy-meal-plans', this)">
                        <img src="${pageContext.request.contextPath}/images/menu1.png" alt=""><!-- BuyMealPlans.jsp, DisplayMealPlanController.java -->
                        <span class="text">Buy Meal Menu</span>
                    </a>
                </li>
                <li>
                    <a href="#" onclick="loadPageAndSelectItem('${pageContext.request.contextPath}/view-purchases', this)">
                        <img src="${pageContext.request.contextPath}/images/plan.png" alt=""><!-- PurchasedPlans.jsp, PurchaseController.java -->
                        <span class="text">My Purchased Plans</span>
                    </a>
                </li>
            </ul>
        </div>
    </header>

    <main class="main-content" id="content">
       
    </main>

    <script>
        // Toggle menu visibility
        function toggleMenu() {
            const menu = document.getElementById('menu');
            menu.classList.toggle('active');
        }

        // Close the menu when clicking outside of it
        document.addEventListener('click', (event) => {
            const menu = document.getElementById('menu');
            const isClickInside = menu.contains(event.target) || event.target.classList.contains('hamburger');
            if (!isClickInside) {
                menu.classList.remove('active');
            }
        });

        // Load page content and highlight the selected menu item
        function loadPageAndSelectItem(page, selectedLink) {
            fetch(page)
                .then(response => response.text())
                .then(data => {
                    document.getElementById('content').innerHTML = data;

                    // Highlight the selected menu item
                    const items = document.querySelectorAll('.image-list li');
                    items.forEach(item => item.classList.remove('selected'));
                    selectedLink.parentElement.classList.add('selected');
                })
                .catch(error => console.log('Error loading page:', error));
        }

        // Optional: Load home page by default
        document.addEventListener('DOMContentLoaded', () => {
            loadPageAndSelectItem('${pageContext.request.contextPath}/user-details', document.querySelector('.image-list li.selected a'));
        });                           <!-- UserDetails.jsp, UserDetailsController.java -->
    </script>
</body>
</html>
