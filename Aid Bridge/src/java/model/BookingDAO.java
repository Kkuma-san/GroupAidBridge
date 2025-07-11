package model;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import static model.DBConnection.getConnection;

public class BookingDAO {

    public void insertBooking(String username, int productId, int quantity, double price, String address) {
        String sql = "INSERT INTO BOOKINGS (USERNAME, PRODUCT_ID, QUANTITY, PRICE, ADDRESS, BOOKING_DATE) VALUES (?, ?, ?, ?, ?, CURRENT_TIMESTAMP)";
         System.out.println("insertBooking() called with: " + username + ", " + productId + ", qty=" + quantity);
        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ps.setInt(2, productId);
            ps.setInt(3, quantity);
            ps.setDouble(4, price);
            ps.setString(5, address);

            ps.executeUpdate();
            conn.commit();

            System.out.println("Booking inserted: " + username + ", Product ID: " + productId);
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public List<Booking> getBookingsByUser(String username) {
        List<Booking> bookings = new ArrayList<>();

       String sql = "SELECT b.booking_date, b.quantity, b.price, b.address,b.status, p.name, p.image " +
             "FROM BOOKINGS b JOIN PRODUCTS p ON b.product_id = p.id " +
             "WHERE b.username = ? ORDER BY b.booking_date DESC";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {

            ps.setString(1, username);
            ResultSet rs = ps.executeQuery();

            while (rs.next()) {
                System.out.println("Booking row -> Product: " + rs.getString("name") +
                   ", Qty: " + rs.getInt("quantity") +
                   ", Date: " + rs.getTimestamp("booking_date"));

                Booking booking = new Booking();
                booking.setProductName(rs.getString("name"));
                booking.setProductImage(rs.getString("image"));
                booking.setQuantity(rs.getInt("quantity"));
                booking.setPrice(rs.getDouble("price"));
                booking.setAddress(rs.getString("address"));
                booking.setBookingDate(rs.getTimestamp("booking_date"));
                booking.setStatus(rs.getString("status"));
                bookings.add(booking);
            }

        } catch (Exception e) {
            e.printStackTrace();
        }

        return bookings;
    }
    
    public List<Booking> getAllBookings() throws Exception {
        List<Booking> bookings = new ArrayList<>();
        String sql = "SELECT USERNAME, PRODUCT_ID, QUANTITY, BOOKING_DATE FROM BOOKINGS";

        try (Connection conn = DBConnection.getConnection();
             PreparedStatement stmt = conn.prepareStatement(sql);
             ResultSet rs = stmt.executeQuery()) {

            while (rs.next()) {
                Booking booking = new Booking();
                booking.setUsername(rs.getString("username"));
                booking.setProductName(rs.getString("product_name"));
                booking.setQuantity(rs.getInt("quantity"));
                booking.setBookingDate(rs.getTimestamp("booking_date"));

                bookings.add(booking);
            }

        } catch (SQLException e) {
            e.printStackTrace();
        }
        return bookings;
    }
    
    public void markAsReceived(String username, Timestamp bookingDate) {
    String sql = "UPDATE BOOKINGS SET STATUS = 'Received' WHERE username = ? AND booking_date = ?";
    try (Connection conn = DBConnection.getConnection();
         PreparedStatement ps = conn.prepareStatement(sql)) {
        ps.setString(1, username);
        ps.setTimestamp(2, bookingDate);
        ps.executeUpdate();
    } catch (Exception e) {
        e.printStackTrace();
    }
}

}


