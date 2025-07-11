
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import model.Booking;
import model.BookingDAO;

@WebServlet("/booking-history")
public class BookingHistoryServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");

        if (username == null) {
            response.sendRedirect("login.jsp");
            return;
        }

        BookingDAO dao = new BookingDAO();
        List<Booking> bookings = dao.getBookingsByUser(username);

        request.setAttribute("bookings", bookings);
        request.getRequestDispatcher("booking-history-view.jsp").forward(request, response);
    }
}

