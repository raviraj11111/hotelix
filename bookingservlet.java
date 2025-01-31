import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

@WebServlet("/RoomBookingServlet")
public class bookingservlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String contactNumber = request.getParameter("contactNumber");
        String checkInDate = request.getParameter("checkInDate");
        String checkOutDate = request.getParameter("checkOutDate");
        String roomType = request.getParameter("roomType");

        String guestsParam = request.getParameter("numberOfGuests");
        int numberOfGuests = (guestsParam != null && !guestsParam.isEmpty()) ? Integer.parseInt(guestsParam) : 0;

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/jaywant", "root", "raviraj5052");

            String sql = "INSERT INTO room_bookings (full_name, contact_number, check_in_date, check_out_date, room_type, number_of_guests) VALUES (?, ?, ?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, fullName);
            stmt.setString(2, contactNumber);
            stmt.setString(3, checkInDate);
            stmt.setString(4, checkOutDate);
            stmt.setString(5, roomType);
            stmt.setInt(6, numberOfGuests);

            int rowsInserted = stmt.executeUpdate();
            if (rowsInserted > 0) {
                request.getSession().setAttribute("bookingMessage", "Guest is equivalent to God. Room booking successful!");
            } else {
                request.getSession().setAttribute("bookingMessage", "Room booking failed! Please try again.");
            }
        } catch (Exception e) {
            e.printStackTrace();
            request.getSession().setAttribute("bookingMessage", "Error: " + e.getMessage());
        } finally {
            try {
                if (stmt != null) stmt.close();
                if (conn != null) conn.close();
            } catch (Exception ex) {
                ex.printStackTrace();
            }
        }

        response.sendRedirect("roombooking.jsp"); // Redirect to the same page
    }
}
