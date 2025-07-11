import model.BookingDAO;
import model.CartItem;
import model.Product;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.*;

public class BookingServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        String username = (String) session.getAttribute("username");
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (username == null || cart == null || cart.isEmpty()) {
            response.sendRedirect("login.jsp");
            return;
        }
        
        System.out.println("BookingServlet triggered for user: " + username);
        BookingDAO dao = new BookingDAO();

        for (CartItem item : cart.values()) {
            Product product = item.getProduct();
            int quantity = item.getQuantity();
            double price = item.getPrice();
            String address = request.getParameter("address");

            dao.insertBooking(username, product.getId(), quantity, product.getPrice(), address);
        }

        session.removeAttribute("cart");
        response.sendRedirect("booking-history");
    }
}


