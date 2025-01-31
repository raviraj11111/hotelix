<%-- 
    Document   : food
    Created on : 20 Jan 2025, 6:12:22 pm
    Author     : sarve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <link href="https://fonts.googleapis.com/css2?family=Roboto:wght@300;400;700&display=swap" rel="stylesheet">
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.4/css/all.min.css" rel="stylesheet"> <!-- Font Awesome CDN -->
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hotel Menu</title>
  <style>
    /* General Reset */
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
    }

    /* Hero Section */
    .hero-section {
      background-color: #fff;
      padding: 2rem;
      text-align: center;
      border-radius: 8px;
      margin: 2rem;
      box-shadow: 0 4px 6px rgba(255, 255, 255, 0.3);
      color: #333;
      padding-top: 6rem;
      border: 2px solid #fff;
    }

    /* Food Grid */
    .food-container {
      display: flex;
      flex-direction: column;
      gap: 1.5rem;
      align-items: center;
    }

    .food-row {
      display: flex;
      justify-content: center;
      gap: 1rem;
    }

    .food-card {
      background: #fff;
      border-radius: 8px;
      width: 180px;
      padding: 1rem;
      text-align: center;
      color: #333;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.2);
      transition: transform 0.3s ease-in-out; /* Smooth transition for scaling */
    }

    .food-card img {
      width: 100%;
      height: 100px;
      object-fit: cover;
      border-radius: 4px;
      transition: transform 0.3s ease-in-out; /* Smooth transition for image scaling */
    }

    .food-card:hover img {
      transform: scale(1.1); /* Zoom effect on hover */
    }

    .food-card h3 {
      margin: 0.5rem 0;
      font-size: 1rem;
    }

    .order-button {
      background-color: #d90000;
      color: white;
      border: none;
      padding: 0.5rem 1rem;
      border-radius: 4px;
      cursor: pointer;
      font-size: 0.9rem;
    }

    .order-button:hover {
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
      color: #d90000;
    }

    .name {
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
  <!-- Hero Section -->
  <section class="hero-section">
    <div class="hero-content">
      <h1>Our Hotel's Delicious Menu</h1>
      <p>Explore our variety of cuisines and place your order now!</p>
    </div>
    <!-- Food Items Grid -->
    <div class="food-container">
      <!-- Row 1 -->
      <div class="food-row">
        <div class="food-card">
          <img src="images/f1.jpeg" alt="Grilled Chicken">
          <h3>Grilled Chicken</h3>
        </div>
        <div class="food-card">
          <img src="images/f2.jpeg" alt="Veggie Pizza">
          <h3>Veggie Pizza</h3>
        </div>
        <div class="food-card">
          <img src="images/f3.jpeg" alt="Pasta Alfredo">
          <h3>Pasta Alfredo</h3>
        </div>
        <div class="food-card">
          <img src="images/f4.jpeg" alt="Caesar Salad">
          <h3>Caesar Salad</h3>
        </div>
        <div class="food-card">
          <img src="images/f5.jpeg" alt="Beef Steak">
          <h3>Beef Steak</h3>
        </div>
      </div>

      <!-- Row 2 -->
      <div class="food-row">
        <div class="food-card">
          <img src="images/f6.jpeg" alt="Chicken Biryani">
          <h3>Chicken Biryani</h3>
        </div>
        <div class="food-card">
          <img src="images/f7.jpeg" alt="Paneer Tikka">
          <h3>Paneer Tikka</h3>
        </div>
        <div class="food-card">
          <img src="images/f8.jpeg" alt="Shrimp Tacos">
          <h3>Shrimp Tacos</h3>
        </div>
        <div class="food-card">
          <img src="images/f9.jpeg" alt="French Fries">
          <h3>French Fries</h3>
        </div>
        <div class="food-card">
          <img src="images/f10.webp" alt="Brownie Sundae">
          <h3>Brownie Sundae</h3>
        </div>
      </div>

      <!-- Centered Place Order Button -->
      <div style="text-align: center; margin-top: 2rem;">
        <a href="foodbooking.jsp" class="order-button">Place Your Order</a>
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
      <div class="footer-section contact-us">
          <h3>Contact US</h3>
          <p><i class="fas fa-map-marker-alt"></i> Address</p>
          <p><i class="fas fa-phone"></i> +08010287703</p>
          <p><i class="fas fa-envelope"></i> process_cmy_111@gmail.com</p>
      </div>
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
