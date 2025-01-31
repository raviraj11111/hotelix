<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="java.sql.*"%>
<%@page import="jakarta.servlet.http.*"%>
<%
    HttpSession sessionUser = request.getSession(false);
    if (sessionUser == null || sessionUser.getAttribute("email") == null) {
        response.sendRedirect("login.jsp");
        return;
    }
%>

<%
    String fullName = (String) session.getAttribute("fullName");
    String email = (String) session.getAttribute("email");
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Management System</title>
    <link rel="stylesheet" href="styles.css">
    <script src="https://kit.fontawesome.com/a076d05399.js" crossorigin="anonymous"></script>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <!-- Only one Font Awesome CDN -->
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0-beta3/css/all.min.css" rel="stylesheet">

    <style>
        /* Dropdown Menu Styles */
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: #fff;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }

        /* Sticky Header Styling */
        .sticky-header {
            background-color: #fff;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
        }

        /* Image Slider Transition */
        .slider img {
            transition: opacity 0.5s ease-in-out;
        }

        /* Fixed Horizontal Scrollbar */
        body {
            overflow-x: scroll;
        }
        html {
            overflow-x: scroll;
        }
        ::-webkit-scrollbar {
            height: 10px;
            position: fixed;
        }
        ::-webkit-scrollbar-track {
            background: #f1f1f1;
        }
        ::-webkit-scrollbar-thumb {
            background: #888;
        }
        ::-webkit-scrollbar-thumb:hover {
            background: #555;
        }

        /* Header Styling */
        .header {
            background-color: #333;
            padding: 20px;
            position: sticky;
            top: 0;
            width: 100%;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
            transition: background-color 0.3s ease-in-out, box-shadow 0.3s ease-in-out;
        }

        .header:hover {
            background-color: #444;
            box-shadow: 0 4px 10px rgba(0, 0, 0, 0.5);
        }

        .logo img {
            width: 50px;
            transition: transform 0.3s ease-in-out;
        }

        .logo span {
            color: #fff;
            font-size: 24px;
            font-weight: bold;
            margin-left: 10px;
            transition: color 0.3s ease-in-out;
        }

        .logo:hover img {
            transform: scale(1.2);
        }

        .logo:hover span {
            color: #f0a500;
        }

        .navbar .menu {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        .navbar .menu li a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            padding: 10px 15px;
            transition: background-color 0.3s, color 0.3s, transform 0.3s;
        }

        .navbar .menu li a:hover {
            background-color: red;
            color: #333;
            transform: scale(1.1);
            border-radius: 5px;
        }

        .navbar .menu a.active {
            color: #FFD700;
        }

        body {
            background-color: #f5f5f5;
            font-family: 'Roboto', sans-serif;
            margin: 0;
            padding: 0;
        }

        /* Hero Section Styling */
        .hero {
            position: relative;
            height: 100vh;
            overflow: hidden;
        }

        .slider {
            position: absolute;
            width: 100%;
            height: 100%;
            display: flex;
            overflow: hidden;
        }

        .slider img {
            width: 100%;
            height: 100%;
            object-fit: cover;
            display: none;
        }

        .slider img.active {
            display: block;
        }

        /* Navigation Buttons */
        .prev, .next {
            position: absolute;
            top: 50%;
            transform: translateY(-50%);
            background-color: rgba(0, 0, 0, 0.5);
            color: #fff;
            border: none;
            padding: 10px;
            cursor: pointer;
            border-radius: 50%;
            font-size: 18px;
            z-index: 2;
        }

        .prev {
            left: 20px;
        }

        .next {
            right: 20px;
        }

        /* Footer Styles */
        footer {
            background-color: #121212;
            color: #fff;
            padding: 40px 20px;
            font-size: 14px;
        }

        .footer-container {
            display: flex;
            justify-content: space-between;
            gap: 20px;
            max-width: 1200px;
            margin: 0 auto;
            flex-wrap: wrap;
        }

        .footer-section {
            flex: 1;
            min-width: 300px;
        }

        .footer-section h3 {
            margin-bottom: 15px;
            font-size: 18px;
            font-weight: bold;
            border-bottom: 2px solid #d90000;
            display: inline-block;
            padding-bottom: 5px;
        }

        .footer-section p, 
        .footer-section ul {
            margin: 10px 0;
        }

        .footer-section ul {
            list-style: none;
            padding: 0;
        }

        .footer-section ul li {
            margin-bottom: 10px;
        }

        .footer-section ul li a {
            text-decoration: none;
            color: #fff;
            transition: 0.3s;
        }

        .footer-section ul li a:hover {
            color: #d90000;
        }

        .footer-section form {
            display: flex;
            flex-direction: column;
            gap: 10px;
        }

        .footer-section form input {
            padding: 10px;
            border: none;
            border-radius: 4px;
            font-size: 14px;
        }

        .footer-section form button {
            padding: 10px;
            border: none;
            background-color: #d90000;
            color: #fff;
            border-radius: 4px;
            cursor: pointer;
            font-size: 14px;
            transition: 0.3s;
        }

        .footer-section form button:hover {
            background-color: #b00000;
        }

        .social-icons {
            margin-top: 10px;
        }

        .social-icons a {
            color: #fff;
            margin-right: 15px;
            font-size: 24px;
            transition: 0.3s;
        }

        .social-icons a:hover {
            transform: scale(1.1);
        }

        /* Colorful Icons */
        .social-icons .facebook { color: #3b5998; }
        .social-icons .twitter { color: #00acee; }
        .social-icons .linkedin { color: #0077b5; }
        .social-icons .youtube { color: #ff0000; }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            border-top: 1px solid #333;
            padding-top: 20px;
            font-size: 12px;
        }
    </style>
    <style>
        /* Navbar Styling */
        .navbar {
            background-color: #333;
            padding: 15px;
            position: fixed;
            top: 0;
            width: 100%;
            z-index: 1000;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar .menu {
            list-style: none;
            display: flex;
            gap: 20px;
        }
        .navbar .menu li a {
            text-decoration: none;
            color: #fff;
            font-weight: bold;
            padding: 10px 15px;
            transition: 0.3s;
        }
        .navbar .menu li a:hover {
            background-color: red;
            border-radius: 5px;
        }
        
        /* Dropdown Menu */
        .dropdown {
            position: relative;
            display: inline-block;
        }
        .dropdown-content {
            display: none;
            position: absolute;
            background-color: white;
            min-width: 160px;
            box-shadow: 0px 8px 16px rgba(0, 0, 0, 0.2);
            z-index: 1;
        }
        .dropdown-content a {
            color: black;
            padding: 12px 16px;
            text-decoration: none;
            display: block;
        }
        .dropdown-content a:hover {
            background-color: #ddd;
        }
        .dropdown:hover .dropdown-content {
            display: block;
        }
    </style>
   </head>
<body>
        <header class="navbar">
        <div class="logo">PROCESS_CMY</div>
        <ul class="menu">
            <li><a href="index.jsp">Home</a></li>
            <li><a href="about.jsp">About</a></li>
            <li><a href="room.jsp">Our Room</a></li>
            <li><a href="food.jsp">Menu</a></li>
            <li><a href="gallery.jsp">Gallery</a></li>
            <li><a href="blog.jsp">Blog</a></li>
            <li><a href="contact.jsp">Contact Us</a></li>
        </ul>
        <ul class="menu">
            <% if (fullName != null) { %>
                <li class="dropdown">
                    <a href="#">Account ▼</a>
                    <div class="dropdown-content">
                        <p><strong><%= fullName %></strong></p>
                        <p><%= email %></p>
                        <a href="logout.jsp">Logout</a>
                    </div>
                </li>
            <% } else { %>
                <li><a href="login.jsp">Login</a></li>
            <% } %>
        </ul>
    </header>
    
    <div class="content" style="margin-top: 80px; padding: 20px;">
        <h1>Welcome, <%= fullName != null ? fullName : "Guest" %>!</h1>
        <% if (fullName != null) { %>
            <p>Your email: <%= email %></p>
        <% } else { %>
            <p>Please <a href="login.jsp">log in</a> to access more features.</p>
        <% } %>
    </div>



        <section class="hero">
        <div class="slider">
            <% for (int i = 1; i <= 10; i++) { %>
                <img src="images/h<%= i %>.jpg" <%= i == 1 ? "class='active'" : "" %> alt="Slide <%= i %>">
            <% } %>
            <button class="prev">&#10094;</button>
            <button class="next">&#10095;</button>
        </div>
    </section>
    <footer>
        <div class="footer-container">
            <div class="footer-section contact-us">
                <h3>Contact US</h3>
                <p><i class="fas fa-map-marker-alt"></i> Address</p>
                <p><i class="fas fa-phone"></i> +08010287703</p>
                <p><i class="fas fa-envelope"></i> process_cmy_111@gmail.com</p>
            </div>
            <div class="footer-section menu-link">
                <h3>Menu Link</h3>
                <ul>
                    <li><a href="index.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="room.jsp">Our Room</a></li>
                    <li><a href="food.jsp">Menu</a></li>
                    <li><a href="gallary.jsp">Gallery</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                </ul>
            </div>
            <div class="footer-section newsletter">
                <h3>News Letter</h3>
                <form>
                    <input type="email" placeholder="Enter your email" required>
                    <button type="submit">Subscribe</button>
                </form>
                <div class="social-icons">
                    <a href="https://www.facebook.com/" class="facebook"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.facebook.com/TwitterInc/" class="twitter"><i class="fab fa-twitter"></i></a>
                    <a href="https://in.linkedin.com/" class="linkedin"><i class="fab fa-linkedin"></i></a>
                    <a href="https://www.youtube.com/" class="youtube"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 Hotel Management System | All Rights Reserved</p>
        </div>
    </footer>

    <script>
        let slideIndex = 0;
        const slides = document.querySelectorAll(".slider img");
        const prevButton = document.querySelector(".prev");
        const nextButton = document.querySelector(".next");

        function showSlide(index) {
            slides.forEach((slide, i) => {
                slide.classList.remove("active");
                if (i === index) {
                    slide.classList.add("active");
                }
            });
        }

        prevButton.addEventListener("click", () => {
            slideIndex = (slideIndex === 0) ? slides.length - 1 : slideIndex - 1;
            showSlide(slideIndex);
        });

        nextButton.addEventListener("click", () => {
            slideIndex = (slideIndex === slides.length - 1) ? 0 : slideIndex + 1;
            showSlide(slideIndex);
        });

        setInterval(() => {
            slideIndex = (slideIndex === slides.length - 1) ? 0 : slideIndex + 1;
            showSlide(slideIndex);
        }, 5000);
    </script>
    
    <script>
        document.addEventListener("DOMContentLoaded", function() {
            let fullName = "<%= fullName %>";
            if (fullName && fullName !== "null") {
                sessionStorage.setItem("userLoggedIn", "true");
            } else {
                sessionStorage.removeItem("userLoggedIn");
            }
        });
    </script>
</body>
</html>
