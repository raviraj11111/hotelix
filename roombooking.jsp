<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    String bookingMessage = (String) session.getAttribute("bookingMessage");
    if (bookingMessage != null) {
%>
    <div style="color: green; font-weight: bold;">
        <%= bookingMessage %>
    </div>
<%
        session.removeAttribute("bookingMessage"); // Remove message after displaying once
    }
%>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Hotel Room Booking Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #000000;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }
        
        .container {
            background-color: #3b5998;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 6px 25px rgba(0, 0, 0, 0.6);
            max-width: 800px;
            width: 100%;
            transition: transform 0.3s ease, box-shadow 0.3s ease;
        }

        .container:hover {
            transform: scale(1.02);
            box-shadow: 0 8px 30px rgba(0, 0, 0, 0.8);
        }

        h3 {
            text-align: center;
            color: #ff0000;
        }

        .form-container {
            background-image: url('images/room4.jpg');

            display: flex;
            justify-content: space-between;
            gap: 20px;
        }

        .form-section {
            width: 48%;
        }

        label {
            color: white;
            font-weight: bold;
            display: block;
            margin: 10px 0 5px;
        }

        input, select, textarea {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-sizing: border-box;
        }

        input:focus, select:focus, textarea:focus {
            border-color: #6a5acd;
            box-shadow: 0 0 8px rgba(106, 90, 205, 0.5);
        }

        /* Styling the button */
        .book-now-btn {
            background-color: #ff0000;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 25px;
            padding: 12px 40px;
            font-size: 18px;
            display: block;
            margin: 20px auto;
            text-align: center;
            transition: background-color 0.3s ease, transform 0.3s ease;
        }

        .book-now-btn:hover {
            background-color: #cc0000;
            transform: scale(1.05);
        }

        .form-group {
            margin-bottom: 15px;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
            }
            .form-section {
                width: 100%;
            }
        }
    </style>
</head>
<body>

    <div class="container">
       <form id="roomBookingForm" action="RoomBookingServlet" method="post">

    <h3>Hotel Room Booking</h3>
    <div class="form-container">
        
        <!-- Left Section: Guest Information -->
        <div class="form-section">
            <h3>Guest Information</h3>
            <div class="form-group">
                <label for="fullName">Full Name:</label>
                <input type="text" id="fullName" name="fullName" required>
            </div>

            <div class="form-group">
                <label for="contactNumber">Contact Number:</label>
                <input type="tel" id="contactNumber" name="contactNumber" required>
            </div>

            <div class="form-group">
                <label for="emailAddress">Email Address:</label>
                <input type="email" id="emailAddress" name="emailAddress" required>
            </div>

            <div class="form-group">
                <label for="address">Address:</label>
                <textarea id="address" name="address" rows="3" required></textarea>
            </div>
        </div>

        <!-- Right Section: Booking Details -->
        <div class="form-section">
            <h3>Booking Details</h3>

            <div class="form-group">
                <label for="roomType">Room Type:</label>
                <select id="roomType" name="roomType" onchange="updatePrice()">
                    <option value="Bedroom">Bedroom - $100/night</option>
                    <option value="Luxury Suite">Luxury Suite - $250/night</option>
                    <option value="Deluxe Room">Deluxe Room - $180/night</option>
                    <option value="Family Suite">Family Suite - $300/night</option>
                    <option value="Presidential Suite">Presidential Suite - $500/night</option>
                    <option value="Economy Suite">Economy Suite - $80/night</option>
                </select>
            </div>

            <div class="form-group">
                <label for="rooms">Select Room :</label>
                <input type="number" id="rooms" name="rooms" min="1" max="100" required>
            </div>

            <div class="form-group">
                <label for="guests">Number of Guests:</label>
                <input type="number" id="guests" name="guests" min="1" max="100" required>
            </div>

            <div class="form-group">
                <label for="checkIn">Check-in Date:</label>
                <input type="date" id="checkIn" name="checkIn" required>
            </div>

            <div class="form-group">
                <label for="checkOut">Check-out Date:</label>
                <input type="date" id="checkOut" name="checkOut" required>
            </div>

            <p id="priceDisplay">Price: $100/night</p>
        </div>
    </div>

    <!-- Centered Book Now Button -->
    <button type="submit" class="book-now-btn">Book Now</button>
</form>

    </div>

    <script>
        function updatePrice() {
            const roomType = document.getElementById('roomType').value;
            const priceMap = {
                'Bedroom': '$100/night',
                'Luxury Suite': '$250/night',
                'Deluxe Room': '$180/night',
                'Family Suite': '$300/night',
                'Presidential Suite': '$500/night',
                'Economy Suite': '$80/night'
            };
            document.getElementById('priceDisplay').textContent = 'Price: ' + priceMap[roomType];
        }

        document.getElementById('bookingForm').addEventListener('submit', function(event) {
            event.preventDefault();
            alert("Booking Successful! We will contact you soon.");
        });
    </script>

</body>
</html>
