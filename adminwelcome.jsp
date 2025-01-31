<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.sql.*" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Panel</title>
    <style>
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
            font-family: Arial, sans-serif;
        }
        body {
            display: flex;
            height: 100vh;
            background-color: #f4f4f4;
        }
        .sidebar {
            width: 250px;
            background-color: #2c3e50;
            color: white;
            display: flex;
            flex-direction: column;
            padding: 20px;
        }
        .sidebar h2 {
            text-align: center;
            margin-bottom: 20px;
            font-size: 22px;
        }
        .nav-links {
            list-style: none;
        }
        .nav-links li {
            padding: 15px;
            margin: 10px 0;
            background-color: #34495e;
            text-align: center;
            border-radius: 5px;
            cursor: pointer;
            transition: background 0.3s;
        }
        .nav-links li:hover {
            background-color: #1abc9c;
        }
        .logout {
            margin-top: auto;
            background-color: red !important;
        }
        .main-content {
            flex: 1;
            padding: 20px;
        }
        h2 {
            text-align: center;
            margin-bottom: 20px;
        }
        table {
            width: 100%;
            border-collapse: collapse;
            margin: 20px 0;
            background: white;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
        }
        table, th, td {
            border: 1px solid #ddd;
        }
        th, td {
            padding: 12px;
            text-align: center;
        }
        .btn {
            padding: 8px 15px;
            background-color: green;
            color: white;
            border: none;
            cursor: pointer;
            border-radius: 5px;
        }
        .btn-delete {
            background-color: red;
        }
        .hidden {
            display: none;
        }
    </style>
</head>
<body>

<!-- Sidebar Navigation -->
<div class="sidebar">
    <h2>Admin Panel</h2>
    <ul class="nav-links">
        <li onclick="showSection('room-bookings')">Room Bookings</li>
        <li onclick="showSection('food-orders')">Food Orders</li>
        <li class="logout" onclick="logout()">Logout</li>
    </ul>
</div>

<!-- Main Content Area -->
<div class="main-content">

    <!-- Room Bookings Section -->
    <div id="room-bookings">
        <h2>Room Bookings</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Name</th>
                <th>Room Type</th>
                <th>Check-In</th>
                <th>Check-Out</th>
                <th>Action</th>
            </tr>
            <% 
                try {
                    Class.forName("com.mysql.cj.jdbc.Driver"); // Load JDBC Driver
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jaywant", "root", "raviraj5052");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM room_bookings");
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("full_name") %></td> <%-- Corrected Column Name --%>
                <td><%= rs.getString("room_type") %></td>
                <td><%= rs.getString("check_in_date") %></td> <%-- Corrected Column Name --%>
                <td><%= rs.getString("check_out_date") %></td> <%-- Corrected Column Name --%>
                <td>
                    <form action="UpdateOrderStatusServlet" method="post">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <select name="status">
                            <option value="Confirmed">Confirmed</option>
                            <option value="Checked In">Checked In</option>
                            <option value="Checked Out">Checked Out</option>
                            <option value="Cancelled">Cancelled</option>
                        </select>
                        <button type="submit" class="btn">Update</button>
                    </form>
                </td>
            </tr>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
    </div>

    <!-- Food Orders Section -->
    <div id="food-orders" class="hidden">
        <h2>Food Orders</h2>
        <table>
            <tr>
                <th>ID</th>
                <th>Customer Name</th>
                <th>Room Number</th>
                <th>Food Item</th>
                <th>Quantity</th>
                <th>Status</th>
                <th>Action</th>
            </tr>
            <% 
                try {
                    Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jaywant", "root", "raviraj5052");
                    Statement stmt = con.createStatement();
                    ResultSet rs = stmt.executeQuery("SELECT * FROM foodorders");
                    while (rs.next()) {
            %>
            <tr>
                <td><%= rs.getInt("id") %></td>
                <td><%= rs.getString("customer_name") %></td>
                <td><%= rs.getInt("room_number") %></td>
                <td><%= rs.getString("food_item") %></td>
                <td><%= rs.getInt("quantity") %></td>
                <td><%= rs.getString("status") %></td>
                <td>
                    <form action="UpdateOrderStatusServlet" method="post">
                        <input type="hidden" name="id" value="<%= rs.getInt("id") %>">
                        <select name="status">
                            <option value="Pending">Pending</option>
                            <option value="Preparing">Preparing</option>
                            <option value="Delivered">Delivered</option>
                            <option value="Cancelled">Cancelled</option>
                        </select>
                        <button type="submit" class="btn">Update</button>
                    </form>
                </td>
            </tr>
            <% 
                    }
                    con.close();
                } catch (Exception e) {
                    out.println("Error: " + e.getMessage());
                }
            %>
        </table>
    </div>

</div>

<!-- JavaScript to Switch Between Sections -->
<script>
    function showSection(sectionId) {
        document.getElementById('room-bookings').classList.add('hidden');
        document.getElementById('food-orders').classList.add('hidden');
        document.getElementById(sectionId).classList.remove('hidden');
    }

    function logout() {
        if (confirm("Are you sure you want to log out?")) {
            window.location.href = "logout.jsp"; // Redirect to logout page
        }
    }
</script>

</body>
</html>
