<%-- 
    Document   : room
    Created on : 20 Jan 2025, 6:11:20 pm
    Author     : sarve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Our Rooms - Hotel Management System</title>
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome CDN -->
    <style>
        body {
            margin: 0;
            font-family: 'Roboto', sans-serif;
            background-color: #f9f9f9;
        }

        .header {
            background-color: #1a1a2e;
            color: white;
            text-align: center;
            padding: 20px 0;
        }

        .header h1 {
            margin: 0;
            font-size: 2.5rem;
        }

        .room-section {
            padding: 50px;
            text-align: center;
        }

        .room-section h2 {
            font-size: 2rem;
            margin-bottom: 10px;
        }

        .room-section p {
            color: #666;
            font-size: 1rem;
            margin-bottom: 40px;
        }

        .room-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .room-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            overflow: hidden;
            text-align: center;
        }

        .room-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .room-card .content {
            padding: 20px;
        }

        .room-card h3 {
            font-size: 1.5rem;
            margin: 0;
            margin-bottom: 10px;
        }

        .room-card p {
            font-size: 0.9rem;
            color: #555;
        }

        .book-now-btn {
            background-color: #d90000;
            color: white;
            text-decoration: none;
            padding: 10px 20px;
            font-size: 1rem;
            border-radius: 5px;
            display: inline-block;
            margin-top: 20px;
            transition: background-color 0.3s;
        }

        .book-now-btn:hover {
            background-color: #b00000;
        }

        header {
            display: flex;
            justify-content: space-between;
            align-items: center;
            padding: 20px 50px;
            background-color: #fff;
            position: fixed;
            width: 100%;
            top: 0;
            z-index: 1000;
        }

        .logo {
            font-size: 24px;
            font-weight: bold;
            color: #d90000;
        }

        nav ul {
            list-style: none;
            display: flex;
            gap: 20px;
        }

        nav ul li a {
            text-decoration: none;
            color: #f4f4f4;
            font-size: 16px;
            padding: 10px 15px;
            text-decoration-color: #f4f4f4;
        }
        nav ul li a:hover {
            color: #d90000; /* Red hover color */
        }

        .name{
                    padding: 10px;
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
            font-size: 18px;
            transition: 0.3s;
        }

        .social-icons a:hover {
            color: #d90000;
        }

        .footer-bottom {
            text-align: center;
            margin-top: 30px;
            border-top: 1px solid #333;
            padding-top: 20px;
            font-size: 12px;
        }

        .room-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .room-card:hover img {
            transform: scale(1.05); /* Slight zoom effect */
            box-shadow: 0 6px 10px rgba(0, 0, 0, 0.2); /* Add a shadow effect */
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

    </style>
    
</head>
<body>
    <div class="header">
        <h1>OUR ROOM</h1>
    </div>

    <section class="room-section">
        <h2>"Find Your Perfect Stay – Comfort and Convenience Await You in Every Room."</h2>
        <p>Explore our luxurious rooms designed for comfort and elegance.</p>

        <div class="room-container">
            <div class="room-card">
                <img src="./images/room1.jpg" alt="Room Image">
                <div class="content">
                    <h3>Bed Room</h3>
                    <p>"Where comfort meets luxury, and every stay feels like home"</p>
                    <a href="roombooking.jsp" class="book-now-btn" onclick="bookRoom()">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/room2.jpg" alt="Room Image">
                <div class="content">
                    <h3>Luxury Suite</h3>
                    <p>"Indulge in elegance—where every detail whispers luxury and every moment feels extraordinary."</p>
                    <a href="roombooking.jsp" class="book-now-btn" onclick="bookRoom()">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/room3.jpg" alt="Room Image">
                <div class="content">
                    <h3>Deluxe Room</h3>
                    <p>"Unwind in style—where modern comfort meets timeless elegance."</p>
                    <a href="roombooking.jsp" class="book-now-btn" onclick="bookRoom()">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/room4.jpg" alt="Room Image">
                <div class="content">
                    <h3>Family Suite</h3>
                    <p>"Create lasting memories together in comfort and style—a perfect retreat for the whole family."</p>
                    <a href="roombooking.jsp" class="book-now-btn" onclick="bookRoom()">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/room5.jpg" alt="Room Image">
                <div class="content">
                    <h3>Presidential Suite</h3>
                    <p>"Indulge in unparalleled luxury—where elegance, comfort, and exclusivity redefine sophistication."</p>
                    <a href="roombooking.jsp" class="book-now-btn" onclick="bookRoom()">Book Now</a>
                </div>
            </div>

            <div class="room-card">
                <img src="images/room6.jpg" alt="Room Image">
                <div class="content">
                    <h3>Economy Room</h3>
                    <p>"Where comfort meets affordability – your perfect stay, without the premium price."

                    </p>
                    <a href="book.html" class="book-now-btn" onclick="bookRoom()">Book Now</a>
                </div>
            </div>
        </div>
    </section>
    <header class="header">
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
            <a href="roombooking.jsp"></a>
        </nav>
    </header>
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
                    <a href="https://www.facebook.com/TwitterInc/" class="twitter"><i class="fab fa-twitter"></i></a>
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
