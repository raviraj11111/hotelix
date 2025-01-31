<%-- 
    Document   : ad
    Created on : 20 Jan 2025, 6:17:56 pm
    Author     : sarve
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Hotel Admin Dashboard</title>
  <link rel="stylesheet" href="styles.css">
</head>
<body>
  <header>
    <h1>Hotel Admin Dashboard</h1>
  </header>
  
  <nav>
    <ul>
      <li><a href="#dashboard">Dashboard</a></li>
      <li><a href="#reservations">Reservations</a></li>
      <li><a href="#customers">Customers</a></li>
      <li><a href="#reports">Reports</a></li>
      <li><a href="#settings">Settings</a></li>
    </ul>
  </nav>
  
  <main>
    <section id="dashboard">
      <h2>Dashboard</h2>
      <div id="stats">
        <div>Total Rooms: <span id="totalRooms">100</span></div>
        <div>Occupied: <span id="occupiedRooms">0</span></div>
        <div>Available: <span id="availableRooms">100</span></div>
      </div>
    </section>

    <section id="reservations">
      <h2>Reservations</h2>
      <form id="reservationForm">
        <label for="guestName">Guest Name:</label>
        <input type="text" id="guestName" required>

        <label for="roomNumber">Room Number:</label>
        <select id="roomNumber" required></select>

        <label for="checkInDate">Check-In Date:</label>
        <input type="date" id="checkInDate" required>

        <label for="checkOutDate">Check-Out Date:</label>
        <input type="date" id="checkOutDate" required>

        <button type="submit">Add Reservation</button>
      </form>
      <div id="reservationList"></div>
    </section>

    <section id="customers">
      <h2>Customer Records</h2>
      <form id="customerForm">
        <label for="customerName">Customer Name:</label>
        <input type="text" id="customerName" required>

        <label for="contactInfo">Contact Info:</label>
        <input type="text" id="contactInfo" required>

        <button type="submit">Add Customer</button>
      </form>
      <div id="customerList"></div>
    </section>

    <section id="reports">
      <h2>Reports</h2>
      <button id="generateReport">Generate Report</button>
      <div id="reportOutput"></div>
    </section>

    <section id="settings">
      <h2>Settings</h2>
      <form id="settingsForm">
        <label for="totalRoomsSetting">Total Rooms:</label>
        <input type="number" id="totalRoomsSetting" value="100">
        <button type="submit">Update Settings</button>
      </form>
    </section>
  </main>

  <footer>
    <div class="footer-container">
        <div class="footer-section contact-us">
            <h3>Contact US</h3>
            <p><i class="fas fa-map-marker-alt"></i> Address</p>
            <p><i class="fas fa-phone"></i> +01 1234569540</p>
            <p><i class="fas fa-envelope"></i> demo@gmail.com</p>
        </div>
        
        <div class="footer-section menu-link">
            <h3>Menu Link</h3>
            <ul>
                <li><a href="#">Home</a></li>
                <li><a href="#">About</a></li>
                <li><a href="#">Our Room</a></li>
                <li><a href="#">Gallery</a></li>
                <li><a href="#">Blog</a></li>
                <li><a href="#">Contact Us</a></li>
            </ul>
        </div>
        
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
        <p>&copy; 2019 All Rights Reserved. Design by Free Html Templates</p>
    </div>
