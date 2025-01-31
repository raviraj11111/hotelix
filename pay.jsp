<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Payment Form</title>
  <style>
    body {
      display: flex;
      justify-content: center;
      align-items: center;
      height: 100vh;
      background-color: #f4f4f4;
      font-family: Arial, sans-serif;
    }
    .payment-form {
      background-color: #fff;
      padding: 20px;
      border-radius: 8px;
      box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
      width: 300px;
    }
    .form-group {
      margin-bottom: 15px;
    }
    label {
      display: block;
      margin-bottom: 5px;
      font-weight: bold;
    }
    .input-group {
      display: flex;
      align-items: center;
    }
    .input-group span {
      padding: 10px;
      background-color: #eee;
      border: 1px solid #ccc;
      border-right: none;
      border-radius: 4px 0 0 4px;
    }
    .input-group input {
      flex: 1;
      padding: 10px;
      border: 1px solid #ccc;
      border-radius: 0 4px 4px 0;
      border-left: none;
    }
    .input-group input:focus {
      outline: none;
      border-color: #007bff;
    }
    button {
      width: 100%;
      padding: 10px;
      background-color: #007bff;
      border: none;
      border-radius: 4px;
      color: #fff;
      font-size: 16px;
      cursor: pointer;
    }
    button:hover {
      background-color: #0056b3;
    }
  </style>
</head>
<body>
  <div class="payment-form">
    <form action="/submit-payment" method="POST">
      <div class="form-group">
        <label for="amount">Amount in Rupees</label>
        <div class="input-group">
          <span>₹</span>
          <input type="number" id="amount" name="amount" placeholder="Enter amount" required min="0" step="0.01">
        </div>
      </div>
      <button type="submit">Pay</button>
    </form>
  </div>
</body>
<script src="script.js"></script>
</html>
