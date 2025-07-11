import model.CartItem;

import javax.servlet.*;
import javax.servlet.http.*;
import java.io.IOException;
import java.util.Map;

public class DeleteCartItemServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        String productIdStr = request.getParameter("productId");

        if (productIdStr != null && cart != null) {
            int productId = Integer.parseInt(productIdStr);
            cart.remove(productId);
            session.setAttribute("cart", cart); // Optional: update session explicitly
        }

        response.sendRedirect("cart.jsp"); // Redirect back to cart view
    }
}
