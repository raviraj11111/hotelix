import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/UpdateOrderStatusServlet")
public class updateorderstatusservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        response.setContentType("text/html");
        PrintWriter out = response.getWriter();

        // Get form data
        String idStr = request.getParameter("id");
        String status = request.getParameter("status");

        if (idStr == null || status == null) {
            out.println("<script>alert('❌ Error: Missing Order ID or Status.'); window.location='adminPanel.jsp';</script>");
            return;
        }

        try {
            int orderId = Integer.parseInt(idStr);

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Establish Database Connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jaywant", "root", "raviraj5052");

            // Update order status
            String query = "UPDATE foodorders SET status = ? WHERE id = ?";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, status);
            ps.setInt(2, orderId);

            int rowsUpdated = ps.executeUpdate();
            ps.close();
            con.close();

            if (rowsUpdated > 0) {
                out.println("<script>alert('✅ Order status updated successfully!'); window.location='adminwelcome.jsp';</script>");
            } else {
                out.println("<script>alert('❌ Failed to update order status.'); window.location='adminwelcome.jsp';</script>");
            }

        } catch (Exception e) {
            out.println("<script>alert('❌ Error: " + e.getMessage() + "'); window.location='adminwelcome.jsp';</script>");
            e.printStackTrace();
        }
    }
}
