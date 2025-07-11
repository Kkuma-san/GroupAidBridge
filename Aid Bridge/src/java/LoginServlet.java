import java.io.IOException;
import java.sql.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.*;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
    throws ServletException, IOException {

        String username = request.getParameter("username");
        String password = request.getParameter("password");
        String userType = request.getParameter("userType");

        HttpSession session = request.getSession();

        if ("admin".equals(userType)) {
            
            if ("Admin".equals(username) && "Admin123".equals(password)) {
                session.setAttribute("username", "admin");
                session.setAttribute("userType", "admin");
                response.sendRedirect("admin-home.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }
            return;
        }

        
        Connection conn = null;
        PreparedStatement stmt = null;
        ResultSet rs = null;

        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            conn = DriverManager.getConnection(
                "jdbc:derby://localhost:1527/UserDatabase", "app", "app");

            String sql = "SELECT * FROM users WHERE username=? AND password=? AND userType='user'";
            stmt = conn.prepareStatement(sql);
            stmt.setString(1, username);
            stmt.setString(2, password);

            rs = stmt.executeQuery();

            if (rs.next()) {
                session.setAttribute("username", username);
                session.setAttribute("userType", "user");
                response.sendRedirect("user-home.jsp");
            } else {
                response.sendRedirect("login.jsp?error=1");
            }

        } catch (Exception e) {
            e.printStackTrace();
            response.sendRedirect("login.jsp?error=2");
        } finally {
            try { if (rs != null) rs.close(); } catch (Exception e) {}
            try { if (stmt != null) stmt.close(); } catch (Exception e) {}
            try { if (conn != null) conn.close(); } catch (Exception e) {}
        }
    }
}


