<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page session="true"%>
<%@page import="java.sql.*, jakarta.servlet.http.*, jakarta.servlet.*"%>

<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <title>Login</title>
  <style>
    * {
      margin: 0;
      padding: 0;
      box-sizing: border-box;
      font-family: 'Poppins', sans-serif;
    }

    body {
      display: flex;
      justify-content: center;
      align-items: center;
      min-height: 100vh;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
    }

    .form-container {
      width: 100%;
      max-width: 400px;
      background: #fff;
      border-radius: 12px;
      box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
      padding: 2rem;
    }

    .form-container h2 {
      text-align: center;
      margin-bottom: 1rem;
      font-size: 1.8rem;
      color: #333;
    }

    .form-group {
      margin-bottom: 1rem;
    }

    .form-group label {
      display: block;
      margin-bottom: 0.5rem;
      color: #555;
    }

    .form-group input {
      width: 100%;
      padding: 0.75rem;
      border: 1px solid #ddd;
      border-radius: 8px;
      font-size: 1rem;
      transition: border 0.3s, box-shadow 0.3s;
    }

    .form-group input:focus {
      border-color: #6a11cb;
      box-shadow: 0 4px 8px rgba(106, 17, 203, 0.1);
      outline: none;
    }

    .submit-btn {
      width: 100%;
      padding: 0.75rem;
      background: linear-gradient(135deg, #6a11cb, #2575fc);
      color: #fff;
      border: none;
      border-radius: 8px;
      font-size: 1rem;
      cursor: pointer;
      transition: background 0.3s, transform 0.3s;
    }

    .submit-btn:hover {
      background: linear-gradient(135deg, #2575fc, #6a11cb);
      transform: scale(1.02);
    }

    .toggle-btns {
      display: flex;
      justify-content: space-between;
      margin-top: 1.5rem;
    }

    .toggle-btns button {
      padding: 0.5rem 1rem;
      background: none;
      border: 1px solid #6a11cb;
      color: #6a11cb;
      border-radius: 8px;
      cursor: pointer;
      transition: background 0.3s, color 0.3s;
    }

    .toggle-btns button:hover {
      background: #6a11cb;
      color: #fff;
    }

    .hidden {
      display: none;
    }

  </style>
</head>
<body>
  <div class="form-container">
    <%-- Display Error Message if Exists --%>
    <% if (request.getAttribute("errorMessage") != null) { %>
      <div style="color: red; text-align: center; margin-bottom: 1rem;">
        <%= request.getAttribute("errorMessage") %>
      </div>
    <% } %>

    <!-- Login Form -->
    <form id="login-form" action="UserAdminFormHandler" method="POST">
      <input type="hidden" name="formType" value="login">
      <h2>User Login</h2>
      <div class="form-group">
        <label for="login-email">Email</label>
        <input type="email" id="login-email" name="email" required>
      </div>
      <div class="form-group">
        <label for="login-password">Password</label>
        <input type="password" id="login-password" name="password" required>
      </div>
      <button type="submit" class="submit-btn">Login</button>
    </form>

    <!-- Registration Form -->
    <form id="register-form" class="hidden" action="UserAdminFormHandler" method="POST">
      <input type="hidden" name="formType" value="register">
      <h2>User Registration</h2>
      <div class="form-group">
        <label for="register-name">Full Name</label>
        <input type="text" id="register-name" name="name" required>
      </div>
      <div class="form-group">
        <label for="register-email">Email</label>
        <input type="email" id="register-email" name="email" required>
      </div>
      <div class="form-group">
        <label for="register-password">Password</label>
        <input type="password" id="register-password" name="password" required>
      </div>
      <button type="submit" class="submit-btn">Register</button>
    </form>

    <!-- Admin Login Form -->
    <form id="admin-form" class="hidden" action="UserAdminFormHandler" method="POST">
      <input type="hidden" name="formType" value="admin">
      <h2>Admin Login</h2>
      <div class="form-group">
        <label for="admin-username">Username</label>
        <input type="text" id="admin-username" name="username" required>
      </div>
      <div class="form-group">
        <label for="admin-password">Password</label>
        <input type="password" id="admin-password" name="password" required>
      </div>
      <button type="submit" class="submit-btn">Login</button>
    </form>

    <!-- Toggle Buttons -->
    <div class="toggle-btns">
      <button onclick="showForm('login-form')">Login</button>
      <button onclick="showForm('register-form')">Register</button>
      <button onclick="showForm('admin-form')">Admin</button>
    </div>
  </div>

  <script>
    function showForm(formId) {
      document.querySelectorAll("form").forEach(form => form.classList.add("hidden"));
      document.getElementById(formId).classList.remove("hidden");
    }
  </script>

</body>
</html>
