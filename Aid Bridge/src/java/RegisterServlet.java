import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {
        System.out.println("RegisterServlet called.");
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");

        if (!password.equals(confirmPassword)) {
            response.sendRedirect("register.jsp?error=1");
            return;
        }

        Connection conn = null;
        PreparedStatement stmt = null;

        try {
            
            Class.forName("org.apache.derby.jdbc.ClientDriver");

            
            conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/UserDatabase", "app", "app");

            
            String sql = "INSERT INTO users (username, email, password, userType) VALUES (?, ?, ?, ?)";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, email);
            stmt.setString(3, password);
            stmt.setString(4, "user");

            stmt.executeUpdate();
            response.sendRedirect("register.jsp?success=1");

        } catch (SQLException | ClassNotFoundException e) {
            e.printStackTrace();
            response.sendRedirect("register.jsp?error=2");
        } finally {
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}


