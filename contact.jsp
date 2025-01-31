<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Contact Form Hero Section</title>
    <style>
        * {
            box-sizing: border-box;
            margin: 0;
            padding: 0;
            font-family: Arial, sans-serif;
        }
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

        .hero {
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
            background-color: #f9f9f9;
            padding: 20px;
            padding-top: 0px; /* Adjust for fixed header */
        }
        .container {
            display: flex;
            max-width: 900px;
            width: 100%;
            background: #fff;
            box-shadow: 0 0 10px rgba(0,0,0,0.1);
            border-radius: 10px;
            overflow: hidden;
        }
        .form-container {
            flex: 1;
            padding: 20px;
        }
        .form-container input, .form-container textarea {
            width: 100%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ddd;
            border-radius: 5px;
        }
        .form-container button {
            width: 100%;
            padding: 10px;
            background: black;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .map-container {
            flex: 1;
        }
        .map-container iframe {
            width: 100%;
            height: 100%;
            border: 0;
        }
        @media (max-width: 768px) {
            .container {
                flex-direction: column;
            }
            .map-container {
                height: 300px;
            }
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
    <div class="logo">
        <div class="name">PROCESS_CMY</div>
    </div>
    <nav class="navbar">
        <ul class="menu">
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
    

    <section class="hero">
        
        <div class="container">
           
            <div class="form-container">
                <form action="ContactServlet"  method="POST" >
    <label for="name">Name:</label><input type="text" name="name" required>
    <label for="email">Email:</label><input type="email" name="email" required>
    <label for="phone">Phone:</label><input type="text" name="phone">
    <label for="message">Message:</label><textarea name="message"></textarea>
    <button type="submit">Submit</button>
</form>

            </div>
            <div class="map-container">
                <iframe 
                    src="https://www.google.com/maps/embed?pb=..."
                    allowfullscreen=""
                    loading="lazy">
                </iframe>
            </div>
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
                <a href="#" class="facebook"><i class="fab fa-facebook"></i></a>
                <a href="#" class="twitter"><i class="fab fa-twitter"></i></a>
                <a href="#" class="linkedin"><i class="fab fa-linkedin"></i></a>
                <a href="#" class="youtube"><i class="fab fa-youtube"></i></a>
            </div>
        </div>
    </div>
    <div class="footer-bottom">
        <p>&copy; 2025 All Rights Reserved. PROCESS_CMY RUlES AND REGULATIONS</p>    
    </div>
</footer>

</body>
</html>