</footer>

  <style>
    /* General Layout */
    body {
      font-family: Arial, sans-serif;
      margin: 0;
      padding: 0;
      background-color: #f4f4f4;
    }

    header {
      background: #333;  /* Dark gray header */
      color: white;
      padding: 20px;
      text-align: center;
    }

    nav {
      background: #444;  /* Medium dark gray for navigation */
      color: white;
      overflow: hidden;
    }

    nav ul {
      margin: 0;
      padding: 0;
      list-style-type: none;
    }

    nav ul li {
      float: left;
    }

    nav ul li a {
      color: white;
      text-decoration: none;
      padding: 14px 20px;
      display: block;
      text-align: center;
    }

    nav ul li a:hover {
      background: #555;  /* Lighten when hovered */
      transition: background 0.3s ease;
    }

    main {
      padding: 20px;
    }

    section {
      margin-bottom: 30px;
      border: 1px solid #ddd;
      padding: 20px;
      background-color: white;
      border-radius: 5px;
    }

    footer {
      background-color: #222;  /* Dark footer */
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

    #stats {
      display: flex;
      gap: 20px;
    }

    #stats div {
      background: #e0e0e0;
      padding: 15px;
      border-radius: 5px;
      box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
    }

    button {
      background: #333;  /* Dark gray button */
      color: white;
      border: none;
      padding: 10px 20px;
      cursor: pointer;
      border-radius: 5px;
      transition: background 0.3s ease;
    }

    button:hover {
      background: #555;  /* Lighter gray on hover */
    }

    input, label {
      margin-bottom: 10px;
      width: 100%;
    }

    input[type="text"], input[type="date"], input[type="number"], select {
      padding: 8px;
      border-radius: 5px;
      border: 1px solid #ccc;
      width: 100%;
    }

    #reservationList, #customerList {
      margin-top: 20px;
    }

    .reservation-item, .customer-item {
      padding: 10px;
      background: #f9f9f9;
      margin-bottom: 10px;
      border: 1px solid #ddd;
      border-radius: 5px;
      display: flex;
      justify-content: space-between;
      align-items: center;
    }

    .reservation-item button, .customer-item button {
      background: #d9534f;
      color: white;
      padding: 5px 10px;
      border: none;
      border-radius: 5px;
      cursor: pointer;
      transition: background 0.3s ease;
    }

    .reservation-item button:hover, .customer-item button:hover {
      background: #c9302c;
    }
  </style>

  <script>
    document.addEventListener("DOMContentLoaded", () => {
      let rooms = Array(100).fill(1);  // All rooms are initially available

      let reservations = [];
      let customers = [];

      const totalRoomsEl = document.getElementById("totalRooms");
      const occupiedRoomsEl = document.getElementById("occupiedRooms");
      const availableRoomsEl = document.getElementById("availableRooms");
      const roomNumberSelect = document.getElementById("roomNumber");
      
      const updateStats = () => {
        const occupiedRooms = reservations.length;
        const availableRooms = rooms.filter(room => room === 1).length;
        totalRoomsEl.textContent = 100;
        occupiedRoomsEl.textContent = occupiedRooms;
        availableRoomsEl.textContent = availableRooms;
        updateRoomDropdown();
      };

      const updateRoomDropdown = () => {
        roomNumberSelect.innerHTML = '';
        rooms.forEach((room, index) => {
          if (room === 1) {
            const option = document.createElement("option");
            option.value = index + 1;
            option.textContent = `Room ${index + 1}`;
            roomNumberSelect.appendChild(option);
          }
        });
      };

      updateStats();

      const reservationForm = document.getElementById("reservationForm");
      reservationForm.addEventListener("submit", (e) => {
        e.preventDefault();

        const guestName = document.getElementById("guestName").value;
        const roomNumber = parseInt(document.getElementById("roomNumber").value);
        const checkInDate = document.getElementById("checkInDate").value;
        const checkOutDate = document.getElementById("checkOutDate").value;

        if (rooms[roomNumber - 1] === 0) {
          alert("Room is already reserved. Please choose a different room.");
          return;
        }

        rooms[roomNumber - 1] = 0;
        reservations.push({ guestName, roomNumber, checkInDate, checkOutDate });

        updateStats();
        reservationForm.reset();
        updateReservationList();
      });

      const updateReservationList = () => {
        const reservationList = document.getElementById("reservationList");
        reservationList.innerHTML = "<h3>Reservation List</h3>";
        reservations.forEach((res, index) => {
          reservationList.innerHTML += `
            <div class="reservation-item">
              ${res.guestName} - Room ${res.roomNumber} 
              (Check-In: ${res.checkInDate}, Check-Out: ${res.checkOutDate})
              <button onclick="deleteReservation(${index})">Delete</button>
            </div>`;
        });
      };

      window.deleteReservation = (index) => {
        const roomNumber = reservations[index].roomNumber;
        rooms[roomNumber - 1] = 1;
        reservations.splice(index, 1);
        updateStats();
        updateReservationList();
      };
    });

    
  </script>
  <script>
    document.addEventListener("DOMContentLoaded", () => {
      let rooms = Array(100).fill(1);  // All rooms are initially available
      let reservations = [];
      let customers = [];
  
      const totalRoomsEl = document.getElementById("totalRooms");
      const occupiedRoomsEl = document.getElementById("occupiedRooms");
      const availableRoomsEl = document.getElementById("availableRooms");
      const roomNumberSelect = document.getElementById("roomNumber");
      
      // Function to update the stats
      const updateStats = () => {
        const occupiedRooms = reservations.length; // Occupied rooms = number of reservations
        const availableRooms = rooms.filter(room => room === 1).length; // Available rooms = rooms that are still marked as 1
        totalRoomsEl.textContent = 100;
        occupiedRoomsEl.textContent = occupiedRooms; // Update occupied rooms count
        availableRoomsEl.textContent = availableRooms; // Update available rooms count
        updateRoomDropdown();
      };
  
      // Function to update the room number dropdown
      const updateRoomDropdown = () => {
        roomNumberSelect.innerHTML = '';
        rooms.forEach((room, index) => {
          if (room === 1) { // If the room is available
            const option = document.createElement("option");
            option.value = index + 1;
            option.textContent = `Room ${index + 1}`;
            roomNumberSelect.appendChild(option);
          }
        });
      };
  
      updateStats(); // Initial update of stats when page loads
  
      // Reservation form submit event listener
      const reservationForm = document.getElementById("reservationForm");
      reservationForm.addEventListener("submit", (e) => {
        e.preventDefault();
  
        const guestName = document.getElementById("guestName").value;
        const roomNumber = parseInt(document.getElementById("roomNumber").value);
        const checkInDate = document.getElementById("checkInDate").value;
        const checkOutDate = document.getElementById("checkOutDate").value;
  
        if (rooms[roomNumber - 1] === 0) {
          alert("Room is already reserved. Please choose a different room.");
          return;
        }
  
        // Mark the room as reserved (0 for occupied)
        rooms[roomNumber - 1] = 0;
  
        // Add reservation details
        reservations.push({ guestName, roomNumber, checkInDate, checkOutDate });
  
        updateStats(); // Update stats after adding reservation
        reservationForm.reset();
        updateReservationList(); // Update the reservation list display
      });
  
      // Function to update the reservation list display
      const updateReservationList = () => {
        const reservationList = document.getElementById("reservationList");
        reservationList.innerHTML = "<h3>Reservation List</h3>";
        reservations.forEach((res, index) => {
          reservationList.innerHTML += `
            <div class="reservation-item">
              ${res.guestName} - Room ${res.roomNumber} 
              (Check-In: ${res.checkInDate}, Check-Out: ${res.checkOutDate})
              <button onclick="deleteReservation(${index})">Delete</button>
            </div>`;
        });
      };
  
      // Delete reservation function
      window.deleteReservation = (index) => {
        const roomNumber = reservations[index].roomNumber;
  
        // Mark the room as available again (1 for available)
        rooms[roomNumber - 1] = 1;
  
        // Remove the reservation from the list
        reservations.splice(index, 1);
  
        updateStats(); // Update stats after deletion
        updateReservationList(); // Update reservation list after deletion
      };
    });
  </script>
  
</body>
</html>
