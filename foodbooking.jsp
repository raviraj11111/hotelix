<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Food Order Form</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-image: url('food-bg.jpg'); /* Replace with your image path */
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
            margin: 0;
            padding: 20px;
            display: flex;
            justify-content: center;
            align-items: center;
            min-height: 100vh;
        }

        /* Dark overlay for readability */
        body::before {
            content: "";
            position: absolute;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background-color: rgba(0, 0, 0, 0.7); /* Semi-transparent black */
            z-index: -1;
        }

        .container {
            background-color: rgba(59, 89, 152, 0.9); /* Semi-transparent blue */
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
            color: #ffcc00;
        }

        .form-container {
            background-image: url('images/f7.jpeg');

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

        input, select {
            width: 100%;
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
            transition: border-color 0.3s ease, box-shadow 0.3s ease;
            box-sizing: border-box;
        }

        input:focus, select:focus {
            border-color: #ffcc00;
            box-shadow: 0 0 8px rgba(255, 204, 0, 0.5);
        }

        .order-btn {
            background-color: #ffcc00;
            color: black;
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

        .order-btn:hover {
            background-color: #d4a500;
            transform: scale(1.05);
        }

        .form-group {
            margin-bottom: 15px;
        }

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
        <form id="foodOrderForm" action="FoodOrderServlet" method="post">
    <label for="fullName">Full Name:</label>
    <input type="text" name="fullName" required>

    <label for="contactNumber">Contact Number:</label>
    <input type="tel" name="contactNumber" required>

    <label for="roomNumber">Room Number:</label>
    <input type="number" name="roomNumber" required>

    <label for="menuItem">Select Food Item:</label>
    <select name="menuItem">
        <option value="Grilled Chicken">Grilled Chicken</option>
        <option value="Veggie Pizza">Veggie Pizza</option>
        <option value="Pasta Alfredo">Pasta Alfredo</option>
    </select>

    <label for="quantity">Quantity:</label>
    <input type="number" name="quantity" min="1" value="1" required>

    <button type="submit">Place Order</button>
</form>

    </div>

    <script>
        function updatePrice() {
            const selectedItem = document.getElementById('menuItem');
            const itemPrice = parseInt(selectedItem.options[selectedItem.selectedIndex].getAttribute('data-price'));
            const quantity = parseInt(document.getElementById('quantity').value);
            const totalPrice = itemPrice * quantity;
            document.getElementById('priceDisplay').textContent = `Total Price: ?${totalPrice}`;
        }

        document.getElementById('menuItem').addEventListener('change', updatePrice);
        document.getElementById('quantity').addEventListener('input', updatePrice);

        document.getElementById('foodOrderForm').addEventListener('submit', function(event) {
            event.preventDefault();
            alert("Order Placed Successfully!");
        });
    </script>
</body>
</html>
