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

@WebServlet("/FoodOrderServlet")
public class foodbookingservlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        PrintWriter out = response.getWriter();
        
        // Retrieve form data
        String fullName = request.getParameter("fullName");
        String contactNumber = request.getParameter("contactNumber");
        String roomNumberStr = request.getParameter("roomNumber");
        String menuItem = request.getParameter("menuItem");
        String quantityStr = request.getParameter("quantity");

        System.out.println("📌 Received Data: " + fullName + ", " + contactNumber + ", " + roomNumberStr + ", " + menuItem + ", " + quantityStr);
        
        // Validate form inputs
        if (fullName == null || contactNumber == null || roomNumberStr == null || menuItem == null || quantityStr == null) {
            out.println("<script>alert('❌ Error: Missing form fields.'); window.location='foodOrder.jsp';</script>");
            return;
        }

        try {
            int roomNumber = Integer.parseInt(roomNumberStr);
            int quantity = Integer.parseInt(quantityStr);
            int pricePerItem = getPrice(menuItem);
            int totalPrice = pricePerItem * quantity;

            // Load MySQL JDBC Driver
            Class.forName("com.mysql.cj.jdbc.Driver");
            
            // Database Connection
            Connection con = DriverManager.getConnection("jdbc:mysql://localhost:3306/jaywant", "root", "raviraj5052");
            System.out.println("✅ Database Connected!");

            // Insert Data into Database
            String query = "INSERT INTO foodorders (customer_name, contact_number, room_number, food_item, quantity, total_price, status) VALUES (?, ?, ?, ?, ?, ?, 'Pending')";
            PreparedStatement ps = con.prepareStatement(query);
            ps.setString(1, fullName);
            ps.setString(2, contactNumber);
            ps.setInt(3, roomNumber);
            ps.setString(4, menuItem);
            ps.setInt(5, quantity);
            ps.setInt(6, totalPrice);

            int rowsInserted = ps.executeUpdate();
            System.out.println("📌 Rows Inserted: " + rowsInserted);
            
            if (rowsInserted > 0) {
                out.println("<script>alert('✅ Order Placed Successfully!'); window.location='foodOrder.jsp';</script>");
            } else {
                out.println("<script>alert('❌ Order Failed! No rows inserted.'); window.location='foodOrder.jsp';</script>");
            }
            
            ps.close();
            con.close();
        } catch (Exception e) {
            System.out.println("❌ Error: " + e.getMessage());
            e.printStackTrace();
            out.println("<script>alert('❌ Database Error: " + e.getMessage() + "'); window.location='foodOrder.jsp';</script>");
        }
    }

    // Helper method to get food item price
    private int getPrice(String menuItem) {
        switch (menuItem) {
            case "Grilled Chicken": return 864;
            case "Veggie Pizza": return 691;
            case "Pasta Alfredo": return 1036;
            default: return 0;
        }
    }
}
