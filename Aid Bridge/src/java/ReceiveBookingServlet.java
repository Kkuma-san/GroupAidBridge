
import java.io.IOException;
import java.sql.Timestamp;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.BookingDAO;

@WebServlet("/receive-booking")
public class ReceiveBookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        String timestampStr = request.getParameter("bookingDate");
        Timestamp bookingDate = Timestamp.valueOf(timestampStr);

        BookingDAO dao = new BookingDAO();
        dao.markAsReceived(username, bookingDate);

        response.sendRedirect("booking-history");
    }
}

