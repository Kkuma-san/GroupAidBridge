import model.*;
import java.io.IOException;
import java.util.*;
import javax.servlet.*;
import javax.servlet.http.*;

public class AddToCartServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
        throws ServletException, IOException {
        
        int productId = Integer.parseInt(request.getParameter("productId"));
        int quantity = Integer.parseInt(request.getParameter("quantity"));

        HttpSession session = request.getSession();
        Map<Integer, CartItem> cart = (Map<Integer, CartItem>) session.getAttribute("cart");

        if (cart == null) {
            cart = new HashMap<>();
        }

        ProductDAO dao = new ProductDAO();
        Product product = dao.getProductById(productId);

        if (cart.containsKey(productId)) {
            CartItem item = cart.get(productId);
            item.setQuantity(item.getQuantity() + quantity);
        } else {
           cart.put(productId, new CartItem(product, quantity, product.getPrice()));
        }

        session.setAttribute("cart", cart);
        response.sendRedirect("cart.jsp");
    }
}

