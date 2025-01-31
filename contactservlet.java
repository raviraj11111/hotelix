import java.io.*;
import jakarta.servlet.*;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.*;
import java.sql.*;

@WebServlet("/ContactServlet")
public class contactservlet extends HttpServlet {

    // Database credentials
    private static final String DB_URL = "jdbc:mysql://localhost:3306/jaywant";
    private static final String DB_USER = "root";
    private static final String DB_PASS = "raviraj5052";

    // Register MySQL JDBC driver (for older versions of Java, not needed in newer)
    static {
        try {
            // Registering MySQL driver
            Class.forName("com.mysql.cj.jdbc.Driver");
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // Get data from the form
        String name = request.getParameter("name");
        String email = request.getParameter("email");
        String phone = request.getParameter("phone");
        String message = request.getParameter("message");

        if (name == null || email == null || phone == null || message == null) {
            response.setStatus(HttpServletResponse.SC_BAD_REQUEST);
            response.getWriter().println("All fields are required.");
            return;
        }

        // Establish a connection to the database
        try (Connection conn = DriverManager.getConnection(DB_URL, DB_USER, DB_PASS)) {
            // SQL query to insert the contact form data into the database
            String sql = "INSERT INTO contacts (name, email, phone, message) VALUES (?, ?, ?, ?)";
            try (PreparedStatement ps = conn.prepareStatement(sql)) {
                ps.setString(1, name);
                ps.setString(2, email);
                ps.setString(3, phone);
                ps.setString(4, message);

                int result = ps.executeUpdate();

                // If insertion is successful, send the response with a thank you message
                if (result > 0) {
                    // Redirect to a page with a "Thank You" popup
                    response.setContentType("text/html");
                    PrintWriter out = response.getWriter();
                    out.println("<html><body>");
                    out.println("<script type='text/javascript'>");
                    out.println("alert('Thank you for contacting us!');");
                    out.println("window.location.href = 'contact.jsp';");
                    out.println("</script>");
                    out.println("</body></html>");
                } else {
                    // In case of failure, show an error message
                    response.sendRedirect("errorPage.jsp");
                }
            }
        } catch (SQLException e) {
            e.printStackTrace();
            // Show error page if there's an exception
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            out.println("<html><body>");
            out.println("<h2>Error occurred while processing your request: " + e.getMessage() + "</h2>");
            out.println("</body></html>");
        }
    }
}
