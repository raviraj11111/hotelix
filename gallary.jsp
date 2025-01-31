<%-- 
    Document   : gallary
    Created on : 20 Jan 2025, 6:13:36 pm
    Author     : sarve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Gallery - Hotel Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome CDN -->
    
    <style>
        header {
            background-color: #1a1a2e; /* Dark background color */
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 30px 40px;
            color: white;
        }
    
        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #d90000; /* Red color for the logo text */
        }
    
        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
            margin: 0;
            padding: 0;
        }
    
        nav ul li {
            margin: 0;
        }
    
        nav ul li a {
            text-decoration: none;
            color: white;
            font-weight: 400;
            font-size: 16px;
            padding: 10px 15px;
            transition: color 0.3s ease;
        }
    
        nav ul li a:hover {
            color: #d90000; /* Red hover color */
        }

        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
        }

        .gallery-section {
            padding: 50px;
            text-align: center;
        }

        .gallery-section h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .gallery-container {
            display: grid;
            grid-template-columns: repeat(4, 1fr); /* 4 columns */
            gap: 20px;
            justify-items: center;
            grid-template-rows: repeat(2, 200px); /* 2 rows with 200px height each */
        }

        .gallery-item {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            overflow: hidden;
            width: 100%;
            max-width: 300px;
            height: 200px;
            background-size: cover;
            background-position: center;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .gallery-item:hover {
            transform: scale(1.05); /* Slight zoom effect */
            box-shadow: 0 6px 12px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
        }

        /* Specific background images for each gallery item */
        .gallery-item:nth-child(1) {
            background-image: url('images/gallery1.jpg');
        }
        .gallery-item:nth-child(2) {
            background-image: url('images/gallery2.jpg');
        }
        .gallery-item:nth-child(3) {
            background-image: url('images/gallery3.jpg');
        }
        .gallery-item:nth-child(4) {
            background-image: url('images/gallery4.jpg');
        }
        .gallery-item:nth-child(5) {
            background-image: url('images/gallery5.jpg');
        }
        .gallery-item:nth-child(6) {
            background-image: url('images/gallery6.jpg');
        }
        .gallery-item:nth-child(7) {
            background-image: url('images/gallery7.jpg');
        }
        .gallery-item:nth-child(8) {
            background-image: url('images/gallery8.jpg');
        }

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
</head>
<body>
    <header>
        <div class="logo">PROCESS_CMY</div>
        <nav>
            <ul>
                <li><a href="home.jsp" class="active">Home</a></li>
                <li><a href="about.jsp">About</a></li>
                <li><a href="room.jsp">Our Room</a></li>
                <li><a href="food.jsp">Menu </a></li>
                <li><a href="gallary.jsp">Gallery</a></li>
                <li><a href="blog.jsp">Blog</a></li>
                <li><a href="contact.jsp">Contact Us</a></li>
            </ul>
        </nav>
    </header>

    <section class="gallery-section">
        <h2>Our Beautiful Rooms and Suites</h2>
        <div class="gallery-container">
            <div class="gallery-item"></div>
            <div class="gallery-item"></div>
            <div class="gallery-item"></div>
            <div class="gallery-item"></div>
            <div class="gallery-item"></div>
            <div class="gallery-item"></div>
            <div class="gallery-item"></div>
            <div class="gallery-item"></div>
        </div>
    </section>

    <footer>
        <div class="footer-container">
            <!-- Contact Us Section -->
            <div class="footer-section contact-us">
                <h3>Contact US</h3>
                <p><i class="fas fa-map-marker-alt"></i> Address</p>
                <p><i class="fas fa-phone"></i> +08010287703</p>
                <p><i class="fas fa-envelope"></i> process_cmy_111@gmail.com</p>
            </div>

            <!-- Menu Link Section -->
            <div class="footer-section menu-link">
                <h3>Menu Link</h3>
                <ul>
                    <li><a href="home.jsp">Home</a></li>
                    <li><a href="about.jsp">About</a></li>
                    <li><a href="room.jsp">Our Room</a></li>
                    <li><a href="food.jsp">Menu</a></li>
                    <li><a href="gallary.jsp">Gallery</a></li>
                    <li><a href="blog.jsp">Blog</a></li>
                    <li><a href="contact.jsp">Contact Us</a></li>
                </ul>
            </div>

            <!-- News Letter Section -->
            <div class="footer-section newsletter">
                <h3>News Letter</h3>
                <form>
                    <input type="email" placeholder="Enter your email" required>
                    <button type="submit">Subscribe</button>
                </form>
                <div class="social-icons">
                    <a href="https://www.facebook.com/" class="facebook"><i class="fab fa-facebook"></i></a>
                    <a href="https://www.twitter.com/" class="twitter"><i class="fab fa-twitter"></i></a>
                    <a href="https://in.linkedin.com/" class="linkedin"><i class="fab fa-linkedin"></i></a>
                    <a href="https://www.youtube.com/" class="youtube"><i class="fab fa-youtube"></i></a>
                </div>
            </div>
        </div>
        <div class="footer-bottom">
            <p>&copy; 2025 All Rights Reserved. PROCESS_CMY RUlES AND REGULATIONS</p>
        </div>
    </footer>
</body>
</html>
