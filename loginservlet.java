import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

@WebServlet("/UserAdminFormHandler")
public class loginservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jaywant";
    private static final String DB_USER = "root"; // Replace with your MySQL username
    private static final String DB_PASSWORD = "raviraj5052"; // Replace with your MySQL password

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form type to differentiate between login, registration, and admin actions
        String formType = request.getParameter("formType");

        try {
            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            // Establish connection to the database
            Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASSWORD);

            if ("login".equals(formType)) {
                // Handle User Login
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                String sql = "SELECT * FROM juser WHERE email = ? AND password = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, email);
                pstmt.setString(2, password);

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    String fullName = rs.getString("full_name");

                    // Store user details in session
                    HttpSession session = request.getSession();
                    session.setAttribute("fullName", fullName);
                    session.setAttribute("email", email);
                    session.setAttribute("role", "user");

                    // Redirect to welcome page
                    response.sendRedirect("home.jsp");
                } else {
                    out.println("<h3>Invalid User Credentials!</h3>");
                }
                pstmt.close();

            } else if ("register".equals(formType)) {
                // Handle User Registration
                String fullName = request.getParameter("name");
                String email = request.getParameter("email");
                String password = request.getParameter("password");

                String sql = "INSERT INTO juser (full_name, email, password) VALUES (?, ?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, fullName);
                pstmt.setString(2, email);
                pstmt.setString(3, password);

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    // Store user details in session
                    HttpSession session = request.getSession();
                    session.setAttribute("fullName", fullName);
                    session.setAttribute("email", email);
                    session.setAttribute("role", "user");

                    // Redirect to welcome page
                    response.sendRedirect("home.jsp");
                } else {
                    out.println("<h3>Registration Failed. Please try again.</h3>");
                }
                pstmt.close();

            } else if ("admin".equals(formType)) {
                // Handle Admin Login using username instead of email
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                String sql = "SELECT * FROM admins WHERE username = ? AND password = ?";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);

                ResultSet rs = pstmt.executeQuery();
                if (rs.next()) {
                    HttpSession session = request.getSession();
                    session.setAttribute("adminUsername", username);
                    session.setAttribute("role", "admin");

                    // Redirect to admin dashboard
                    response.sendRedirect("adminwelcome.jsp");
                } else {
                    out.println("<h3>Invalid Admin Credentials!</h3>");
                }
                pstmt.close();

            } else if ("adminRegister".equals(formType)) {
                // Handle Admin Registration
                String username = request.getParameter("username");
                String password = request.getParameter("password");

                String sql = "INSERT INTO admins (username, password) VALUES (?, ?)";
                PreparedStatement pstmt = conn.prepareStatement(sql);
                pstmt.setString(1, username);
                pstmt.setString(2, password);

                int rows = pstmt.executeUpdate();
                if (rows > 0) {
                    out.println("<h3>Admin Registration Successful!</h3>");
                } else {
                    out.println("<h3>Admin Registration Failed. Please try again.</h3>");
                }
                pstmt.close();
            }

            conn.close();

        } catch (Exception e) {
            e.printStackTrace();
            out.println("<h3>Error: " + e.getMessage() + "</h3>");
        }

        out.close();
    }
}
