<%-- 
    Document   : blog
    Created on : 20 Jan 2025, 6:14:27 pm
    Author     : sarve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Blog - Hotel Management System</title>  
    <link rel="stylesheet" href="styles.css">
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome CDN --> 
    <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
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

        .blog-section {
            padding: 50px;
            text-align: center;
        }

        .blog-section h2 {
            font-size: 2rem;
            margin-bottom: 20px;
        }

        .blog-section p {
            color: #666;
            font-size: 1rem;
            margin-bottom: 40px;
        }

        .blog-container {
            display: flex;
            justify-content: center;
            flex-wrap: wrap;
            gap: 20px;
        }

        .blog-card {
            background-color: white;
            border-radius: 8px;
            box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
            width: 300px;
            overflow: hidden;
        }

        .blog-card img {
            width: 100%;
            height: 200px;
            object-fit: cover;
        }

        .blog-card .content {
            padding: 20px;
        }

        .blog-card h3 {
            font-size: 1.5rem;
            margin: 0;
        }

        .blog-card h4 {
            color: red;
            margin: 10px 0;
            font-size: 1rem;
        }

        .blog-card p {
            font-size: 0.9rem;
            color: #555;
        }

        .btn-book {
            display: block;
            background-color: #d90000;
            color: white;
            font-size: 1rem;
            padding: 10px;
            text-align: center;
            border: none;
            width: 100%;
            margin-top: 20px;
            cursor: pointer;
            border-radius: 4px;
            transition: background-color 0.3s ease;
        }

        .btn-book:hover {
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
    <div class="header">
        <h1>BLOG</h1>
    </div>

    <section class="blog-section">
        <h2>"Stay Informed, Stay Inspired – Explore Tips, Guides, and Stories to Enhance Your Travel Experience."

        </h2>
        <p>Discover the latest updates and features of our hotel management system.</p>

        <div class="blog-container">
            <div class="blog-card">
                <img src="images/blog1.jpg" alt="Blog Image">
                <div class="content">
                    <h3>Bed Room</h3>
                    <h4>Read Quote and stay </h4>
                    <p>"Where comfort meets convenience – your perfect room, your perfect retreat."</p>
                  <a href="roombooking.jsp"><button class="btn-book" onclick="bookRoom('Dining Area')">Book Now</button></a>
                </div>
            </div>

            <div class="blog-card">
                <img src="images/blog2.jpg" alt="Blog Image">
                <div class="content">
                    <h3>Luxury Suite</h3>
                    <h4>Read Quote and stay </h4>
                    <p>"Indulge in elegance – where luxury meets sophistication for an unforgettable stay."

                    </p>
                    <a href="roombooking.jsp"><button class="btn-book" onclick="bookRoom('Dining Area')">Book Now</button></a>                </div>
            </div>

            <div class="blog-card">
                <img src="images/blog3.jpg" alt="Blog Image">
                <div class="content">
                    <h3>Dining Area</h3>
                    <h4>Read Quote and stay </h4>
                    <p>"Savor every moment – where delicious meals and unforgettable ambiance come together."</p>
                    <a href="roombooking.jsp"><button class="btn-book" onclick="bookRoom('Dining Area')">Book Now</button></a>
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
    
<!--  -->
</body>
</html>
