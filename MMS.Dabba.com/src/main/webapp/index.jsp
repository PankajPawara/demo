<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!doctype html>
<html class="no-js" lang="en">

<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <!-- Title of Site -->
    <title>Dabba.com</title>
    <!-- For favicon png -->
    <link rel="shortcut icon" type="image/icon" href="${pageContext.request.contextPath}/assets/images/p1.png"/>
    <!-- CSS Resources -->
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/font-awesome.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/flaticon.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/animate.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.carousel.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/owl.theme.default.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootstrap.min.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/bootsnav.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/style.css">
    <link rel="stylesheet" href="${pageContext.request.contextPath}/assets/css/responsive.css">
</head>
<body>
    <!-- Header Section -->
    <header class="top-area">
        <div class="header-area">
            <nav class="navbar navbar-default bootsnav navbar-fixed dark no-background">
                <div class="container">
                    <div class="navbar-header">
                        <img class="img" src="${pageContext.request.contextPath}/assets/images/red-dabba.png" height="60px" width="60px">
                    </div>
                    
                    <div class="navbar-header">
                        <a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp">Dabba.com</a>
                    </div>
                    
                    <div class="collapse navbar-collapse menu-ui-design" id="navbar-menu">
                        <ul class="nav navbar-nav navbar-right" data-in="fadeInDown" data-out="fadeOutUp">
                            <li class="smooth-menu"><a href="#welcome-hero">Home</a></li>
                            <li class="smooth-menu"><a href="${pageContext.request.contextPath}/ULogin.jsp">User Login</a></li>
                            <li class="smooth-menu"><a href="${pageContext.request.contextPath}/ALogin.jsp">Admin Login</a></li>
                        </ul>
                    </div>
                </div>
            </nav>
        </div>
    </header>
    <section id="welcome-hero" class="welcome-hero">
        <div class="container">
            <div class="row">
                <div class="col-md-12 text-center">
                    <div class="header-text">
                        <h2>Welcome<span>,</span> We are <br> here <br> to serve you<span>.</span></h2>
                        <p>with efficiency and convenience transform your dining experience.</p>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- Footer Section -->
    <footer id="footer-copyright" class="footer-copyright">
        <div id="scroll-Top">
            <div class="return-to-top">
                <i class="fa fa-angle-up" id="scroll-top"></i>
            </div>                
        </div>
    </footer>
    <!-- JavaScript Resources -->
    <script src="${pageContext.request.contextPath}/assets/js/jquery.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/modernizr/2.8.3/modernizr.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootstrap.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/bootsnav.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.sticky.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/progressbar.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/jquery.appear.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/owl.carousel.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery-easing/1.4.1/jquery.easing.min.js"></script>
    <script src="${pageContext.request.contextPath}/assets/js/custom.js"></script>    
</body>
</html>
